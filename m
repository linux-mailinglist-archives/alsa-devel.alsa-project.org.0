Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF28C029
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 20:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A99B1675;
	Tue, 13 Aug 2019 20:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A99B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565719718;
	bh=ePX20USftA5mf+h2OOKxnDIhw1fRzFwPI4EcJEMBJXg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0729a9Bfmc6FY3fK+9b55ih3Ixv7CBZcXx0wRkDSs8Ofb069tXq+eQAMxbPrHnSL
	 ek5fo1TGDxMyp0UMMC8OfxtpJPbfjD3xSZCyqZtKSoccW50gqxxX7sXihqDbUqWLas
	 /JdbY4gVlYI/VJYnvu5B4Lrr+dH8GdsAp5xiz03I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F786F8026A;
	Tue, 13 Aug 2019 20:06:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4AC2F80273; Tue, 13 Aug 2019 20:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01BA7F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 20:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01BA7F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="crKc/7fw"
Received: by mail-wr1-x444.google.com with SMTP id j16so6344885wrr.8
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 11:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dbz/igoDoo4+zLxs3kF9+hv9Esg794AftEWjrVInnJg=;
 b=crKc/7fwPh5m+g0e/i39wYeK5QmB4xu5OeW7rfKDO+Bq/9qNZgYMaLTqHvSawI94wE
 jBqROdM2P1VWbYHmQKvFY+DFOlrTE91xcSAH0k6BpHu9v0sYwByfulGgpq8db8lxbinI
 hGM44abSoBlDNcRhNKS2vt0xv357FOof9cDZm6viVbbfVB7Wrj6cwWbzGtLCZFjuCxHo
 FlLxfxc5ixtJTkgDG7Y8zml7gbd4SdtWcvmOhYONMNUCdYiBfb3pF6iLmxCgqrUFw4KX
 0xq3fDXUiqHCQgC4AZN+jPCSv9PPjRsd9RBJI+J6g7U/baizMlf5WEpO1Udmplxj1Zxa
 +2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbz/igoDoo4+zLxs3kF9+hv9Esg794AftEWjrVInnJg=;
 b=Bk2aPLsIrjWy1GFvcQ+AzTkIgXINejdE/RzBW2NC930S0NHQl1bYbqBstpfsKTMSX1
 71hiRVYSu8oGH4GzGqdHS0Vd3RG1LEbf1eOVrvG3jNIuYJC6OWcsqJgptkG9L2Yxr7rn
 tjxnLirqgzwmwim5NIQ26SY4OEopSoIs2chCMu47MHRDZc8pY63zZR/U5hv+9bbYg3+K
 6RvU2v5s/rYOMlMhedyNzQZacAasasNzk4L/LEpcO/oxcvfUVqHmfZ5Esf0pUvlKYpuN
 KT0dYV8SIJKkFzpwoNYdmSElqFnbR4G+NlF6xAJwF2pB2SVrBsXNVO2XS7hOzBcdLAJZ
 Z2OQ==
X-Gm-Message-State: APjAAAVwUN1Zj1Vpp5m0q2k9wqjOXmOpofhXB1/cFdWzOzGEhwfERz1b
 gPTOqVirXKsgbYNDQ7Tk3aRu6A==
X-Google-Smtp-Source: APXvYqzgl6xdkykBM+mhjTBQLfQ5t1yXWfJm/Upuv3NFiGY2+Yb08ANGQdW5WEwn7wKhRxX0zMlI5Q==
X-Received: by 2002:a05:6000:152:: with SMTP id
 r18mr39426525wrx.41.1565719606987; 
 Tue, 13 Aug 2019 11:06:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u186sm3990440wmu.26.2019.08.13.11.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 11:06:46 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
Date: Tue, 13 Aug 2019 19:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
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

CgpPbiAxMy8wOC8yMDE5IDE4OjUxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBPbiA4
LzEzLzE5IDExOjUwIEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+PiBUaGFua3MgZm9y
IHRoZSByZXZpZXcsCj4+Cj4+IE9uIDEzLzA4LzIwMTkgMTU6NDQsIFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IHdyb3RlOgo+Pj4gT24gOC8xMy8xOSAzOjM1IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdy
b3RlOgo+Pj4+IE9uIHBsYXRmb3JtcyB3aGljaCBoYXZlIHNtYXJ0IHNwZWFrZXIgYW1wbGlmaWVy
cyBjb25uZWN0ZWQgdmlhCj4+Pj4gc291bmR3aXJlIGFuZCBtb2RlbGVkIGFzIGF1eCBkZXZpY2Vz
IGluIEFTb0MsIGluIHN1Y2ggdXNlY2FzZXMgbWFjaGluZQo+Pj4+IGRyaXZlciBzaG91bGQgYmUg
YWJsZSB0byBnZXQgc2R3IG1hc3RlciBzdHJlYW0gZnJvbSBkYWkgc28gdGhhdCBpdCBjYW4KPj4+
PiB1c2UgdGhlIHJ1bnRpbWUgc3RyZWFtIHRvIHNldHVwIHNsYXZlIHN0cmVhbXMuCj4+Pgo+Pj4g
dXNpbmcgdGhlIF9zZXRfc2R3X3N0cmVhbT8gSSBkb24ndCBmdWxseSBnZXQgdGhlIHNlcXVlbmNl
IHdpdGggdGhlIAo+Pj4gd29yZGluZyBhYm92ZS4KPj4KPj4gWWVzLCB1c2luZyBzZXRfc2R3X3N0
cmVhbSgpLgo+IAo+IE1heWJlIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgaGVyZSwgYnV0IEkgZG9u
J3Qgc2VlIHdoZXJlIHRoZSAKPiBzZXRfc2R3X3N0cmVhbSgpIGlzIGNhbGxlZC4KCnNvcnJ5IGZv
ciB0aGUgY29uZnVzaW9uLiBJdCB3YXMgdG9vIHF1aWNrIHJlcGx5LiA6LSkKSSB3YXMgc3VwcG9z
ZSB0byBzYXkgc2R3X3N0cmVhbV9hZGRfc2xhdmUoKSBpbnN0ZWFkIG9mIHNldF9zZHdfc3RyZWFt
KCkuCgpBcyBBdXggZGV2aWNlIGlzIGRhaWxlc3MgdGhlcmUgaXMgbm8gd2F5IHRvIGdldCBob2xk
IG9mIHNkdyBzdHJlYW0gCnJ1bnRpbWUgZm9yIHNsYXZlIGRldmljZSBhc3NvY2lhdGVkIHdpdGgg
aXQuCgpIYXZpbmcgc25kX3NvY19kYWlfZ2V0X3Nkd19zdHJlYW0oKSB3b3VsZCBoZWxwIG1hY2hp
bmUgZHJpdmVyIHRvIGdldCAKaG9sZCBvZiBzZHdfc3RyZWFtX3J1bnRpbWUgZnJvbSBjb250cm9s
bGVyIGRhaSBhbmQgc2V0dXAgc2xhdmUgc3RyZWFtcyAKdXNpbmcgc2R3X3N0cmVhbV9hZGRfc2xh
dmUoKS4KCgp0aGFua3MsCnNyaW5pCgoKPiAKPiBBbHNvIEkgZG9uJ3QgZnVsbHkgZ2V0IHRoZSBy
dWxlLiBzZXRfc2R3X3N0cmVhbSgpIGxvb2tzIHJlcXVpcmVkLCAKPiBnZXRfc2R3X3N0cmVhbSgp
IGlzIG9wdGlvbmFsLCBpcyB0aGlzIHdoYXQgeW91IGFyZSBzdWdnZXN0aW5nPwo+IAo+Pj4KPj4+
Pgo+Pj4+IHNvdW5kd2lyZSBhbHJlYWR5IGFzIGEgc2V0IGZ1bmN0aW9uLCBnZXQgZnVuY3Rpb24g
d291bGQgcHJvdmlkZSBtb3JlCj4+Pj4gZmxleGliaWxpdHkgdG8gYWJvdmUgY29uZmlndXJhdGlv
bnMuCj4+Pgo+Pj4gSSBhbSBub3QgY2xlYXIgaWYgeW91IGFyZSBhc2tpbmcgZm9yIGJvdGggdG8g
YmUgdXNlZCwgb3IgZ2V0IG9ubHkgb3IgCj4+PiBzZXQgb25seT8KPj4KPj4gSXQgZGVwZW5kcyBv
biB0aGUgdXNlY2FzZSwgaW4gZGI4NDVjIHVzZWNhc2XCoCBbMV0gYXMgQXV4IGRldmljZSBpcyBk
YWkgCj4+IGxlc3MsIG1hY2hpbmUgZHJpdmVyIGlzIHVzaW5nIGdldCBmdW5jdGlvbiB0byBnZXQg
aG9sZCBvZiBtYXN0ZXIgCj4+IHN0cmVhbSBzbyB0aGF0IGl0IGNhbiBzZXR1cCBzbGF2ZSBwb3J0
IGNvbmZpZy4KPj4KPj4KPj4gTG9va3MgbGlrZSB0aGVyZSBpcyBhIHR5cG8gaW4gYWJvdmUgbGlr
ZQo+Pgo+PiBUaGlzIHdhcyBzdXBwb3NlZCB0byBiZSAic291bmR3aXJlIGFscmVhZHkgaGFzIGEg
c2V0IGZ1bmN0aW9uLCBnZXQgCj4+IGZ1bmN0aW9uIHdvdWxkIHByb3ZpZGUgbW9yZSBmbGV4aWJp
bGl0eSB0byBhYm92ZSBjb25maWd1cmF0aW9ucyIKPj4KPj4gWzFdIAo+PiBodHRwczovL2dpdC5s
aW5hcm8ub3JnL2xhbmRpbmctdGVhbXMvd29ya2luZy9xdWFsY29tbS9rZXJuZWwuZ2l0L3RyZWUv
c291bmQvc29jL3Fjb20vZGI4NDVjLmM/aD1pbnRlZ3JhdGlvbi1saW51eC1xY29tbHQgCj4+Cj4+
Cj4+IHRoYW5rcywKPj4gc3JpbmkKPj4KPj4+Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTcmlu
aXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4+Pj4gLS0t
Cj4+Pj4gwqAgaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmggfCAxMCArKysrKysrKysrCj4+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NvdW5kL3NvYy1kYWkuaCBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCj4+Pj4gaW5k
ZXggZGM0OGZlMDgxYTIwLi4xZTAxZjRhMzAyZTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9z
b3VuZC9zb2MtZGFpLmgKPj4+PiArKysgYi9pbmNsdWRlL3NvdW5kL3NvYy1kYWkuaAo+Pj4+IEBA
IC0yMDIsNiArMjAyLDcgQEAgc3RydWN0IHNuZF9zb2NfZGFpX29wcyB7Cj4+Pj4gwqDCoMKgwqDC
oCBpbnQgKCpzZXRfc2R3X3N0cmVhbSkoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqc3RyZWFtLCBpbnQgZGlyZWN0aW9uKTsKPj4+
PiArwqDCoMKgIHZvaWQgKigqZ2V0X3Nkd19zdHJlYW0pKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFp
LCBpbnQgZGlyZWN0aW9uKTsKPj4+PiDCoMKgwqDCoMKgIC8qCj4+Pj4gwqDCoMKgwqDCoMKgICog
REFJIGRpZ2l0YWwgbXV0ZSAtIG9wdGlvbmFsLgo+Pj4+IMKgwqDCoMKgwqDCoCAqIENhbGxlZCBi
eSBzb2MtY29yZSB0byBtaW5pbWlzZSBhbnkgcG9wcy4KPj4+PiBAQCAtNDEwLDQgKzQxMSwxMyBA
QCBzdGF0aWMgaW5saW5lIGludCAKPj4+PiBzbmRfc29jX2RhaV9zZXRfc2R3X3N0cmVhbShzdHJ1
Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9U
U1VQUDsKPj4+PiDCoCB9Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc25kX3NvY19kYWlfZ2V0
X3Nkd19zdHJlYW0oc3RydWN0IHNuZF9zb2NfZGFpIAo+Pj4+ICpkYWksCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGRpcmVjdGlv
bikKPj4+PiArewo+Pj4+ICvCoMKgwqAgaWYgKGRhaS0+ZHJpdmVyLT5vcHMtPmdldF9zZHdfc3Ry
ZWFtKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGFpLT5kcml2ZXItPm9wcy0+Z2V0X3Nk
d19zdHJlYW0oZGFpLCBkaXJlY3Rpb24pOwo+Pj4+ICvCoMKgwqAgZWxzZQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRU5PVFNVUFApOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+IMKg
ICNlbmRpZgo+Pj4+Cj4+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+PiBBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKPj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
