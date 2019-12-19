Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E71267CC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 18:16:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DECE815F9;
	Thu, 19 Dec 2019 18:15:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DECE815F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576775765;
	bh=RD4dL2pBEP0DKWGXfI6svO1ZD4faP9u2+2WJqjTHIiU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EA1aQhn4YBrmH00l82Ythuuyj/NBl2iH4Uw69y1YO+qeascQMbch6V8W8fctupRxm
	 83e0kAjYmX0uwAwHgDcBVANHuiO0PKQvxN8MNin/xPe0qHOlr3ywU7wthse5BXiwl2
	 ndsp/JLZU04QRCmfPuRk86l/rQ8PMFkXIlYakYMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35A53F80218;
	Thu, 19 Dec 2019 18:14:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23B8F8014F; Thu, 19 Dec 2019 18:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D39F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 18:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D39F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H4G/I2Wr"
Received: by mail-wr1-x444.google.com with SMTP id q10so6755116wrm.11
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 09:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HZ0EtI8SNKlfgm0DfEQvvRLmJ1Ih0hN8p888zZI0xD0=;
 b=H4G/I2WrR1UhOCtp1/0yzqTouxps1FSmdWsBfOQTPXS+dwbHJG2wxEOPPq8f/a1fs+
 6ZABq6etTBDIn7AzrrWkJUnW+k4YKWzA0nbrDfHGAhs8mXbeKtgTmfVFXL9MJxiWTh9Z
 7N2GqMK0Z2fhKaB9Kyx5WpCCUx2YXElNEpEEVimjEO4B6vAeTOKXPnQrEkld9B+MNMkx
 ZCb3JkmF4D+qs0XL0JDPusJNh8JSYgDwXigyZS5dA5ikNteDmdH8P8xwFF/nV90sjlYN
 j5Uu0DzK+jpeFcnW/6ADPP0H0/r3Gr2HZE5IgMWScOkQ3Oo16H9hImySyw75UjPrftLU
 BNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZ0EtI8SNKlfgm0DfEQvvRLmJ1Ih0hN8p888zZI0xD0=;
 b=ep3P+EvbuAcqlcya3Gx8cal9O0FUWYlBWxpigBs+tj8tIvpeYvstpSJycpzaLIXIoy
 Oc0fMfxrExN4IHf5ds+7odjrj9iAzhYdcgkA9YAdoty1tnclG9XI1eVNT8QorI1oxF6p
 Kw0vM/KuzrWglGjl+LCl4T1jBreNLstx4MuaLu1dhPUx9Fo+PN412pjXTgoAkan/F1EO
 mnmcF7ivAUm4CIu9pJQj8t3A3DrgUni2svVhhVPkMwuyVzAoLia08yAHypuKtGquB2sr
 1ycdTGPH21pVOedbSfZ89ULFhmVWgxCigLqIn62oCIlrYpH/JH82daDXmmmT/TQo7Cq5
 /c5w==
X-Gm-Message-State: APjAAAU4LAda5XRZMXSG9YT1oYov8mQEp27KyrQJ/XkmgTSthz/AvfLP
 JXmUBpBEnclZFbq/1BIeilwckw==
X-Google-Smtp-Source: APXvYqwA8FWwQCzaZcPxfmvA9yCyMILHVORxzfEwKmag9PvZ6iu+Z0fU6wuYiLUEqjwYA9xb9fI5kg==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr10904787wrs.213.1576775654849; 
 Thu, 19 Dec 2019 09:14:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x132sm11088147wmg.0.2019.12.19.09.14.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:14:14 -0800 (PST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20191219092842.10885-1-srinivas.kandagatla@linaro.org>
 <20191219092842.10885-3-srinivas.kandagatla@linaro.org>
 <c791e241-cd71-4c05-dac5-04e3ecaaf995@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a5315861-d9b8-0852-8a3a-012f60cc3a44@linaro.org>
Date: Thu, 19 Dec 2019 17:14:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c791e241-cd71-4c05-dac5-04e3ecaaf995@linux.intel.com>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v5 2/2] soundwire: qcom: add support for
 SoundWire controller
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxOS8xMi8yMDE5IDE2OjA3LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiAxMi8xOS8xOSAzOjI4IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+PiBRdWFs
Y29tbSBTb3VuZFdpcmUgTWFzdGVyIGNvbnRyb2xsZXIgaXMgcHJlc2VudCBpbiBtb3N0IFF1YWxj
b21tIFNvQ3MKPj4gZWl0aGVyIGludGVncmF0ZWQgYXMgcGFydCBvZiBXQ0QgYXVkaW8gY29kZWNz
IHZpYSBzbGltYnVzIG9yCj4+IGFzIHBhcnQgb2YgU09DIEkvTy4KPj4KPj4gVGhpcyBwYXRjaHNl
dCBhZGRzIHN1cHBvcnQgdG8gYSB2ZXJ5IGJhc2ljIGNvbnRyb2xsZXIgd2hpY2ggaGFzIGJlZW4K
Pj4gdGVzdGVkIHdpdGggV0NEOTM0eCBTb3VuZFdpcmUgY29udHJvbGxlciBjb25uZWN0ZWQgdG8g
V1NBODgxeCBzbWFydAo+PiBzcGVha2VyIGFtcGxpZmllcnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPiAK
PiBUaGlzIGxvb2tzIHF1aXRlIGdvb2QsIEkgb25seSBoYXZlIGEgY291cGxlIG9mIG5pdC1waWNr
cy9xdWVzdGlvbnMgYmVsb3cuCgpUaGFua3MgZm9yIHRha2luZyB0aW1lIHRvIHJldmlldyB0aGlz
LgoKPj4gK3N0YXRpYyBpbnQgcWNvbV9zd3JtX2FiaF9yZWdfcmVhZChzdHJ1Y3QgcWNvbV9zd3Jt
X2N0cmwgKmN0cmwsIGludCByZWcsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHUzMiAqdmFsKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCByZWdtYXAgKndjZF9yZWdtYXAg
PSBjdHJsLT5yZWdtYXA7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIC8qIHBn
IHJlZ2lzdGVyICsgb2Zmc2V0ICovCj4+ICvCoMKgwqAgcmV0ID0gcmVnbWFwX2J1bGtfd3JpdGUo
d2NkX3JlZ21hcCwgU1dSTV9BSEJfQlJJREdFX1JEX0FERFJfMCwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICh1OCAqKSZyZWcsIDQpOwo+PiArwqDCoMKgIGlmIChyZXQgPCAwKQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIFNEV19DTURfRkFJTDsKPj4gKwo+PiArwqDCoMKgIHJldCA9
IHJlZ21hcF9idWxrX3JlYWQod2NkX3JlZ21hcCwgU1dSTV9BSEJfQlJJREdFX1JEX0RBVEFfMCwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwsIDQpOwo+PiArwqDC
oMKgIGlmIChyZXQgPCAwKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFNEV19DTURfRkFJTDsK
Pj4gKwo+PiArwqDCoMKgIHJldHVybiBTRFdfQ01EX09LOwo+PiArfQo+IAo+IEkgdGhpbmsgSSBh
c2tlZCB0aGUgcXVlc3Rpb24gYmVmb3JlIGJ1dCBkb24ndCByZW1lbWJlciB0aGUgYW5zd2VyIHNv
IHlvdSAKPiBtYXkgd2FudCB0byBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IFNEV19DTURf
SUdOT1JFRCBpcyBub3QgYSAKPiBwb3NzaWJsZSByZXR1cm4gdmFsdWU/Cj4gClRoZXJlIGlzIG5v
IHdheSBhdGxlYXN0IGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgY29udHJvbGxlciB0byBrbm93IGlm
IHRoZSAKY29tbWFuZCBpcyBpZ25vcmVkLiBPbmx5IGVycm9yIHRoYXQgY2FuIGJlIGRldGVjdGVk
IGF0bSBpcyB0aW1lb3V0IAp3YWl0aW5nIGZvciByZXNwb25zZS4gSG9wZWZ1bGx5IG5ldyB2ZXJz
aW9ucyBvZiB0aGlzIElQIGhhdmUgdGhhdCAKYWJpbGl0eSB0byBkZXRlY3QgdGhpcy4KCj4gVGhl
IEJFUiBpcyBzdXBwb3NlZCB0byBiZSB2ZXJ5IHZlcnkgbG93IGJ1dCB0aGVyZSBpcyBhIG5vbi16
ZXJvIAo+IHBvc3NpYmlsaXR5IG9mIGEgZGV2aWNlIGxvc2luZyBzeW5jLgo+IAo+PiArCj4+ICtz
dGF0aWMgaW50IHFjb21fc3dybV9jbWRfZmlmb193cl9jbWQoc3RydWN0IHFjb21fc3dybV9jdHJs
ICpjdHJsLCB1OCAKPj4gY21kX2RhdGEsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHU4IGRldl9hZGRyLCB1MTYgcmVnX2FkZHIpCj4+ICt7Cj4+ICvCoMKgwqAg
REVDTEFSRV9DT01QTEVUSU9OX09OU1RBQ0soY29tcCk7Cj4+ICvCoMKgwqAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKPj4gK8KgwqDCoCB1MzIgdmFsOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4g
K8KgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmY3RybC0+Y29tcF9sb2NrLCBmbGFncyk7Cj4+ICvC
oMKgwqAgY3RybC0+Y29tcCA9ICZjb21wOwo+PiArwqDCoMKgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmN0cmwtPmNvbXBfbG9jaywgZmxhZ3MpOwo+PiArwqDCoMKgIHZhbCA9IFNXUk1fUkVHX1ZB
TF9QQUNLKGNtZF9kYXRhLCBkZXZfYWRkciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTV1JNX1NQRUNJQUxfQ01EX0lELCByZWdfYWRkcik7Cj4+ICvCoMKgwqAgcmV0ID0gY3Ry
bC0+cmVnX3dyaXRlKGN0cmwsIFNXUk1fQ01EX0ZJRk9fV1JfQ01ELCB2YWwpOwo+PiArwqDCoMKg
IGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPiAKPiB0aGUgY29kZSBpcyBh
IGJpdCBpbmNvbnNpc3RlbnQgYXQgdGhlIG1vbWVudCBvbiBob3cgZXJyb3JzIGFyZSBoYW5kbGVk
Lgo+IEluIHNvbWUgY2FzZXMgeW91IGV4cGxpY2l0bHkgdGVzdCBmb3IgZXJyb3JzLCBidXQgLi4u
CgpJIGxvb2tlZCBhdCBvdXIgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYW5kIEkgdGhpbmsgd2UgZGVj
aWRlZCBub3QgdG8gZG8gCmVycm9yIGNoZWNraW5nIHJlYWRpbmcgb24gY29udHJvbGxlciByZWdp
c3RlcnMuCgoiRm9yIHRoZSBJbnRlbCBzdHVmZiwgd2UgdHlwaWNhbGx5IGRvbid0IGNoZWNrIHRo
ZSByZWFkL3dyaXRlcyB0byAKY29udHJvbGxlciByZWdpc3RlcnMsIGJ1dCBhbnl0aGluZyB0aGF0
IGdvZXMgb3V0IG9uIHRoZSBidXMgaXMgY2hlY2tlZC4gIgo+IAo+IAo+PiArCj4+ICvCoMKgwqAg
Zm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjdHJsLT5yZWdf
cmVhZChjdHJsLCBTV1JNX0NNRF9GSUZPX1JEX0ZJRk9fQUREUiwgJnZhbCk7Cj4gCj4gLi4uIGhl
cmUgeW91IGRvbid0IC4uLgo+IAo+PiArwqDCoMKgwqDCoMKgwqAgcnZhbFtpXSA9IHZhbCAmIDB4
RkY7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICtlcnI6Cj4+ICvCoMKgwqAgc3Bpbl9sb2NrX2lycXNh
dmUoJmN0cmwtPmNvbXBfbG9jaywgZmxhZ3MpOwo+PiArwqDCoMKgIGN0cmwtPmNvbXAgPSBOVUxM
Owo+PiArwqDCoMKgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmN0cmwtPmNvbXBfbG9jaywgZmxh
Z3MpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZv
aWQgcWNvbV9zd3JtX2dldF9kZXZpY2Vfc3RhdHVzKHN0cnVjdCBxY29tX3N3cm1fY3RybCAqY3Ry
bCkKPj4gK3sKPj4gK8KgwqDCoCB1MzIgdmFsOwo+PiArwqDCoMKgIGludCBpOwo+PiArCj4+ICvC
oMKgwqAgY3RybC0+cmVnX3JlYWQoY3RybCwgU1dSTV9NQ1BfU0xWX1NUQVRVUywgJnZhbCk7Cj4g
Cj4gLi4uIGFuZCBub3QgaGVyZSAuLi4KPiAKPj4gKwo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBTRFdfTUFYX0RFVklDRVM7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqAgdTMyIHM7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHMgPSAodmFsID4+IChpICogMikpOwo+PiArwqDCoMKgwqDCoMKg
wqAgcyAmPSBTV1JNX01DUF9TTFZfU1RBVFVTX01BU0s7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjdHJs
LT5zdGF0dXNbaV0gPSBzOwo+PiArwqDCoMKgIH0KPj4gK30KPj4gKwo+PiArc3RhdGljIGlycXJl
dHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4+ICt7
Cj4+ICvCoMKgwqAgc3RydWN0IHFjb21fc3dybV9jdHJsICpjdHJsID0gZGV2X2lkOwo+PiArwqDC
oMKgIHUzMiBzdHMsIHZhbHVlOwo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+ICsK
Pj4gK8KgwqDCoCBjdHJsLT5yZWdfcmVhZChjdHJsLCBTV1JNX0lOVEVSUlVQVF9TVEFUVVMsICZz
dHMpOwo+IAo+IC4uLiBhbmQgaGVyZSBzYW1lIHRoZSByZWdfcmVhZC93cml0ZXMgYXJlIG5vIGxv
bmdlciB0ZXN0ZWQgZm9yPwo+IAo+PiArCj4+ICvCoMKgwqAgaWYgKHN0cyAmIFNXUk1fSU5URVJS
VVBUX1NUQVRVU19DTURfRVJST1IpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGN0cmwtPnJlZ19yZWFk
KGN0cmwsIFNXUk1fQ01EX0ZJRk9fU1RBVFVTLCAmdmFsdWUpOwo+PiArwqDCoMKgwqDCoMKgwqAg
ZGV2X2Vycl9yYXRlbGltaXRlZChjdHJsLT5kZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiQ01EIGVycm9yLCBmaWZvIHN0YXR1cyAweCV4XG4iLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSk7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBjdHJsLT5yZWdfd3JpdGUoY3RybCwgU1dSTV9DTURfRklGT19DTUQsIDB4MSk7Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgaWYgKChzdHMgJiBTV1JNX0lOVEVSUlVQVF9TVEFU
VVNfTkVXX1NMQVZFX0FUVEFDSEVEKSB8fAo+PiArwqDCoMKgwqDCoMKgwqAgc3RzICYgU1dSTV9J
TlRFUlJVUFRfU1RBVFVTX0NIQU5HRV9FTlVNX1NMQVZFX1NUQVRVUykKPj4gK8KgwqDCoMKgwqDC
oMKgIHNjaGVkdWxlX3dvcmsoJmN0cmwtPnNsYXZlX3dvcmspOwo+PiArCj4+ICvCoMKgwqAgY3Ry
bC0+cmVnX3dyaXRlKGN0cmwsIFNXUk1fSU5URVJSVVBUX0NMRUFSLCBzdHMpOwo+IAo+IGlzIGl0
IGludGVudGlvbmFsIHRvIGNsZWFyIHRoZSBpbnRlcnJ1cHRzIGZpcnN0LCBiZWZvcmUgZG9pbmcg
YWRkaXRpb25hbCAKPiBjaGVja3M/Cj4gCgpObywgSSBjYW4gbW92ZSBpdCB0byByaWdodCB0byB0
aGUgZW5kIQoKPiBPciBjb3VsZCBpdCBiZSBkb25lIGltbWVkaWF0ZWx5IGFmdGVyIHJlYWRpbmcg
dGhlIHN0YXR1cy4gSXQncyBub3QgY2xlYXIgCj4gdG8gbWUgaWYgdGhlIHBvc2l0aW9uIG9mIHRo
aXMgY2xlYXIgbWF0dGVycywgYW5kIGlmIHllcyB5b3Ugc2hvdWxkIAo+IHByb2JhYmx5IGFkZCBh
IGNvbW1lbnQ/CgpBbSBub3QgMTAwJSBpZiBpdCBtYXR0ZXJzLCBidXQgSWRlYWxseSBJIHdvdWxk
IGxpa2UgY2xlYXIgdGhlIGludGVycnVwdCAKc291cmNlIGJlZm9yZSBjbGVhcmluZyB0aGUgaW50
ZXJydXB0LgoKCj4gCj4+ICsKPj4gK8KgwqDCoCBpZiAoc3RzICYgU1dSTV9JTlRFUlJVUFRfU1RB
VFVTX1NQRUNJQUxfQ01EX0lEX0ZJTklTSEVEKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xv
Y2tfaXJxc2F2ZSgmY3RybC0+Y29tcF9sb2NrLCBmbGFncyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoY3RybC0+Y29tcCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGxldGUoY3RybC0+
Y29tcCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjdHJsLT5j
b21wX2xvY2ssIGZsYWdzKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gSVJR
X0hBTkRMRUQ7Cj4gVGhlIHJlc3QgbG9va3MgZmluZS4gbmljZSB3b3JrLgpUaGFua3MsCnNyaW5p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
