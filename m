Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8028677A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 18:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC4E1666;
	Thu,  8 Aug 2019 18:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC4E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565283047;
	bh=NZaNH3S0SbnAS5lYyblPL7rMNa/+EXsnDQDYXJhCbkE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNEiRCRXl6ELH2a2LAE4CWJ2TP3SwqHRRtrSC+E1hmPG+3QxQlPjfFayrn0amcooU
	 W8ZPsQyo0hg63JgSTqIBUOLTW2DAn6mdJy2wmwM0n/DQZE+UGYWXym6wq32rqv3FTm
	 GPySKYMi1KmIM2Lt504Qp7T8oMFkQyXAL4TxClYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3521F803F3;
	Thu,  8 Aug 2019 18:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A285F80534; Thu,  8 Aug 2019 18:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1379F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 18:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1379F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cwd3fSQi"
Received: by mail-wm1-x344.google.com with SMTP id s15so3089288wmj.3
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 09:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lL2ShwsE/GA9BuDEpLxcIGuN5LXS8sAbxL9xoaNEokw=;
 b=cwd3fSQiRwN6sA8taiEQr8r3230IVi0h+C58VurH9KWDmqdrJ2YUSTjZPnCZyQ3VrV
 JwqOYtnxH4T9CkZrwy2RluKRFHYHLvGwkb+daaAt/nqT7asOx4UfOxu5nYs/oTMZf1Wq
 3n1WIpgb/9BbwuYKpRC4BS1sB1heZb2sffB5OhQROsCmrQwZdVfH7OYV6On47fCuvzrp
 ByJRSkM95InCOT9LHtdITzxsSpIGANBx5HxVgGCEEJcMz1l/zP0prRpZkaW+l1XXfph/
 wdaacSUL1MW1gHpeuI5QHL3Y86/ts6T0XBqhtwJerzQ08gAH3siBPwwLKAfV6LWisVQ0
 cbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lL2ShwsE/GA9BuDEpLxcIGuN5LXS8sAbxL9xoaNEokw=;
 b=qrbNmowoh8QDQJbjibVrf1ZAKUB9dhVIBuziyJxVDykwOZrhJkAC6i/hG8G8esSAfW
 mIrta4RzJf24N/FQ18qxAeTnttsRVuxPavFGRpLAA3t+p+BDAcknN4aMOzuJ9I080JaE
 oZA6tWjul2s/XesLB1AxccoNKxB4oQx/JeQRd0ae8uLxsXJZiHYUgZUFJtevKGrivVgB
 AWaFmQ7qDx9iqDt4J1enISjk0hhXdWlNM+9MQSfzcJdI0upRvQfBSYHdIKhPtmKB2Rr6
 aCpyvNdjekJX+GFPVL5BsGZZjv5df2aKJMZi0Sn2ehEHtjhIaCcNBddggCwNBZ7xGzag
 Os6g==
X-Gm-Message-State: APjAAAXl6TCExX2hJ0WHVXZycfpbK0U10yynlTybKHklTPGo3Mt2T81Z
 fTXOgS2UpzzmlmUgS1jMwHMFLg==
X-Google-Smtp-Source: APXvYqxffKPC+HPHpszeXHZyBaa0mp+CcvH1UOy9QMMrHgh8Dhaf1vCOw9UxYWNilMieJlTSzKH6rw==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr5627277wmk.40.1565282937783;
 Thu, 08 Aug 2019 09:48:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id r5sm5114319wmh.35.2019.08.08.09.48.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 09:48:57 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
 <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cdd2bded-551c-65f5-ca29-d2bb825bdaba@linaro.org>
Date: Thu, 8 Aug 2019 17:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
	bindings
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

Ck9uIDA4LzA4LzIwMTkgMTY6NTgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IAo+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmR3aXJlL3NsYXZlLnR4
dAo+PiBAQCAtMCwwICsxLDQ2IEBACj4+ICtTb3VuZFdpcmUgc2xhdmUgZGV2aWNlIGJpbmRpbmdz
Lgo+PiArCj4+ICtTb3VuZFdpcmUgaXMgYSAyLXBpbiBtdWx0aS1kcm9wIGludGVyZmFjZSB3aXRo
IGRhdGEgYW5kIGNsb2NrIGxpbmUuCj4+ICtJdCBmYWNpbGl0YXRlcyBkZXZlbG9wbWVudCBvZiBs
b3cgY29zdCwgZWZmaWNpZW50LCBoaWdoIHBlcmZvcm1hbmNlIAo+PiBzeXN0ZW1zLgo+PiArCj4+
ICtTb3VuZFdpcmUgc2xhdmUgZGV2aWNlczoKPj4gK0V2ZXJ5IFNvdW5kV2lyZSBjb250cm9sbGVy
IG5vZGUgY2FuIGNvbnRhaW4gemVybyBvciBtb3JlIGNoaWxkIG5vZGVzCj4+ICtyZXByZXNlbnRp
bmcgc2xhdmUgZGV2aWNlcyBvbiB0aGUgYnVzLiBFdmVyeSBTb3VuZFdpcmUgc2xhdmUgZGV2aWNl
IGlzCj4+ICt1bmlxdWVseSBkZXRlcm1pbmVkIGJ5IHRoZSBlbnVtZXJhdGlvbiBhZGRyZXNzIGNv
bnRhaW5pbmcgNSBmaWVsZHM6Cj4+ICtTb3VuZFdpcmUgVmVyc2lvbiwgSW5zdGFuY2UgSUQsIE1h
bnVmYWN0dXJlciBJRCwgUGFydCBJRCBhbmQgQ2xhc3MgSUQKPj4gK2ZvciBhIGRldmljZS4gQWRk
aXRpb24gdG8gYmVsb3cgcmVxdWlyZWQgcHJvcGVydGllcywgY2hpbGQgbm9kZXMgY2FuCj4+ICto
YXZlIGRldmljZSBzcGVjaWZpYyBiaW5kaW5ncy4KPiAKPiBJbiBjYXNlIHRoZSBjb250cm9sbGVy
IHN1cHBvcnRzIG11bHRpcGxlIGxpbmtzLCB3aGF0J3MgdGhlIGVuY29kaW5nIHRoZW4/Cj4gaW4g
dGhlIE1JUEkgRGlzQ28gc3BlYyB0aGVyZSBpcyBhIGxpbmtJZCBmaWVsZCBpbiB0aGUgX0FEUiBl
bmNvZGluZyB0aGF0IAo+IGhlbHBzIGlkZW50aWZ5IHdoaWNoIGxpbmsgdGhlIFNsYXZlIGRldmlj
ZSBpcyBjb25uZWN0ZWQgdG8KPiAgPj4gKwo+PiArUmVxdWlyZWQgcHJvcGVydHkgZm9yIFNvdW5k
V2lyZSBjaGlsZCBub2RlIGlmIGl0IGlzIHByZXNlbnQ6Cj4+ICstIGNvbXBhdGlibGU6wqDCoMKg
wqAgInNkd1ZFUixNRkQsUElELENJRCIuIFRoZSB0ZXh0dWFsIHJlcHJlc2VudGF0aW9uIG9mCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgU291bmRXaXJlIEVudW1lcmF0aW9uIGFkZHJlc3MgY29tcHJp
c2luZyBTb3VuZFdpcmUKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBWZXJzaW9uLCBNYW51ZmFjdHVy
ZXIgSUQsIFBhcnQgSUQgYW5kIENsYXNzIElELAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHNoYWxs
IGJlIGluIGxvd2VyLWNhc2UgaGV4YWRlY2ltYWwgd2l0aCBsZWFkaW5nCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqAgemVyb2VzIHN1cHByZXNzZWQuCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgVmVyc2lv
biBudW1iZXIgJzB4MTAnIHJlcHJlc2VudHMgU291bmRXaXJlIDEuMAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIFZlcnNpb24gbnVtYmVyICcweDExJyByZXByZXNlbnRzIFNvdW5kV2lyZSAxLjEKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCBleDogInNkdzEwLDAyMTcsMjAxMCwwIgo+PiArCj4+ICstIHNk
dy1pbnN0YW5jZS1pZDogU2hvdWxkIGJlICgnSW5zdGFuY2UgSUQnKSBmcm9tIFNvdW5kV2lyZQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgIEVudW1lcmF0aW9uIEFkZHJlc3MuIEluc3RhbmNlIElEIGlz
IGZvciB0aGUgY2FzZXMKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCB3aGVyZSBtdWx0aXBsZSBEZXZp
Y2VzIG9mIHRoZSBzYW1lIHR5cGUgb3IgQ2xhc3MKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBhcmUg
YXR0YWNoZWQgdG8gdGhlIGJ1cy4KPiAKPiBzbyBpdCBpcyBhY3R1YWxseSByZXF1aXJlZCBpZiB5
b3UgaGF2ZSBhIHNpbmdsZSBTbGF2ZSBkZXZpY2U/IE9yIGlzIGl0IAo+IG9ubHkgcmVxdWlyZWQg
d2hlbiB5b3UgaGF2ZSBtb3JlIHRoYW4gMSBkZXZpY2Ugb2YgdGhlIHNhbWUgdHlwZT8KPiAKClRo
aXMgaXMgbWFuZGF0b3J5IGZvciBhbnkgc2xhdmUgZGV2aWNlIQoKPiBGV0lXIGluIHRoZSBNSVBJ
IERpc0NvIHNwZWMgd2Uga2VwdCB0aGUgaW5zdGFuY2VJRCBhcyBwYXJ0IG9mIHRoZSBfQURSLCAK
PiBzbyBpdCdzIGltcGxpY2l0bHkgbWFuZGF0b3J5IChhbmQgaWdub3JlZCBieSB0aGUgYnVzIGlm
IHRoZXJlIGlzIG9ubHkgCj4gb25lIGRldmljZSBvZiB0aGUgc2FtZSB0aW1lKQo+IAo+PiArCj4+
ICtTb3VuZFdpcmUgZXhhbXBsZSBmb3IgUXVhbGNvbW0ncyBTb3VuZFdpcmUgY29udHJvbGxlcjoK
Pj4gKwo+PiArc291bmR3aXJlQGMyZDAwMDAgewo+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAicWNv
bSxzb3VuZHdpcmUtdjEuNS4wIgo+PiArwqDCoMKgIHJlZyA9IDwweDBjMmQwMDAwIDB4MjAwMD47
Cj4+ICsKPj4gK8KgwqDCoCBzcGtyX2xlZnQ6d3NhODgxMC1sZWZ0ewo+PiArwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzZHcxMCwwMjE3LDIwMTAsMCI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBz
ZHctaW5zdGFuY2UtaWQgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoCAuLi4KPj4gK8KgwqDCoCB9
Owo+PiArCj4+ICvCoMKgwqAgc3Brcl9yaWdodDp3c2E4ODEwLXJpZ2h0ewo+PiArwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJzZHcxMCwwMjE3LDIwMTAsMCI7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBzZHctaW5zdGFuY2UtaWQgPSA8Mj47Cj4gCj4gSXNuJ3QgdGhlIE1JUEkgZW5jb2RpbmcgcmVw
b3J0ZWQgaW4gdGhlIERldl9JRDAuLjUgcmVnaXN0ZXJzIDAtYmFzZWQ/Cj4gCj4+ICvCoMKgwqDC
oMKgwqDCoCAuLi4KPj4gK8KgwqDCoCB9Owo+PiArfTsKPj4KPiAKPiBBbmQgbm93IHRoYXQgSSB0
aGluayBvZiBpdCwgd291bGRuJ3QgaXQgYmUgc2ltcGxlciBmb3IgZXZlcnlvbmUgaWYgd2UgCj4g
YWxpZ25lZCBvbiB0aGF0IE1JUEkgRGlzQ28gcHVibGljIHNwZWM/IGUuZy4geW91J2QgaGF2ZSBv
bmUgcHJvcGVydHkgCj4gd2l0aCBhIDY0LWJpdCBudW1iZXIgdGhhdCBmb2xsb3dzIHRoZSBNSVBJ
IHNwZWMuIE5vIHNwZWNpYWwgZW5jb2RpbmcgCj4gbmVjZXNzYXJ5IGZvciBkZXZpY2UgdHJlZSBj
YXNlcywgeW91ciBEVCBibG9iIHdvdWxkIHVzZSB0aGlzOgoKVGhhbmtzIGZvciB0aGUgc3VnZ2Vz
dGlvbiwgYWRkaW5nIDY0IGRldmljZSBiaXRzIGFzIGNvbXBhdGlibGUgc3RyaW5nIApzaG91bGQg
dGFrZSBjYXJlIG9mIGxpbmtJRCB0b28uIEkgd2lsbCBnaXZlIHRoYXQgYSBnbyEKCj4gCj4gc291
bmR3aXJlQGMyZDAwMDAgewo+ICDCoMKgwqDCoGNvbXBhdGlibGUgPSAicWNvbSxzb3VuZHdpcmUt
djEuNS4wIgo+ICDCoMKgwqDCoHJlZyA9IDwweDBjMmQwMDAwIDB4MjAwMD47Cj4gCj4gIMKgwqDC
oMKgc3Brcl9sZWZ0OndzYTg4MTAtbGVmdHsKPiAgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJzZHcwMCAwMCAxMCAwMiAxNyAyMCAxMCAwMCIKPiAgwqDCoMKgwqB9Cj4gCj4gIMKgwqDCoMKg
c3Brcl9yaWdodDp3c2E4ODEwLXJpZ2h0ewo+ICDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InNkdzAwMDAxMDAyMTcyMDExMDAiCj4gIMKgwqDCoMKgfQo+IH0KPiAKPiBXZSBjb3VsZCB1c2Ug
cGFyZW50aGVzZXMgaWYgaXQgbWFrZXMgcGVvcGxlIGhhcHBpZXIsIGJ1dCB0aGUgaW5mb3JtYXRp
b24gCj4gZnJvbSB0aGUgTUlQSSBEaXNDbyBzcGVjIGNhbiBiZSB1c2VkIGFzIGlzLCBhbmQgcHJv
dmlkZSBhIG1lYW5zIGZvciBzcGVjIAo+IGNoYW5nZXMgdmlhIHJlc2VydmVkIGJpdHMuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
