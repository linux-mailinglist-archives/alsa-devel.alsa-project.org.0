Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD3822166
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:52:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05477AE8;
	Tue,  2 Jan 2024 19:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05477AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221540;
	bh=fsaPUQlWzMu0T1JDNsFpX1qHfwvcZZB2BT+r/1bVaqQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HIPd37j2SoY4gAVIBAw1biw3UhUUzgRwmcPqMSgk858wSJWMo7sMy2Ls59uv5CxBN
	 6XQ7ok2LebFmo7npYxBST9hmy0JmzvliGJbEwtLwO57+iHMd6poGu/Pj7ukvDE7oMf
	 fEEpPHWApSh7eeUmsilEFtvLC396cOXUr/p9+ri8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C923AF8065C; Tue,  2 Jan 2024 19:50:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E810F80610;
	Tue,  2 Jan 2024 19:50:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FC60F80425; Tue, 19 Dec 2023 06:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88770F8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88770F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=w/cj2sUj
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5913922ab10so2564720eaf.1
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 21:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702963709; x=1703568509;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zWxwuUiCn8vp2HBl8LMU799KIIXKiR1QHKcb8ywkNrE=;
        b=w/cj2sUjxJZQEkQRTJA8AINnfB22MgpsUEBUtEDtuKwCCaP6RmeH5aepdd0Hi3Bid7
         4Rm9vKuJlJaFodNIFwcPa1BFbvFVnoW84UtAtOAieUqoBn+hqrtFhsAniN/rhSj6S9NM
         7PUDX+e2oh52kgWHeI8qRMXQ9jAOU9TRwZG90X54lYBHG83uC4qirbRepLJP4cPcfhXs
         hdxP0yYBhgOLa4oPczfmmQPUy/g+u+bx73Z2G0fGyqSj4O8pjuqh6F80x2X/MW90lV8G
         FXGorDemVb48Ja4DYZacVuP4TZ/zWnpKpIPcMVEl3NIPdPl+vyr79VLtDSI7vEOjWSwL
         aofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702963709; x=1703568509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWxwuUiCn8vp2HBl8LMU799KIIXKiR1QHKcb8ywkNrE=;
        b=J87ymVLhgLLKSuy7/+3eP7WV8kEzSkeBGJGhU6GsOtRZicZ5Iut5Aq8gZKf7/ReY5v
         z/SWog3VN38evZl6r0mb4qlQvE1+SEAYu1qK3tzNo25plkbuy7X3An1udDitjzYcauMS
         143A0r70BPAnKagnPKd0XweVdqWsk1qPZ3tzOHGfc/FEh+9saOU+PeMoWaYaNUeL7dUi
         ifLnvi+cQKrmitIDqP2xzR0Iz7UeB6PeywMA+ucrXHVdEP6Kmu8VmNErD/nClGXHZAzl
         w17V0mSSZRb6VIaCt9nHbOvb2ssyoKys88hWhF/a6Ba3+H2YVwWSMH/zqZkiF2W20U8Q
         0mug==
X-Gm-Message-State: AOJu0YyIfv9tW4X6R6ELMwHwjlE0VI15E37902ML0IGaj+x740VXxcTj
	cAnq/yDmKwhBfF+r7Rzne2MKQ1dkKEvaCZmUa8W20A==
X-Google-Smtp-Source: 
 AGHT+IHZPUkndNRPQTeCn1TdP/K0+1jBXYjg6c05tzxJgCy+FQakA4SEsLqkpt4cM0YW8LQfp6MLVrL59204WA1AAI4=
X-Received: by 2002:a4a:ad02:0:b0:591:dde9:359c with SMTP id
 r2-20020a4aad02000000b00591dde9359cmr1384697oon.16.1702963709400; Mon, 18 Dec
 2023 21:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20231218145655.134929-1-jbrunet@baylibre.com>
In-Reply-To: <20231218145655.134929-1-jbrunet@baylibre.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Tue, 19 Dec 2023 13:28:18 +0800
Message-ID: 
 <CADYyEwT0vba5+JQdTESi8xh4vKtB+1rPfnnRyuDn=V_OMUPFMQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix missing report for jack initial
 status
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GYQFXGSGGHDPTZ3XLTZSOQA2EOLRXHGC
X-Message-ID-Hash: GYQFXGSGGHDPTZ3XLTZSOQA2EOLRXHGC
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:16:43 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYQFXGSGGHDPTZ3XLTZSOQA2EOLRXHGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGVzdGVkLWJ5OiBaaGVuZ3FpYW8gWGlhIDx4aWF6aGVuZ3FpYW9AaHVhcWluLmNvcnAtcGFydG5l
ci5nb29nbGUuY29tPg0KDQpPbiBNb24sIERlYyAxOCwgMjAyMyBhdCAxMDo1N+KAr1BNIEplcm9t
ZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToNCg0KPiBUaGlzIGZpeGVzIGEg
cHJvYmxlbSBpbnRyb2R1Y2VkIHdoaWxlIGZpeGluZyBFTEQgcmVwb3J0aW5nIHdpdGggbm8gamFj
aw0KPiBzZXQuDQo+DQo+IE1vc3QgZHJpdmVyIHVzaW5nIHRoZSBoZG1pLWNvZGVjIHdpbGwgY2Fs
bCB0aGUgJ3BsdWdnZWRfY2InIGNhbGxiYWNrDQo+IGRpcmVjdGx5IHdoZW4gcmVnaXN0ZXJlZCB0
byByZXBvcnQgdGhlIGluaXRpYWwgc3RhdGUgb2YgdGhlIEhETUkgY29ubmVjdG9yLg0KPg0KPiBX
aXRoIHRoZSBjb21taXQgbWVudGlvbm5lZCwgdGhpcyBvY2N1cnMgYmVmb3JlIGphY2sgaXMgcmVh
ZHkgYW5kIHRoZQ0KPiBpbml0aWFsIHJlcG9ydCBpcyBsb3N0IGZvciBwbGF0Zm9ybXMgYWN0dWFs
bHkgcHJvdmlkaW5nIGEgamFjayBmb3IgSERNSS4NCj4NCj4gRml4IHRoaXMgYnkgc3RvcmluZyB0
aGUgaGRtaSBjb25uZWN0b3Igc3RhdHVzIHJlZ2FyZGxlc3Mgb2YgamFjayBiZWluZyBzZXQNCj4g
b3Igbm90IGFuZCByZXBvcnQgdGhlIGxhc3Qgc3RhdHVzIHdoZW4gamFjayBnZXRzIHNldC4NCj4N
Cj4gV2l0aCB0aGlzLCB0aGUgaW5pdGlhbCBzdGF0ZSBpcyByZXBvcnRlZCBjb3JyZWN0bHkgZXZl
biBpZiBpdCBpcw0KPiBkaXNjb25uZWN0ZWQuIFRoaXMgd2FzIG5vdCBkb25lIGluaXRpYWxseSBh
bmQgaXMgYWxzbyBhIGZpeC4NCj4NCj4gRml4ZXM6IDE1YmUzNTNkNTVmOSAoIkFTb0M6IGhkbWkt
Y29kZWM6IHJlZ2lzdGVyIGhwZCBjYWxsYmFjayBvbiBjb21wb25lbnQNCj4gcHJvYmUiKQ0KPiBS
ZXBvcnRlZC1ieTogWmhlbmdxaWFvIFhpYSA8eGlhemhlbmdxaWFvQGh1YXFpbi5jb3JwLXBhcnRu
ZXIuZ29vZ2xlLmNvbT4NCj4gQ2xvc2VzOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbHNh
LWRldmVsL0NBRFl5RXdUTnlZK2ZSOVNnZkRhLWc2aWlEd2tVM01VZFBWQ1lleHMyXzN3YmNNOF92
Z0BtYWlsLmdtYWlsLmNvbS8NCj4gQ2M6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGdvb2dsZS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPg0K
PiAtLS0NCj4gIHNvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jIHwgMTIgKysrKysrKysrKy0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jIGIvc291bmQvc29j
L2NvZGVjcy9oZG1pLWNvZGVjLmMNCj4gaW5kZXggMjBkYTFlYWE0ZjFjLi4wOTM4NjcxNzAwYzYg
MTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jDQo+ICsrKyBiL3Nv
dW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jDQo+IEBAIC04NTAsOCArODUwLDkgQEAgc3RhdGlj
IGludCBoZG1pX2RhaV9wcm9iZShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkNCj4gIHN0YXRpYyB2
b2lkIGhkbWlfY29kZWNfamFja19yZXBvcnQoc3RydWN0IGhkbWlfY29kZWNfcHJpdiAqaGNwLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBqYWNrX3N0
YXR1cykNCj4gIHsNCj4gLSAgICAgICBpZiAoaGNwLT5qYWNrICYmIGphY2tfc3RhdHVzICE9IGhj
cC0+amFja19zdGF0dXMpIHsNCj4gLSAgICAgICAgICAgICAgIHNuZF9zb2NfamFja19yZXBvcnQo
aGNwLT5qYWNrLCBqYWNrX3N0YXR1cywNCj4gU05EX0pBQ0tfTElORU9VVCk7DQo+ICsgICAgICAg
aWYgKGphY2tfc3RhdHVzICE9IGhjcC0+amFja19zdGF0dXMpIHsNCj4gKyAgICAgICAgICAgICAg
IGlmIChoY3AtPmphY2spDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNuZF9zb2NfamFja19y
ZXBvcnQoaGNwLT5qYWNrLCBqYWNrX3N0YXR1cywNCj4gU05EX0pBQ0tfTElORU9VVCk7DQo+ICAg
ICAgICAgICAgICAgICBoY3AtPmphY2tfc3RhdHVzID0gamFja19zdGF0dXM7DQo+ICAgICAgICAg
fQ0KPiAgfQ0KPiBAQCAtODgwLDYgKzg4MSwxMyBAQCBzdGF0aWMgaW50IGhkbWlfY29kZWNfc2V0
X2phY2soc3RydWN0DQo+IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsDQo+DQo+ICAgICAg
ICAgaWYgKGhjcC0+aGNkLm9wcy0+aG9va19wbHVnZ2VkX2NiKSB7DQo+ICAgICAgICAgICAgICAg
ICBoY3AtPmphY2sgPSBqYWNrOw0KPiArDQo+ICsgICAgICAgICAgICAgICAvKg0KPiArICAgICAg
ICAgICAgICAgICogUmVwb3J0IHRoZSBpbml0aWFsIGphY2sgc3RhdHVzIHdoaWNoIG1heSBoYXZl
IGJlZW4NCj4gcHJvdmlkZWQNCj4gKyAgICAgICAgICAgICAgICAqIGJ5IHRoZSBwYXJlbnQgaGRt
aSBkcml2ZXIgd2hpbGUgdGhlIGhwZCBob29rIHdhcw0KPiByZWdpc3RlcmVkLg0KPiArICAgICAg
ICAgICAgICAgICovDQo+ICsgICAgICAgICAgICAgICBzbmRfc29jX2phY2tfcmVwb3J0KGphY2ss
IGhjcC0+amFja19zdGF0dXMsDQo+IFNORF9KQUNLX0xJTkVPVVQpOw0KPiArDQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgICB9DQo+DQo+IC0tDQo+IDIuNDIuMA0KPg0KPg0K
