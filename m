Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC8A68E419
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C427836;
	Wed,  8 Feb 2023 00:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C427836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811015;
	bh=0WUfWkx3WXMvy1NiSACkhw5M/JH64HxliKyyiJCmmoM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pdc9B4taLEf9VcFilje+PPbBoGuMGNIPGFzjJR7x5k5BKk/rnT8zZDAUgsPtMq2HV
	 SxAxP/Oyflm+CtG3thnX9nBGdBLXnuAT6BvPMyP11lIOwUxGjmMGis0XUZKtkeDyQf
	 JhH81cR8b+wxFeiaWnpGgrhn8kFXpvp69O+6E1G4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17891F8010B;
	Wed,  8 Feb 2023 00:02:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BBF8F8012B; Wed,  8 Feb 2023 00:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0B3AF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B3AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GbghwzCF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D994560DD9;
	Tue,  7 Feb 2023 15:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA007C433D2;
	Tue,  7 Feb 2023 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675783034;
	bh=Q151YrDjhoMhmpGuvpiLtseqfC4fVjDbC/y8Ns++CsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GbghwzCFhEMQs40x17kyuerW4g6D2KZndDylwZZI4H/oJGBymTGgjxfdBO1+/CL0Z
	 N5ks1PnLaFOISUER7nIebA724EBf8nZQlvL3DuhegUj4mP+lk6AHW75X9UV/uPjMnB
	 UjRdt0mhuIhQkcHffDZLUuQAxUfNmzwBSf1hfnmhGz9XcECVeI3XzmfbBO9LQdyYys
	 GWtmJUj891vatpVEw0vpvwfQqzoTkNrqfyH2vutMSFYzLg8BwbxlkKspH1ngcsZlAy
	 ZO1qKdqCJMYMKxIqjdrWGdl0EYsg1eplyU1VTctnhs9cJ5SMmiaod4Zj65OToHAah+
	 JpO2MTKKi5T2Q==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230207210428.2076354-1-amadeuszx.slawinski@linux.intel.com>
References: <20230207210428.2076354-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Return -ENOMEM on memory allocation
 failure
Message-Id: <167578303267.230357.2123593541021713335.b4-ty@kernel.org>
Date: Tue, 07 Feb 2023 15:17:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.0
Message-ID-Hash: SYNQFU7QNKTHNVV75Q27A55PSMILQX5G
X-Message-ID-Hash: SYNQFU7QNKTHNVV75Q27A55PSMILQX5G
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dan Carpenter <error27@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYNQFU7QNKTHNVV75Q27A55PSMILQX5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Transfer-Encoding: base64

T24gVHVlLCAwNyBGZWIgMjAyMyAyMjowNDoyOCArMDEwMCwgQW1hZGV1c3ogU8WCYXdpxYRza2kg
d3JvdGU6DQo+IFdoZW4gaGFuZGxpbmcgZXJyb3IgcGF0aCwgcmV0IG5lZWRzIHRvIGJlIHNldCB0
byBjb3JyZWN0IHZhbHVlLg0KPiANCj4gDQoNCkFwcGxpZWQgdG8NCg0KICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zb3VuZC5naXQgZm9y
LW5leHQNCg0KVGhhbmtzIQ0KDQpbMS8xXSBBU29DOiB0b3BvbG9neTogUmV0dXJuIC1FTk9NRU0g
b24gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZQ0KICAgICAgY29tbWl0OiBjMTczZWU1YjJmYTYx
OTUwNjY2NzRkNjZkMWQ3ZTE5MTAxMGZiMWZmDQoNCkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMg
dGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dA0KdHJlZSAodXN1
YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVy
aW5nDQp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgp
LCBob3dldmVyIGlmDQpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkg
YmUgZHJvcHBlZCBvciByZXZlcnRlZC4NCg0KWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJl
c3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZw0KYW5kIHJldmlldyBvZiB0
aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5k
DQpzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJl
cG9ydGVkIGlmIG5lZWRlZC4NCg0KSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBh
cmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQ0Kc2hvdWxkIGJlIHNlbnQgYXMgaW5j
cmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZw0KcGF0Y2hlcyB3
aWxsIG5vdCBiZSByZXBsYWNlZC4NCg0KUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5k
IG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZw0KdG8gdGhpcyBtYWlsLg0KDQpU
aGFua3MsDQpNYXJrDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0IC0tIGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGFsc2EtZGV2ZWwtbGVhdmVAYWxz
YS1wcm9qZWN0Lm9yZwo=
