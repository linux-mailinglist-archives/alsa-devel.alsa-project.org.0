Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59617432F6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 05:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5412F7F1;
	Fri, 30 Jun 2023 05:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5412F7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688094966;
	bh=IXaIXf36cqmL9UhAVahSGdkjLxEXRgBKnBWquij5u3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O68t9zTSGYCG2J+sIpWgGNqZBUxrIsq09HlDOoX3H1P9kU8+6+RVceHfm7opxt3Q+
	 5K44J7XoPN8pxlA7cFQFEY6MnxLPGBqyS/C37tSZHZdZyIOz45n33Gzde5YFPdtzIe
	 3XW5rSEmhJICKTIn42n+cd1aPPI5duY4RbRHA1PE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAFAEF80169; Fri, 30 Jun 2023 05:15:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B42CDF80212;
	Fri, 30 Jun 2023 05:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D7EF80246; Fri, 30 Jun 2023 05:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9211FF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 05:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9211FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CmvCKWkx
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b059dd7c0cso1243108fac.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 20:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688094881; x=1690686881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RNHf6NVyUFQzNF1pz0y7cG4/I8Za9eQypQWPdii93NU=;
        b=CmvCKWkxmXYkRw78eBrpd5Mt3SR6SdqFOyTPci351n8/8ZfGWZsZ9xmJVymyZK1spF
         hsu1/M93oG5KzWuejxCwHCpINRcE6pIrFjL4eYr2qfd/46zGBLrgxqIlalUqW1011LUp
         MlzhzVVeZsHBOySbmMStB1Of3+RCgseF2aRfWfXKHNQNTXTS89vV2Gn/atKyDYnIJI/3
         NO7JY9xqaVEr5JXdDhbBFQLYzckFmoYowTp+0SuhQ1Za+jus3CcSaNNXnN/Jp9gilScw
         vCfLGMe7pObWpgGSFDXX/rSWfwSS1bHmyZhfjsqdRdRsHZ1M7szOKDEh5VpT2V2L9NxA
         l5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688094881; x=1690686881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNHf6NVyUFQzNF1pz0y7cG4/I8Za9eQypQWPdii93NU=;
        b=NZ7yapH/5B7llUbWcHh2kNCB/IasBuq0TM/8FtVn6SGMq0Vif7qsWm7bcQWk5Dlydt
         UsiMDAaIjIrR7a0dH+4KD1GF2EPShza/kmlkoMkuALD5laWl3ZFgmvBSaFYUxLdmLEHK
         zO3P94aAqFYdNu2BWJJGs4EcO+Da9XFRWN3mpcl4+1rp4FMtt7SL8pMA04+X8r6KF4NA
         l1k/q9MfP440A5Q+m0qwXnLhLe2gxldxHUrPcpoICu/3SDr/3V9WRGjPjvBtim2G73GJ
         QGaY/qJ/c2G5Pnm5+MKFn/eMcv+107cE3KW+Ijv6fDn2AKoPg9fjBC1XpPvDKl4v8eOp
         oO/Q==
X-Gm-Message-State: AC+VfDyMTPXmOSdi2Q8MnNlUCgHFixzxh1mp8ehY+hCAd8WL7Krf/MNk
	dWOJvoyqtdqhX3HUvVn7sLyVduMQQ0W2nYQK2xc=
X-Google-Smtp-Source: 
 ACHHUZ7WTdGVqeE2h2G7jbY8wJpCeiRwHxDDbBj1wOBjgeai0L8fVjvRCCFkKz3jq/nSBDkU7tc8ipjBiPsGeISUs2Q=
X-Received: by 2002:aca:190a:0:b0:3a1:df16:2eed with SMTP id
 l10-20020aca190a000000b003a1df162eedmr1296953oii.30.1688094881310; Thu, 29
 Jun 2023 20:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230629141034.2659669-1-s.hauer@pengutronix.de>
 <20230629141034.2659669-3-s.hauer@pengutronix.de>
In-Reply-To: <20230629141034.2659669-3-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jun 2023 11:14:30 +0800
Message-ID: 
 <CAA+D8AMrtKjXsUNDuQTCaG-0b2DaRz5x34Owih-EbUs3+nH-_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Fill Tx FIFO to avoid initial
 underruns
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID-Hash: 5UX73YYUSUAJYU6YK3NMPUJ2VBSEZNIH
X-Message-ID-Hash: 5UX73YYUSUAJYU6YK3NMPUJ2VBSEZNIH
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
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UX73YYUSUAJYU6YK3NMPUJ2VBSEZNIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTA6MTDigK9QTSBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+DQp3cm90ZToNCg0KPiBGcm9tOiBBaG1hZCBGYXRvdW0gPGEuZmF0b3Vt
QHBlbmd1dHJvbml4LmRlPg0KPg0KPiBKQUNLIGhhbmRsZXMgWFJ1bnMgYnkgc3RvcHBpbmcgYW5k
IHN0YXJ0IHRoZSBBTFNBIGRldmljZS4gT24gb2NjYXNpb24sDQo+IHRoaXMgbGVhZHMgdG8gZWFy
bHkgdW5kZXJydW5zIG9uIHN0YXJ0IGxlYWRpbmcgdG8gcmVvcmRlcmQgb3V0cHV0DQo+IGNoYW5u
ZWxzLg0KPg0KPiBCeSBmaWxsaW5nIHRoZSBGSUZPIGluaXRpYWxseSwgd2UgY2FuIGF2b2lkIHRo
ZXNlIGVhcmx5IHVuZGVycnVucy4NCj4gVGhpcyBpcyBhbHNvIHN1Z2dlc3RlZCBieSB0aGUgaS5N
WDhNTSByZWZlcmVuY2UgbWFudWFsOg0KPg0KPiAgICJJZiB0aGUgVHJhbnNtaXQgRklGTyBpcyBl
bXB0eSwgdGhlbiB0byBhdm9pZCBhIEZJRk8gdW5kZXJydW4sIHRoZQ0KPiAgIFRyYW5zbWl0IERh
dGEgUmVnaXN0ZXIgbXVzdCBiZSB3cml0dGVuIGF0IGxlYXN0IDMgYml0IGNsb2NrcyBiZWZvcmUN
Cj4gICB0aGUgc3RhcnQgb2YgdGhlIG5leHQgdW5tYXNrZWQgd29yZC4gQmVmb3JlIGVuYWJsaW5n
IHRoZSB0cmFuc21pdHRlciwNCj4gICB0aGUgVHJhbnNtaXQgRklGTyBzaG91bGQgYmUgaW5pdGlh
bGl6ZWQgd2l0aCBkYXRhIChzaW5jZSBhZnRlciB0aGUNCj4gICB0cmFuc21pdHRlciBpcyBlbmFi
bGVkLCB0aGUgdHJhbnNtaXR0ZXIgd2lsbCBzdGFydCBhIG5ldyBmcmFtZSwgYW5kDQo+ICAgaWYg
bm8gZGF0YSBpcyBpbiB0aGUgRklGTywgdGhlbiB0aGUgdHJhbnNtaXR0ZXIgd2lsbCBpbW1lZGlh
dGVseSBnaXZlDQo+ICAgYW4gZXJyb3IpIg0KPg0KPiBbMV06IFJldi4gMCwgMDIvMjAxOSwgMTMu
OS4zLjUuMiBGSUZPIHBvaW50ZXJzDQo+IEZpeGVzOiA0MzU1MDgyMTQ5NDIgKCJBU29DOiBBZGQg
U0FJIFNvQyBEaWdpdGFsIEF1ZGlvIEludGVyZmFjZSBkcml2ZXIuIikNCj4gU2lnbmVkLW9mZi1i
eTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4NCj4gU2lnbmVkLW9mZi1i
eTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4NCj4gTm90
ZXM6DQo+ICAgICBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgICAgLSBBZGQgbWlzc2luZyBTaWduZWQt
b2ZmLWJ5DQo+DQo+ICBzb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYyB8IDE4ICsrKysrKysrKysrKysr
KysrKw0KPiAgc291bmQvc29jL2ZzbC9mc2xfc2FpLmggfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9mc2wvZnNs
X3NhaS5jIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gaW5kZXggMzZmNjExNTQ2OTg0My4u
NmE0Zjk5MDExMGQ5MSAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4g
KysrIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gQEAgLTc1NSw2ICs3NTUsMjEgQEAgc3Rh
dGljIHZvaWQgZnNsX3NhaV9jb25maWdfZGlzYWJsZShzdHJ1Y3QgZnNsX3NhaQ0KPiAqc2FpLCBp
bnQgZGlyKQ0KPiAgICAgICAgIH0NCj4gIH0NCj4NCj4gK3N0YXRpYyB2b2lkIGZzbF9zYWlfdHhf
ZmlsbF9maWZvKHN0cnVjdCBmc2xfc2FpICpzYWksDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgKnJ1bnRpbWUpDQo+ICt7DQo+ICsgICAg
ICAgdTMyIHNsb3RzLCBzbG90X3dpZHRoLCBwaW5zOw0KPiArICAgICAgIGludCBpOw0KPiArDQo+
ICsgICAgICAgc2xvdF93aWR0aCA9IHNhaS0+c2xvdF93aWR0aCA/Og0KPiBzbmRfcGNtX2Zvcm1h
dF9waHlzaWNhbF93aWR0aChydW50aW1lLT5mb3JtYXQpOw0KPiArDQo+ICsgICAgICAgc2xvdHMg
PSBmc2xfc2FpX2dldF90ZG1fc2xvdHMoc2FpLCBydW50aW1lLT5jaGFubmVscywgc2xvdF93aWR0
aCk7DQo+ICsgICAgICAgcGlucyA9IERJVl9ST1VORF9VUChydW50aW1lLT5jaGFubmVscywgc2xv
dHMpOw0KPiArDQo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IHJ1bnRpbWUtPmNoYW5uZWxzOyBp
KyspDQo+ICsgICAgICAgICAgICAgICByZWdtYXBfd3JpdGUoc2FpLT5yZWdtYXAsIEZTTF9TQUlf
VERSKGkgJSBwaW5zKSwgMHgwKTsNCj4NCg0KVGhlcmUgbWF5IGJlIGFuIGlzc3VlIGhlcmUgZm9y
IHRoZSBjYXNlIHRoYXQgc2VsZWN0ZWQgcGlucyBhcmUgbm90DQpjb250aW51b3VzLiBmb3IgZXhh
bXBsZTogc2VsZWN0IHBpbiAwLCAyLCA0LCA2DQoNCmJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2pp
dQ0KDQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgZnNsX3NhaV90cmlnZ2VyKHN0cnVjdCBzbmRf
cGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kLA0KPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IHNuZF9zb2NfZGFpICpjcHVfZGFpKQ0KPiAgew0KPiBAQCAtNzg0LDYgKzc5OSw5IEBAIHN0
YXRpYyBpbnQgZnNsX3NhaV90cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQ0KPiAqc3Vi
c3RyZWFtLCBpbnQgY21kLA0KPiAgICAgICAgIGNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RBUlQ6
DQo+ICAgICAgICAgY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9SRVNVTUU6DQo+ICAgICAgICAgY2Fz
ZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9SRUxFQVNFOg0KPiArICAgICAgICAgICAgICAgLyog
RmlsbCBGSUZPIHRvIGF2b2lkIGluaXRpYWwgdW5kZXJydW5zICovDQo+ICsgICAgICAgICAgICAg
ICBpZiAodHgpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZzbF9zYWlfdHhfZmlsbF9maWZv
KHNhaSwgc3Vic3RyZWFtLT5ydW50aW1lKTsNCj4gICAgICAgICAgICAgICAgIHJlZ21hcF91cGRh
dGVfYml0cyhzYWktPnJlZ21hcCwgRlNMX1NBSV94Q1NSKHR4LCBvZnMpLA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEZTTF9TQUlfQ1NSX0ZSREUsIEZTTF9TQUlfQ1NSX0ZS
REUpOw0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmggYi9zb3VuZC9z
b2MvZnNsL2ZzbF9zYWkuaA0KPiBpbmRleCBhNTNjNGYwZTI1ZmFmLi42NmExMzZkOTdhNDQxIDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuaA0KPiArKysgYi9zb3VuZC9zb2Mv
ZnNsL2ZzbF9zYWkuaA0KPiBAQCAtMzQsNiArMzQsNyBAQA0KPiAgI2RlZmluZSBGU0xfU0FJX1RE
UjUgICAweDM0IC8qIFNBSSBUcmFuc21pdCBEYXRhIDUgKi8NCj4gICNkZWZpbmUgRlNMX1NBSV9U
RFI2ICAgMHgzOCAvKiBTQUkgVHJhbnNtaXQgRGF0YSA2ICovDQo+ICAjZGVmaW5lIEZTTF9TQUlf
VERSNyAgIDB4M0MgLyogU0FJIFRyYW5zbWl0IERhdGEgNyAqLw0KPiArI2RlZmluZSBGU0xfU0FJ
X1REUihvZnMpICAgICAgIChGU0xfU0FJX1REUjAgKyAob2ZzKSAqIDQpDQo+ICAjZGVmaW5lIEZT
TF9TQUlfVEZSMCAgIDB4NDAgLyogU0FJIFRyYW5zbWl0IEZJRk8gMCAqLw0KPiAgI2RlZmluZSBG
U0xfU0FJX1RGUjEgICAweDQ0IC8qIFNBSSBUcmFuc21pdCBGSUZPIDEgKi8NCj4gICNkZWZpbmUg
RlNMX1NBSV9URlIyICAgMHg0OCAvKiBTQUkgVHJhbnNtaXQgRklGTyAyICovDQo+IC0tDQo+IDIu
MzkuMg0KPg0KPg0K
