Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4035AAA5A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 19:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355D4166E;
	Thu,  5 Sep 2019 19:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355D4166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567705702;
	bh=Kld2wWtci8MZAlRuYH+KRJsbGt7K3OVVp7YQZ7XIORo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyV74HV3MHS5FLolv9Z2fiTbe2OYP2WozGjL6fuAoutM7jF0hc/ZD6IeH+OsIZpni
	 ebychqIaCeAKBO/kiDCVrg6BIpNo8QyEDJF/3cxgdPFRpHx8slTx9bBbt0EvquiBbs
	 rH161nKzYFfPbKOPAG9/bBAzmAmiknUHtqTFgw5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB29F80529;
	Thu,  5 Sep 2019 19:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBDC3F803A6; Wed,  4 Sep 2019 09:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_72,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E718F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 09:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E718F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pE0XfTRd"
Received: by mail-pl1-x641.google.com with SMTP id y10so3234876pll.7
 for <alsa-devel@alsa-project.org>; Wed, 04 Sep 2019 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=1HJ3qCdCUyf823DWeTAysaV+raU3RzZxD/8XtxmFomw=;
 b=pE0XfTRddAZgRQTIb9j8RuIotUuppcWbnNdFxkFTv5jPcEj6Vqqs12/+HRF97yKCHb
 BpUaESNqqu6IYl8qO+mgmQsA/NILTt9Fw+59Gk4R2gTRDyl+0cxzGkZPF2HUhtG/A7Sc
 fs4IfMrCOAK4+BVkSoIyum29mzGOhsKnAX7p6OoslVWTgl7XtjfIw67RK0H1odf5HYrH
 V5kg0BM6S06nN9jlnWteetulKZIxBhLE6LiGgzfZh3Q1v46lhfXJtSdRvvpqEVgPTv3I
 iXPtl/aT3a5NKGvuM6/nHKyAkCHAqFx15E3dfSP1o49JrInqOzAKdhkVzS5Uy3XgPsVP
 /+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=1HJ3qCdCUyf823DWeTAysaV+raU3RzZxD/8XtxmFomw=;
 b=DyO/qz1MvcGrvRkh22B3troK40IbIbVX3+5eIN8Yk7LSA1GgVQmM8w0/Gk8SWUEgXG
 YehieVK0aDe3sL/HMKfPaPBkCNaGzK6JwYHJ1hk8pCcTUGV4FZTw5Du4gUf625rMbLG6
 y6L+Irvv6dM53TZ9zS5lXHZ13Jgd1GwAXB0t/PT5QNEiah5WDM+VN5poL+LO5ROr01xu
 sxKMR4GZwQXA4AazHV9exAem4k6Y1cMPciAZXRJ9+ZxknHuicI+X9YYc0Gd04hDZ51px
 IIwK6fckyC7m2/8rFua0FS/nxShF4OU4gSCXL5GqaKFH788SRmLMTMufDNzYGrcxWaWF
 Mgwg==
X-Gm-Message-State: APjAAAWWiDbVFqzDm/um98d3j7pLZyEOpVbn1/suVzrZBSafFvJCQr82
 aXRJiIxwAcN9lCV46Y2QxDc=
X-Google-Smtp-Source: APXvYqzXH6nry3NKOfLO1wE/wnrGhxqTPLl9DGnqm+bzfmm5LdxAt1ikeLcmPfXhDHk/6EvE/CuvBA==
X-Received: by 2002:a17:902:33c1:: with SMTP id
 b59mr39662050plc.104.1567580830113; 
 Wed, 04 Sep 2019 00:07:10 -0700 (PDT)
Received: from [192.168.43.124] ([101.12.227.136])
 by smtp.gmail.com with ESMTPSA id d10sm4626883pfh.8.2019.09.04.00.07.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 00:07:09 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20190903163829.GB7916@sirena.co.uk>
From: Richtek Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
Date: Wed, 4 Sep 2019 15:07:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903163829.GB7916@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 05 Sep 2019 19:43:12 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] [MT6660] Mediatek Smart Amplifier Driver
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

RGVhciBNYXJrOgoKIMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgogwqDCoMKgIEkgaGF2
ZSBzb21lIHF1ZXN0aW9ucyBmb3IgeW91ciBjb21tZW50LiBQbGVhc2UgY2hlY2sgdGhlIHJlZCBj
b21tZW50LgoKCgpNYXJrIEJyb3duIOaWvCAyMDE5LzkvNCDkuIrljYgxMjozOCDlr6vpgZM6Cj4g
T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDM6MDg6MjFQTSArMDgwMCwgcmljaHRlay5qZWZmLmNo
YW5nQGdtYWlsLmNvbSB3cm90ZToKPgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3NvdW5kL3Nv
Yy9jb2RlY3MvbXQ2NjYwLmMKPj4gQEAgLTAsMCArMSw4MDIgQEAKPj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDE5IE1l
ZGlhVGVrIEluYy4KPj4gKyAqLwo+IFBsZWFzZSBtYWtlIHRoZSBlbnRpcmUgY29tbWVudCBibG9j
ayBhIEMrKyBjb21tZW50IHNvIHRoaW5ncyBsb29rIG1vcmUKPiBjb25zaXN0ZW50Lgo+Cj4+ICtz
dHJ1Y3QgcmVnX3NpemVfdGFibGUgewo+PiArCXUzMiBhZGRyOwo+PiArCXU4IHNpemU7Cj4+ICt9
Owo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdfc2l6ZV90YWJsZSBtdDY2NjBfcmVnX3NpemVf
dGFibGVbXSA9IHsKPj4gKwl7IE1UNjY2MF9SRUdfSFBGMV9DT0VGLCA0IH0sCj4+ICsJeyBNVDY2
NjBfUkVHX0hQRjJfQ09FRiwgNCB9LAo+PiArCXsgTVQ2NjYwX1JFR19URE1fQ0ZHMywgMiB9LAo+
PiArCXsgTVQ2NjYwX1JFR19SRVNWMTcsIDIgfSwKPj4gKwl7IE1UNjY2MF9SRUdfUkVTVjIzLCAy
IH0sCj4+ICsJeyBNVDY2NjBfUkVHX1NJR01BWCwgMiB9LAo+PiArCXsgTVQ2NjYwX1JFR19ERVZJ
RCwgMn0sCj4+ICsJeyBNVDY2NjBfUkVHX1RETV9DRkczLCAyfSwKPj4gKwl7IE1UNjY2MF9SRUdf
SENMSVBfQ1RSTCwgMn0sCj4+ICsJeyBNVDY2NjBfUkVHX0RBX0dBSU4sIDJ9LAo+PiArfTsKPiBQ
bGVhc2UgdGFsayB0byB5b3VyIGhhcmR3YXJlIGRlc2lnbmVycyBhYm91dCB0aGUgYmVuZWZpdHMg
b2YgY29uc2lzdGVudAo+IHJlZ2lzdGVyIHNpemVzIDovCgpBY3R1YWxseSB0aGlzIGlzIG91ciBo
YXJkd2FyZSBEZXNpZ24gZm9yIE1UNjY2MC4gV2UgY2Fubm90IG1vZGlmeSAKaGFyZHdhcmUgdGhp
cyB0aW1lLgoKIMKgwqAgV2Ugd2lsbCBkZXNpZ24gd2VsbCBpbiBuZXh0IGNoaXAuCgo+Cj4+ICtz
dGF0aWMgaW50MzJfdCBtdDY2NjBfaTJjX3VwZGF0ZV9iaXRzKHN0cnVjdCBtdDY2NjBfY2hpcCAq
Y2hpcCwKPj4gKwl1aW50MzJfdCBhZGRyLCB1aW50MzJfdCBtYXNrLCB1aW50MzJfdCBkYXRhKQo+
PiArewo+IEl0IHdvdWxkIGJlIGdvb2QgdG8gaW1wbGVtZW50IGEgcmVnbWFwIHJhdGhlciB0aGFu
IG9wZW4gY29kaW5nCj4gKmV2ZXJ5dGhpbmcqIC0gaXQnZCBnaXZlIHlvdSB0aGluZ3MgbGlrZSB0
aGlzIHdpdGhvdXQgbmVlZGluZyB0byBvcGVuCj4gY29kZSB0aGVtLiAgUHJvdmlkaW5nIHlvdSBk
b24ndCB1c2UgdGhlIGNhY2hlIGNvZGUgaXQgc2hvdWxkIGNvcGUgZmluZQo+IHdpdGggdmFyaWFi
bGUgcmVnaXN0ZXIgc2l6ZXMuCgoKRHVlIHRvIG91ciBoYXJkd2FyZSBkZXNpZ24sIGl0IGlzIGhh
cmQgdG8gaW1wbGVtZW50IHJlZ21hcCBmb3IgTVQ2NjYwLgoKPgo+PiArCj4+ICtzdGF0aWMgaW50
IG10NjY2MF9pMmNfaW5pdF9zZXR0aW5nKHN0cnVjdCBtdDY2NjBfY2hpcCAqY2hpcCkKPj4gK3sK
Pj4gKwlpbnQgaSwgbGVuLCByZXQ7Cj4+ICsJY29uc3Qgc3RydWN0IGNvZGVjX3JlZ192YWwgKmlu
aXRfdGFibGU7Cj4+ICsKPj4gKwlpbml0X3RhYmxlID0gZTRfcmVnX2luaXRzOwo+PiArCWxlbiA9
IEFSUkFZX1NJWkUoZTRfcmVnX2luaXRzKTsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCBsZW47
IGkrKykgewo+PiArCQlyZXQgPSBtdDY2NjBfaTJjX3VwZGF0ZV9iaXRzKGNoaXAsIGluaXRfdGFi
bGVbaV0uYWRkciwKPj4gKwkJCQlpbml0X3RhYmxlW2ldLm1hc2ssIGluaXRfdGFibGVbaV0uZGF0
YSk7Cj4+ICsJCWlmIChyZXQgPCAwKQo+PiArCQkJcmV0dXJuIHJldDsKPiBXaHkgYXJlIHdlIG5v
dCB1c2luZyB0aGUgY2hpcCBkZWZhdWx0cyBoZXJlPwpCZWNhdXNlIE1UNjY2MCBuZWVkcyB0aGlz
IGluaXRpYWwgc2V0dGluZyBmb3Igd29ya2luZyB3ZWxsLgo+PiArc3RhdGljIGludCBtdDY2NjBf
Y2hpcF9wb3dlcl9vbigKPj4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwg
aW50IG9uX29mZikKPj4gK3sKPj4gKwlzdHJ1Y3QgbXQ2NjYwX2NoaXAgKmNoaXAgPSAoc3RydWN0
IG10NjY2MF9jaGlwICopCj4+ICsJCXNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBv
bmVudCk7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICsJdW5zaWduZWQgaW50IHZhbDsKPj4gKwo+PiAr
CWRldl9kYmcoY29tcG9uZW50LT5kZXYsICIlczogb25fb2ZmID0gJWRcbiIsIF9fZnVuY19fLCBv
bl9vZmYpOwo+PiArCW11dGV4X2xvY2soJmNoaXAtPnZhcl9sb2NrKTsKPj4gKwlpZiAob25fb2Zm
KSB7Cj4+ICsJCWlmIChjaGlwLT5wd3JfY250ID09IDApIHsKPj4gKwkJCXJldCA9IG10NjY2MF9p
MmNfdXBkYXRlX2JpdHMoY2hpcCwKPj4gKwkJCQlNVDY2NjBfUkVHX1NZU1RFTV9DVFJMLCAweDAx
LCAweDAwKTsKPj4gKwkJCXZhbCA9IG10NjY2MF9pMmNfcmVhZChjaGlwLCBNVDY2NjBfUkVHX0lS
UV9TVEFUVVMxKTsKPj4gKwkJCWRldl9pbmZvKGNoaXAtPmRldiwKPj4gKwkJCQkiJXMgcmVnMHgw
NSA9IDB4JXhcbiIsIF9fZnVuY19fLCB2YWwpOwo+PiArCQl9Cj4+ICsJCWNoaXAtPnB3cl9jbnQr
KzsKPiBUaGlzIGxvb2tzIGxpa2UgeW91J3JlIG9wZW4gY29kaW5nIHJ1bnRpbWUgUE0gc3R1ZmY/
ICBBRkFJQ1QgdGhlIGlzc3VlCj4gaXMgdGhhdCB5b3UgbmVlZCB0byB3cml0ZSB0byB0aGlzIHJl
Z2lzdGVyIHRvIGRvIGFueSBJL08uICBKdXN0Cj4gaW1wbGVtZW50IHRoaXMgdmlhIHRoZSBzdGFu
ZGFyZCBydW50aW1lIFBNIGZyYW1ld29yaywgeW91J2xsIG5lZWQgdG8gZG8KPiBzb21ldGhpbmcg
YWJvdXQgdGhlIHJlZ2lzdGVyIEkvTyBpbiB0aGUgY29udHJvbHMgKGlkZWFsbHkgaW4gdGhlCj4g
ZnJhbWV3b3JrLCBpdCdkIGJlIGEgbG90IGVhc2llciBpZiB5b3UgZGlkIGhhdmUgYSBjYWNoZSkg
YnV0IHlvdSBjb3VsZAo+IGN1dCBvdXQgdGhpcyBiaXQuCgoKSW4gb3VyIGV4cGVyaWVuY2UsIHNv
bWUgQ3VzdG9tZXIgcGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0IHJ1bnRpbWUgUE0uCgpEbyB5b3Ug
aGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCBhIGNvbXBhdGlibGUgZHJpdmVyIGZvciBzdXBwb3J0
IGFuZCBub3QgCnN1cHBvcnQgcnVudGltZSBQTSBwbGF0Zm9ybT8KCgo+PiArc3RhdGljIGludCBt
dDY2NjBfY29tcG9uZW50X3NldF9iaWFzX2xldmVsKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAq
Y29tcG9uZW50LAo+PiArCWVudW0gc25kX3NvY19iaWFzX2xldmVsIGxldmVsKQo+PiArewo+PiAr
CXN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSA9Cj4+ICsJCXNuZF9zb2NfY29tcG9u
ZW50X2dldF9kYXBtKGNvbXBvbmVudCk7Cj4+ICsJaW50IHJldDsKPj4gKwl1bnNpZ25lZCBpbnQg
dmFsOwo+PiArCXN0cnVjdCBtdDY2NjBfY2hpcCAqY2hpcCA9IHNuZF9zb2NfY29tcG9uZW50X2dl
dF9kcnZkYXRhKGNvbXBvbmVudCk7Cj4+ICsKPj4gKwlpZiAoZGFwbS0+Ymlhc19sZXZlbCA9PSBs
ZXZlbCkgewo+PiArCQlkZXZfd2Fybihjb21wb25lbnQtPmRldiwgIiVzOiByZXBlYXQgbGV2ZWwg
Y2hhbmdlXG4iLCBfX2Z1bmNfXyk7Cj4gVGhpcyBzaG91bGRuJ3QgYmUgYSB3YXJuaW5nLgoKCkkg
d2lsbCBtb2RpZnkgaXQgZm9yIGEgZXJyb3IgbWVzc2FnZS4KCj4KPj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX2tjb250cm9sX25ldyBtdDY2NjBfY29tcG9uZW50X3NuZF9jb250cm9sc1tdID0g
ewo+PiArCVNPQ19TSU5HTEVfRVhUX1RMVigiVm9sdW1lX0N0cmwiLCBNVDY2NjBfUkVHX1ZPTF9D
VFJMLCAwLCAyNTUsCj4+ICsJCQkgICAxLCBzbmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBv
bmVudF9wdXRfdm9sc3csCj4+ICsJCQkgICB2b2xfY3RsX3RsdiksCj4+ICsJU09DX1NJTkdMRV9F
WFQoIldEVF9FbmFibGUiLCBNVDY2NjBfUkVHX1dEVF9DVFJMLCA3LCAxLCAwLAo+PiArCQkgICAg
ICAgc25kX3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25lbnRfcHV0X3ZvbHN3KSwKPiBUaGVz
ZSBjb250cm9sIG5hbWVzIHNob3VsZCBhbGwgdXNlIHN0YW5kYXJkIEFMU0EgY29udHJvbCBuYW1l
cyAtIG9uL29mZgo+IHN3aXRjaGVzIHNob3VsZCBlbmQgaW4gU3dpdGNoLCB2b2x1bWUgY29udHJv
bHMgaW4gVm9sdW1lLgoKCkkgd2lsbCBtb2RpZnkgaXQuCgo+Cj4+ICsJU09DX1NJTkdMRV9FWFQo
IkkyU0xSUyIsIE1UNjY2MF9SRUdfREFUQU9fU0VMLCA2LCAzLCAwLAo+PiArCQkgICAgICAgc25k
X3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25lbnRfcHV0X3ZvbHN3KSwKPj4gKwlTT0NfU0lO
R0xFX0VYVCgiSTJTRE9MUyIsIE1UNjY2MF9SRUdfREFUQU9fU0VMLCAzLCA3LCAwLAo+PiArCQkg
ICAgICAgc25kX3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25lbnRfcHV0X3ZvbHN3KSwKPj4g
KwlTT0NfU0lOR0xFX0VYVCgiSTJTRE9SUyIsIE1UNjY2MF9SRUdfREFUQU9fU0VMLCAwLCA3LCAw
LAo+PiArCQkgICAgICAgc25kX3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25lbnRfcHV0X3Zv
bHN3KSwKPiBXaGF0IGRvIHRoZXNlIGNvbnRyb2xzIGRvPwoKCmkgd2lsbCBtb2RpZnkga2NvbnRy
b2wgbmFtZXMgZm9yIG1vcmUgZGV0YWlsIGRlc2NyaXB0aW9uLgoKClRoYW5rcyAmIEJScwoKUmlj
aHRlayBKZWZmIENoYW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
