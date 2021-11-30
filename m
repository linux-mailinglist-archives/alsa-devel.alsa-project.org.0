Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61A4630D4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 11:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7161F96;
	Tue, 30 Nov 2021 11:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7161F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638267361;
	bh=dBYQclrL1vKJA2hPRXt6KeF9g/jxE7KFkoJRa+VO53I=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lX73VF8F2VxaeDBg0X6UbWJDK7sXm/opGbN37RIdv8coIw3FallM6BqPZuLuFcCx9
	 ztG2/1ieCW1jeVii/2c5WSKrpqH8Kn3+6egusgDvPvTc0dd2tw18tDC4xL84ZRmwu4
	 vjf/uxGjyYiSRFjKNT731gK2Ewp8jQJU5xFSYNCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63378F80113;
	Tue, 30 Nov 2021 11:14:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ECB5F80290; Tue, 30 Nov 2021 11:14:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A535FF80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 11:14:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A535FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="1AfopWS6"
Received: by mail-wr1-x436.google.com with SMTP id a18so43245224wrn.6
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 02:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dBYQclrL1vKJA2hPRXt6KeF9g/jxE7KFkoJRa+VO53I=;
 b=1AfopWS6zkTVa6jdKQAeJJGCeMD6fHQz81yeyoe5PnEej7snZTuH+i2brOhwwuuAKl
 Ad415D20Z29yvG1BpKgjlqjo2EaqbXSgSqpXOvJRlMztKmI4bxG+dQAFegsm+RPTbBi2
 1skDls09LikfsHP40q7JVyi0tnfCtKX/flqYJzfbKJA9QZAatjWyotuq+3AfZANvvkKH
 jJviAflgtTO+clMQg9JcSbSzH129XygWrX/qjFVBFk6/TFo9Gtf3ye4oGKmIGB/K8Svb
 pxexwZQvUToX5cjLUqg2Zzv6hjlwyH9sZCoJtUtbPC7FVF74YUpuR6GQ4d7as9shHY4k
 hUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dBYQclrL1vKJA2hPRXt6KeF9g/jxE7KFkoJRa+VO53I=;
 b=teWT9usFXwjXv+12DeLu0d8QGeSv2bbrnsm+72mhJ7yVOqK8hcHBIO6tI57yEm0MHr
 NRqJ/nUhu+JxKKsKaS0OAjZnhp+Z6M4jEi62//NiXgMQGGCUoDlk9H8uYDh29i4Zo2py
 VQZ5rdAxjyqDoGMzzt0XC2drQPljhgbYngYSOS0CZ6TI/wUN+HLRu5fvuBns4ME+IXyP
 07ilLo1vmZVphwqVb8nnjyRPm1MP8rntHrcTUdVrgZh5KVdJMEBXghtNyZLSYN7oPXiP
 Q0dooOsjA0RZ+p8KxsfG9yX+gvxUma42toRph3Uoss3GK8fcKwFqirhIrkLOJrJyRTpe
 4hYw==
X-Gm-Message-State: AOAM5321YCD3oN82q9cWBVablgdIk8YhrIDq+hZ4fK0jnYzunj+hlMcI
 EySQ3lj/uyjVSKJEWywCBAHdJ61fxNNM8w==
X-Google-Smtp-Source: ABdhPJxYuug+7fh9iF3Xer/mVNntASv0BCC/qpNTVPpvQln8yYOB0AEfumefDIRmDn+iSntMtA/T7g==
X-Received: by 2002:adf:a285:: with SMTP id s5mr40497412wra.468.1638267268433; 
 Tue, 30 Nov 2021 02:14:28 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id e24sm11990465wra.78.2021.11.30.02.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:14:28 -0800 (PST)
References: <20211130093617.103147-1-jbrunet@baylibre.com>
 <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
Date: Tue, 30 Nov 2021 11:13:33 +0100
In-reply-to: <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
Message-ID: <1jmtlmeyrg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DQpPbiBUdWUgMzAgTm92IDIwMjEgYXQgMTE6MDYsIFJpY2FyZCBXYW5kZXJsb2YgPHJpY2FyZHdA
YXhpcy5jb20+IHdyb3RlOg0KDQo+IE9uIFR1ZSwgMzAgTm92IDIwMjEsIEplcm9tZSBCcnVuZXQg
d3JvdGU6DQo+DQo+PiBVc2UgZGV2X2Vycl9wcm9iZSgpIGhlbHBlciBmdW5jdGlvbiB0byBoYW5k
bGUgcHJvYmUgZGVmZXJyYWwuDQo+PiBJdCByZW1vdmVzIHRoZSBvcGVuIGNvZGVkIHRlc3QgZm9y
IC1FUFJPQkVfREVGRVIgYnV0IG1vcmUgaW1wb3J0YW50bHksIGl0DQo+PiBzZXRzIHRoZSBkZWZl
cnJhbCByZWFzb24gaW4gZGVidWdmcyB3aGljaCBpcyBncmVhdCBmb3IgZGVidWdnaW5nLg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4N
Cj4+IC0tLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vYWl1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTcgKysrKysrKy0tLS0tLS0tLS0NCj4+IMKgc291bmQvc29jL21lc29uL2F4Zy1m
aWZvLmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysrLS0tLS0tDQo+PiDCoHNvdW5kL3NvYy9t
ZXNvbi9heGctcGRtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKystLS0tLS0NCj4+IMKg
c291bmQvc29jL21lc29uL2F4Zy1zcGRpZmluLmPCoMKgwqDCoMKgwqAgfMKgIDYgKystLS0tDQo+
PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctc3BkaWZvdXQuY8KgwqDCoMKgwqAgfMKgIDYgKystLS0t
DQo+PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctdGRtLWZvcm1hdHRlci5jIHwgMTggKysrKysrLS0t
LS0tLS0tLS0tDQo+PiDCoHNvdW5kL3NvYy9tZXNvbi9heGctdGRtLWludGVyZmFjZS5jIHzCoCA5
ICsrKy0tLS0tLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC11dGlscy5jwqAgfMKg
IDQgKystLQ0KPj4gwqBzb3VuZC9zb2MvbWVzb24vdDkwMTUuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgOCArKysrLS0tLQ0KPj4gwqA5IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KyksIDU0IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lc29u
L2FpdS5jIGIvc291bmQvc29jL21lc29uL2FpdS5jDQo+PiBpbmRleCBiYTE1ZDU3NjJiMGIuLjM3
MDM2YWRmMTRjZSAxMDA2NDQNCj4+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9haXUuYw0KPj4gKysr
IGIvc291bmQvc29jL21lc29uL2FpdS5jDQo+PiBAQCAtMjE5LDMxICsyMTksMjkgQEAgc3RhdGlj
IGludCBhaXVfY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiDCoA0KPj4gwqDCoMKgwqDC
oMKgwqDCoCBhaXUtPnBjbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAicGNsayIpOw0KPj4gwqDCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKGFpdS0+cGNsaykpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChQVFJfRVJSKGFpdS0+cGNsaykgIT0gLUVQUk9CRV9ERUZFUikNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRl
diwgIkNhbid0IGdldCB0aGUgYWl1IHBjbGtcbiIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWl1LT5wY2xrKSwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiQ2Fu
J3QgZ2V0IHRoZSBhaXUgcGNsa1xuIik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihhaXUtPnBjbGspOw0KPj4gwqDCoMKgwqDCoMKgwqDCoCB9DQo+
DQo+IEEgbWlub3IgdGhpbmcsIGJ1dCBkZXZfZXJyX3Byb2JlIHJldHVybnMgaXRzIGVyciBhcmd1
bWVudCwgc28gdGhpcyANCj4gY29uc3RydWN0IGNhbiBiZSB3cml0dGVuIG1vcmUgdGVyc2VseSBh
czoNCj4NCj4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWlvLT5wY2xrKSwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJDYW4ndCBnZXQgdGhlIGFp
byBwY2xrXG4iKTsNCj4NCj4gYW5kIHRoYXQgYWxzbyBzZWVtcyB0byBiZSBpbiBjb21tb24gdXNh
Z2Ugd2hlbiBicm93c2luZyBleGlzdGluZyBjb2RlLg0KDQpNaXNzZWQgdGhhdA0KVGhhbmtzIFJp
Y2FyZCwgSSdsbCB1cGRhdGUgdGhlIGNoYW5nZS4NCg0KPg0KPiAvUmljYXJkDQoNCg==
