Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48621128F05
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Dec 2019 18:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE6D166A;
	Sun, 22 Dec 2019 18:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE6D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577034628;
	bh=+pycJ/qPV8MFEgO5JaD40un/tmMQwom/M9gIzkVnWaQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0oN92OmmOrHfdHCiqwWolU3L6F4ZbV06YQXwcJTW8/dfW9P9O4hXdJCzHElWZGDC
	 25BzrCZbgq9VpEn1lDOME5tttvLXeWCE1MjI3e+5QX9Efa2YKM4ZcQ/8Ib/1IffmW0
	 LGV33O8QN0QzRi24OVFhdpi5fGDSOo52eYYE4xek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0735CF80136;
	Sun, 22 Dec 2019 18:08:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD49F80136; Sun, 22 Dec 2019 18:08:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_13, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F402F80087
 for <alsa-devel@alsa-project.org>; Sun, 22 Dec 2019 18:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F402F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lBOnFY3S"
Received: by mail-lf1-x143.google.com with SMTP id 203so10874817lfa.12
 for <alsa-devel@alsa-project.org>; Sun, 22 Dec 2019 09:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XjviABgI8uKT6jfajitLOO1FKERwjoQLoHocvrVg72o=;
 b=lBOnFY3SjyNV+mLXr5VAodcA9UsoqDyherSaxNhPxoC/QZ4L9b6vQdSvK819AFBDKI
 yQ2SE/dFKELWNRGzgYWJm9euqup+1I+pneg8LppYsOVsKAfEDEf2bg83sERfsxkyO8mw
 L7jBmBy+2fRxulXbKP1q/xChybQ9/eWFsaMXZe+1AqGgKaRMnSg5SN9l7A8ntyaRt+FJ
 J3yufFsYhga53LGbTHp2XC7lrO0iBM1pDQW2nk/0Tu+chIRqWAF/S3bdvMWUAbfdy/F+
 tCG1xw8qltt8yHYo0RUkER4vRctWjYfUyN8LO6DgD63rLWQeORm5mnU7Ma2TqP/J6k1v
 91Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XjviABgI8uKT6jfajitLOO1FKERwjoQLoHocvrVg72o=;
 b=scZ38tYtDTXZwUN39bhtOBk9aqfaotu0E7hGNnOhOiyS3J279FP/2sodEYoICvvGuW
 Yxyp+OhbEcLixAiMKZl8WcH5nvEqe9HueT8gEfZ8nyaABAmyaPaHHBG7EInU5auhEM7n
 qBNUyvXpwOMMNxMqcubTsxHkKbP7PCCqVPMvcl+q86qDhsWPjxxyVz13+dFqvyY6sBCm
 X5DTv8aCc86daFafZkOXQLPG70+ewOCdGQ3ZHMJ62xafLgkWbuedHDtpEiKamP6m/I8h
 53XO3mtuWdD3uiIxoaaV3RHZq444OYGJlvD6pDgFYrX4X7lDEFw4tbsG8V09SVZ6gQhe
 SiUQ==
X-Gm-Message-State: APjAAAULustUrpx744tzhZg+ffDGJktWDY1NFTW1rByDgbZ+Jhl5ofzw
 mdn7ElEzqM49AAwop4n9ASI=
X-Google-Smtp-Source: APXvYqxbp8UI/QkymBKq3DjOPVLPJClfNyE7gfYuRk2VmJjWAMXYrICeuyMLELXqjGKo5BVN8DPAmg==
X-Received: by 2002:a19:4849:: with SMTP id v70mr14443964lfa.30.1577034518474; 
 Sun, 22 Dec 2019 09:08:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u13sm6859516lfq.19.2019.12.22.09.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Dec 2019 09:08:37 -0800 (PST)
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
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
Date: Sun, 22 Dec 2019 20:08:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
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

MjAuMTIuMjAxOSAyMDowNiwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMjAvMTIvMjAxOSAx
Njo0MCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyMC4xMi4yMDE5IDE4OjI1LCBCZW4gRG9v
a3Mg0L/QuNGI0LXRgjoKPj4+IE9uIDIwLzEyLzIwMTkgMTU6MDIsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+PiAyMC4xMi4yMDE5IDE3OjU2LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4g
T24gMjAvMTIvMjAxOSAxNDo0MywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4gMjAuMTIu
MjAxOSAxNjo1NywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMjAv
MTIvMjAxOSAxMTozOCwgQmVuIERvb2tzIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMC8xMi8yMDE5IDEx
OjMwLCBKb24gSHVudGVyIHdyb3RlOgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9uIDI1LzExLzIwMTkg
MTc6MjgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4+PiAyNS4xMS4yMDE5IDIwOjIy
LCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4gMjUuMTEuMjAxOSAxMzoz
NywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4+PiBPbiAyMy8xMS8yMDE5IDIxOjA5
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gMTguMTAuMjAxOSAxODo0OCwg
QmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8
ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
Pj4gVGhlIHRlZ3JhMyBhdWRpbyBjYW4gc3VwcG9ydCAyNCBhbmQgMzIgYml0IHNhbXBsZSBzaXpl
cyBzbwo+Pj4+Pj4+Pj4+Pj4+PiBhZGQKPj4+Pj4+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+Pj4+Pj4+
IG9wdGlvbiB0byB0aGUgdGVncmEzMF9pMnNfaHdfcGFyYW1zIHRvIGNvbmZpZ3VyZSB0aGUKPj4+
Pj4+Pj4+Pj4+Pj4gUzI0X0xFIG9yCj4+Pj4+Pj4+Pj4+Pj4+IFMzMl9MRQo+Pj4+Pj4+Pj4+Pj4+
PiBmb3JtYXRzIHdoZW4gcmVxdWVzdGVkLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+
Cj4+Pj4+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrOiBmaXh1cCBtZXJnZSBv
ZiAyNCBhbmQgMzJiaXRdCj4+Pj4+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
OiBhZGQgcG0gY2FsbHMgYXJvdW5kIHl0ZG0gY29uZmlnXQo+Pj4+Pj4+Pj4+Pj4+PiBbYmVuLmRv
b2tzQGNvZGV0aGluay5jby51azogZHJvcCBkZWJ1ZyBwcmludGluZyB0byBkZXZfZGJnXQo+Pj4+
Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs+Cj4+Pj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+PiBzcXVhc2ggNWFlY2E1YTA1
NWZkIEFTb0M6IHRlZ3JhOiBpMnM6Cj4+Pj4+Pj4+Pj4+Pj4+IHBtX3J1bnRpbWVfZ2V0X3N5bmMo
KSBpcwo+Pj4+Pj4+Pj4+Pj4+PiBuZWVkZWQKPj4+Pj4+Pj4+Pj4+Pj4gaW4gdGRtIGNvZGUKPj4+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gQVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9n
ZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+Pj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+
Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBzb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyB8IDI1Cj4+
Pj4+Pj4+Pj4+Pj4+ICsrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4+Pj4+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4+Pj4+Pj4+Pj4+Pj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBf
aTJzLmMKPj4+Pj4+Pj4+Pj4+Pj4gaW5kZXggNzNmMGRkZGVhZWYzLi4wNjNmMzRjODgyYWYgMTAw
NjQ0Cj4+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+
Pj4+Pj4+Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+Pj4+
Pj4+Pj4+IEBAIC0xMjcsNyArMTI3LDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJh
bXMoc3RydWN0Cj4+Pj4+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+
Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWkt
PmRldjsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdyYTMwX2ky
cyAqaTJzID0KPj4+Pj4+Pj4+Pj4+Pj4gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoZGFpKTsKPj4+
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWwsIHJl
ZzsKPj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGky
c2Nsb2NrLCBiaXRjbnQ7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaW50IHJldCwgc2FtcGxlX3Np
emUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250LAo+Pj4+Pj4+Pj4+Pj4+PiBhdWRpb19iaXRzOwo+
Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfYWh1Yl9jaWZf
Y29uZiBjaWZfY29uZjsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCDCoMKgwqDCoMKgIGlmIChw
YXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAyKQo+Pj4+Pj4+Pj4+Pj4+PiBAQCAtMTM3LDggKzEz
NywxOSBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+Pj4+
Pj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHN3aXRjaCAocGFyYW1zX2Zvcm1hdChwYXJhbXMpKSB7Cj4+Pj4+Pj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+Pj4+
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19D
VFJMX0JJVF9TSVpFXzE2Owo+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0
cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAxNjsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRS
Vl9QQ01fRk9STUFUX1MyNF9MRToKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9
IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMjQ7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzI0Owo+Pj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAyNDsKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZP
Uk1BVF9TMzJfTEU6Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMw
X0kyU19DVFJMX0JJVF9TSVpFXzMyOwo+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVk
aW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18zMjsKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMzI7Cj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+Pj4+
Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4+Pj4+PiBAQCAtMTcwLDgg
KzE4MSw4IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+Pj4+Pj4+
Pj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYudGhyZXNob2xkID0gMDsKPj4+Pj4+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2NoYW5uZWxzID0gMjsKPj4+Pj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNpZl9jb25mLmNsaWVudF9jaGFubmVscyA9IDI7Cj4+Pj4+
Pj4+Pj4+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZf
QklUU18xNjsKPj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IFRF
R1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5h
dWRpb19iaXRzID0gYXVkaW9fYml0czsKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5j
bGllbnRfYml0cyA9IGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBjaWZfY29uZi5leHBhbmQgPSAwOwo+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgY2lmX2NvbmYucmVwbGljYXRlID0gMDsKPj4+Pj4+Pj4+Pj4+Pj4gQEAgLTMwNiwxNCArMzE3
LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyCj4+Pj4+Pj4+Pj4+
Pj4+IHRlZ3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19tYXggPSAyLAo+Pj4+Pj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2
MDAwLAo+Pj4+Pj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01f
Rk1UQklUX1MxNl9MRSwKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0g
U05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4+Pj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuc3RyZWFtX25hbWUgPSAiQ2FwdHVyZSIsCj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4gPSAyLAo+Pj4+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+Pj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85
NjAwMCwKPj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENN
X0ZNVEJJVF9TMTZfTEUsCj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9
IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+Pj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAub3BzID0gJnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4+Pj4+Pj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAuc3ltbWV0cmljX3JhdGVzID0gMSwKPj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEhlbGxvLAo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
Pj4gVGhpcyBwYXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3Jz
Cj4+Pj4+Pj4+Pj4+Pj4gYW55d2hlcmUsIGJ1dAo+Pj4+Pj4+Pj4+Pj4+IHRoZXJlIGlzIG5vIGF1
ZGlvIGFuZCByZXZlcnRpbmcgdGhpcyBwYXRjaCBoZWxwcy4gUGxlYXNlCj4+Pj4+Pj4+Pj4+Pj4g
Zml4IGl0Lgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFdoYXQgaXMgdGhlIGZhaWx1cmUgbW9k
ZT8gSSBjYW4gdHJ5IGFuZCB0YWtlIGEgbG9vayBhdCB0aGlzCj4+Pj4+Pj4+Pj4+PiBzb21lCj4+
Pj4+Pj4+Pj4+PiB0aW1lCj4+Pj4+Pj4+Pj4+PiB0aGlzIHdlZWssIGJ1dCBJIGFtIG5vdCBzdXJl
IGlmIEkgaGF2ZSBhbnkgYm9hcmRzIHdpdGggYW4KPj4+Pj4+Pj4+Pj4+IGFjdHVhbAo+Pj4+Pj4+
Pj4+Pj4gdXNlZnVsCj4+Pj4+Pj4+Pj4+PiBhdWRpbyBvdXRwdXQ/Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+IFRoZSBmYWlsdXJlIG1vZGUgaXMgdGhhdCB0aGVyZSBubyBzb3VuZC4gSSBhbHNvIG5v
dGljZWQgdGhhdAo+Pj4+Pj4+Pj4+PiB2aWRlbwo+Pj4+Pj4+Pj4+PiBwbGF5YmFjayBzdHV0dGVy
cyBhIGxvdCBpZiBtb3ZpZSBmaWxlIGhhcyBhdWRpbyB0cmFjaywgc2VlbXMKPj4+Pj4+Pj4+Pj4g
c29tZXRoaW5nCj4+Pj4+Pj4+Pj4+IHRpbWVzIG91dCBkdXJpbmcgb2YgdGhlIGF1ZGlvIHBsYXli
YWNrLiBGb3Igbm93IEkgZG9uJ3QgaGF2ZSBhbnkKPj4+Pj4+Pj4+Pj4gbW9yZSBpbmZvLgo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gT2gsIEkgZGlkbid0IHNheSBob3cgdG8gcmVw
cm9kdWNlIGl0Li4gZm9yIGV4YW1wbGUgc2ltcGx5IHBsYXlpbmcKPj4+Pj4+Pj4+PiBiaWdfYnVj
a19idW5ueV83MjBwX2gyNjQubW92IGluIE1QViBoYXMgdGhlIGF1ZGlvIHByb2JsZW0uCj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+PiBodHRwczovL2Rvd25sb2FkLmJsZW5kZXIub3JnL3BlYWNoL2JpZ2J1
Y2tidW5ueV9tb3ZpZXMvYmlnX2J1Y2tfYnVubnlfNzIwcF9oMjY0Lm1vdgo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gR2l2ZW4g
dGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2VzIHJlZ21hcCwgaXQgY291bGQgYmUgZ29vZCB0bwo+
Pj4+Pj4+Pj4gZHVtcCB0aGUKPj4+Pj4+Pj4+IEkyUy9BSFVCIHJlZ2lzdGVycyB3aGlsZSB0aGUg
Y2xpcCBpZiBwbGF5aW5nIHdpdGggYW5kIHdpdGhvdXQgdGhpcwo+Pj4+Pj4+Pj4gcGF0Y2gKPj4+
Pj4+Pj4+IHRvIHNlZSB0aGUgZGlmZmVyZW5jZXMuIEkgYW0gY3VyaW91cyBpZiB0aGUgYXVkaW8g
aXMgbm93IGJlaW5nCj4+Pj4+Pj4+PiBwbGF5ZWQgYXMKPj4+Pj4+Pj4+IDI0IG9yIDMyLWJpdCBp
bnN0ZWFkIG9mIDE2LWJpdCBub3cgdGhlc2UgYXJlIGF2YWlsYWJsZS4KPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBZb3UgY291bGQgYWxzbyBkdW1wIHRoZSBod19wYXJhbXMgdG8gc2VlIHRoZSBmb3JtYXQg
d2hpbGUKPj4+Pj4+Pj4+IHBsYXlpbmcgYXMKPj4+Pj4+Pj4+IHdlbGwgLi4uCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gJCAvcHJvYy9hc291bmQvPHNjYXJkLW5hbWU+L3BjbTBwL3N1YjAvaHdfcGFyYW1z
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgc3VwcG9zZSBpdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhl
IGNvZGVjIGlzbid0IHByb3Blcmx5Cj4+Pj4+Pj4+IGRvaW5nID4xNgo+Pj4+Pj4+PiBiaXRzIGFu
ZCB0aGUgZmFjdCB3ZSBub3cgb2ZmZXIgMjQgYW5kIDMyIGNvdWxkIGJlIGFuIGlzc3VlLiBJJ3Zl
Cj4+Pj4+Pj4+IG5vdAo+Pj4+Pj4+PiBnb3QgYW55dGhpbmcgd2l0aCBhbiBhdWRpbyBvdXRwdXQg
b24gaXQgdGhhdCB3b3VsZCBiZSBlYXN5IHRvIHRlc3QuCj4+Pj4+Pj4KPj4+Pj4+PiBJIHRob3Vn
aHQgSSBoYWQgdGVzdGVkIG9uIGEgSmV0c29uIFRLMSAoVGVncmExMjQpIGJ1dCBpdCB3YXMKPj4+
Pj4+PiBzb21ldGltZQo+Pj4+Pj4+IGJhY2suIEhvd2V2ZXIsIGFkbWl0dGVkbHkgSSBtYXkgaGF2
ZSBvbmx5IGRvbmUgc2ltcGxlIDE2LWJpdCB0ZXN0aW5nCj4+Pj4+Pj4gd2l0aCBzcGVha2VyLXRl
c3QuCj4+Pj4+Pj4KPj4+Pj4+PiBXZSBkbyB2ZXJpZnkgdGhhdCBhbGwgc291bmRjYXJkcyBhcmUg
ZGV0ZWN0ZWQgYW5kIHJlZ2lzdGVyZWQgYXMKPj4+Pj4+PiBleHBlY3RlZAo+Pj4+Pj4+IGR1cmlu
ZyBkYWlseSB0ZXN0aW5nLCBidXQgYXQgdGhlIG1vbWVudCB3ZSBkb24ndCBoYXZlIGFueXRoaW5n
IHRoYXQKPj4+Pj4+PiB2ZXJpZmllcyBhY3R1YWwgcGxheWJhY2suCj4+Pj4+Pgo+Pj4+Pj4gUGxl
YXNlIHRha2UgYSBsb29rIGF0IHRoZSBhdHRhY2hlZCBsb2dzLgo+Pj4+Pgo+Pj4+PiBJIHdvbmRl
ciBpZiB3ZSBhcmUgZmFsbGluZyBpbnRvIEZJRk8gY29uZmlndXJhdGlvbiBpc3N1ZXMgd2l0aCB0
aGUKPj4+Pj4gbm9uLTE2IGJpdCBjYXNlLgo+Pj4+Pgo+Pj4+PiBDYW4geW91IHRyeSBhZGRpbmcg
dGhlIGZvbGxvd2luZyB0d28gcGF0Y2hlcz8KPj4+Pgo+Pj4+IEl0IGlzIG11Y2ggYmV0dGVyIG5v
dyEgVGhlcmUgaXMgbm8gaG9ycmlibGUgbm9pc2UgYW5kIG5vIHN0dXR0ZXJpbmcsCj4+Pj4gYnV0
Cj4+Pj4gYXVkaW8gc3RpbGwgaGFzIGEgInJvYm90aWMiIGVmZmVjdCwgbGlrZSBmcmVxIGlzbid0
IGNvcnJlY3QuCj4+Pgo+Pj4gSSB3b25kZXIgaWYgdGhlcmUncyBhbiBpc3N1ZSB3aXRoIEZJRk8g
c3Rva2luZz8gSSBzaG91bGQgYWxzbyBwb3NzaWJseQo+Pj4gYWRkIHRoZSBjb3JyZWN0bHkgc3Rv
cCBGSUZPcyBwYXRjaCBhcyB3ZWxsLgo+Pgo+PiBJJ2xsIGJlIGhhcHB5IHRvIHRyeSBtb3JlIHBh
dGNoZXMuCj4+Cj4+IE1lYW53aGlsZSBzb3VuZCBvbiB2NS41KyBpcyBicm9rZW4gYW5kIHRodXMg
dGhlIGluY29tcGxldGUgcGF0Y2hlcwo+PiBzaG91bGQgYmUgcmV2ZXJ0ZWQuCj4gCj4gSGF2ZSB5
b3UgY2hlY2tlZCBpZiBqdXN0IHJlbW92aW5nIHRoZSAyNC8zMiBiaXRzIGZyb20gLmZvcm1hdHMg
aW4KPiB0aGUgZGFpIHRlbXBsYXRlIGFuZCBzZWUgaWYgdGhlIHByb2JsZW0gY29udGludWVzPyAK
Ckl0IHdvcmtzLgoKPiBJIHdpbGwgdHJ5IGFuZAo+IHNlZSBpZiBJIGNhbiBmaW5kIHRoZSBjb2Rl
IHRoYXQgZG9lcyB0aGUgZmlmbyBsZXZlbCBjaGVja2luZyBhbmQKPiBzZWUgaWYgdGhlIHByb2Js
ZW0gaXMgaW4gdGhlIEZJRk8gZmlsbCBvciBzb21ldGhpbmcgZWxzZSBpbiB0aGUKPiBhdWRpbyBo
dWIgc2V0dXAuCgpPawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
