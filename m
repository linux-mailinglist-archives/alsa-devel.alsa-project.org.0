Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61C3A562
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jun 2019 14:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC691665;
	Sun,  9 Jun 2019 14:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC691665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560082766;
	bh=LMHh+2j9GW6nRDoX5ynaznuuFPvNErIWZKbn1Bp3+SY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2udcnVFU+evq9EGjrjpUpOdt8/EGWWQoAHqo8y7fpczsBSFqND2BE7d2Aq9nDpdm
	 i/SqLUsjqAeaUmmXx9yUmNnxUSSTEwGYhiNelsSU4LVpLe0s5qKEWJyaAnxVTRSY4t
	 laJ7U9EEvJfK2AZznMi92e90FoYOfrvCTaVmyJww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EBB6F8973D;
	Sun,  9 Jun 2019 14:16:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07E22F8973B; Sun,  9 Jun 2019 14:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5DE8F89736
 for <alsa-devel@alsa-project.org>; Sun,  9 Jun 2019 14:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5DE8F89736
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FYLVfUtK"
Received: by mail-wm1-x344.google.com with SMTP id h19so7127082wme.0
 for <alsa-devel@alsa-project.org>; Sun, 09 Jun 2019 05:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LpQBsLxOpX37xTANohRbpLZWsHdkz9zKfiLJ8/LUdwA=;
 b=FYLVfUtKWyeWJSTHK/1+iRBkE/d4V2jWSZ9c2lLXRAsfbgdl8xTBokfr+yFBwU3evv
 otb4miQ9PfF92NNm3rgFTkfQP2s8sgCNfPDW9UceQvrUGMTKudjrdLH4To9umrIrVIoS
 3Pwg94HQ75Ec42mt+5CrbnOvIDPH321+eYILQucaMjnSvtpYD1n5u8qVaIsgzIeAxAhH
 rvEBIBK0DofGd+yPHdkI9JgUD38Yx++IptYksvylyOPOFgynBvhhQzVyeN8XyIDJuzkI
 F5Kz/wFM/f0y1iB8XOOLuuvhTL9Cey6q2hRQHjh+X9cM+x+vY7UO4NTYb6AXNnuCmheu
 bN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LpQBsLxOpX37xTANohRbpLZWsHdkz9zKfiLJ8/LUdwA=;
 b=H3bgRb3FDJfhn9Ob19vXRZParkXuMZz3rK3JO4iRkvbobudE7G7eKlyslJX8n3fNtm
 Quw6dxZa2UUp0FdHWbZ/ZrIyHzD/0FA1ZQJ0Ffdk6Ffhdvs45jyc96madZTg+dXml3Lt
 zY6yNaVhkmLGZ9tXnQ4RR826szZQdusD+IwdMsjtBDTqgatWJ/hILSichAYldeFkZzc8
 IudgsQPz5iRUvaeDuwHn/aQJwOVbawKE4vP+OLHkICjGy/beQnPGIDW2q0ibDbovQQ9o
 Ff8nVR56p+XQRf05yQ20E6CKOfwphHP8cLxzw7kEq5LWKxrJ5OsXNaJZSYn7lLklg5R8
 znLg==
X-Gm-Message-State: APjAAAWOLcXtnCfS3kq0cqrKSBNfqb8+P8xiTfX4eZbzGj2oRHXizIQK
 QmwrhrkuOXI/Lcph060vW3QAew==
X-Google-Smtp-Source: APXvYqwt339mnQf4UEVUi8OBWtoZ3i25kVNHP5JRQNlY2ULQwvZj2wG0lbSvdmMSv9woVd8aqmRntw==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr9970774wml.28.1560082584755;
 Sun, 09 Jun 2019 05:16:24 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 32sm18825130wra.35.2019.06.09.05.16.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 05:16:24 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-2-srinivas.kandagatla@linaro.org>
 <13bfb632-f743-c416-2224-c7acb5b28604@intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <eef7ecf8-330f-c7e8-7d5e-f21d9771f037@linaro.org>
Date: Sun, 9 Jun 2019 13:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <13bfb632-f743-c416-2224-c7acb5b28604@intel.com>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 1/6] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

VGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXcsCgpPbiAwOC8wNi8yMDE5IDIwOjIyLCBD
ZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0wNi0wNyAxMDo1NiwgU3Jpbml2YXMgS2Fu
ZGFnYXRsYSB3cm90ZToKPj4gT24gcGxhdGZvcm1zIHdoaWNoIGhhdmUgc21hcnQgc3BlYWtlciBh
bXBsaWZpZXJzIGNvbm5lY3RlZCB2aWEKPj4gc291bmR3aXJlIGFuZCBtb2RlbGVkIGFzIGF1eCBk
ZXZpY2VzIGluIEFTb0MsIGluIHN1Y2ggdXNlY2FzZXMgbWFjaGluZQo+PiBkcml2ZXIgc2hvdWxk
IGJlIGFibGUgdG8gZ2V0IHNkdyBtYXN0ZXIgc3RyZWFtIGZyb20gZGFpIHNvIHRoYXQgaXQgY2Fu
Cj4+IHVzZSB0aGUgcnVudGltZSBzdHJlYW0gdG8gc2V0dXAgc2xhdmUgc3RyZWFtcy4KPj4KPj4g
c291bmR3aXJlIGFscmVhZHkgYXMgYSBzZXQgZnVuY3Rpb24sIGdldCBmdW5jdGlvbiB3b3VsZCBw
cm92aWRlIG1vcmUKPj4gZmxleGliaWxpdHkgdG8gYWJvdmUgY29uZmlndXJhdGlvbnMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFA
bGluYXJvLm9yZz4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvc291bmQvc29jLWRhaS5oIHwgMTAgKysr
KysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmggYi9pbmNsdWRlL3NvdW5kL3NvYy1kYWku
aAo+PiBpbmRleCBmNWQ3MDA0MTEwOGYuLjlmOTBiOTM2ZmQ5YSAxMDA2NDQKPj4gLS0tIGEvaW5j
bHVkZS9zb3VuZC9zb2MtZGFpLmgKPj4gKysrIGIvaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmgKPj4g
QEAgLTE3Nyw2ICsxNzcsNyBAQCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3BzIHsKPj4gwqDCoMKgwqDC
oCBpbnQgKCpzZXRfc2R3X3N0cmVhbSkoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKnN0cmVhbSwgaW50IGRpcmVjdGlvbik7Cj4+ICvC
oMKgwqAgdm9pZCAqKCpnZXRfc2R3X3N0cmVhbSkoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGlu
dCBkaXJlY3Rpb24pOwo+PiDCoMKgwqDCoMKgIC8qCj4+IMKgwqDCoMKgwqDCoCAqIERBSSBkaWdp
dGFsIG11dGUgLSBvcHRpb25hbC4KPj4gwqDCoMKgwqDCoMKgICogQ2FsbGVkIGJ5IHNvYy1jb3Jl
IHRvIG1pbmltaXNlIGFueSBwb3BzLgo+PiBAQCAtMzg1LDQgKzM4NiwxMyBAQCBzdGF0aWMgaW5s
aW5lIGludCAKPj4gc25kX3NvY19kYWlfc2V0X3Nkd19zdHJlYW0oc3RydWN0IHNuZF9zb2NfZGFp
ICpkYWksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1RTVVBQOwo+PiDCoCB9Cj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgKnNuZF9zb2NfZGFpX2dldF9zZHdfc3RyZWFtKHN0cnVjdCBz
bmRfc29jX2RhaSAKPj4gKmRhaSwgaW50IGRpcmVjdGlvbikKPiAKPiBFeGNlZWRzIGNoYXJhY3Rl
ciBsaW1pdD8KPiAKPj4gK3sKPj4gK8KgwqDCoCBpZiAoZGFpLT5kcml2ZXItPm9wcy0+Z2V0X3Nk
d19zdHJlYW0pCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGFpLT5kcml2ZXItPm9wcy0+Z2V0
X3Nkd19zdHJlYW0oZGFpLCBkaXJlY3Rpb24pOwo+PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBOVUxMOwo+IAo+IHNldF8gZXF1aXZhbGVudCByZXR1cm5zIC1FTk9UU1VQ
UCBpbnN0ZWFkLgo+IEVSUl9QVFIgc2VlbXMgdG8gbWFrZSBtb3JlIHNlbnNlIGhlcmUuCj4gCj4+
ICsKPiAKPiBVbm5lY2Vzc2FyeSBuZXdsaW5lLgoKSSBhZ3JlZSB3aXRoIGFsbCB0aGUgY29tbWVu
dCwgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uCgp0aGFua3MsCnNyaW5pCj4gCj4+ICt9
Cj4+ICsKPj4gwqAgI2VuZGlmCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
