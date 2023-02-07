Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74168E43E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D455F83B;
	Wed,  8 Feb 2023 00:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D455F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811598;
	bh=RNlLY3tCZ1mjIAHVos9N4PH1bLkIYj/SFHNw7YDn/m8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSWp1ibkbeBeeAsRM2YMb/9UaVkJtEKkgICg6hb8nMh4Xe/fVvEg/4StOAMOsuAE1
	 V0aVgfjYjiwhEUSjivMGxGyogxD7zvQ+gWmIw9IBDKCKzzthOYu7j/6LFxqsp7xboH
	 EhitHzDsrFQtfTfPFlURRyvSUcijkku1PZuXrHcg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B24F80525;
	Wed,  8 Feb 2023 00:12:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E787AF80526; Wed,  8 Feb 2023 00:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F34F9F80224
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F34F9F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VN+j6e2y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675811520; x=1707347520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w4yUWgdrMkSu5h1zXbr5sfr/CirMhN4jXxr0vnH7soA=;
  b=VN+j6e2y75F9CanGTsIGv5X/l/j6yfWacLy2d3rWRsW32IZanRAHMlrU
   AkN5uXovt/YV1D/JBDTF/puvKcIySa8NTp9yI7xKXqL68Ub0lTJ90D22h
   Ub/8f/34kzGGs5PzAwz7SEMYthfpweJxiBAprFcPOQPn8KPztcNyAJIU/
   hh0/0C5t0+8oNV0JPtvdxbrr0fc1FpXTguEQBa0s94DOiQ9rzUZve7WMf
   1e6AivLZbHQs8l/pn+E40OaMzNtBECMM5NibUZmnFjZMVN48aZTHnGxrv
   vaGUG+8qKigBO096//fDevAcPJXv1/H2ajM/htei7eMtGcPGrFPHf3KnO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357027927"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000";
   d="scan'208";a="357027927"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 14:44:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="616981528"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000";
   d="scan'208";a="616981528"
Received: from jinggu-mobl.amr.corp.intel.com (HELO [10.212.120.142])
 ([10.212.120.142])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 14:44:23 -0800
Message-ID: <b532bf7b-e1fb-3a9d-1b88-02f3159be47d@linux.intel.com>
Date: Tue, 7 Feb 2023 07:29:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 20/22] sound: usb: Prevent starting of audio stream
 if in use
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-21-quic_wcheng@quicinc.com>
 <557f8f76-38f5-5e07-905e-774e03120bd2@linux.intel.com>
 <b26c9e4c-5a9c-a2ff-19a7-78419c6b81df@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b26c9e4c-5a9c-a2ff-19a7-78419c6b81df@quicinc.com>
Message-ID-Hash: 2HCJYB32Y4VGPVMIAZUZC5R6URSKKGXO
X-Message-ID-Hash: 2HCJYB32Y4VGPVMIAZUZC5R6URSKKGXO
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HCJYB32Y4VGPVMIAZUZC5R6URSKKGXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDIvNi8yMyAxOToxNSwgV2VzbGV5IENoZW5nIHdyb3RlOg0KPiBIaSBQaWVycmUsDQo+
IA0KPiBPbiAxLzI2LzIwMjMgODoxMiBBTSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+
Pg0KPj4NCj4+IE9uIDEvMjUvMjMgMjE6MTQsIFdlc2xleSBDaGVuZyB3cm90ZToNCj4+PiBXaXRo
IFVTQiBhdWRpbyBvZmZsb2FkaW5nLCBhbiBhdWRpbyBzZXNzaW9uIGlzIHN0YXJ0ZWQgZnJvbSB0
aGUgQVNvQw0KPj4+IHBsYXRmb3JtIHNvdW5kIGNhcmQgYW5kIFBDTSBkZXZpY2VzLsKgIExpa2V3
aXNlLCB0aGUgVVNCIFNORCBwYXRoIGlzDQo+Pj4gc3RpbGwNCj4+PiByZWFkaWx5IGF2YWlsYWJs
ZSBmb3IgdXNlLCBpbiBjYXNlIHRoZSBub24tb2ZmbG9hZCBwYXRoIGlzIGRlc2lyZWQuwqAgSW4N
Cj4+PiBvcmRlciB0byBwcmV2ZW50IHRoZSB0d28gZW50aXRpZXMgZnJvbSBhdHRlbXB0aW5nIHRv
IHVzZSB0aGUgVVNCIGJ1cywNCj4+PiBpbnRyb2R1Y2UgYSBmbGFnIHRoYXQgZGV0ZXJtaW5lcyB3
aGVuIGVpdGhlciBwYXRocyBhcmUgaW4gdXNlLg0KPj4+DQo+Pj4gSWYgYSBQQ00gZGV2aWNlIGlz
IGFscmVhZHkgaW4gdXNlLCB0aGUgY2hlY2sgd2lsbCByZXR1cm4gYW4gZXJyb3IgdG8NCj4+PiB1
c2Vyc3BhY2Ugbm90aWZ5aW5nIHRoYXQgdGhlIHN0cmVhbSBpcyBjdXJyZW50bHkgYnVzeS7CoCBU
aGlzIGVuc3VyZXMNCj4+PiB0aGF0DQo+Pj4gb25seSBvbmUgcGF0aCBpcyB1c2luZyB0aGUgVVNC
IHN1YnN0cmVhbS4NCj4+DQo+PiBJdCdzIGdvb2QgdG8gbWFpbnRhaW4gbXV0dWFsIGV4Y2x1c2lv
biwgYnV0IGl0J3Mgc3RpbGwgdmVyeSBoYXJkIGZvciBhbg0KPj4gYXBwbGljYXRpb24gdG8gZmln
dXJlIG91dCB3aGljaCBjYXJkIGNhbiBiZSB1c2VkIHdoZW4uDQo+Pg0KPj4gUmV0dXJuaW5nIC1F
QlVTWSBpcyBub3Qgc3VwZXIgaGVscGZ1bC4gVGhlcmUgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtl
IGENCj4+IG5vdGlmaWNhdGlvbiBvciBjb25uZWN0aW9uIHN0YXR1cyBzbyB0aGF0IHJvdXRpbmcg
ZGVjaXNpb25zIGNhbiBiZSBtYWRlDQo+PiB3aXRob3V0IHRyaWFsLWFuZC1lcnJvci4NCj4+DQo+
IA0KPiBUaGUgVVNCIG9mZmxvYWQgZHJpdmVyIGRvZXMgaGF2ZSBhY2Nlc3MgdG8gdGhlIFVTQiBz
dWJzdHJlYW0gdGhhdCBpcw0KPiBiZWluZyB1dGlsaXplZC9vZmZsb2FkZWQuwqAgTWF5YmUgaW4g
YWRkaXRpb24gdG8gdGhpcyBjaGVjaywgd2UgY2FuIGFsc28NCj4gc2V0IHRoZSBQQ00gcnVudGlt
ZSBzdGF0ZSBhcyB3ZWxsIChmb3IgdGhhdCBwYXJ0aWN1bGFyIHN1YnN0cmVhbSk/wqAgVGhhdA0K
PiB3YXkgdXNlcnNwYWNlIGNhbiBmZXRjaCBpbmZvcm1hdGlvbiBhYm91dCBpZiB0aGUgc3RyZWFt
IGlzIGJ1c3kgb3Igbm90Lg0KDQpZb3UncmUgbWlzc2luZyB0aGUgcG9pbnQuIFdoZW4gYSBjYXJk
IGlzIGV4cG9zZWQgYnV0IHRoZSBQQ00gZGV2aWNlcyBtYXkNCm9yIG1heSBub3QgYmUgdXNhYmxl
IChjb25zdW1pbmcgZGF0YSB3aXRoIG5vIHNvdW5kIHJlbmRlcmVkIG9yIHJldHVybmluZw0KYW4g
ZXJyb3IpLCBpdCdzIG11Y2ggYmV0dGVyIHRvIHByb3ZpZGUgYSBjbGVhciBjb25uZWN0aW9uIHN0
YXR1cyB0bw0KdXNlcnNwYWNlLg0KDQpMZXQgbWUgZ2l2ZSB5b3UgYW4gZXhhbXBsZS4gSW50ZWwg
ZHJpdmVycyBjYW4gZXhwb3NlIDMgSERNSS9EUCBQQ00NCmRldmljZXMuIFVzZXJzcGFjZSBoYXMg
bm8gaWRlYSB3aGljaCBvbmUgdG8gdXNlLCBzbyB0aGVyZSdzIGEgamFjaw0KY29udHJvbCB0aGF0
IHRlbGxzIHVzZXJzcGFjZSB3aGV0aGVyIHRoZXJlIGlzIGEgcmVjZWl2ZXIgY29ubmVjdGVkIHNv
DQp0aGF0IHRoZSBhdWRpbyBzZXJ2ZXIgY2FuIHVzZSB0aGUgcmVsZXZhbnQgUENNIGRldmljZS4N
Cg0KQXVkaW8gcm91dGluZyBiYXNlZCBvbiB0cmlhbCBhbmQgZXJyb3IgaXMgcmVhbGx5IHByb2Js
ZW1hdGljLCBlcnJvcnMgY2FuDQpoYXBwZW4gYnV0IHRoZXkgc2hvdWxkIGJlIGV4Y2VwdGlvbmFs
IChlLmcuIHhydW5zKSwgbm90IGEgbWVhbnMgb2YNCmRyaXZlci11c2Vyc3BhY2UgY29tbXVuaWNh
dGlvbiBvbiB0aGUgZGV2aWNlIHN0YXR1cy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0IC0tIGFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGFsc2EtZGV2
ZWwtbGVhdmVAYWxzYS1wcm9qZWN0Lm9yZwo=
