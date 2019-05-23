Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00527851
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 10:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808CE1669;
	Thu, 23 May 2019 10:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808CE1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558601106;
	bh=oYbeplyhPUpa+GTCsl5ZAVE1i/3hxXAKkhNgfjBDdKM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3fIZkLqQspAwizsM0maFeq3j2JT/OsaFpsIl5Tdr9EgtJGXqTv3XYTkJnI7pZNfa
	 PxG9pmmcIHMA5zmPl6/VR0GV5GtDexp0rwXQ1BURhWiD/Q637qE114g3N65AMKqON7
	 yTonJDjzPng/FWnmqkeZ6isVcfclKvEW198WW1xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5EEFF89674;
	Thu, 23 May 2019 10:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD335F89674; Thu, 23 May 2019 10:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E4CF89625
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 10:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E4CF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ui/NihjZ"
Received: by mail-wr1-x441.google.com with SMTP id f8so5293576wrt.1
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+LCxAheRB5qj77eljS/M2DLhUcgp+C7BPN+J7IFDhdI=;
 b=Ui/NihjZ0pUjUW2sMbKku3wVCIrB8aJgyCELcpQNnt/LzhlDqPTjENf7NL7GRsisW5
 RBvgc7sdX00PJos/YG8V1Uaj2zzu3+z1trLNdbQ7G5L4WucXjFbf9tbMHfF6ycNlZ8CN
 ceuHElvJWD2CfdgUCvqatSXfi6Onvd5tMNhnht9+EydUN6cesGkrFUZEtpH07nBArc9m
 98HnR0hy255/Mb2J8A9TdSX4ARB+zzHzNU2F5n+xGj7PCLEpz7Q+VSob44ebkjuZnNEs
 cj8qN9AHrrjs1dDX1mSik0E1DGInk2eNLaQdN95AkjeYhtt/r8tXq55fu0OsaX/ff8wL
 3XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+LCxAheRB5qj77eljS/M2DLhUcgp+C7BPN+J7IFDhdI=;
 b=NBhlq/MowzIV5pkNoA9ppPwx3taWOPCc+4caoZQasePeFnpxteUOwzHRA1kNtUHNOX
 MiDOPE29ptqlNNL3HFlfsY9CZaPFBRjpFB7t2CAMAOh8BfbgjvjaO1hjurXE2SE5uOk/
 1dsC88IMg77tVx3+XOjFNLwYcDpU47AYjOfnF+nfgN+zDQeotsUhTGrsBZO6VAqb/m0z
 T1mh4x8a/PSj3T9cCYyOlmjIe0rU6ynw/d99v+wCCSezNNKl87Z40pj5S1Hv05j514w6
 dI+ao7DkZbVkPBJCWlA42bmzt+neOq39C/kvLmjZqN9g483Fn8bnQhY5eBZCK6m/tJTz
 ddjg==
X-Gm-Message-State: APjAAAVm3Cua/EFPCUj0L3xk6wMQo+JdKrOePE8s7+JfIeWUmEG1eLBx
 7MR74e2DOEIfNksxsn86Zk9jJA==
X-Google-Smtp-Source: APXvYqxyi4aASx0zjHHgh92IIp9xuwbeTDlL4GfAU8mgGRhZ9PmpEAyuP80j1M/++Do9dCrCOJXkpQ==
X-Received: by 2002:a5d:4ec6:: with SMTP id s6mr51133938wrv.184.1558600996450; 
 Thu, 23 May 2019 01:43:16 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id g2sm28814885wru.37.2019.05.23.01.43.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 01:43:15 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
 <4744834c-36b1-dd8d-45fa-76c75eb3d5cb@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2dc66f9d-e508-d457-a7d6-c06c4336e7b8@linaro.org>
Date: Thu, 23 May 2019 09:43:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4744834c-36b1-dd8d-45fa-76c75eb3d5cb@linux.intel.com>
Content-Language: en-US
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: stream: fix bad unlock balance
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

CgpPbiAyMi8wNS8yMDE5IDE3OjQxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiA1LzIyLzE5IDExOjI1IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+PiBUaGlz
IHBhdGNoIGZpeGVzIGJlbG93IHdhcm5pbmcgZHVlIHRvIHVubG9ja2luZyB3aXRob3V0IGxvY2tp
bmcuCj4+Cj4+IMKgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gwqAg
V0FSTklORzogYmFkIHVubG9jayBiYWxhbmNlIGRldGVjdGVkIQo+PiDCoCA1LjEuMC0xNjUwNi1n
YzFjMzgzYTZmMGEyLWRpcnR5ICMxNTIzIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoCBXCj4+IMKg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgYXBsYXkvMjk1NCBp
cyB0cnlpbmcgdG8gcmVsZWFzZSBsb2NrICgmYnVzLT5tc2dfbG9jaykgYXQ6Cj4+IMKgIGRvX2Jh
bmtfc3dpdGNoKzB4MjFjLzB4NDgwCj4+IMKgIGJ1dCB0aGVyZSBhcmUgbm8gbW9yZSBsb2NrcyB0
byByZWxlYXNlIQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmlu
aXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NvdW5kd2ly
ZS9zdHJlYW0uYyB8IDMgKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJlL3N0cmVh
bS5jIGIvZHJpdmVycy9zb3VuZHdpcmUvc3RyZWFtLmMKPj4gaW5kZXggNTQ0OTI1ZmYwYjQwLi5k
MTYyNjhmMzBlNGYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5jCj4+
ICsrKyBiL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5jCj4+IEBAIC04MTQsNyArODE0LDggQEAg
c3RhdGljIGludCBkb19iYW5rX3N3aXRjaChzdHJ1Y3QgCj4+IHNkd19zdHJlYW1fcnVudGltZSAq
c3RyZWFtKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZidXMtPm1z
Z19sb2NrKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChtdXRleF9pc19sb2NrZWQoJmJ1cy0+bXNn
X2xvY2spKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1dGV4X3VubG9jaygmYnVzLT5tc2df
bG9jayk7Cj4gCj4gRG9lcyB0aGlzIGV2ZW4gY29tcGlsZT8gc2hvdWxkIGJlIG11dGV4X3VubG9j
aywgbm8/Cj4gCj4gV2UgYWxzbyBtYXkgd2FudCB0byBpZGVudGlmeSB0aGUgaXNzdWUgaW4gbW9y
ZSBkZXRhaWxzIHdpdGhvdXQgcHVzaGluZyAKPiBpdCB1bmRlciB0aGUgcnVnLiBUaGUgbG9ja2lu
ZyBtZWNoYW5pc20gaXMgZmFyIGZyb20gc2ltcGxlIGFuZCBpdCdzIAo+IGxpa2VseSB0aGVyZSBh
cmUgYSBudW1iZXIgb2YgcHJvYmxlbXMgd2l0aCBpdC4KPiAKbXNnX2xvY2sgaXMgdGFrZW4gY29u
ZGl0aW9uYWxseSBkdXJpbmcgbXVsdGkgbGluayBiYW5rIHN3aXRjaCBjYXNlcywgCmhvd2V2ZXIg
dGhlIHVubG9jayBpcyBkb25lIHVuY29uZGl0aW9uYWxseSBsZWFkaW5nIHRvIHRoaXMgd2Fybmlu
Zy4KCkhhdmluZyBhIGNsb3NlciBsb29rIHNob3cgdGhhdCB0aGVyZSBjb3VsZCBiZSBhIGRlYWQg
bG9jayBpbiB0aGlzIHBhdGggCndoaWxlIGV4ZWN1dGluZyBzZHdfdHJhbnNmZXIoKS4gQW5kIGlu
ZmFjdCB0aGVyZSBpcyBubyBuZWVkIHRvIHRha2UgCm1zZ19sb2NrIGluICBtdWx0aSBsaW5rIHN3
aXRjaCBjYXNlcyBhcyBzZHdfdHJhbnNmZXIgc2hvdWxkIHRha2UgY2FyZSBvZiAKdGhpcy4KClZp
bm9kL1NhbnlvZyBhbnkgcmVhc29uIHdoeSBtc2dfbG9jayBpcyByZWFsbHkgcmVxdWlyZWQgaW4g
dGhpcyBwYXRoPwoKLS1zcmluaQoKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
