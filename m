Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4575971D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF252200;
	Wed, 19 Jul 2023 15:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF252200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689773839;
	bh=pKPyYiK1DHf3uGwJfokTQrZ+i3quqe2Cf6khHC46LJc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4o3tCm1zRKFszEyxYlTWBNFaGnWMF93UvjpBMasG8yKGue9TDiZRq5hTt39w2jS/
	 XoffwOx5BAZZltcR7I5YuWoWi776WS5/lVZilVbRYm5a+4MTCzUYYJw6eDX84c7E9f
	 K4W9raRvBApBkCCLAa/hO5HumnKhAkhN3PENURDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC17F80544; Wed, 19 Jul 2023 15:36:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF551F8032D;
	Wed, 19 Jul 2023 15:36:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78C1FF8047D; Wed, 19 Jul 2023 15:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24725F800D2;
	Wed, 19 Jul 2023 15:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24725F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VwUg3ZyK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689773757; x=1721309757;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wfPSbk3KPqoC/jBdA7CzlHdvMnbUfG0A2+TB1XSaqrw=;
  b=VwUg3ZyK39+4KtDgELqg9jkpWR/FdxNXYgxUDqd1m9t69h36olDfYwAc
   YZT463tZ/ibWuD0uiUs/01RrXz1bfG+/GvO/njhyR67mQHG8ACxveJC26
   R5RVipjCo0uH17p4Ya0m1GeR2rDILprXi4cUorC5w75HCBBeTFxfX5+R3
   TsJtjSTQtwX/D2v8dTpflhINmF3WmHnrigK6PiCsoXNxkKwexZvlxKPmc
   LZoJz9Lsp3qs8DRY1lBFNpMXjkGta5gR7C8RP0usLrGJgwc0HutADhGPH
   1Vt5l1eX+IXIY7RVno6PzcqO/MRw2bx1YEzDwMBI6v9UqrjsGcbIOnVoK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397324607"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200";
   d="scan'208";a="397324607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674297037"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200";
   d="scan'208";a="674297037"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:35:48 -0700
Date: Wed, 19 Jul 2023 16:32:28 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Alsa-devel <alsa-devel@alsa-project.org>,
    sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
    Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
    Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2307191613460.3532114@eliteleevi.tm.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
 <874jm0modf.wl-tiwai@suse.de>
 <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Message-ID-Hash: YYDCNW6PZL6OSGRKKOIYPOHM4I2W5KED
X-Message-ID-Hash: YYDCNW6PZL6OSGRKKOIYPOHM4I2W5KED
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYDCNW6PZL6OSGRKKOIYPOHM4I2W5KED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCk9uIFdlZCwgMTkgSnVsIDIwMjMsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOg0KDQo+
IE9uIFR1ZSwgMTggSnVsIDIwMjMgMTk6MDQ6NDEgKzAyMDAsIEthaSBWZWhtYW5lbiB3cm90ZToN
Cj4+IE15IG9ubHkgYmlnZ2VyIGNvbmNlcm4gaXMgY29ybmVyIGNhc2VzIHdoZXJlIHRoZSBkaXNw
bGF5IFBDSSBkZXZpY2UgaXMgDQpvbiANCj4+IHRoZSBidXMgYW5kIHZpc2libGUgdG8ga2VybmVs
LCBidXQgZm9yIHNvbWUgcmVhc29uIHRoZXJlIGlzIG5vIHdvcmtpbmcgDQo+PiBkcml2ZXIgaW4g
dGhlIHN5c3RlbSBvciBpdCBpcyBkaXNhYmxlZC4NCj4gDQo+IFllYWgsIEkgaGF2ZSBubyBhbnN3
ZXIgZm9yIHRoaXMuIE15IGd1ZXNzIGlzwqB0aGF0IGluIGFuIGlkZWFsIHdvcmxkLCB0aGUgb3B0
aW9uYWwgZmVhdHVyZXMNCj4gcmVsYXRlZCB0byBIRE1JIG91dHB1dHMgd291bGQgYmUgcHV0IGlu
IGEgc2VwYXJhdGUgc3ViLWRyaXZlciwgd2hpY2ggY291bGQgLUVQUk9CRV9ERUZFUi4NCj4gT25s
eSB3aGVuIHRoaXMgZHJpdmVyIGxvYWRzLCBmZWF0dXJlcyByZWxhdGVkIHRvIGRpc3BsYXkgd2ls
bCB3b3JrLCBidXQgdGhlIG1haW4gYXVkaW8gZHJpdmVyDQo+IGNvdWxkIHN0aWxsIGxvYWQuDQoN
CmluIGxvbmdlciB0ZXJtLCB3ZSBoYXZlIG9uZ29pbmcgd29yayBpbiBTT0YgdG8gYWxsb3cgZXhw
b3NpbmcgbXVsdGlwbGUgDQpjYXJkcyAoZS5nLiB0byBoYXZlIGEgc2VwYXJhdGUgY2FyZCBmb3Ig
SERNSS9EUCBQQ00gZGV2aWNlcyksIGFuZCB3ZQ0KYXJlIGNvbnRpbnVvdXNseSB3b3JraW5nIGF0
IGltcHJvdmluZyB0aGUgZGF0YSB3ZSBnZXQgZnJvbSBBQ1BJIHRvIA0KaGF2ZSBsZXNzIGd1ZXNz
d29yayBpbiB0aGUgZHJpdmVyLiBCdXQgdGhpcyByZWFsbHkgZG9lc24ndCBoZWxwIGluIHRoZSAN
CnNob3J0dGVybSBhbmQvb3IgY292ZXIgYWxsIHNjZW5hcmlvcy4NCg0KU28gZm9yIG5vdywgdGhp
cyBpcyBsZWdhY3kgd2UganVzdCBuZWVkIHRvIGRlYWwgd2l0aC4gT1RPSCwgSSBkbyBhZ3JlZQ0K
dGhhdC4uLg0KDQo+IEEgbW9kdWxlIG9wdGlvbiB0byBzbmRfaGRhY19pOTE1X2luaXQgd291bGQg
cHJvYmFibHkgYmUgdGhlIGxlYXN0IG9mIGFsbCBldmlscyBoZXJlLg0KPiANCj4gSSBzZWUgdGhl
IHJlbW92YWwgb2YgdGhlIDYwIHNlY29uZCB0aW1lb3V0IGFzIGEgZ29vZCB0aGluZyByZWdhcmRs
ZXNzLiA6LSkgVXN1YWxseSB3aGVuIG5vbW9kZXNldCBpcyB1c2VkLCBpdCdzIGp1c3QgZm9yIHNh
ZmUNCj4gbW9kZS4NCj4gDQo+IFdpdGggdGhlIGFkZGl0aW9uIG9mwqAgdGhlIHhlIGRyaXZlciwg
YmxpbmRseSBtb2Rwcm9iaW5nIGk5MTUgd2lsbCBmYWxsIGFwYXJ0IHJlZ2FyZGxlc3MuDQoNClRo
ZSBtb2Rwcm9iaW5nIG9mIGk5MTUgZnJvbSB0aGUgYXVkaW8gZHJpdmVyLCBoYXMgYWx3YXlzIGZl
bHQgYSBiaXQgDQpvdXQtb2YtcGxhY2UsIGFuZCB3aXRoIHRoZSB4ZSBkcml2ZXIsIHRoaXMgc2lt
cGx5IHdvbid0IHNjYWxlIGFueW1vcmUuDQoNClRoZSB0ZXN0IHJlc3VsdHMgc28gZmFyIGxvb2sg
Z29vZCBhbmQgdGhpcyBwYXRjaHNldCB3b3JrcyBvayBldmVuIGlmIHNvbWUgDQpvZiB0aGUgbW9y
ZSBjb21wbGV4IG11bHRpLUdQVSBjb25maWd1cmF0aW9ucyB3ZSBoYXZlLCBzbyBJIHRoaW5rIHdp
dGggYSANCm1vZHVsZSBvcHRpb24gdG8gc25kX2hkYWNfaTkxNSwgSSdkIGJlIHJlYWR5IHRvIGdv
IHdpdGggdGhpcy4NCg0KQnIsIEthaQ==
