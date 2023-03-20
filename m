Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488206C0B48
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 08:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5E4210;
	Mon, 20 Mar 2023 08:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5E4210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679296991;
	bh=b2GcyEMDDVOWlL6udEVpKFE1ZR0jWviVjFmGHupjjDw=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EnH/TfTE7acmlYRTzVf0dWHWm5AsB6zgpFvY2ooeIE0YVl/iK6g85MxbRzZ+DDMaX
	 P1/iTpSE1gC3okrYTMKDCvn0QFOdsHIToKi2KY8uGHzt4w6QkHW8AcijJ/fAi7+Eg4
	 vertxl6ILtAg5rJ6JcgTj/FcAsvPwI2aRgQM6DTM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC43BF804B1;
	Mon, 20 Mar 2023 08:21:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D3F2F80105; Mon, 20 Mar 2023 08:20:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96A8AF80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 08:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A8AF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PMXRutyh
Received: by mail-wm1-x334.google.com with SMTP id w11so5700276wmo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679296630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPfksq9HcHZfOW713EHJPP4EqV5hzLLqhdQlnIpNQ4w=;
        b=PMXRutyhQFx1KU9gPiiDMqyuz2dvA92bTRqogWM4OB4usYcokfKFO13vIDzfzAXNeU
         qKHvl5c1d9tk4TCbPT3R/zca2Dhle0sxmuYyCp8h52n1LZWspQQQbmeYX0xpFI0Pm7r2
         ebxxMqKSwc9xGFdUQvyx7eepNit6IMhsjRx3rC9AquJbcIgRMbgj7fTli8FnKhMALz9a
         HBKHMRMaf9lBufOCNRkVQ+Lp+g9ELub7Pq52voEkfp13ainxAk6BdejDKUKHEHdwE8Nq
         IZXgulMujh932zf7F+uOS4gh2iT8rL2R5X5NJ/QBxkyjGU6KmL8akyuGNLPcjecTU3rz
         lFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPfksq9HcHZfOW713EHJPP4EqV5hzLLqhdQlnIpNQ4w=;
        b=g8182rr8eCW7310xF/XGT3/JubsGBzUGX8LF0Q9GQEcCn7Vy69NbnPqJEAriWFYJ/U
         Z8jYVSItupaX0TsMuXlAHl/EnPSUZI7vriCYa7b1BO29nHmNIldFp1jGys6JRx050EdK
         a/ZrOQMN62svUyg8aGgYN/QUVlvLOdTHNqv9MIMS29FJVJR/azjuiDr1FaOTHskumNBb
         cvPzmL7SsS6qpavRJ1UelqPK44KPWhgTf2bLIFDwySvPgs5cAN6A8IuP7//Q4Jxw3edd
         41hwUHJ46O6Xjcq8NE07v7K0ujhFjKLYl60MuG6YAO3BTLy0MtoUREg7BelRtg1AWunx
         oPAA==
X-Gm-Message-State: AO0yUKUZ0nnmKxBNHw0IU0DtkUf89EOsqEEZ8dVz90KPl/xe6BZW/T0B
	1gJplt4v532QFl6bHmXiJ37MrYW1vkBsU4rv3v8=
X-Google-Smtp-Source: 
 AK7set/OBiFs7Xg2IWUgP/EwAtFtEoS5w1aGmFF2v9Tj2CD2CdHIr6sfWK/qn/FwI6ulg5h/4/qGKVw4GVQbr7pNspc=
X-Received: by 2002:a7b:c398:0:b0:3ed:f221:9a49 with SMTP id
 s24-20020a7bc398000000b003edf2219a49mr549201wmj.7.1679296630506; Mon, 20 Mar
 2023 00:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
 <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Mar 2023 15:16:59 +0800
Message-ID: 
 <CAA+D8AMUd0JSKipzY+7tc4ihpYApg0yrLHjYgeAn0gVL11phKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: Specify driver name in ASoC card
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID-Hash: XU2UGNI2KZIDYVNE3MHO5JBMLFXPLZY3
X-Message-ID-Hash: XU2UGNI2KZIDYVNE3MHO5JBMLFXPLZY3
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XU2UGNI2KZIDYVNE3MHO5JBMLFXPLZY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgODozNuKAr1BNIEFsZXhhbmRlciBTdGVpbiA8DQphbGV4
YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPiB3cm90ZToNCg0KPiBTZXQgdGhlIHNuZF9zb2Nf
Y2FyZCBkcml2ZXIgbmFtZSB3aGljaCBmaXhlcyB0aGUgd2FybmluZzoNCj4gZnNsLWFzb2MtY2Fy
ZCBzb3VuZDogQVNvQzogZHJpdmVyIG5hbWUgdG9vIGxvbmcgJ2lteC1hdWRpby10bHYzMjBhaWMz
Mng0Jw0KPiAtPiAnaW14LWF1ZGlvLXRsdjMyJw0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+DQo+DQoNCkFja2VkLWJ5
OiBTaGVuZ2ppdSBXYW5nIDxzaGVuZ2ppdS53YW5nQGdtYWlsLmNvbT4NCg0KQmVzdCByZWdhcmRz
DQp3YW5nIHNoZW5naml1DQoNCj4gLS0tDQo+IFRoZXNlIHBhdGNoZXMgY291bGQgYmUgc3F1YXNo
ZWQsIGJ1dCBJIG9wdGVkIGZvciBzZXBhcmF0aW9uIHRoaXMgcGF0Y2gNCj4gaXMgdGhlIGFjdHVh
bCBmdW5jdGlvbmFsIGNoYW5nZS4gUGF0Y2ggMSBpcyBqdXN0IHByZXBhcmF0aW9uLg0KPg0KPiAg
c291bmQvc29jL2ZzbC9mc2wtYXNvYy1jYXJkLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ZzbC9mc2wtYXNvYy1j
YXJkLmMgYi9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYw0KPiBpbmRleCBlOTU2YWJmZDUw
ZjguLmJmZmExMDQ4ZDMxZSAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2wtYXNvYy1j
YXJkLmMNCj4gKysrIGIvc291bmQvc29jL2ZzbC9mc2wtYXNvYy1jYXJkLmMNCj4gQEAgLTYwOSw2
ICs2MDksNyBAQCBzdGF0aWMgaW50IGZzbF9hc29jX2NhcmRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZQ0KPiAqcGRldikNCj4NCj4gICAgICAgICBwcml2LT5jYXJkLmRhcG1fcm91dGVzID0g
YXVkaW9fbWFwOw0KPiAgICAgICAgIHByaXYtPmNhcmQubnVtX2RhcG1fcm91dGVzID0gQVJSQVlf
U0laRShhdWRpb19tYXApOw0KPiArICAgICAgIHByaXYtPmNhcmQuZHJpdmVyX25hbWUgPSBEUklW
RVJfTkFNRTsNCj4gICAgICAgICAvKiBEaXZlcnNpZnkgdGhlIGNhcmQgY29uZmlndXJhdGlvbnMg
Ki8NCj4gICAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJmc2wsaW14LWF1
ZGlvLWNzNDI4ODgiKSkgew0KPiAgICAgICAgICAgICAgICAgY29kZWNfZGFpX25hbWUgPSAiY3M0
Mjg4OCI7DQo+IC0tDQo+IDIuMzQuMQ0KPg0KPg0K
