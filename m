Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F636C0B47
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 08:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1059FFA;
	Mon, 20 Mar 2023 08:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1059FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679296941;
	bh=7Cqq6gJzA9S1Yq1GbG5w0jhL29OScGS75JfKI3mIhIA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L3MzFXEBwmjWVZDZop037Lvf5l8QPTtT94O6wm3gMJx09t/EsakdBm30HC681wTvb
	 OZaWuYJSVf5GhFFN/6zLfPYSPaEeOdgaSs0L7UEvcb4TgPRzu7ph8KgzjdqLMW5zYk
	 R6tSrGd5t5LwUHvtU/cy2MbY5R7XrOrNhLXUGlCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC47F80254;
	Mon, 20 Mar 2023 08:21:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0247F8027B; Mon, 20 Mar 2023 08:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72EC6F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 08:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EC6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TDLldTic
Received: by mail-wr1-x430.google.com with SMTP id r29so9282511wra.13
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679296530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dY92vEzHOiV+rG421ld252/xmXBkyzgS2OHqebmaw2Y=;
        b=TDLldTicqspc9s1Psp4WFXM8D1A71UjYcc3DBGVJ8aJLJVzaffglVufgUdf93s0Lcq
         6Mhyjsg5miExtKZtuIXP6xYILZ5YBNWrhnVHD7bkfnWQxZ9/e0x0tvlf96KppEpGhIQB
         wJJBRoDGe9Pptc+dbY6caRmGejyJJJHlS/kVnGxP7enYui5mONkTHqWllfUKE0Yij/EY
         tmB6j3vxRwi2kwYT4D+QokKuGoMFIYi4yxJb0OjxDxfxeFUF1wfkpY13HnCqwPgA7pd1
         rcGg/ADwMUPM+hXSaYQC+loTBcAtI7ak+FmdwpmxHDPhJUjFyPkNirlQRKtcX7rAPv0W
         OXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY92vEzHOiV+rG421ld252/xmXBkyzgS2OHqebmaw2Y=;
        b=6hloQXGwBXf77+K003KT4DJlG367uFVNZIDvJ2hYQQ65NKX54nS8S+42mNeQ8kBO3G
         oP8MZPsZYZSxWp4bD0s1sg4Gse1eP3P7s4lUwKtcT5Tl7x3+jEZ/y8EiRdAqUx98X1C8
         zjWopgj2fQNNA1ixbGVZ41EmhR/myyVXegcTHJBidAUEsLcLZafqJKVfexKF7XPAG3eb
         c+Gk2+rjuPJrfa5e8CuBj/vnfIzDnYMJrMYefzL33LoJ/toKyvS7YXUWHLJ7k+zx1mrb
         lLRojGRaKKbBDxnM9tyLKI/P9lftWWidrXpfa1Xya3dPa3teBUKlKv61k6rV/yzb4NUT
         Mzbw==
X-Gm-Message-State: AO0yUKUBpAwA6wV+td5/CWBhmnTp+uu0FSm0LH9Te8PTjTuqtbyxDOBv
	iu8HHhz/pMdu8O2cp91OTZAMufpTo89VlNHXmQk=
X-Google-Smtp-Source: 
 AK7set8bjiLJmu3eUzsHxI8KBE9iHVveKhlY4rBBQM8zc10nf1T3fnhAqGB41UEVlQTJakshmB93LPsWh9KA8n+x5Vs=
X-Received: by 2002:a5d:588c:0:b0:2cf:e75a:eaf0 with SMTP id
 n12-20020a5d588c000000b002cfe75aeaf0mr3099156wrf.0.1679296530304; Mon, 20 Mar
 2023 00:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Mar 2023 15:15:18 +0800
Message-ID: 
 <CAA+D8AMrzi7_ZBV57emtosfRVUTXzmu3KtiMaxXBRtY3G66O4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID-Hash: QUTEKWHEQOXWAOY3KM4RSLZ2DGAJOBPO
X-Message-ID-Hash: QUTEKWHEQOXWAOY3KM4RSLZ2DGAJOBPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUTEKWHEQOXWAOY3KM4RSLZ2DGAJOBPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgODozNuKAr1BNIEFsZXhhbmRlciBTdGVpbiA8DQphbGV4
YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPiB3cm90ZToNCg0KPiBJbnN0ZWFkIG9mIGNvcHlp
bmcgdGhlIGRyaXZlciBuYW1lIG1hbnVhbGx5LCB1c2UgYSBjb21tb24gZGVmaW5lLg0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN0ZWluIDxh
bGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPg0KPg0KDQpBY2tlZC1ieTogU2hlbmdqaXUg
V2FuZyA8c2hlbmdqaXUud2FuZ0BnbWFpbC5jb20+DQoNCkJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVu
Z2ppdQ0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2ZzbC9mc2wtYXNvYy1jYXJkLmMgfCA2ICsrKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jIGIvc291bmQvc29j
L2ZzbC9mc2wtYXNvYy1jYXJkLmMNCj4gaW5kZXggY2RmY2E5ZmQxZWIwLi5lOTU2YWJmZDUwZjgg
MTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jDQo+ICsrKyBiL3Nv
dW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jDQo+IEBAIC0yOCw2ICsyOCw4IEBADQo+ICAjaW5j
bHVkZSAiLi4vY29kZWNzL3dtODk5NC5oIg0KPiAgI2luY2x1ZGUgIi4uL2NvZGVjcy90bHYzMjBh
aWMzMXh4LmgiDQo+DQo+ICsjZGVmaW5lIERSSVZFUl9OQU1FICJmc2wtYXNvYy1jYXJkIg0KPiAr
DQo+ICAjZGVmaW5lIENTNDI3eF9TWVNDTEtfTUNMSyAwDQo+DQo+ICAjZGVmaW5lIFJYIDANCj4g
QEAgLTkxNSw3ICs5MTcsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBmc2xfYXNvY19jYXJk
X2R0X2lkcyk7DQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBmc2xfYXNvY19jYXJk
X2RyaXZlciA9IHsNCj4gICAgICAgICAucHJvYmUgPSBmc2xfYXNvY19jYXJkX3Byb2JlLA0KPiAg
ICAgICAgIC5kcml2ZXIgPSB7DQo+IC0gICAgICAgICAgICAgICAubmFtZSA9ICJmc2wtYXNvYy1j
YXJkIiwNCj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gRFJJVkVSX05BTUUsDQo+ICAgICAgICAg
ICAgICAgICAucG0gPSAmc25kX3NvY19wbV9vcHMsDQo+ICAgICAgICAgICAgICAgICAub2ZfbWF0
Y2hfdGFibGUgPSBmc2xfYXNvY19jYXJkX2R0X2lkcywNCj4gICAgICAgICB9LA0KPiBAQCAtOTI0
LDUgKzkyNiw1IEBAIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZnNsX2Fzb2NfY2FyZF9kcml2ZXIp
Ow0KPg0KPiAgTU9EVUxFX0RFU0NSSVBUSU9OKCJGcmVlc2NhbGUgR2VuZXJpYyBBU29DIFNvdW5k
IENhcmQgZHJpdmVyIHdpdGggQVNSQyIpOw0KPiAgTU9EVUxFX0FVVEhPUigiTmljb2xpbiBDaGVu
IDxuaWNvbGVvdHN1a2FAZ21haWwuY29tPiIpOw0KPiAtTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpm
c2wtYXNvYy1jYXJkIik7DQo+ICtNT0RVTEVfQUxJQVMoInBsYXRmb3JtOiIgRFJJVkVSX05BTUUp
Ow0KPiAgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiAtLQ0KPiAyLjM0LjENCj4NCj4NCg==
