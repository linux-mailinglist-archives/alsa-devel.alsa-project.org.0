Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62626136CD4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 13:14:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4A31718;
	Fri, 10 Jan 2020 13:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4A31718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578658465;
	bh=WcGU1Gb0tH+K57Jd3Yt08V4XtDeeP60UjfFZuDGHDNI=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jk1p8tjtxlF8fm93DJvrKV4j6KVzb/7/2n58FRLIhlni1zgNIXezMHSjAPVThZaGu
	 kPXce+N7apArEmfND/Cc5r5WvBchmSwHevKJGoBsi4XCXD90Cp/jwKDA7XrgLKWu6x
	 +amJbtQWyw1Tr3aJrfwJBfMMajY3w3OKMQG4i4so=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BFF4F80116;
	Fri, 10 Jan 2020 13:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF102F8011C; Fri, 10 Jan 2020 13:12:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD7B4F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 13:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD7B4F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dQfyW/TB"
Received: by mail-wm1-x344.google.com with SMTP id f129so1736209wmf.2
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 04:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PbLS8+CBS7HYER+f3f/RHxsRY9Q8q0B8TRW1+q98Z4A=;
 b=dQfyW/TB0LdtH31ZM/dsMU6OGeB9k8z8Upm5IgOBDNeDz+y8xV6T6aYpdGkgoIW3S5
 XCukLIzmrVXKDtYTZQhf1qYINfhSfklO6vcJUVBt19OMfRdfmDNMeJVdeqZZxDXJP/LA
 R6T3m2yEBU4dzHnNC4R+6dSXWGl2ZVJb8WhEq77eV1+KcIfgCHa5USib4fQiRAS1Gr24
 kkds2xe5tA+oZZwTde5hJ+JlXo3gFkXlgwP2bfMsiSrLoiIbKZkBvXIEfME7NDYRqp5/
 EIBirhm9EGHEjxTbVpHSGxO0elM8HnIOtJNc0BvSG5lxqRcne+lztEmRejNNCJCHBN44
 8K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbLS8+CBS7HYER+f3f/RHxsRY9Q8q0B8TRW1+q98Z4A=;
 b=SCd3+x2c1+T1bPMgTurxK4uooPXqyVyfqOGIQcaVYaqReS+wf2Q+TVclrviwnklSYO
 Yt91zaOXBTaLm1Hu/OhxUweHu6CwkWFSHDxkagyi9THxDQfj1IsPkeKwrHCsYee52+if
 b6abh3gG4COrktWej+iQcGSPyCLMTG1fV13OiR6H1szLZMYlWrIaVQBiX/CEVQsjPyjg
 bVaHhtVVE3rscHcYTEo3BD66qn0+bN8NjjcyOR0kTnI46Hiz7xhVTv/CmoBPj/ih+84h
 VA6eV6NKd3yvI+6TT4sr1nJPY0pT1B9BRM8bet3mqp71HYwzyHFnerAcxBYrU5vAvjv6
 5RuQ==
X-Gm-Message-State: APjAAAUN486OYR4hRH+PqutW4mSyUD7ZwxoEVwTGnJDfaLOB5JuZTUSv
 sE9EZGUyZAUZenJxNmtARzfqEg==
X-Google-Smtp-Source: APXvYqzIASqp7May83PDLm1BQr+QIyfmrPfepqhskPM02Q4ODS5KUUSOL1TYCNsq/yO/UopKoKkKhA==
X-Received: by 2002:a1c:486:: with SMTP id 128mr4066673wme.163.1578658353503; 
 Fri, 10 Jan 2020 04:12:33 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q11sm2032269wrp.24.2020.01.10.04.12.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 04:12:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20191219092842.10885-1-srinivas.kandagatla@linaro.org>
 <20191219092842.10885-3-srinivas.kandagatla@linaro.org>
 <c791e241-cd71-4c05-dac5-04e3ecaaf995@linux.intel.com>
 <a5315861-d9b8-0852-8a3a-012f60cc3a44@linaro.org>
Message-ID: <4dab7ee8-dc0e-bf61-24db-3e227c459575@linaro.org>
Date: Fri, 10 Jan 2020 12:12:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a5315861-d9b8-0852-8a3a-012f60cc3a44@linaro.org>
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

CgpPbiAxOS8xMi8yMDE5IDE3OjE0LCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+Pj4gKwo+
Pj4gK8KgwqDCoCBpZiAoc3RzICYgU1dSTV9JTlRFUlJVUFRfU1RBVFVTX0NNRF9FUlJPUikgewo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGN0cmwtPnJlZ19yZWFkKGN0cmwsIFNXUk1fQ01EX0ZJRk9fU1RB
VFVTLCAmdmFsdWUpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnJfcmF0ZWxpbWl0ZWQoY3Ry
bC0+ZGV2LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJDTUQg
ZXJyb3IsIGZpZm8gc3RhdHVzIDB4JXhcbiIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY3RybC0+cmVnX3dy
aXRlKGN0cmwsIFNXUk1fQ01EX0ZJRk9fQ01ELCAweDEpOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+
PiArwqDCoMKgIGlmICgoc3RzICYgU1dSTV9JTlRFUlJVUFRfU1RBVFVTX05FV19TTEFWRV9BVFRB
Q0hFRCkgfHwKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHMgJiBTV1JNX0lOVEVSUlVQVF9TVEFUVVNf
Q0hBTkdFX0VOVU1fU0xBVkVfU1RBVFVTKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNjaGVkdWxlX3dv
cmsoJmN0cmwtPnNsYXZlX3dvcmspOwo+Pj4gKwo+Pj4gK8KgwqDCoCBjdHJsLT5yZWdfd3JpdGUo
Y3RybCwgU1dSTV9JTlRFUlJVUFRfQ0xFQVIsIHN0cyk7Cj4+Cj4+IGlzIGl0IGludGVudGlvbmFs
IHRvIGNsZWFyIHRoZSBpbnRlcnJ1cHRzIGZpcnN0LCBiZWZvcmUgZG9pbmcgCj4+IGFkZGl0aW9u
YWwgY2hlY2tzPwo+Pgo+IAo+IE5vLCBJIGNhbiBtb3ZlIGl0IHRvIHJpZ2h0IHRvIHRoZSBlbmQh
CgpSZWFzb24gd2h5IEkgZGlkIHRoaXMgd2FzIHRoYXQgaWYgd2UgcnVuIGNvbXBsZXRlKCkgYmVm
b3JlIGlycSBpcyAKY2xlYXJlZCBjb21wbGV0ZSBtaWdodCB0cmlnZ2VyIGFub3RoZXIgcmVhZC93
cml0ZSB3aGljaCBjYW4gcmFpc2UgYW4gCmludGVycnVwdC4gQW5kIHdpdGggaW50ZXJydXB0IHN0
YXR1cyBub3QgY2xlYXJlZCB3ZSBtaWdodCBtaXNzIGl0LiBUaGlzIAppcyB2ZXJ5IG11Y2ggdGlt
aW5nIGRlcGVuZGVudCBzcGVjaWFsbHkgd2l0aCB0aGUgdGhyZWFkZWQgaXJxLgoKU28gY29kZSBu
ZWVkcyBubyBjaGFuZ2UgYXRtIQoKPiAKPj4gT3IgY291bGQgaXQgYmUgZG9uZSBpbW1lZGlhdGVs
eSBhZnRlciByZWFkaW5nIHRoZSBzdGF0dXMuIEl0J3Mgbm90IAo+PiBjbGVhciB0byBtZSBpZiB0
aGUgcG9zaXRpb24gb2YgdGhpcyBjbGVhciBtYXR0ZXJzLCBhbmQgaWYgeWVzIHlvdSAKPj4gc2hv
dWxkIHByb2JhYmx5IGFkZCBhIGNvbW1lbnQ/Cj4gCj4gQW0gbm90IDEwMCUgaWYgaXQgbWF0dGVy
cywgYnV0IElkZWFsbHkgSSB3b3VsZCBsaWtlIGNsZWFyIHRoZSBpbnRlcnJ1cHQgCj4gc291cmNl
IGJlZm9yZSBjbGVhcmluZyB0aGUgaW50ZXJydXB0Lgo+IAo+IAo+Pgo+Pj4gKwo+Pj4gK8KgwqDC
oCBpZiAoc3RzICYgU1dSTV9JTlRFUlJVUFRfU1RBVFVTX1NQRUNJQUxfQ01EX0lEX0ZJTklTSEVE
KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmN0cmwtPmNvbXBfbG9j
aywgZmxhZ3MpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjdHJsLT5jb21wKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcGxldGUoY3RybC0+Y29tcCk7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY3RybC0+Y29tcF9sb2NrLCBmbGFncyk7Cj4+PiAr
wqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIElSUV9IQU5ETEVEOwo+PiBUaGUgcmVz
dCBsb29rcyBmaW5lLiBuaWNlIHdvcmsuIAoKVGhhbmtzLApzcmluaQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
