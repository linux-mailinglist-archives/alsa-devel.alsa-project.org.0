Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCA1280D3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 17:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A9115E0;
	Fri, 20 Dec 2019 17:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A9115E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576860169;
	bh=G561VahpAOGMpyrnhdeMK0Zxa8tnJpdwsFzEVN89cBE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsJc4EoI0axJxm+mo9b/eoQAARmpRQvx6xBCqMqcBRb5w4nk+IRZSz2cyiB0l1YXO
	 BnDwvYVfOf33dCakwddOtMzaHS05feBXP0thUxVGNci1hRXFOnmaCNQc1DEw7sYacr
	 ndxN7dHrXg4vkg4SBBvDljyQNVE4CvtVS5ZFrswU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5E3F8014F;
	Fri, 20 Dec 2019 17:41:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BDA1F8015A; Fri, 20 Dec 2019 17:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_13, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36CEBF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 17:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CEBF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FeAxi6+D"
Received: by mail-lf1-x142.google.com with SMTP id l18so973474lfc.1
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TQjFqgy8IMgTD9h+ZMv1UTRRgE3Um9U0JtlFjgV4djI=;
 b=FeAxi6+DEJaoaE44kA9Z/QTDx2T1EZXQSytn57IjDtnpeMMlTWz274d5Ye/woGildJ
 KCaOG6ZQ946ezJDXA5BswVplysuxR1sGBQ7U6FmovHafNxGVWahHEWq02d3vVZB2Kb3j
 ZaxGhTYopzqiRP0/nJSAU4guMJkfjD3MjduLLhwL0tEEf4f7WikoKRRQZATy609b95Qk
 bZiMmvgrMB6hIBeYGH5Iorp9FVLT7KHyxTwL5z1nK6hTqyKwxmSBf0455kqqcvW9nQrv
 QUDx6fJjaTzZAMIkWEcSUdKL9wdI2nrEAvYw0cg33ISb9AHEPvgClA6U40xtQgML7+5s
 Mw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TQjFqgy8IMgTD9h+ZMv1UTRRgE3Um9U0JtlFjgV4djI=;
 b=oCwZnbtC4ZcS3wq3jZjfONS+oiBBWTIir99IUUE18BdAIqtBEsKQPwzwLKqZhOMF4X
 WRDt5LI6a0XtG/dp90Tmkj6iHWNqtGvjI4PSgtAfSnwgnhJnv6V+CMSJow88St2hMfxo
 WCajj0EqVUywpfxma/hOJLNqtcVYo/yAopoxFruoMWi2H5VLLwSC2QVNgtIoF4ojt+yu
 mMK6DoZfOOrhgWOmKFBHpcltzm9XPOzSMQ5dA9LArxsAoje5UZXNEXzKlu2snvWMYhRt
 PtvXHGwY9/Fu+XuSP2BfdKTXpYC3/RsNKTrN01HhLE2s6djKOGLoSLIrII89CpDRUFMI
 br4g==
X-Gm-Message-State: APjAAAWLKS1Kzv2pVQ3j9jP1cfkujE7FMmMPXZlQN+gjKgMglJpTRQb1
 FJLzdiWl+zHZAh/9FO+rWtk=
X-Google-Smtp-Source: APXvYqweYJcbYi64VeuM6D5sjgzOHLu66GrjuG3B0WzDlAcvrbezs9Wjlu40LF+0H27iwkoN++lUlA==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr9723046lfk.67.1576860060015; 
 Fri, 20 Dec 2019 08:41:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y23sm4606005ljk.6.2019.12.20.08.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 08:40:59 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
Date: Fri, 20 Dec 2019 19:40:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
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

MjAuMTIuMjAxOSAxODoyNSwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMjAvMTIvMjAxOSAx
NTowMiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyMC4xMi4yMDE5IDE3OjU2LCBCZW4gRG9v
a3Mg0L/QuNGI0LXRgjoKPj4+IE9uIDIwLzEyLzIwMTkgMTQ6NDMsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+PiAyMC4xMi4yMDE5IDE2OjU3LCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4+Pj4+
Cj4+Pj4+IE9uIDIwLzEyLzIwMTkgMTE6MzgsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4+IE9uIDIw
LzEyLzIwMTkgMTE6MzAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyNS8x
MS8yMDE5IDE3OjI4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+Pj4+IDI1LjExLjIwMTkg
MjA6MjIsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4gMjUuMTEuMjAxOSAx
MzozNywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4gT24gMjMvMTEvMjAxOSAyMTow
OSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+Pj4+PiAxOC4xMC4yMDE5IDE4OjQ4LCBC
ZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8ZWR3
YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBUaGUg
dGVncmEzIGF1ZGlvIGNhbiBzdXBwb3J0IDI0IGFuZCAzMiBiaXQgc2FtcGxlIHNpemVzIHNvIGFk
ZAo+Pj4+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+Pj4+PiBvcHRpb24gdG8gdGhlIHRlZ3JhMzBfaTJz
X2h3X3BhcmFtcyB0byBjb25maWd1cmUgdGhlIFMyNF9MRSBvcgo+Pj4+Pj4+Pj4+Pj4gUzMyX0xF
Cj4+Pj4+Pj4+Pj4+PiBmb3JtYXRzIHdoZW4gcmVxdWVzdGVkLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGlu
ay5jby51az4KPj4+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrOiBmaXh1cCBt
ZXJnZSBvZiAyNCBhbmQgMzJiaXRdCj4+Pj4+Pj4+Pj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5j
by51azogYWRkIHBtIGNhbGxzIGFyb3VuZCB5dGRtIGNvbmZpZ10KPj4+Pj4+Pj4+Pj4+IFtiZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrOiBkcm9wIGRlYnVnIHByaW50aW5nIHRvIGRldl9kYmddCj4+
Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs+Cj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+IHNxdWFzaCA1YWVjYTVhMDU1ZmQg
QVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzCj4+Pj4+Pj4+Pj4+PiBu
ZWVkZWQKPj4+Pj4+Pj4+Pj4+IGluIHRkbSBjb2RlCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4g
QVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0g
Y29kZQo+Pj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoCBzb3VuZC9zb2MvdGVn
cmEvdGVncmEzMF9pMnMuYyB8IDI1Cj4+Pj4+Pj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+Pj4+IGIvc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+Pj4+IGluZGV4IDczZjBkZGRlYWVmMy4uMDYzZjM0
Yzg4MmFmIDEwMDY0NAo+Pj4+Pj4+Pj4+Pj4gLS0tIGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBf
aTJzLmMKPj4+Pj4+Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+
Pj4+Pj4+Pj4+PiBAQCAtMTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdf
cGFyYW1zKHN0cnVjdAo+Pj4+Pj4+Pj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwK
Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gZGFpLT5k
ZXY7Cj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdyYTMwX2kycyAqaTJz
ID0KPj4+Pj4+Pj4+Pj4+IHNuZF9zb2NfZGFpX2dldF9kcnZkYXRhKGRhaSk7Cj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWwsIHJlZzsKPj4+Pj4+Pj4+
Pj4+IC3CoMKgwqAgaW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250
Owo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGkyc2Ns
b2NrLCBiaXRjbnQsIGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCB0ZWdyYTMwX2FodWJfY2lmX2NvbmYgY2lmX2NvbmY7Cj4+Pj4+Pj4+Pj4+PiDCoMKgwqDC
oCDCoMKgwqDCoMKgIGlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAyKQo+Pj4+Pj4+Pj4+
Pj4gQEAgLTEzNyw4ICsxMzcsMTkgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMo
c3RydWN0Cj4+Pj4+Pj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKHBhcmFtc19mb3JtYXQocGFyYW1zKSkgewo+
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xF
Ogo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJT
X0NUUkxfQklUX1NJWkVfMTY7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0
cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDE2Owo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JN
QVRfUzI0X0xFOgo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJT
X0NUUkxfQklUX1NJWkVfMjQ7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0
cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18yNDsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzYW1wbGVfc2l6ZSA9IDI0Owo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzMyX0xFOgo+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMzI7
Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9D
SUZfQklUU18zMjsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDMy
Owo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCBkZWZhdWx0Ogo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+
Pj4+PiBAQCAtMTcwLDggKzE4MSw4IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1z
KHN0cnVjdAo+Pj4+Pj4+Pj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4+Pj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYudGhyZXNob2xkID0gMDsKPj4+Pj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuYXVkaW9fY2hhbm5lbHMgPSAyOwo+Pj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi5jbGllbnRfY2hhbm5lbHMgPSAyOwo+Pj4+
Pj4+Pj4+Pj4gLcKgwqDCoCBjaWZfY29uZi5hdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9C
SVRTXzE2Owo+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IFRFR1JB
MzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuYXVkaW9f
Yml0cyA9IGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNpZl9jb25mLmNsaWVudF9i
aXRzID0gYXVkaW9fYml0czsKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYu
ZXhwYW5kID0gMDsKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuc3RlcmVv
X2NvbnYgPSAwOwo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi5yZXBsaWNh
dGUgPSAwOwo+Pj4+Pj4+Pj4+Pj4gQEAgLTMwNiwxNCArMzE3LDE4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyCj4+Pj4+Pj4+Pj4+PiB0ZWdyYTMwX2kyc19kYWlfdGVt
cGxhdGUgPSB7Cj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxz
X21pbiA9IDIsCj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxz
X21heCA9IDIsCj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0g
U05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCAu
Zm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+
Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJ
VF9TMTZfTEUsCj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5zdHJlYW1fbmFtZSA9ICJDYXB0dXJlIiwKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWluID0gMiwKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+
Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZf
TEUsCj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1U
QklUX1MzMl9MRSB8Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
TkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqAgfSwKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLm9wcyA9ICZ0ZWdyYTMw
X2kyc19kYWlfb3BzLAo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAuc3ltbWV0cmljX3Jh
dGVzID0gMSwKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEhlbGxvLAo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGJyZWFrcyBhdWRpbyBvbiBUZWdyYTMwLiBJ
IGRvbid0IHNlZSBlcnJvcnMKPj4+Pj4+Pj4+Pj4gYW55d2hlcmUsIGJ1dAo+Pj4+Pj4+Pj4+PiB0
aGVyZSBpcyBubyBhdWRpbyBhbmQgcmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggaGVscHMuIFBsZWFzZSBm
aXggaXQuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBXaGF0IGlzIHRoZSBmYWlsdXJlIG1vZGU/IEkg
Y2FuIHRyeSBhbmQgdGFrZSBhIGxvb2sgYXQgdGhpcyBzb21lCj4+Pj4+Pj4+Pj4gdGltZQo+Pj4+
Pj4+Pj4+IHRoaXMgd2VlaywgYnV0IEkgYW0gbm90IHN1cmUgaWYgSSBoYXZlIGFueSBib2FyZHMg
d2l0aCBhbiBhY3R1YWwKPj4+Pj4+Pj4+PiB1c2VmdWwKPj4+Pj4+Pj4+PiBhdWRpbyBvdXRwdXQ/
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhlIGZhaWx1cmUgbW9kZSBpcyB0aGF0IHRoZXJlIG5vIHNv
dW5kLiBJIGFsc28gbm90aWNlZCB0aGF0IHZpZGVvCj4+Pj4+Pj4+PiBwbGF5YmFjayBzdHV0dGVy
cyBhIGxvdCBpZiBtb3ZpZSBmaWxlIGhhcyBhdWRpbyB0cmFjaywgc2VlbXMKPj4+Pj4+Pj4+IHNv
bWV0aGluZwo+Pj4+Pj4+Pj4gdGltZXMgb3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2su
IEZvciBub3cgSSBkb24ndCBoYXZlIGFueQo+Pj4+Pj4+Pj4gbW9yZSBpbmZvLgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gT2gsIEkgZGlkbid0IHNheSBob3cgdG8gcmVwcm9kdWNlIGl0Li4g
Zm9yIGV4YW1wbGUgc2ltcGx5IHBsYXlpbmcKPj4+Pj4+Pj4gYmlnX2J1Y2tfYnVubnlfNzIwcF9o
MjY0Lm1vdiBpbiBNUFYgaGFzIHRoZSBhdWRpbyBwcm9ibGVtLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBo
dHRwczovL2Rvd25sb2FkLmJsZW5kZXIub3JnL3BlYWNoL2JpZ2J1Y2tidW5ueV9tb3ZpZXMvYmln
X2J1Y2tfYnVubnlfNzIwcF9oMjY0Lm1vdgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gR2l2ZW4gdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2VzIHJlZ21hcCwgaXQg
Y291bGQgYmUgZ29vZCB0bwo+Pj4+Pj4+IGR1bXAgdGhlCj4+Pj4+Pj4gSTJTL0FIVUIgcmVnaXN0
ZXJzIHdoaWxlIHRoZSBjbGlwIGlmIHBsYXlpbmcgd2l0aCBhbmQgd2l0aG91dCB0aGlzCj4+Pj4+
Pj4gcGF0Y2gKPj4+Pj4+PiB0byBzZWUgdGhlIGRpZmZlcmVuY2VzLiBJIGFtIGN1cmlvdXMgaWYg
dGhlIGF1ZGlvIGlzIG5vdyBiZWluZwo+Pj4+Pj4+IHBsYXllZCBhcwo+Pj4+Pj4+IDI0IG9yIDMy
LWJpdCBpbnN0ZWFkIG9mIDE2LWJpdCBub3cgdGhlc2UgYXJlIGF2YWlsYWJsZS4KPj4+Pj4+Pgo+
Pj4+Pj4+IFlvdSBjb3VsZCBhbHNvIGR1bXAgdGhlIGh3X3BhcmFtcyB0byBzZWUgdGhlIGZvcm1h
dCB3aGlsZSBwbGF5aW5nIGFzCj4+Pj4+Pj4gd2VsbCAuLi4KPj4+Pj4+Pgo+Pj4+Pj4+ICQgL3By
b2MvYXNvdW5kLzxzY2FyZC1uYW1lPi9wY20wcC9zdWIwL2h3X3BhcmFtcwo+Pj4+Pj4KPj4+Pj4+
IEkgc3VwcG9zZSBpdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIGNvZGVjIGlzbid0IHByb3Bl
cmx5IGRvaW5nID4xNgo+Pj4+Pj4gYml0cyBhbmQgdGhlIGZhY3Qgd2Ugbm93IG9mZmVyIDI0IGFu
ZCAzMiBjb3VsZCBiZSBhbiBpc3N1ZS4gSSd2ZSBub3QKPj4+Pj4+IGdvdCBhbnl0aGluZyB3aXRo
IGFuIGF1ZGlvIG91dHB1dCBvbiBpdCB0aGF0IHdvdWxkIGJlIGVhc3kgdG8gdGVzdC4KPj4+Pj4K
Pj4+Pj4gSSB0aG91Z2h0IEkgaGFkIHRlc3RlZCBvbiBhIEpldHNvbiBUSzEgKFRlZ3JhMTI0KSBi
dXQgaXQgd2FzIHNvbWV0aW1lCj4+Pj4+IGJhY2suIEhvd2V2ZXIsIGFkbWl0dGVkbHkgSSBtYXkg
aGF2ZSBvbmx5IGRvbmUgc2ltcGxlIDE2LWJpdCB0ZXN0aW5nCj4+Pj4+IHdpdGggc3BlYWtlci10
ZXN0Lgo+Pj4+Pgo+Pj4+PiBXZSBkbyB2ZXJpZnkgdGhhdCBhbGwgc291bmRjYXJkcyBhcmUgZGV0
ZWN0ZWQgYW5kIHJlZ2lzdGVyZWQgYXMKPj4+Pj4gZXhwZWN0ZWQKPj4+Pj4gZHVyaW5nIGRhaWx5
IHRlc3RpbmcsIGJ1dCBhdCB0aGUgbW9tZW50IHdlIGRvbid0IGhhdmUgYW55dGhpbmcgdGhhdAo+
Pj4+PiB2ZXJpZmllcyBhY3R1YWwgcGxheWJhY2suCj4+Pj4KPj4+PiBQbGVhc2UgdGFrZSBhIGxv
b2sgYXQgdGhlIGF0dGFjaGVkIGxvZ3MuCj4+Pgo+Pj4gSSB3b25kZXIgaWYgd2UgYXJlIGZhbGxp
bmcgaW50byBGSUZPIGNvbmZpZ3VyYXRpb24gaXNzdWVzIHdpdGggdGhlCj4+PiBub24tMTYgYml0
IGNhc2UuCj4+Pgo+Pj4gQ2FuIHlvdSB0cnkgYWRkaW5nIHRoZSBmb2xsb3dpbmcgdHdvIHBhdGNo
ZXM/Cj4+Cj4+IEl0IGlzIG11Y2ggYmV0dGVyIG5vdyEgVGhlcmUgaXMgbm8gaG9ycmlibGUgbm9p
c2UgYW5kIG5vIHN0dXR0ZXJpbmcsIGJ1dAo+PiBhdWRpbyBzdGlsbCBoYXMgYSAicm9ib3RpYyIg
ZWZmZWN0LCBsaWtlIGZyZXEgaXNuJ3QgY29ycmVjdC4KPiAKPiBJIHdvbmRlciBpZiB0aGVyZSdz
IGFuIGlzc3VlIHdpdGggRklGTyBzdG9raW5nPyBJIHNob3VsZCBhbHNvIHBvc3NpYmx5Cj4gYWRk
IHRoZSBjb3JyZWN0bHkgc3RvcCBGSUZPcyBwYXRjaCBhcyB3ZWxsLgoKSSdsbCBiZSBoYXBweSB0
byB0cnkgbW9yZSBwYXRjaGVzLgoKTWVhbndoaWxlIHNvdW5kIG9uIHY1LjUrIGlzIGJyb2tlbiBh
bmQgdGh1cyB0aGUgaW5jb21wbGV0ZSBwYXRjaGVzCnNob3VsZCBiZSByZXZlcnRlZC4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
