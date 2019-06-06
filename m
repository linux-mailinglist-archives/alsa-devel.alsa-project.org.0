Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CE3774D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 17:00:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947B3950;
	Thu,  6 Jun 2019 16:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947B3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559833225;
	bh=oLhN2pzvTK7yVaoknp4Dos23P0GCV1Z5hGo3LQwD/UE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SclxYSM/nkBb5FSfcruYXHv1nP3kHqOkUSxx1uVpa5RhN8GqT9IqWQ5eR1gHlr2a/
	 Uj4gsCh9woyPDgLt3/z1QxbvEwomUxT9EfxPAMGsfgT9CMu4ef6/ZpbqPxGJ8QuJqv
	 zTyY2HXLW4Y7GOqhQvhATfwZzA5gcT8Pc8uihah0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3D0F896F8;
	Thu,  6 Jun 2019 16:58:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7915FF896F7; Thu,  6 Jun 2019 16:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB826F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 16:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB826F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZCo7O2C8"
Received: by mail-wr1-x443.google.com with SMTP id p11so2770834wre.7
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QujUueqFUx2/VSrL+HZmRN292Qq0Dhoh8CSUM41nf2A=;
 b=ZCo7O2C8yP4nwdUG6GBa7j3UmhQfPthiEWab3oypsGCItJN5tuZZ11EJ9UiZiiFdnG
 x96ys34BGhcW3sNOsQ+lWZMOb12EMkuf3pSGBDJYQbwmNyfKoGfI80RFTli7u2DGBg/9
 XJ80NBhRd+O0no3dkGRaqslAStOx+NFMDbunqpAnSqal3hJj2KsoYOlp91q6PmT2NqvE
 3/JXvNTUENLYhCoaZasLzE6P99EByMOe86MhrtudILbtxuWaXYU0By8UwXKHDuZaXg3X
 HXny8/I/wPSsTthKpSupdSaz4scGB6yuXsSsiAeQepzVx1uf+XTkuUlOcYAqE1NOimjJ
 BXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QujUueqFUx2/VSrL+HZmRN292Qq0Dhoh8CSUM41nf2A=;
 b=Va1rd/7BbSgGmUqT/WcIHezyfQ2P8PsVBGtKUNmlfotTaZPFAfXZQjsg91Y5X2IY3I
 JLELXqbprwriSvaVo7NWkqLFKZE5kIr6DBvXd1c3PbBDKTQLCgALgOgoD3RrIH6VbZll
 PPvkQjMq3G9RVB89drpsQDnwV8cyGKE0UKjDiCdM0CKccCD5TVZqxfVh1UbsNq74LQ6d
 7fqVFZmDFMj93YlYC/BRMnYho+kutWKekADfgn6n4Xnh14qVpD3Ii7P5HAlU7cipOYSC
 M9ya0S67F1PZ8F0qz8j1SrGU5uWJQi9jbN6pD5wMot8xm2R57vgaOWiEVwix1Uu/FGVM
 ou/A==
X-Gm-Message-State: APjAAAXV7zKlmYUbw6nMzZxyEA268aYQDXjRi9kV7l4X3rqXoFrRUyXs
 kcFWJ3FmcSUE1XcIW7KY4cUlyw==
X-Google-Smtp-Source: APXvYqzZxEOJPWQeIL+UsyHAq9cz1Yc6pAWJ9MgF/JfNneHwBH0kgD+JhRh8xYlf8ptsNnwIVBVw6Q==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr30386901wrv.322.1559833114696; 
 Thu, 06 Jun 2019 07:58:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z17sm1983993wru.21.2019.06.06.07.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 07:58:34 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
 <9427a73a-e09a-4a9c-7690-271d2e2e1024@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f13c82d2-94a4-9517-bcf6-95aa40c6a42f@linaro.org>
Date: Thu, 6 Jun 2019 15:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9427a73a-e09a-4a9c-7690-271d2e2e1024@linux.intel.com>
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] soundwire: stream: fix bad unlock
	balance
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

CgpPbiAwNi8wNi8yMDE5IDE1OjI4LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBPbiA2
LzYvMTkgNjoyMiBBTSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPj4gbXVsdGkgYmFuayBz
d2l0Y2hpbmcgY29kZSB0YWtlcyBsb2NrIG9uIGNvbmRpdGlvbiBidXQgcmVsZWFzZXMgd2l0aG91
dAo+PiBhbnkgY2hlY2sgcmVzdWx0aW5nIGluIGJlbG93IHdhcm5pbmcuCj4+IFRoaXMgcGF0Y2gg
Zml4ZXMgdGhpcy4KPiAKPiAKPiBRdWVzdGlvbiB0byBtYWtlIHN1cmUgd2UgYXJlIHRhbGtpbmcg
YWJvdXQgdGhlIHNhbWUgdGhpbmc6IG11bHRpLWxpbmsgCj4gYmFuayBzd2l0Y2hpbmcgaXMgYSBj
YXBhYmlsaXR5IGJleW9uZCB0aGUgc2NvcGUgb2YgdGhlIFNvdW5kV2lyZSBzcGVjIAo+IHdoaWNo
IHJlcXVpcmVzIGhhcmR3YXJlIHN1cHBvcnQgdG8gc3luY2hyb25pemUgbGlua3MgYW5kIGFzIFNh
bnlvZyAKPiBoaW50ZWQgYXQgaW4gYSBwcmV2aW91cyBlbWFpbCBmb2xsb3cgYSBkaWZmZXJlbnQg
ZmxvdyBmb3IgYmFuayBzd2l0Y2hlcy4KPiAKPiBZb3Ugd291bGQgbm90IHVzZSB0aGUgbXVsdGkt
bGluayBtb2RlIGlmIHlvdSBoYXZlIGRpZmZlcmVudCBsaW5rcyB0aGF0IAo+IGNhbiBvcGVyYXRl
IGluZGVwZW5kZW50bHkgYW5kIGhhdmUgbm8gc3luY2hyb25pemF0aW9uIHJlcXVpcmVtZW50LiBZ
b3UgCj4gd291bGQgY29udmVyc2VseSB1c2UgdGhlIG11bHRpLWxpbmsgbW9kZSBpZiB5b3UgaGF2
ZSB0d28gZGV2aWNlcyBvbiB0aGUgCj4gc2FtZSB0eXBlIG9uIGRpZmZlcmVudCBsaW5rcyBhbmQg
d2FudCBhdWRpbyB0byBiZSByZW5kZXJlZCBhdCB0aGUgc2FtZSAKPiB0aW1lLgo+IAo+IENhbiB5
b3UgY2xhcmlmeSBpZiBpbmRlZWQgeW91IHdlcmUgdXNpbmcgdGhlIGZ1bGwtYmxvd24gbXVsdGkt
bGluayBtb2RlIAo+IHdpdGggaGFyZHdhcmUgc3luY2hyb25pemF0aW9uIG9yIGEgcmVndWxhciBz
aW5nbGUtbGluayBvcGVyYXRpb24/IEkgYW0gCj4gbm90IGFza2luZyBmb3IgZGV0YWlscyBvZiB5
b3VyIHRlc3QgaGFyZHdhcmUsIGp1c3QgdHJ5aW5nIHRvIHJlY29uc3RydWN0IAo+IHRoZSBwcm9n
cmFtIGZsb3cgbGVhZGluZyB0byB0aGlzIHByb2JsZW0uCj4gCgpBbSB0ZXN0aW5nIG9uIGEgcmVn
dWxhciBzaW5nbGUgbGluaywgd2hpY2ggaGl0cyB0aGlzIHBhdGguCgo+IEl0IGNvdWxkIGFsc28g
YmUgdGhhdCB5b3VyIGNvbW1pdCBtZXNzYWdlIHdhcyBtZWFudCB0byBzYXk6Cj4gInRoZSBtc2cg
bG9jayBpcyB0YWtlbiBmb3IgbXVsdGktbGluayBjYXNlcyBvbmx5IGJ1dCByZWxlYXNlZCAKPiB1
bmNvbmRpdGlvbmFsbHksIGxlYWRpbmcgdG8gYW4gdW5sb2NrIGJhbGFuY2Ugd2FybmluZyBmb3Ig
c2luZ2xlLWxpbmsgCj4gdXNhZ2VzIj8KWWVzLgpWaW5vZCBjYW4gdXBkYXRlIGNvbW1lbnQgd2hp
bGUgYXBwbHlpbmcgdGhpcyBwYXRjaD8KSWYgbm90IEkgY2FuIHJlc3BpbiB3aXRoIGNvcnJlY3Qg
bG9nLgoKdGhhbmtzLApzcmluaQoKPiAKPiBUaGFua3MhCj4gCj4+Cj4+IMKgID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gwqAgV0FSTklORzogYmFkIHVubG9jayBiYWxh
bmNlIGRldGVjdGVkIQo+PiDCoCA1LjEuMC0xNjUwNi1nYzFjMzgzYTZmMGEyLWRpcnR5ICMxNTIz
IFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoCBXCj4+IMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4gwqAgYXBsYXkvMjk1NCBpcyB0cnlpbmcgdG8gcmVsZWFzZSBsb2Nr
ICgmYnVzLT5tc2dfbG9jaykgYXQ6Cj4+IMKgIGRvX2Jhbmtfc3dpdGNoKzB4MjFjLzB4NDgwCj4+
IMKgIGJ1dCB0aGVyZSBhcmUgbm8gbW9yZSBsb2NrcyB0byByZWxlYXNlIQo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5v
cmc+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYyB8IDMgKystCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5jIGIvZHJpdmVycy9zb3VuZHdpcmUv
c3RyZWFtLmMKPj4gaW5kZXggY2U5Y2I3ZmE0NzI0Li43M2M1MmNkNGZlYzggMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5jCj4+ICsrKyBiL2RyaXZlcnMvc291bmR3aXJl
L3N0cmVhbS5jCj4+IEBAIC04MTQsNyArODE0LDggQEAgc3RhdGljIGludCBkb19iYW5rX3N3aXRj
aChzdHJ1Y3QgCj4+IHNkd19zdHJlYW1fcnVudGltZSAqc3RyZWFtKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAtwqDC
oMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZidXMtPm1zZ19sb2NrKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIGlmIChidXMtPm11bHRpX2xpbmspCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4
X3VubG9jaygmYnVzLT5tc2dfbG9jayk7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7Cj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
