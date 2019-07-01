﻿using System.Collections.Generic;
using Orchard.MediaLibrary.WebSearch.Models;
using Orchard.MediaLibrary.WebSearch.ViewModels;

namespace Orchard.MediaLibrary.WebSearch.Providers {
    public abstract class WebSearchProviderBase : IWebSearchProvider {
        public abstract string Name { get; }

        public abstract IWebSearchSettings Settings { get; }

        public abstract IEnumerable<WebSearchResult> GetImages(string query);
    }
}