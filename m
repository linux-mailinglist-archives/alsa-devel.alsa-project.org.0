Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5532127EF4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3402B1673;
	Fri, 20 Dec 2019 16:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3402B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576854257;
	bh=oaiYFiBFyJYgygVkdlgs3/fd7RdWiu819UWgxjXhRIA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fQ3Ih+7ec+6A3Zzt0o1SPl0uHOJNy+bbcb0wVaxGcowLriG+BpHtcE0NHFwAqMdDv
	 lcuhF+M9dEJk9iOygdExlmvT4HWhy400owPordcLZSM+f+FMesHqwxEVw+99vcUxFV
	 lk9sogozHJHkplMRTci2xsND9DwLmlZsgPQy9cxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62880F8014C;
	Fri, 20 Dec 2019 16:02:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B4AF8015A; Fri, 20 Dec 2019 16:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_13, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70783F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70783F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bzBksC74"
Received: by mail-lf1-x144.google.com with SMTP id y1so7265022lfb.6
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlFuak06Cmps6wMpnaD71zwpjTVLzEqESjElloc7LCs=;
 b=bzBksC74unjLUTSNJ9LTu/0jA1k8Eb5ZmZFtmc2XhZV54wcj0Hs2QUlYWGUdAFreHh
 EPDbPz6GLGEB4N1anGt91ZXAfUE1V8o4m0AVYTXWrD5lgf0s6nzutxnCaP9opJLnfpJ+
 EL54Bf30bCl2paqg75VMh/3xHb85kvXluQ95BjhY0tSsIDrgJKacCLReIqAJe6pr40Dd
 LjJwdVP3IznPtdluo19N701g72XbpLuzTaUsiFjfXPCr01HoolPltdNYctbgL8RWVxDg
 77LbI5Uko0Q5U7Wj5whTLa9JcBm+31td5gQJ50UGPQhSOOqLpHAOJJGpV6BCC5Vg5rNR
 KJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlFuak06Cmps6wMpnaD71zwpjTVLzEqESjElloc7LCs=;
 b=ZCb/SGb/xkPfcs6/nt9S18HO6cYLHL7nI3QT/j6pD7ACYH63hO/xNu1SkSJM+7B8F3
 twg1j78J4UZFyY0nYgJ4XxxIvqXr8PH0XwBVpUAGqxXgHEwIpGeFgFUcnpNFZGkSFJkZ
 8riCF72Ck9nKQUwQ6Hn7V6YzYdxfuWsVKMPKMmkJVO+GPIDQedHzqKT0gRkLdJL2RSRT
 MMPCfZO4hoNmg+//9n/aEdyh1eI/4WTYjORBFVvQ7sb+pGs97DNwzAscPXuhkQdHuL9i
 c0rzPBysgnnZbSeIabiksYOzo9oVdmqLDlZaRHexQdmlovXBZJYOWE3hWVGvZApduy0m
 PpYw==
X-Gm-Message-State: APjAAAW2diF1VqRecaY0hNZrfaQXe81z3kxChJTyCLKw6DykBcA51Uih
 /d/5UofzbaCdKJ5w7+vJeg8=
X-Google-Smtp-Source: APXvYqyUv5bsYT89+s3bGupr3x8zRyZoL7ukNG6hTwbuy8SXSfKcRxMb5xPiTJ1LaCrqDXCo87EveA==
X-Received: by 2002:ac2:4884:: with SMTP id x4mr8997942lfc.92.1576854147072;
 Fri, 20 Dec 2019 07:02:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y7sm4342276ljj.58.2019.12.20.07.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 07:02:26 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>, Jon Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
Date: Fri, 20 Dec 2019 18:02:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

MjAuMTIuMjAxOSAxNzo1NiwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMjAvMTIvMjAxOSAx
NDo0MywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyMC4xMi4yMDE5IDE2OjU3LCBKb24gSHVu
dGVyINC/0LjRiNC10YI6Cj4+Pgo+Pj4gT24gMjAvMTIvMjAxOSAxMTozOCwgQmVuIERvb2tzIHdy
b3RlOgo+Pj4+IE9uIDIwLzEyLzIwMTkgMTE6MzAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Cj4+
Pj4+IE9uIDI1LzExLzIwMTkgMTc6MjgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+IDI1
LjExLjIwMTkgMjA6MjIsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+IDI1LjEx
LjIwMTkgMTM6MzcsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+PiBPbiAyMy8xMS8yMDE5
IDIxOjA5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4+PiAxOC4xMC4yMDE5IDE4OjQ4
LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVk
d2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGUgdGVn
cmEzIGF1ZGlvIGNhbiBzdXBwb3J0IDI0IGFuZCAzMiBiaXQgc2FtcGxlIHNpemVzIHNvIGFkZAo+
Pj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+Pj4+IG9wdGlvbiB0byB0aGUgdGVncmEzMF9pMnNfaHdfcGFy
YW1zIHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9yCj4+Pj4+Pj4+Pj4gUzMyX0xFCj4+Pj4+Pj4+
Pj4gZm9ybWF0cyB3aGVuIHJlcXVlc3RlZC4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pj4+
Pj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51azogZml4dXAgbWVyZ2Ugb2YgMjQgYW5kIDMy
Yml0XQo+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrOiBhZGQgcG0gY2FsbHMg
YXJvdW5kIHl0ZG0gY29uZmlnXQo+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
OiBkcm9wIGRlYnVnIHByaW50aW5nIHRvIGRldl9kYmddCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+Pj4+IHNxdWFzaCA1YWVjYTVhMDU1ZmQgQVNvQzogdGVncmE6IGkyczogcG1fcnVudGlt
ZV9nZXRfc3luYygpIGlzCj4+Pj4+Pj4+Pj4gbmVlZGVkCj4+Pj4+Pj4+Pj4gaW4gdGRtIGNvZGUK
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKSBpcyBuZWVkZWQgaW4gdGRtIGNvZGUKPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+PiDCoMKg
wqAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAyNSArKysrKysrKysrKysrKysrKysr
Ky0tLS0tCj4+Pj4+Pj4+Pj4gwqDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+Pj4+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVn
cmEzMF9pMnMuYwo+Pj4+Pj4+Pj4+IGluZGV4IDczZjBkZGRlYWVmMy4uMDYzZjM0Yzg4MmFmIDEw
MDY0NAo+Pj4+Pj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+
Pj4+Pj4gKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+PiBAQCAt
MTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+
Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gZGFpLT5kZXY7Cj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfaTJzICppMnMgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0
YShkYWkpOwo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWws
IHJlZzsKPj4+Pj4+Pj4+PiAtwqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJz
Y2xvY2ssIGJpdGNudDsKPj4+Pj4+Pj4+PiArwqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBz
cmF0ZSwgaTJzY2xvY2ssIGJpdGNudCwgYXVkaW9fYml0czsKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgdGVncmEzMF9haHViX2NpZl9jb25mIGNpZl9jb25mOwo+Pj4+Pj4+Pj4+IMKg
wqDCoCDCoMKgwqDCoMKgIGlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAyKQo+Pj4+Pj4+
Pj4+IEBAIC0xMzcsOCArMTM3LDE5IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1z
KHN0cnVjdAo+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykpIHsKPj4+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+Pj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0la
RV8xNjsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVE
SU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNhbXBsZV9z
aXplID0gMTY7Cj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+
Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMjQ7Cj4+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMjQ7
Cj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMjQ7Cj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01f
Rk9STUFUX1MzMl9MRToKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9J
MlNfQ1RSTF9CSVRfU0laRV8zMjsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0
cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18zMjsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
c2FtcGxlX3NpemUgPSAzMjsKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+
Pj4+PiBAQCAtMTcwLDggKzE4MSw4IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1z
KHN0cnVjdAo+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYudGhyZXNob2xkID0gMDsKPj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCBjaWZfY29uZi5hdWRpb19jaGFubmVscyA9IDI7Cj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgY2lmX2NvbmYuY2xpZW50X2NoYW5uZWxzID0gMjsKPj4+Pj4+Pj4+PiAtwqDCoMKg
IGNpZl9jb25mLmF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4+Pj4+
Pj4gLcKgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18x
NjsKPj4+Pj4+Pj4+PiArwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+
Pj4+Pj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGNpZl9jb25mLmV4cGFuZCA9IDA7Cj4+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqAgY2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIGNpZl9jb25mLnJlcGxpY2F0ZSA9IDA7Cj4+Pj4+Pj4+Pj4gQEAgLTMwNiwxNCArMzE3
LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyCj4+Pj4+Pj4+Pj4g
dGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5y
YXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwK
Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklU
X1MxNl9MRSwKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnN0
cmVhbV9uYW1lID0gIkNhcHR1cmUiLAo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hh
bm5lbHNfbWF4ID0gMiwKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9
IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5m
b3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9M
RSwKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
IC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAu
c3ltbWV0cmljX3JhdGVzID0gMSwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEhlbGxv
LAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYnJlYWtzIGF1ZGlvIG9uIFRlZ3JhMzAu
IEkgZG9uJ3Qgc2VlIGVycm9ycwo+Pj4+Pj4+Pj4gYW55d2hlcmUsIGJ1dAo+Pj4+Pj4+Pj4gdGhl
cmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNoIGhlbHBzLiBQbGVhc2UgZml4
IGl0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaGF0IGlzIHRoZSBmYWlsdXJlIG1vZGU/IEkgY2FuIHRy
eSBhbmQgdGFrZSBhIGxvb2sgYXQgdGhpcyBzb21lCj4+Pj4+Pj4+IHRpbWUKPj4+Pj4+Pj4gdGhp
cyB3ZWVrLCBidXQgSSBhbSBub3Qgc3VyZSBpZiBJIGhhdmUgYW55IGJvYXJkcyB3aXRoIGFuIGFj
dHVhbAo+Pj4+Pj4+PiB1c2VmdWwKPj4+Pj4+Pj4gYXVkaW8gb3V0cHV0Pwo+Pj4+Pj4+Cj4+Pj4+
Pj4gVGhlIGZhaWx1cmUgbW9kZSBpcyB0aGF0IHRoZXJlIG5vIHNvdW5kLiBJIGFsc28gbm90aWNl
ZCB0aGF0IHZpZGVvCj4+Pj4+Pj4gcGxheWJhY2sgc3R1dHRlcnMgYSBsb3QgaWYgbW92aWUgZmls
ZSBoYXMgYXVkaW8gdHJhY2ssIHNlZW1zCj4+Pj4+Pj4gc29tZXRoaW5nCj4+Pj4+Pj4gdGltZXMg
b3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2suIEZvciBub3cgSSBkb24ndCBoYXZlIGFu
eQo+Pj4+Pj4+IG1vcmUgaW5mby4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE9oLCBJIGRpZG4ndCBz
YXkgaG93IHRvIHJlcHJvZHVjZSBpdC4uIGZvciBleGFtcGxlIHNpbXBseSBwbGF5aW5nCj4+Pj4+
PiBiaWdfYnVja19idW5ueV83MjBwX2gyNjQubW92IGluIE1QViBoYXMgdGhlIGF1ZGlvIHByb2Js
ZW0uCj4+Pj4+Pgo+Pj4+Pj4gaHR0cHM6Ly9kb3dubG9hZC5ibGVuZGVyLm9yZy9wZWFjaC9iaWdi
dWNrYnVubnlfbW92aWVzL2JpZ19idWNrX2J1bm55XzcyMHBfaDI2NC5tb3YKPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pgo+Pj4+PiBHaXZlbiB0aGF0IHRoZSBhdWRpbyBkcml2ZXJzIHVzZXMgcmVnbWFwLCBp
dCBjb3VsZCBiZSBnb29kIHRvIGR1bXAgdGhlCj4+Pj4+IEkyUy9BSFVCIHJlZ2lzdGVycyB3aGls
ZSB0aGUgY2xpcCBpZiBwbGF5aW5nIHdpdGggYW5kIHdpdGhvdXQgdGhpcwo+Pj4+PiBwYXRjaAo+
Pj4+PiB0byBzZWUgdGhlIGRpZmZlcmVuY2VzLiBJIGFtIGN1cmlvdXMgaWYgdGhlIGF1ZGlvIGlz
IG5vdyBiZWluZwo+Pj4+PiBwbGF5ZWQgYXMKPj4+Pj4gMjQgb3IgMzItYml0IGluc3RlYWQgb2Yg
MTYtYml0IG5vdyB0aGVzZSBhcmUgYXZhaWxhYmxlLgo+Pj4+Pgo+Pj4+PiBZb3UgY291bGQgYWxz
byBkdW1wIHRoZSBod19wYXJhbXMgdG8gc2VlIHRoZSBmb3JtYXQgd2hpbGUgcGxheWluZyBhcwo+
Pj4+PiB3ZWxsIC4uLgo+Pj4+Pgo+Pj4+PiAkIC9wcm9jL2Fzb3VuZC88c2NhcmQtbmFtZT4vcGNt
MHAvc3ViMC9od19wYXJhbXMKPj4+Pgo+Pj4+IEkgc3VwcG9zZSBpdCBpcyBhbHNvIHBvc3NpYmxl
IHRoYXQgdGhlIGNvZGVjIGlzbid0IHByb3Blcmx5IGRvaW5nID4xNgo+Pj4+IGJpdHMgYW5kIHRo
ZSBmYWN0IHdlIG5vdyBvZmZlciAyNCBhbmQgMzIgY291bGQgYmUgYW4gaXNzdWUuIEkndmUgbm90
Cj4+Pj4gZ290IGFueXRoaW5nIHdpdGggYW4gYXVkaW8gb3V0cHV0IG9uIGl0IHRoYXQgd291bGQg
YmUgZWFzeSB0byB0ZXN0Lgo+Pj4KPj4+IEkgdGhvdWdodCBJIGhhZCB0ZXN0ZWQgb24gYSBKZXRz
b24gVEsxIChUZWdyYTEyNCkgYnV0IGl0IHdhcyBzb21ldGltZQo+Pj4gYmFjay4gSG93ZXZlciwg
YWRtaXR0ZWRseSBJIG1heSBoYXZlIG9ubHkgZG9uZSBzaW1wbGUgMTYtYml0IHRlc3RpbmcKPj4+
IHdpdGggc3BlYWtlci10ZXN0Lgo+Pj4KPj4+IFdlIGRvIHZlcmlmeSB0aGF0IGFsbCBzb3VuZGNh
cmRzIGFyZSBkZXRlY3RlZCBhbmQgcmVnaXN0ZXJlZCBhcyBleHBlY3RlZAo+Pj4gZHVyaW5nIGRh
aWx5IHRlc3RpbmcsIGJ1dCBhdCB0aGUgbW9tZW50IHdlIGRvbid0IGhhdmUgYW55dGhpbmcgdGhh
dAo+Pj4gdmVyaWZpZXMgYWN0dWFsIHBsYXliYWNrLgo+Pgo+PiBQbGVhc2UgdGFrZSBhIGxvb2sg
YXQgdGhlIGF0dGFjaGVkIGxvZ3MuCj4gCj4gSSB3b25kZXIgaWYgd2UgYXJlIGZhbGxpbmcgaW50
byBGSUZPIGNvbmZpZ3VyYXRpb24gaXNzdWVzIHdpdGggdGhlCj4gbm9uLTE2IGJpdCBjYXNlLgo+
IAo+IENhbiB5b3UgdHJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIHR3byBwYXRjaGVzPwoKSXQgaXMg
bXVjaCBiZXR0ZXIgbm93ISBUaGVyZSBpcyBubyBob3JyaWJsZSBub2lzZSBhbmQgbm8gc3R1dHRl
cmluZywgYnV0CmF1ZGlvIHN0aWxsIGhhcyBhICJyb2JvdGljIiBlZmZlY3QsIGxpa2UgZnJlcSBp
c24ndCBjb3JyZWN0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
