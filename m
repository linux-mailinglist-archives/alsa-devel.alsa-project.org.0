Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440EA75C4A6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9F77F4;
	Fri, 21 Jul 2023 12:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9F77F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689935259;
	bh=luIDifDHrPHIWI9MpFWas0pGglYEXpJCGh+rjVBvQ+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=foMtu+sdjjMVAy6EktyZ/Rydooik0edOKH9oeeq73vmiknfF8N6FPSCAANUSHlm6a
	 dqPaW7jU4g+sTU/mmla+Me6wwlLvrhFxMB1osAlTijrCy4EnvevAtVmcpegZpP3HxO
	 SOn5eWlNxqwUKSH+S9h15vbOTG5d+ETt+S7jeiAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E293EF804DA; Fri, 21 Jul 2023 12:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA4E5F8032D;
	Fri, 21 Jul 2023 12:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 818B4F8047D; Fri, 21 Jul 2023 12:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 264ADF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 264ADF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GBb/RuMs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689935201; x=1721471201;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3la85cW8/KmPX/dcr+1vrlAz048TD7nuQ3LGUmKvcgY=;
  b=GBb/RuMsrDZLwmuFiT89HQ6Q5YVCyybPRlXDXFe4W2642axpWYvnUy6C
   nrAnrJNwzp6ynCEGwYkPtz3yMs5mruyJx9+KeCeCoOUPl0kgFgzsS5KwS
   qqrcP7dSoL/LOeV/Pwg2YB+To2CyjFi/Gw5c9TialHD87uiP70Q0a+IR5
   7fSJ765BKChIyiHmXP8x2GYzXeR435gn4dppRpoN6HtXf9/Wwiy/vcANo
   /IAZAItcAj/Nftu43Q7Zz9aY+BVUQGfCjORsdCOOThc+9cUA8YtKHZPpz
   OxEvNq7ykyeuAaeEny7+iB03OnFMcJnJ+VE1KU3fv5GGmR9WIRB2HYoOE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369664215"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="369664215"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971398246"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="971398246"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:26:33 -0700
Date: Fri, 21 Jul 2023 13:23:07 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Racinglee <cydiaimpactor2003@gmail.com>
cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Regressions <regressions@lists.linux.dev>,
    Linux ALSA Development <alsa-devel@alsa-project.org>
Subject: Re: 6.4 and higher causes audio distortion
In-Reply-To: 
 <CAL4Djy3KeD51LtT0bT2aRe9S_uwMiAfa-X=V2SfdnYt-MYp5ng@mail.gmail.com>
Message-ID: 
 <alpine.DEB.2.22.394.2307211322100.3532114@eliteleevi.tm.intel.com>
References: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
 <CAL4Djy3KeD51LtT0bT2aRe9S_uwMiAfa-X=V2SfdnYt-MYp5ng@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Message-ID-Hash: A7SNNV6QCZ3PU42RZVNUSDQU23OYLSAA
X-Message-ID-Hash: A7SNNV6QCZ3PU42RZVNUSDQU23OYLSAA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7SNNV6QCZ3PU42RZVNUSDQU23OYLSAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCg0KT24gV2VkLCAxOSBKdWwgMjAyMywgUmFjaW5nbGVlIHdyb3RlOg0KDQo+IE9uIFNh
dCwgSnVsIDE1LCAyMDIzIGF0IDM6NTbigK9BTSBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdt
YWlsLmNvbT4gd3JvdGU6DQo+ID4gSSBub3RpY2UgYSByZWdyZXNzaW9uIHJlcG9ydCBvbiBCdWd6
aWxsYSBbMV0uIFF1b3RpbmcgZnJvbSBpdDoNCj4gPg0KPiA+ID4gSSBoYXZlIGEgTGVub3ZvIFRo
aW5rUGFkIFgxIFlvZ2EgR2VuIDcgcnVubmluZyBBcmNoIExpbnV4LiBMaW51eCA2LjQgDQo+ID4g
PiBhbmQgaGlnaGVyLCBjYXVzZSBhdWRpbyBkaXN0b3J0aW9uLiBTb21ldGltZXMsIHRoaXMgb2Nj
dXJzIHRvIHRoZSANCj4gPiA+IHBvaW50IHRoYXQgbmVhcmx5IG5vdGhpbmcgaXMgZGlzY2Vybmli
bGUuIFRoaXMgY2FycmllcyBvdmVyIHRvIHdpcmVkIA0KPiA+ID4gaGVhZHBob25lcy4gVGhlIGlz
c3VlIG9jY3VycyBvbiB0aGUgZW50aXJlIG1haW5saW5lIDYuNC54IGtlcm5lbCANCj4gPiA+IHNl
cmllcyBhbmQgYWxzbyB0aGUgNi40LjMgc3RhYmxlIGFuZCA2LjUgUkMxIGtlcm5lbCwgd2hpY2gg
YXJlIHRoZSANCj4gPiA+IGxhdGVzdCBhdCB0aGUgdGltZSBvZiB3cml0aW5nLiBUaGUgaXNzdWUg
b2NjdXJzIG9uIGJvdGggdGhlIEFyY2ggDQo+ID4gPiBkaXN0cmlidXRlZCBrZXJuZWxzLCBhbmQg
dGhlIG1haW5saW5lIGtlcm5lbHMuDQpbLi4uXQ0KPiBVcGRhdGluZyByZWd6Ym90IGFmdGVyIG5l
d2VyIGZpbmRpbmdzIGFuZCBkZXRlcm1pbmF0aW9ucyBhYm91dCB0aGUNCj4gcG9zc2libGUgY3Vs
cHJpdCBjb21taXQNCj4gDQo+ICNyZWd6Ym90IHRpdGxlOiA2LjQgYW5kIGhpZ2hlciBjYXVzZXMg
YXVkaW8gZGlzdG9ydGlvbg0KPiANCj4gI3JlZ3pib3QgaW50cm9kdWNlZDogdjYuNC1yYzEuLjFi
ZjgzZmE2NjU0Yw0KPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lk
PTIxNzY3MyNjNQ0KPiANCg0KdGhhbmsgeW91LCBmaWxlZCBhIGJ1ZyB0byBTT0YgYmFzZWQgb24g
dGhlIGJpc2VjdCByZXN1bHRzOg0KaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGlu
dXgvaXNzdWVzLzQ0ODINCg0KQnIsIEthaQ==
