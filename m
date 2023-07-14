Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9238754EB8
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 15:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9171DE5;
	Sun, 16 Jul 2023 14:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9171DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512417;
	bh=yh5Bsiu4c1Do/1mqj5dFS2pnbu0eVcp1Ts5/m0wOIsA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=adeGEWZncsaXOVAmqmabRssWfffZYebZqQYIp7FsFW7+ZIyi+5QoZa+OlX4D80RHZ
	 Wi1uHBQo0fhdu9mp7DoyVlm6Y9NHfOVn460a0JIxxH7TB5SU9PDUa9ZA9ln39t11ta
	 czLod//BhSTBpqPePgF0/nKemN3007MGD90DZy8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC743F805B4; Sun, 16 Jul 2023 14:58:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52388F805B3;
	Sun, 16 Jul 2023 14:58:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84C14F80236; Fri, 14 Jul 2023 14:29:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3310DF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3310DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QfNolH2t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689337761; x=1720873761;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=paNCn0i0ocmnyoUcYofPrK6VJYyVDAF9BUUDGQr8dR0=;
  b=QfNolH2tXCCrvmY2YIfJM5WSmz1ebEk0O6+9CY4d9sOzC6W79EeD3xk7
   6MfvStG4IMc6PMAMXA1c/dk81Gbl283FohtVolti/6Qjzepdz92fbRhyo
   FebnwS2GH9lal04fpDvcA1EWW0JcB94rwkeN1T3dVsizjEPB1UMtD+0Ce
   5s1+fRLxxCMo5hJISAa0slhpEwXXhobid2576Qx+QR5yHDtuI1PNO1EHe
   MIvmmeQSWv0lt2e7AJK4u1ehRdHnoF9WOoEvjZZD0ITwkwimmnrTRbtIz
   qJAGaQRhIhM4FS0LwJolwG8TX5TO6jTPlgy0uhTHbfP0aIZa0f/Df8GW6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368101719"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="368101719"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812415922"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="812415922"
Received: from rchauhax-mobl1.gar.corp.intel.com ([10.249.35.123])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:29:12 -0700
Date: Fri, 14 Jul 2023 15:29:09 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-2?Q?Amadeusz_S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
    Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
    linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
    Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Andy Shevchenko <andriy.shevchenko@intel.com>,
    Hans de Goede <hdegoede@redhat.com>,
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 07/15] ALSA: hda/i915:  Use global PCI match macro
In-Reply-To: <20230714202457.423866-8-amadeuszx.slawinski@linux.intel.com>
Message-ID: <9d3c56af-e9ff-7791-1644-2d362e428f48@linux.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
 <20230714202457.423866-8-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VQUBZXG7LNMJDOKA6MWAHVVZOI5GWX5L
X-Message-ID-Hash: VQUBZXG7LNMJDOKA6MWAHVVZOI5GWX5L
X-Mailman-Approved-At: Sun, 16 Jul 2023 12:57:52 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQUBZXG7LNMJDOKA6MWAHVVZOI5GWX5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCkp1c3QgYSBzbWFsbCBuaXQsIHlvdSBoYXZlIGFuIGV4dHJhIHNwYWNlIGluIHRoZSBz
aG9ydGxvZyBsaW5lLg0KDQotLSANCiBpLg0KDQpPbiBGcmksIDE0IEp1bCAyMDIzLCBBbWFkZXVz
eiBTxYJhd2nFhHNraSB3cm90ZToNCg0KPiBJbnN0ZWFkIG9mIHVzaW5nIGxvY2FsIG1hY3JvIHRv
IG1hdGNoIFBDSSBkZXZpY2UsIHVzZSBnbG9iYWwgb25lLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51
eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgc291bmQvaGRhL2hkYWNfaTkxNS5jIHwgNyArLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2hkYWNfaTkxNS5jIGIvc291bmQvaGRhL2hkYWNfaTkx
NS5jDQo+IGluZGV4IDE2MWE5NzExY2Q2My4uMmE0NTFmZjRmZTZhIDEwMDY0NA0KPiAtLS0gYS9z
b3VuZC9oZGEvaGRhY19pOTE1LmMNCj4gKysrIGIvc291bmQvaGRhL2hkYWNfaTkxNS5jDQo+IEBA
IC0xMSwxMSArMTEsNiBAQA0KPiAgI2luY2x1ZGUgPHNvdW5kL2hkYV9pOTE1Lmg+DQo+ICAjaW5j
bHVkZSA8c291bmQvaGRhX3JlZ2lzdGVyLmg+DQo+ICANCj4gLSNkZWZpbmUgSVNfSFNXX0NPTlRS
T0xMRVIocGNpKSAoKChwY2kpLT5kZXZpY2UgPT0gMHgwYTBjKSB8fCBcDQo+IC0JCQkJKChwY2kp
LT5kZXZpY2UgPT0gMHgwYzBjKSB8fCBcDQo+IC0JCQkJKChwY2kpLT5kZXZpY2UgPT0gMHgwZDBj
KSB8fCBcDQo+IC0JCQkJKChwY2kpLT5kZXZpY2UgPT0gMHgxNjBjKSkNCj4gLQ0KPiAgLyoqDQo+
ICAgKiBzbmRfaGRhY19pOTE1X3NldF9iY2xrIC0gUmVwcm9ncmFtIEJDTEsgZm9yIEhTVy9CRFcN
Cj4gICAqIEBidXM6IEhEQSBjb3JlIGJ1cw0KPiBAQCAtMzksNyArMzQsNyBAQCB2b2lkIHNuZF9o
ZGFjX2k5MTVfc2V0X2JjbGsoc3RydWN0IGhkYWNfYnVzICpidXMpDQo+ICANCj4gIAlpZiAoIWFj
b21wIHx8ICFhY29tcC0+b3BzIHx8ICFhY29tcC0+b3BzLT5nZXRfY2RjbGtfZnJlcSkNCj4gIAkJ
cmV0dXJuOyAvKiBvbmx5IGZvciBpOTE1IGJpbmRpbmcgKi8NCj4gLQlpZiAoIUlTX0hTV19DT05U
Uk9MTEVSKHBjaSkpDQo+ICsJaWYgKCFIREFfQ09OVFJPTExFUl9JU19IU1cocGNpKSkNCj4gIAkJ
cmV0dXJuOyAvKiBvbmx5IEhTVy9CRFcgKi8NCj4gIA0KPiAgCWNkY2xrX2ZyZXEgPSBhY29tcC0+
b3BzLT5nZXRfY2RjbGtfZnJlcShhY29tcC0+ZGV2KTsNCj4g
