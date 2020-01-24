Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC34147681
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 02:20:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 191E9166E;
	Fri, 24 Jan 2020 02:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 191E9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579828837;
	bh=ojtyzsXzzk03fxw8GbLMOnRrxke1vShuRy/7iLklBr0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXwas1lfKBUK3p+DvRMzjUfsAW6NXhsBYq9vEXrT+QuxxXJceRAdWcljgmotRuZ6v
	 J8tgeDwhnXfi9Fd2OwAP45gxXtXgIRFOXUyxezWHbIU8NR2DaQxHMP+5JGApHyhX2U
	 LTXmT9VapEWwOFkuFFlwm8x09e6WYLI09iQHdmKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D6A2F80272;
	Fri, 24 Jan 2020 02:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3772BF80233; Fri, 24 Jan 2020 02:18:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2831F8015B
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 02:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2831F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gQvil3S7"
Received: by mail-lf1-x141.google.com with SMTP id l18so126071lfc.1
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 17:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qa1ZeKIxwMxhhVXWx6jah5pzEB39RZ2UXKKeVBvARPU=;
 b=gQvil3S7iFbcn3Zs8yz7OmBRM/dDoATirdGEZo2VCbmL8OTLPt7/ozLpiNQZdpg+WT
 7fNM9+G1SywrHuqMmvNR4XL1FL0+A0/Qt0t1CPFRe8FBJHZu42bClhUubNNvVZgtH2GP
 kM3eg7TYMuQyPL4o0asf3vO55XaTS0yJb6XO5spInitlXvOGtydV1rc6ebnTH6BprioC
 8H98izxEKeAdjG8oPxARdM8rk88hJ+J36UE3ZH99G3M+CtF7v9zW7a9YGacuHPRgUwfE
 uR7owsNEdBpOk91HfdXy5LmGWQdnFO+QnYALvsQz0P6QbRKCJwkmZSvX80FkdPwGGSzb
 6ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qa1ZeKIxwMxhhVXWx6jah5pzEB39RZ2UXKKeVBvARPU=;
 b=U+811GzGkoG84Ufz4LqPdE2m5Ajxcq6JxKG4FDZ6BwcsQV53mKH+oFKHPXOqc962aK
 pqEp1dt5F+w4VrA/VzdO055NcTqFAi995DXFfLITfSz5fgOlbC+s+Zo3BPstR6czgJCq
 GBMUCgvfzxhTVteiE2zrUOq6Ne9CLF687SBMkA+ir9IvOPAHFGt1f7HbBmJ3NcmAj/aY
 UuZYCuR77M4W3v78nmhXpUxUpcuJVzYyjWbQVsYsMqYbpz2RvVIiyIym/6CwMuBGirTz
 BE1Sscs/WGvrI5+4szglt+rboIUO9Gp3+ZRr1MQp6wpL09dqzlDFyYMZZxkAJPEbkSkz
 8Piw==
X-Gm-Message-State: APjAAAUy66WbRQ6BtTgKT44iSMUuurk1lz3QLHFdYmqV9GX/GrTPoxkM
 Oho4RBCd4jTlFq2zQ7PAMZbg5Xoz
X-Google-Smtp-Source: APXvYqxECFw30QnabkPguwcGpQ2JKwDUyv9e9T2Ryy+nL3W+5b0VqO7G9uYOHFCPG8/lASm/uehVZw==
X-Received: by 2002:a19:4ad0:: with SMTP id x199mr241966lfa.13.1579828719604; 
 Thu, 23 Jan 2020 17:18:39 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id k24sm2503908ljj.27.2020.01.23.17.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 17:18:38 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
Date: Fri, 24 Jan 2020 04:18:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1579530198-13431-6-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: tegra: add Tegra210 based AHUB
 driver
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

MjAuMDEuMjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6CltzbmlwXQo+ICtzdGF0
aWMgaW50IHRlZ3JhX2FodWJfZ2V0X3ZhbHVlX2VudW0oc3RydWN0IHNuZF9rY29udHJvbCAqa2N0
bCwKPiArCQkJCSAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWN0bCkKPiArewo+ICsJ
c3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudCA9IHNuZF9zb2NfZGFwbV9rY29udHJvbF9j
b21wb25lbnQoa2N0bCk7Cj4gKwlzdHJ1Y3QgdGVncmFfYWh1YiAqYWh1YiA9IHNuZF9zb2NfY29t
cG9uZW50X2dldF9kcnZkYXRhKGNtcG50KTsKPiArCXN0cnVjdCBzb2NfZW51bSAqZSA9IChzdHJ1
Y3Qgc29jX2VudW0gKilrY3RsLT5wcml2YXRlX3ZhbHVlOwo+ICsJdW5zaWduZWQgaW50IHJlZywg
aSwgYml0X3BvcyA9IDA7Cj4gKwo+ICsJLyoKPiArCSAqIEZpbmQgdGhlIGJpdCBwb3NpdGlvbiBv
ZiBjdXJyZW50IE1VWCBpbnB1dC4KPiArCSAqIElmIG5vdGhpbmcgaXMgc2V0LCBwb3NpdGlvbiB3
b3VsZCBiZSAwIGFuZCBpdCBjb3JyZXNwb25kcyB0byAnTm9uZScuCj4gKwkgKi8KPiArCWZvciAo
aSA9IDA7IGkgPCBhaHViLT5zb2NfZGF0YS0+cmVnX2NvdW50OyBpKyspIHsKPiArCQl1bnNpZ25l
ZCBpbnQgcmVnX3ZhbDsKPiArCj4gKwkJcmVnID0gZS0+cmVnICsgKFRFR1JBMjEwX1hCQVJfUEFS
VDFfUlggKiBpKTsKPiArCQlzbmRfc29jX2NvbXBvbmVudF9yZWFkKGNtcG50LCByZWcsICZyZWdf
dmFsKTsKPiArCQlyZWdfdmFsICY9IGFodWItPnNvY19kYXRhLT5tYXNrW2ldOwo+ICsKPiArCQlp
ZiAocmVnX3ZhbCkgewo+ICsJCQliaXRfcG9zID0gZmZzKHJlZ192YWwpICsKPiArCQkJCSAgKDgg
KiBjbXBudC0+dmFsX2J5dGVzICogaSk7CgpNdWx0aXBsaWNhdGlvbiB0YWtlcyBwcmVjZWRlbmNl
LCBicmFjZXMgYXJlIG5vdCBuZWVkZWQuIFNhbWUgZm9yIGFsbApvdGhlciBvY2N1cnJlbmNlcyBp
biB0aGUgY29kZS4KCltzbmlwXQo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJLyog
RmluZCBpbmRleCByZWxhdGVkIHRvIHRoZSBpdGVtIGluIGFycmF5ICpfYWh1Yl9tdXhfdGV4dHNb
XSAqLwo+ICsJZm9yIChpID0gMDsgaSA8IGUtPml0ZW1zOyBpKyspIHsKPiArCQlpZiAoYml0X3Bv
cyA9PSBlLT52YWx1ZXNbaV0pIHsKPiArCQkJdWN0bC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBd
ID0gaTsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW50IHRlZ3JhX2FodWJfcHV0X3ZhbHVlX2VudW0oc3RydWN0IHNuZF9rY29u
dHJvbCAqa2N0bCwKPiArCQkJCSAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWN0bCkK
PiArewo+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudCA9IHNuZF9zb2NfZGFwbV9r
Y29udHJvbF9jb21wb25lbnQoa2N0bCk7Cj4gKwlzdHJ1Y3QgdGVncmFfYWh1YiAqYWh1YiA9IHNu
ZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNtcG50KTsKPiArCXN0cnVjdCBzbmRfc29jX2Rh
cG1fY29udGV4dCAqZGFwbSA9IHNuZF9zb2NfZGFwbV9rY29udHJvbF9kYXBtKGtjdGwpOwo+ICsJ
c3RydWN0IHNvY19lbnVtICplID0gKHN0cnVjdCBzb2NfZW51bSAqKWtjdGwtPnByaXZhdGVfdmFs
dWU7Cj4gKwlzdHJ1Y3Qgc25kX3NvY19kYXBtX3VwZGF0ZSB1cGRhdGVbVEVHUkFfWEJBUl9VUERB
VEVfTUFYX1JFR10gPSB7IH07CgpTaG91bGRuJ3QgdGhpcyBiZSB7MH0gdG8gbWFrZSBhcnJheSB6
ZXJvJ2VkPwoKW3NuaXBdCj4gK3N0YXRpYyBpbnQgdGVncmFfYWh1Yl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKwljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpt
YXRjaDsKPiArCXN0cnVjdCB0ZWdyYV9haHViICphaHViOwo+ICsJc3RydWN0IHRlZ3JhX2FodWJf
c29jX2RhdGEgKnNvY19kYXRhOwo+ICsJdm9pZCBfX2lvbWVtICpyZWdzOwo+ICsJc3RydWN0IHJl
c291cmNlICpyZXM7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCW1hdGNoID0gb2ZfbWF0Y2hfZGV2aWNl
KHRlZ3JhX2FodWJfb2ZfbWF0Y2gsICZwZGV2LT5kZXYpOwo+ICsJaWYgKCFtYXRjaCkgewo+ICsJ
CWRldl9lcnIoJnBkZXYtPmRldiwgImVycm9yOiBubyBkZXZpY2UgbWF0Y2ggZm91bmRcbiIpOwo+
ICsJCXJldHVybiAtRU5PREVWOwo+ICsJfQo+ICsKPiArCXNvY19kYXRhID0gKHN0cnVjdCB0ZWdy
YV9haHViX3NvY19kYXRhICopbWF0Y2gtPmRhdGE7Cgpzb2NfZGF0YSA9IGRldmljZV9nZXRfbWF0
Y2hfZGF0YSgmcGRldi0+ZGV2KTsKCj4gKwlhaHViID0gZGV2bV9rY2FsbG9jKCZwZGV2LT5kZXYs
IDEsIHNpemVvZigqYWh1YiksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFhaHViKQo+ICsJCXJldHVy
biAtRU5PTUVNOwo+ICsKPiArCWFodWItPnNvY19kYXRhID0gc29jX2RhdGE7Cj4gKwo+ICsJcGxh
dGZvcm1fc2V0X2RydmRhdGEocGRldiwgYWh1Yik7Cj4gKwo+ICsJYWh1Yi0+Y2xrID0gZGV2bV9j
bGtfZ2V0KCZwZGV2LT5kZXYsICJhaHViIik7Cj4gKwlpZiAoSVNfRVJSKGFodWItPmNsaykpIHsK
PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW4ndCByZXRyaWV2ZSBBSFVCIGNsb2NrXG4iKTsK
PiArCQlyZXR1cm4gUFRSX0VSUihhaHViLT5jbGspOwo+ICsJfQo+ICsKPiArCXJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gKwo+ICsJcmVncyA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ICsJaWYgKElTX0VSUihy
ZWdzKSkKPiArCQlyZXR1cm4gUFRSX0VSUihyZWdzKTsKCnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
