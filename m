Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8475F77BFE0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 20:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A624F208;
	Mon, 14 Aug 2023 20:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A624F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692037914;
	bh=3Nnm6dnR8UKyZRFW8GItBRJbIOkAxBm6BzNq6VZQ7xU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CncHWSqgJu7SmrAPcgWFF3iN+dQMLW3P3BrcskgBHjhTG3pEnDVncLhrohTwoADeg
	 mCPS4QU3o2h2ktxyV5f6jLXYJsFuC19OJ1dficRcpJb5ZXcNk7G0XbtVGdkJEexfQL
	 5jeeddtxl32kuzXsYDs/v5JNKkbpdCqwQh/oxAFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E084F800EE; Mon, 14 Aug 2023 20:31:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC172F80254;
	Mon, 14 Aug 2023 20:31:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D44F8025F; Mon, 14 Aug 2023 20:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D00DF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 20:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D00DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=GbH3P8Lb
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-56401f1da3dso2662727a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Aug 2023 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692037853; x=1692642653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XSC8HkADATPwZrekNC8xteRBC7tAnBDvbwfDDGhfHTU=;
        b=GbH3P8LbCOK0jw6hcB5upIv3Lt11G4F7N0uy4mm74emLO8IgfufwSv/HXBEnj5Bthr
         M8vE8o5FQqO8x2yepph9znIVeg9tV4LJ2H9zjBsfDQQzL8KjlHfhJqg6FnUsok9qknvH
         DYnAhH/7Vwa4LGozbRzZbkDXjpOoqBkpRn3YJjXLEroFi/7UV/A7VmU+jr5rY9K+HnJU
         Iq9/FRuGanGFjVHUPjqzUtfckTsd44OQz//aNn0WZbdHMbZZddct3ZOAfJ9ecSnKpOFT
         lLd0CRJqG5zoF3GuOdlSLvmPzv9IwLDROpd/0M6MrsN5RNHPzii2VwKT2INffQvm/vKY
         lHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692037853; x=1692642653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSC8HkADATPwZrekNC8xteRBC7tAnBDvbwfDDGhfHTU=;
        b=AoMBgmhsZAxhjsOcdIEwdoUcwniEEPwyGMTfPOiKmvheqq9SxYFSO/uJcrBwvM6IMc
         ZoI9mSb6xOxRgOPsCi1YEcpevq30G/NXI1og347NEMjU2DDbqRRhZemBpcYUNrXe0x/i
         k5K0IExvIvTyEULlqVLx8S2JL1IhFwOFAp4HrlDkUaCr5YOUTrzQSmDJAbbj0+YH60Md
         FHWzu4kV+zPPm1eoduQRjoDXrDm5tBixP9OQTaoQzZNdyUn8SlXH94ZZt43RiBbA8HvJ
         k8flkDihXL+OCeorvooyIoSYxBVmUmJBaoyQgkozlvNJv7Tm6skS4E/1Wy/DVi9+WfFl
         dO5A==
X-Gm-Message-State: AOJu0Yz7OyvjKTQH6tpBhyC1QYK5OQPCZMQSTUMO/Bn/+7gKdQyzWEBu
	wqRfLzHFuLsJ3pa186LuRda325Qt/EViStP5qDhm5g==
X-Google-Smtp-Source: 
 AGHT+IG/gz7L4gfFilMLkPOeXTHvRJAcl1nOjU8yU4fN6VWYFty5RO+vJA1uVXfwHAnk8VvOHyrd+mDtwcD3v05tkaY=
X-Received: by 2002:a17:90b:23c7:b0:268:5558:de4c with SMTP id
 md7-20020a17090b23c700b002685558de4cmr7899913pjb.38.1692037852649; Mon, 14
 Aug 2023 11:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230814012637.487602-1-bradynorander@gmail.com>
 <dfdc7097-6286-f3a5-be41-eafd73fe128b@linux.intel.com>
 <ZNpr18oSz1bDayj1@arch>
In-Reply-To: <ZNpr18oSz1bDayj1@arch>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 14 Aug 2023 11:30:41 -0700
Message-ID: 
 <CAOReqxjEQi16YQ5SGrJawuYL1TQBoG3GxhhVt=kPtr03b3TdAA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
To: Brady Norander <bradynorander@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
	broonie@kernel.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	cujomalainey@chromium.org
Message-ID-Hash: KENNBTW3T6N6EH3FOXCYTBT3X3H3ZLLW
X-Message-ID-Hash: KENNBTW3T6N6EH3FOXCYTBT3X3H3ZLLW
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KENNBTW3T6N6EH3FOXCYTBT3X3H3ZLLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMTE6MDHigK9BTSBCcmFkeSBOb3JhbmRlciA8YnJhZHlu
b3JhbmRlckBnbWFpbC5jb20+DQp3cm90ZToNCg0KPiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAw
ODo1NDoxNUFNIC0wNTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToNCj4gPiBzYW1lIGhl
cmUsIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGJsaW5kbHkgYWRkIHF1aXJrcy4NCj4gPg0KPiA+IE9u
ZSBtaWdodCBhcmd1ZSBpdCBkb2Vzbid0IGh1cnQgYnV0IG5vdCBhbGwgU0tVcyBhcmUgc3VwcG9y
dGVkIGJ5IENocm9tZS4NCj4NCj4gRmFpciBlbm91Z2guIEkgd2Fzbid0IHN1cmUgd2hpY2ggU0tV
cyB3ZXJlIHVzZWQgaW4gQ2hyb21lIHBsYXRmb3JtcyBhbmQNCj4gd2hpY2ggb25lcyB3ZXJlbid0
IHNvIEkgZmlndXJlZCBpdCB3b3VsZCBiZSBzYWZlciB0byBpbmNsdWRlIGFsbCBvZiB0aGVtDQo+
IHRoYW4gbWlzcyBzb21lIHRoYXQgYXJlIG5lZWRlZC4gSSBjYW4gcmVzZW5kIHRoZSBwYXRjaCB3
aXRob3V0IHRoZSBxdWlyaw0KPiBmb3IgdGhlIFBYIFNLVXMuDQo+DQoNCkZUUiB3ZSBjYXJyeSBh
IC5jb25mIHdoaWNoIGhhcyB0aGUgZm9sbG93aW5nIGNvbmZpZyB3aGljaCBpcyBwcm9iYWJseSB3
aHkNCndlIGRvbid0IHNlZSB0aGlzIGlzc3VlLiBJIHVuZGVyc3RhbmQgdGhpcyBiZWhhdmlvdXIg
Zm9yIGR1YWwgc3VwcG9ydGVkDQpsZWdhY3kgcGxhdGZvcm1zIGJ1dCBpdCBpcyBpbmRlZWQgd2Vp
cmQgdG8gc2VlIG9uIFNPRiBvbmx5IHN1cHBvcnRlZA0KcGxhdGZvcm1zLg0KDQojIFVzZSB0aGUg
U09GIGRyaXZlciBmb3IgUENJX0RFVklDRSgweDgwODYsIDB4OWRjOCkgaW5zdGVhZCBvZiBzbmRf
aGRhX2ludGVsDQpvcHRpb25zIHNuZF9pbnRlbF9zZHdfYWNwaSBzZHdfbGlua19tYXNrPTB4NQ0K
b3B0aW9ucyBzbmRfaW50ZWxfZHNwY2ZnIGRzcF9kcml2ZXI9Mw0Kb3B0aW9ucyBzbmRfc29mX2lu
dGVsX2hkYV9jb21tb24gYWx3YXlzX2VuYWJsZV9kbWlfbDE9MQ0KYmxhY2tsaXN0IHNuZF9oZGFf
aW50ZWwNCg==
