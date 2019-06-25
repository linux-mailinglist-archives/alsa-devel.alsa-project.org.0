Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A766754DE6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 13:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1954815F2;
	Tue, 25 Jun 2019 13:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1954815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561463081;
	bh=k8Sn+omjFjL86pu9SWCugh1UIqRlj7TRLD/ho9+0aSE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbseTyY9fCirglRppk8JX5poSchs/V0gnrpFcQ73Z0kUGPlHpnDOqpeTQfxUKVIcq
	 Ylh5h6/QXl6rYHDOWxeqpFJPQrnJWZUkg+ACPLt3n4uTf6FGK02zDgnd2WLHNZxbVu
	 lPSXUVfxO8k9WV/Aoz20QLWKmyj1KF2ee826CXkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BB3F896F9;
	Tue, 25 Jun 2019 13:42:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A28AF896F9; Tue, 25 Jun 2019 13:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 302DBF8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 13:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302DBF8071F
Received: from [114.253.249.0] (helo=[192.168.1.105])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hfjqL-0007Wm-Uz; Tue, 25 Jun 2019 11:42:46 +0000
To: Takashi Iwai <tiwai@suse.de>, "Yang, Libin" <libin.yang@intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
 <1558948047-18930-4-git-send-email-libin.yang@intel.com>
 <s5hftowv2ii.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D195285809B@SHSMSX103.ccr.corp.intel.com>
 <s5hsgswt1at.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528582FD@SHSMSX103.ccr.corp.intel.com>
 <96A12704CE18D347B625EE2D4A099D195289BC7B@SHSMSX103.ccr.corp.intel.com>
 <96A12704CE18D347B625EE2D4A099D19528A2E44@SHSMSX103.ccr.corp.intel.com>
 <s5hpnn1x6uz.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <7b42cbfe-e5f5-143b-a42d-f45be999311f@canonical.com>
Date: Tue, 25 Jun 2019 19:41:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <s5hpnn1x6uz.wl-tiwai@suse.de>
Content-Language: en-US
Cc: "'alsa-devel@alsa-project.org'" <alsa-devel@alsa-project.org>,
 "'broonie@kernel.org'" <broonie@kernel.org>,
 "'pierre-louis.bossart@linux.intel.com'"
 <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDIwMTkvNi8yNSDkuIvljYg3OjA1LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gVHVlLCAy
NSBKdW4gMjAxOSAwODowMjo0NSArMDIwMCwKPiBZYW5nLCBMaWJpbiB3cm90ZToKPj4+IFNvcnJ5
IGZvciBhIGxvbmcgZGVsYXkgZm9yIHRoZSBoZG1pIGphY2tzLiBJIHdhcyBidXN5IG9uIGFub3Ro
ZXIgY3JpdGljYWwgaXNzdWUKPj4+IGxhc3QgMiB3ZWVrcy4gSSBoYXZlIHdvcmtlZCBvdXQgdGhl
IFVDTSBjb25maWd1cmF0aW9uIGZpbGVzLiBQbGVhc2UgY2hlY2sgdGhlCj4+PiBhdHRhY2htZW50
LiBJdCBpcyBhIGxvbmcgZmlsZSwgc28gSSB1c2UgdGhlIGF0dGFjaG1lbnQgaW5zdGVhZCBvZiB0
aGUgcGF0Y2ggbW9kZS4KPj4+IEJhc2VkIG9uIG15IHRlc3QsIGl0IHdvcmtzIHdlbGwuIENvdWxk
IHlvdSBwbGVhc2UgaGVscCByZXZpZXcgaWYgdGhlCj4+PiBjb25maWd1cmF0aW9uIGZpbGUgaXMg
T0sgb3Igbm90LiBJIHdpbGwgZG8gbW9yZSB0ZXN0IG9uIHRoZSBtZWFudGltZSwgaW5jbHVkaW5n
Cj4+PiBEUE1TVCBhbmQgTk9OLURQTVNULgo+PiBXaXRoIHNvbWUgbW9yZSB0ZXN0cyBvbiB0aGUg
bmV3IGhkbWkgamFjayB3aXRoIFVDTSBjb25maWd1cmF0aW9uLCBJIGZvdW5kCj4+IHRoYXQgdGhl
IGtlcm5lbCBwYXRjaCBjYW4gYWx3YXlzIG5vdGlmeSB0aGUgamFjayBob3RwbHVnIGV2ZW50IHRv
IHVzZXJzcGFjZQo+PiBjb3JyZWN0bHkuIEhvd2V2ZXIsIHRoZSB1c2Vyc3BhY2UgY2FuJ3Qgc2V0
IHRoZSBhbWl4ZXIgY29ycmVjdGx5IGJhc2VkIG9uCj4+IHRoZSBVQ00gY29uZmlndXJhdGlvbnMg
c29tZXRpbWVzLgo+Pgo+PiBIZXJlIGlzIHRoZSBkZXRhaWxzOgo+PiBUaGVyZSBhcmUgMyBQQ01z
IG9uIEludGVsIHBsYXRmb3Jtcy4gTGV0J3MgY2FsbCB0aGVtIHBjbTEsIHBjbTIsIHBjbTMuCj4+
IEFuZCB0aGVyZSBhcmUgMyBwaW5zIChwaW41LCBwaW42LCBwaW43KS4gRm9yIERQTVNULCBhbmQg
ZWFjaCBwaW4gaGFzIDMgcG9ydHM6Cj4+IHBvcnQwLCBwb3J0MSwgcG9ydDIuCj4+Cj4+IEZvciBu
b24tRFBNU1QsIHdlIGNhbiBzZXQgcGluNSA8PT4gcGNtMSwgcGluNiA8PT4gcGNtMiwgcGluNyA8
PT4gcGNtMy4KPj4gVGhpcyBjYW4gYWx3YXlzIHdvcmsuCj4+Cj4+IEZvciBEUE1TVCwgYXMgdGhl
cmUgYXJlIDkgcG9ydHMgdXNpbmcgMyBwY21zLiBTbyB3ZSBzaG91bGQgYXNzaWduCj4+IDEgcGNt
IHRvIDMgcG9ydHMuIEZvciBleGFtcGxlLCBwaW41LXBvcnQwLCBwaW42LXBvcnQxIGFuZCBwaW43
LXBvcnQyCj4+IGFyZSB1c2luZyBwY20xOyAgcGluNS1wb3J0MSwgcGluNi1wb3J0MiBhbmQgcGlu
Ny1wb3J0MCBhcmUgdXNpbmcKPj4gcGNtMjsgcGluNS1wb3J0MjsgcGluNi1wb3J0MyBhbmQgcGlu
Ny1wb3J0MSBhcmUgdXNpbmcgcGNtMy4KPj4gSW4gdGhpcyBzZXR0aW5nLCB3ZSBzaG91bGQgc2V0
dGluZyB0aGUgQ29uZmxpY3RpbmdEZXZpY2UgaW4gVUNNLgo+PiBGb3IgZXhhbXBsZSwgcGluNS1w
b3J0MCBpcyBjb25mbGljdGluZyB3aXRoIHBpbjYtcG9ydDEgYW5kIHBpbjctcG9ydDIuCj4+IEh1
aSBhbmQgSSBmb3VuZCBpZiB3ZSBzZXQgb25lIGRldmljZSBjb25mbGljdGluZyB3aXRoIDIgZGV2
aWNlcywgdGhlCj4+IGFtaXhlciBzZXR0aW5nIHdpbGwgYmUgd3JvbmcgYW5kIGl0IHdpbGwgbm90
IGZvbGxvd2luZyBVQ00gY29uZmlndXJhdGlvbgo+PiBzZXR0aW5nIHdoZW4gd2UgYXJlIGhvdHBs
dWdnaW5nIHRoZSBtb25pdG9ycy4KPiBIb3cgd3Jvbmcgd291bGQgaXQgYmVoYXZlPyAgT25seSBv
bmUgb2YgdGhlbSBpcyBkb25lPwoKWWVzLCBvbmx5IHRoZSAxc3QgY29uZmxpY3RpbmcgZGV2aWNl
IGlzIGhhbmRsZWQuCgpmb3IgZXhhbXBsZToKCnBpbjUtcG9ydDAgaGFzIHR3byBjb25mbGljdGlu
ZyBkZXZpY2VzOiBwaW42LXBvcnQxIGFuZCBwaW43LXBvcnQyLAoKV2hlbiBwaW41LXBvcnQwIGlz
IGFjdGl2ZSBpbiB0aGUgcHVsc2VhdWRpbywgSSBjYW4gc2VlIHRoZSAKcGluNi1wb3J0MS5EaXNh
YmxlU2VxdWVjZSBhbmQgcGluNy1wb3J0Mi5EaXNhYmxlU2VxdWVuY2UgYXJlIGNhbGxlZCAKYWNj
b3JkaW5nIHRvIHB1bHNlYXVkaW8ncyBsb2csIGJ1dCBpdCBsb29rcyBsaWtlIHRoZSBjb21tYW5k
cyBvbmx5IGluIAp0aGUgMXN0IGRldmljZSAocGluNi1wb3J0MS5EaXNhYmxlU2VxdWVuY2UpIGFy
ZSBleGVjdXRlZC4KClRvIGNhbGwgY29uZmxpY3RpbmcgZGV2aWNlcycgZGlzYWJsZXNlcXVlbmNl
LCB0aGUgcHVsc2VhdWRpbyB3aWxsIGNhbGwgCnNuZF91c2VfY2FzZV9zZXQodWNtLT51Y21fbWdy
LCAiX2Rpc2RldiIsIGRldl9uYW1lKSB0d2ljZSwgYnV0IG9ubHkgdGhlIAoxc3QgdGltZSBjYWxs
aW5nIHRha2VzIGVmZmVjdC4KCgo+Cj4+IEh1aSBhbmQgSSB0aG91Z2h0IHRoaXMgbWF5IGJlIHRo
ZSBhbHNhLWxpYiBvciBwdWxzZWF1ZGlvIGlzc3VlLgo+IFlvdSBjYW4gdHJ5IGFsc2F1Y20gZGly
ZWN0bHkgd2l0aG91dCBQQSwgdG9vLgo+IEJ1dCBpbiBnZW5lcmFsIHRoZSBjb25mbGljdGluZyBk
ZXZpY2UgbWFuYWdlbWVudCBpcyBkb25lIGluIFBBLCBzbyBJJ2QKPiBiZWdpbiB3aXRoIHRyYWNr
aW5nIHRoZSBQQSBVQ00gY29kZSBhdCBmaXJzdC4KPgo+Cj4gdGhhbmtzLAo+Cj4gVGFrYXNoaQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
