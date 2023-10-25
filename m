Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6357D8699
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B51F823;
	Thu, 26 Oct 2023 18:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B51F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698337221;
	bh=iG+KqE/j/lyZPzeRAvJ20xuJDLlwnA3y7FhO1BP3UeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BkA8FxgQU1Yi3g54+a8GrOX7NHd1kVw5S/TcBtE0c1kv9iOsjB8T/VmGndLhaAe8S
	 2mBqU64ZOgADRtOrCum6VJ1wH04Z41vmt+i92paTj92Att1hbBNvcz4/YuLiyRaVnb
	 /6vfGQaKdA+TlamHklKdB4mEbLqyze0Ni2l25kzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC588F8014B; Thu, 26 Oct 2023 18:19:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6761CF80165;
	Thu, 26 Oct 2023 18:19:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4250F80165; Wed, 25 Oct 2023 05:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,NUMERIC_HTTP_ADDR,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28149F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 05:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28149F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=ZEJD3sU9
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1e9bb3a0bfeso3891264fac.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 20:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698203015; x=1698807815;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zDZNyGNAkL6IuESpJ8AESr2RrAKFaDI+tZr/T3lMuyE=;
        b=ZEJD3sU9V3Fsey5R5zp+0YHgFXnF2kv/ASYWVjfVDEZJM5uKBdkOzuGxi/rzRdwJBf
         LYCl5yOqMOVEzaOsgh2Y/WSQPYPWVeOkcH587JLEzExc+vEkcEzu3y+fiyNPBf1f2Qgs
         D6nRtzwZLbuqnDiosdFqp1O1sM2Q2bOH+NsmY4II8Ta557AKkLLnvftnUunzC/kugwuI
         bgfG9lrr+OvLkN2ChYUxwvLw/11ZqzYX4XfYQ4xiZTx+ICOaHWnxTgdiLn0zw1MjbZxZ
         MMBnQ6/gyUeUQl4OsGRDYJBtwVqYqnPPyEW/EoiE6Qrfu2gVBNUmrisCr5fXXZfFrJDM
         KfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698203015; x=1698807815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDZNyGNAkL6IuESpJ8AESr2RrAKFaDI+tZr/T3lMuyE=;
        b=QTTmv7rOV1ZcF0lCkCF7r2YsdH9QT/Ne9BOR+hExayRbEJUGeWbZg2YBMW/+SffDfq
         C+vx8Lr7Z1zoMc3ZpiSX3uryE+zczGxt9Q+VBOjltbjHSTEwWOMOviLW0GljrPUn5L8I
         X9BlEs4VOYihJ6TWSTwiYJPFGH7Nbx665TBfUY23ioL2a9JsAgnHg0qZWedeHtdGG9DG
         DcriinblG9z33CLBvOU9nlD70Mcfzi7SfDMgIkJ3qZQcZJqN0CSJKrAkR2EfFT4tKcd8
         or8EkzldFNjwjF7jHnpEzhIViOQUYqAO+8DYkOOEZ1G6QJYKWYrz9HxXk0RDkyF5EZnf
         B1Rw==
X-Gm-Message-State: AOJu0YxauXJ69RHXXE1JA2OtIdSLWfPbSSd9Hl+rO4/+6FmBKQOfEnNn
	1b6NmmlzrYbeBFD6UgdxVIQgNMiFFV44z2iVJp14OA==
X-Google-Smtp-Source: 
 AGHT+IHP8atSxqeq8lJkcQwvJwtP0KH6MnNnGNB2DV06dph61QpMLsbf5WnvHngzCjMjJTwl3W+GxZ9xdNPdzcz3h5E=
X-Received: by 2002:a05:6870:9724:b0:1ea:206e:cb10 with SMTP id
 n36-20020a056870972400b001ea206ecb10mr16028668oaq.22.1698203015421; Tue, 24
 Oct 2023 20:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
In-Reply-To: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Wed, 25 Oct 2023 11:03:24 +0800
Message-ID: 
 <CADYyEwSMB9QQCZVuTC=+m8wZJFxkXzzZPhV6wv2-TsZAXa1j8A@mail.gmail.com>
Subject: Re: [bug report] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4FIYEM34M7VIJCUWOEFG4MZMY2LUEWKX
X-Message-ID-Hash: 4FIYEM34M7VIJCUWOEFG4MZMY2LUEWKX
X-Mailman-Approved-At: Thu, 26 Oct 2023 16:19:26 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4FIYEM34M7VIJCUWOEFG4MZMY2LUEWKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgRGFuLA0KDQpPbiBUdWUsIE9jdCAyNCwgMjAyMyBhdCA1OjUw4oCvUE0gRGFuIENhcnBlbnRl
ciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0Kd3JvdGU6DQoNCj4gSGVsbG8geGlhemhlbmdx
aWFvLA0KPg0KPiBUaGUgcGF0Y2ggZDg4YzQzMzgzMTAxOiAiQVNvQzogbWVkaWF0ZWs6DQo+IG10
ODE4Nl9tdDYzNjZfcnQxMDE5X3J0NTY4MnM6IGFkZCBydDU2NTAgc3VwcG9ydCIgZnJvbSBPY3Qg
MTksIDIwMjMNCj4gKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBz
dGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPg0KPiAgICAgICAgIHNvdW5kL3NvYy9tZWRpYXRlay9t
dDgxODYvbXQ4MTg2LW10NjM2Ni1ydDEwMTktcnQ1Njgycy5jOjE5OA0KPiBtdDgxODZfcnQ1Njgy
c19pbml0KCkNCj4gICAgICAgICB3YXJuOiBkb2VzIGVuZGlhbm5lc3MgbWF0dGVyIGZvciAndHlw
ZSc/DQo+DQo+IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxODYvbXQ4MTg2LW10NjM2Ni1ydDEwMTkt
cnQ1Njgycy5jDQo+ICAgICAxNjEgc3RhdGljIGludCBtdDgxODZfcnQ1Njgyc19pbml0KHN0cnVj
dCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpDQo+ICAgICAxNjIgew0KPiAgICAgMTYzICAgICAg
ICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudF9hZmUgPQ0KPiAgICAgMTY0ICAgICAg
ICAgICAgICAgICBzbmRfc29jX3J0ZGNvbV9sb29rdXAocnRkLCBBRkVfUENNX05BTUUpOw0KPiAg
ICAgMTY1ICAgICAgICAgc3RydWN0IG10a19iYXNlX2FmZSAqYWZlID0NCj4gc25kX3NvY19jb21w
b25lbnRfZ2V0X2RydmRhdGEoY21wbnRfYWZlKTsNCj4gICAgIDE2NiAgICAgICAgIHN0cnVjdCBt
dGtfc29jX2NhcmRfZGF0YSAqc29jX2NhcmRfZGF0YSA9DQo+ICAgICAxNjcgICAgICAgICAgICAg
ICAgIHNuZF9zb2NfY2FyZF9nZXRfZHJ2ZGF0YShydGQtPmNhcmQpOw0KPiAgICAgMTY4ICAgICAg
ICAgc3RydWN0IG10ODE4Nl9tdDYzNjZfcnQxMDE5X3J0NTY4MnNfcHJpdiAqcHJpdiA9DQo+IHNv
Y19jYXJkX2RhdGEtPm1hY2hfcHJpdjsNCj4gICAgIDE2OSAgICAgICAgIHN0cnVjdCBzbmRfc29j
X2phY2sgKmphY2sgPSAmcHJpdi0+aGVhZHNldF9qYWNrOw0KPiAgICAgMTcwICAgICAgICAgc3Ry
dWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudF9jb2RlYyA9DQo+ICAgICAxNzEgICAgICAgICAg
ICAgICAgIHNuZF9zb2NfcnRkX3RvX2NvZGVjKHJ0ZCwgMCktPmNvbXBvbmVudDsNCj4gICAgIDE3
MiAgICAgICAgIGludCByZXQ7DQo+ICAgICAxNzMgICAgICAgICBpbnQgdHlwZTsNCj4gICAgIDE3
NA0KPiAgICAgMTc1ICAgICAgICAgcmV0ID0gbXQ4MTg2X2RhaV9pMnNfc2V0X3NoYXJlKGFmZSwg
IkkyUzEiLCAiSTJTMCIpOw0KPiAgICAgMTc2ICAgICAgICAgaWYgKHJldCkgew0KPiAgICAgMTc3
ICAgICAgICAgICAgICAgICBkZXZfZXJyKHJ0ZC0+ZGV2LCAiRmFpbGVkIHRvIHNldCB1cCBzaGFy
ZWQNCj4gY2xvY2tzXG4iKTsNCj4gICAgIDE3OCAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsN
Cj4gICAgIDE3OSAgICAgICAgIH0NCj4gICAgIDE4MA0KPiAgICAgMTgxICAgICAgICAgcmV0ID0g
c25kX3NvY19jYXJkX2phY2tfbmV3X3BpbnMocnRkLT5jYXJkLCAiSGVhZHNldCBKYWNrIiwNCj4g
ICAgIDE4MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRfSkFDS19IRUFE
U0VUIHwNCj4gU05EX0pBQ0tfQlROXzAgfA0KPiAgICAgMTgzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNORF9KQUNLX0JUTl8xIHwNCj4gU05EX0pBQ0tfQlROXzIgfA0KPiAg
ICAgMTg0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNORF9KQUNLX0JUTl8z
LA0KPiAgICAgMTg1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGphY2ssIG10
ODE4Nl9qYWNrX3BpbnMsDQo+ICAgICAxODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQVJSQVlfU0laRShtdDgxODZfamFja19waW5zKSk7DQo+ICAgICAxODcgICAgICAgICBp
ZiAocmV0KSB7DQo+ICAgICAxODggICAgICAgICAgICAgICAgIGRldl9lcnIocnRkLT5kZXYsICJI
ZWFkc2V0IEphY2sgY3JlYXRpb24gZmFpbGVkOg0KPiAlZFxuIiwgcmV0KTsNCj4gICAgIDE4OSAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgIDE5MCAgICAgICAgIH0NCj4gICAgIDE5
MQ0KPiAgICAgMTkyICAgICAgICAgc25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFD
S19CVE5fMCwNCj4gS0VZX1BMQVlQQVVTRSk7DQo+ICAgICAxOTMgICAgICAgICBzbmRfamFja19z
ZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8xLA0KPiBLRVlfVk9JQ0VDT01NQU5EKTsN
Cj4gICAgIDE5NCAgICAgICAgIHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tf
QlROXzIsIEtFWV9WT0xVTUVVUCk7DQo+ICAgICAxOTUgICAgICAgICBzbmRfamFja19zZXRfa2V5
KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8zLA0KPiBLRVlfVk9MVU1FRE9XTik7DQo+ICAgICAx
OTYNCj4gICAgIDE5NyAgICAgICAgIHR5cGUgPSBTTkRfSkFDS19IRUFEU0VUIHwgU05EX0pBQ0tf
QlROXzAgfCBTTkRfSkFDS19CVE5fMQ0KPiB8IFNORF9KQUNLX0JUTl8yIHwgU05EX0pBQ0tfQlRO
XzM7DQo+IC0tPiAxOTggICAgICAgICByZXR1cm4gc25kX3NvY19jb21wb25lbnRfc2V0X2phY2so
Y21wbnRfY29kZWMsIGphY2ssICh2b2lkDQo+ICopJnR5cGUpOw0KPg0KPiBUaGlzIGlzIGFuIHVu
cHVibGlzaGVkIFNtYXRjaCBjaGVjayB3aGVyZSBJIG1hbnVhbGx5IHJldmlldyBjYXN0cyB0byBz
ZWUNCj4gaWYgdGhleSBhcmUgY29ycmVjdC4gIFF1aXRlIG9mdGVuIHRoZXkgYXJlbid0IGJlY2F1
c2Ugb2YgYW4gZW5kaWFuIGJ1Zw0KPiBvciBhIDY0IGJpdCB2cyAzMiBiaXQgaXNzdWUuDQo+DQo+
IEhlcmUgaXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCdzIGhhcHBlbmluZy4gIE5vcm1hbGx5IHdp
dGggdGhpcyBzb3J0IG9mDQo+IHBhc3MgYSB2b2lkIHBvaW50ZXIgY29kZSwgeW91IGNhbiB0aWUg
aXQgdmVyeSBlYXNpbHkgdG8gdGhlIHNhbWUgZHJpdmVyLg0KPiBCdXQgaW4gdGhpcyBjYXNlIGl0
J3MgbXVjaCBtb3JlIGRpZmZpY3VsdC4NCj4NCj4gVGhlcmUgYXJlIHR3byBmdW5jdGlvbnMgd2hp
Y2ggdXNlIHRoZSB2b2lkICpkYXRhIHBvaW50ZXIsDQo+IHJ0NTY0MF9zZXRfamFjaygpIGFuZCBy
dDU2NDVfY29tcG9uZW50X3NldF9qYWNrKCkuICBPbmUgdGFrZXMgYW4gaW50IGFuZA0KPiB0aGUg
b3RoZXIgdGFrZXMgYSBzdHJ1Y3QgcnQ1NjQwX3NldF9qYWNrX2RhdGEgcG9pbnRlci4gIFNvIHBy
ZXN1bWFibHkNCj4gd2Uga25vdyB0aGF0IHRoZSBjbXBudF9jb2RlYy0+ZHJpdmVyLT5zZXRfamFj
ayBwb2ludHMgdG8NCj4gLS0+IHJ0NTY0NV9jb21wb25lbnRfc2V0X2phY2soKS4gIEJ1dCBob3cg
ZG8gd2Uga25vdyB0aGF0Pw0KPg0KPiAtLT4gSXMgdGhlcmUgYSB0cmljayBmb3IgbWUgYXMgYSBy
ZXZpZXdlciB0byB1c2U/DQo+DQoNCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10
ODE4Nl9tdDYzNjZfcnQxMDE5X3J0NTY4MnNfZHRfbWF0Y2hbXSA9IHsNCnsNCi5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4Ni1tdDYzNjYtcnQxMDE5LXJ0NTY4MnMtc291bmQiLA0KLmRhdGEg
PSAmbXQ4MTg2X210NjM2Nl9ydDEwMTlfcnQ1Njgyc19zb2NfY2FyZCwNCn0sDQp7DQouY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxODYtbXQ2MzY2LXJ0NTY4MnMtbWF4OTgzNjAtc291bmQiLA0K
LmRhdGEgPSAmbXQ4MTg2X210NjM2Nl9ydDU2ODJzX21heDk4MzYwX3NvY19jYXJkLA0KfSwNCnsN
Ci5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4Ni1tdDYzNjYtcnQ1NjUwLXNvdW5kIiwNCi5k
YXRhID0gJm10ODE4Nl9tdDYzNjZfcnQ1NjUwX3NvY19jYXJkLA0KfSwNCnt9DQp9Ow0KDQogVGhp
cyBkcml2ZXIgdXNlcyBvbmx5IHR3byBjb2RlY3M6IHJ0NTY1MCwgcnQ1NjgyDQogaW4gIG10ODE4
Ni1tdDYzNjYtcnQxMDE5LXJ0NTY4MnMuYywgIHJ0NTY1MCB1c2VzIHJ0NTY0NV9jb21wb25lbnRf
c2V0X2phY2sNCnRvIHNldCBqYWNrLCAnKCppbnQqICopZGF0YQ0KPGh0dHA6Ly8xNzIuMzEuOTMu
NDY6ODg4OC9zb3VyY2Uvcz9kZWZzPWRhdGEmcHJvamVjdD12NS4xNT4nIGlzIHVzZWQgaW4gdGhl
DQpmdW5jdGlvbiwNClJUNTY4MlMgZG9lcyBub3QgdXNlICd2b2lkICogZGF0YScgaW4gcnQ1Njgy
c19zZXRfamFja19kZXRlY3QuDQoNCkFzIGZvciBydDU2NDAsIHdlIGFyZSBub3QgdXNpbmcgaXQg
aW4gdGhpcyBkcml2ZXIsIHNvIGl0IHdpbGwgbm90IHJ1bg0KcnQ1NjQwX3NldF9qYWNrLg0KDQpp
ZiB3ZSB3YW50IHRvIGtub3cgd2hhdCBmdW5jdGlvbiAnJ3NuZF9zb2NfY29tcG9uZW50X3NldF9q
YWNrJycgY2FsbHMsIHdlDQpjYW4gc2VlIHdoYXQgY29kZWNzIHRoaXMgZHJpdmVyIHVzZXMgaW4g
a2NvbmZpZyBsaWtlOg0KDQpjb25maWcgU05EX1NPQ19NVDgxODZfTVQ2MzY2X1JUMTAxOV9SVDU2
ODJTDQp0cmlzdGF0ZSAiQVNvQyBBdWRpbyBkcml2ZXIgZm9yIE1UODE4NiB3aXRoIFJUMTAxOSBS
VDU2ODJTDQpNQVg5ODM1N0EvTUFYOTgzNjAgY29kZWMiDQpkZXBlbmRzIG9uIEkyQyAmJiBHUElP
TElCDQpkZXBlbmRzIG9uIFNORF9TT0NfTVQ4MTg2ICYmIE1US19QTUlDX1dSQVANCnNlbGVjdCBT
TkRfU09DX01BWDk4MzU3QQ0Kc2VsZWN0IFNORF9TT0NfTVQ2MzU4DQpzZWxlY3QgU05EX1NPQ19N
QVg5ODM1N0ENCnNlbGVjdCBTTkRfU09DX1JUMTAxNVANCnNlbGVjdCBTTkRfU09DX1JUNTY4MlMN
CnNlbGVjdCBTTkRfU09DX1JUNTY0NQ0Kc2VsZWN0IFNORF9TT0NfQlRfU0NPDQpzZWxlY3QgU05E
X1NPQ19ETUlDDQpzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDDQpoZWxwDQoNCg0KICAgIDE5OSB9
DQo+DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4NCg==
