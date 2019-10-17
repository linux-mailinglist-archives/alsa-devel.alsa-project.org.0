Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C74DB38E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 19:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7CFE16B6;
	Thu, 17 Oct 2019 19:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7CFE16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571334014;
	bh=T4pWUAtgkrn7tZO7GqRNouHBtOYW5zbOX72WD53UGCY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrRoxfVaXC7PDdCaZBZ84DUTw1vQj7miqkOPmQ506JGPrmJokbR9zsII6+LtpsIEA
	 soRqG7joQOUaxkFQNqc+/Ug2QucLVQYWrnIELQf2N8vA7bGfrEBTVwNAdyKfQulAw+
	 azEckbFPxQtSAqem5kI69KUjT6XOIVgjh/nl4ogU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDDAF804AA;
	Thu, 17 Oct 2019 19:38:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A627FF804AA; Thu, 17 Oct 2019 19:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B577F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 19:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B577F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X5NnkjRM"
Received: by mail-lj1-x241.google.com with SMTP id b20so3452022ljj.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=98c8LVtjKUr2K/g2lcYCoBp2CmHqhMtP4y0d2mR2xZg=;
 b=X5NnkjRM8XYA5w3vvKAfU8s+tUxtQKSChCCvipA+uWZAKMVI3PvClfNgrK55lpIAmS
 tBlIRSsnyJoN9WQvN8WnXHUGt5m9UQFJ9MtOd7BlrQoaTftZcx1Kt5Dms64MDFlgCanm
 xcbrxn7k+txIsvtHDUY7+Yd1yYCn2qXRdR01/c0X/eULbT2ZoOAV5UH1tHDYQ4MWRh6r
 iW73FbaWUodiMa4d18IjwCevNEyTbNeGkZZjCPjE3mYM/cIt7NZND9aYrmGkOiHxrfcM
 Ff0pJFj0mH40jsX0NSlNJD2y3aveWo+r5O491Q07+peA1tres3zR22NoTL84njtpetV7
 4CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=98c8LVtjKUr2K/g2lcYCoBp2CmHqhMtP4y0d2mR2xZg=;
 b=oY/1XrHxWM1eSbIrnF/NEqnOPB/VNUW9MaunqV287fj0BlUBXozP5VsI/1QBgrQ1V3
 XbIqwhXtBK/rUI7BX2G3jGZshsPz7PebQbs2fQ3/CCos1G3sHW9W0c6xcOxNwwfoG1MU
 eFZB84K/vqUK0zA2lkrnuUjKkE9DvVF3gHrh6zm0IvwmBLHWiKh9m/wjaweC7dRlqmxI
 DM3IkrvXEHznIMmxV3waXLVCLkfX529jfZnm1IcRl1GGHfAuGZdHtNiMd7k48pbv3/Hn
 YJ66HmAZ79ixSrxih9JpnFxFRXyzeXg0MpLwtVYTTfjd+MwqW1Jx2j+KZB2qWVZePORS
 oQLA==
X-Gm-Message-State: APjAAAWbFIrHmD6fE5z2ZDMwcyZacQYklC+viKGplkmAbCZBy8V193lm
 OhLdyGDmRlAX7yj3NgOWPXw=
X-Google-Smtp-Source: APXvYqzt2e6gO1zgAn8bv1tC/8yg+7tfeY44gxC5T+nm53J57A6QyDcxfjJU4+Jsj0ifX/S2h4HO/w==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr3340209lji.66.1571333902839; 
 Thu, 17 Oct 2019 10:38:22 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id r19sm1431980ljd.95.2019.10.17.10.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 10:38:22 -0700 (PDT)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
Date: Thu, 17 Oct 2019 20:38:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v4 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
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

MTcuMTAuMjAxOSAxOToyMywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMDgvMTAvMjAxOSAx
NjoyOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBIZWxsbyBCZW4sCj4+Cj4+IDA3LjEwLjIw
MTkgMTg6MzEsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4gRnJvbTogRWR3YXJkIENyYWdnIDxl
ZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4KPj4+IFRoZSBDSUYgY29uZmlndXJhdGlv
biBhbmQgY2xvY2sgc2V0dGluZyBpcyBjdXJyZW50bHkgaGFyZCBjb2RlZCBmb3IgMgo+Pj4gY2hh
bm5lbHMuIFNpbmNlIHRoZSBoYXJkd2FyZSBpcyBjYXBhYmxlIG9mIHN1cHBvcnRpbmcgMS04IGNo
YW5uZWxzIGFkZAo+Pj4gc3VwcG9ydCBmb3IgcmVhZGluZyB0aGUgY2hhbm5lbCBjb3VudCBmcm9t
IHRoZSBzdXBwbGllZCBwYXJhbWV0ZXJzIHRvCj4+PiBhbGxvdyBmb3IgYmV0dGVyIFRETSBzdXBw
b3J0LiBJdCBzZWVtcyB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YKPj4+IHRoaXMKPj4+
IGRyaXZlciB3YXMgZml4ZWQgYXQgMiBjaGFubmVscyBmb3Igc2ltcGxpY2l0eSwgYW5kIG5vdCBp
bXBsZW1lbnRpbmcgVERNLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3
YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
OiBhZGRlZCBpc190ZG0gYW5kIGNoYW5uZWwgbnIgY2hlY2tdCj4+PiBbYmVuLmRvb2tzQGNvZGV0
aGluay5jby51azogbWVyZ2UgZWRnZSBjb250cm9sIGludG8gc2V0LWZvcm1hdF0KPj4+IFtiZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrOiByZW1vdmVkIGlzX3RkbSBhbmQgbW92ZWQgZWRnZSB0byBo
d19wYXJhbXNdCj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhp
bmsuY28udWs+Cj4+PiAtLS0KPj4+IMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIHwg
MjEgKysrKysrKysrKysrKy0tLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3Rl
Z3JhL3RlZ3JhMzBfaTJzLmMKPj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+
IGluZGV4IDA2M2YzNGM4ODJhZi4uNzM4MmY3OTQ5YmY0IDEwMDY0NAo+Pj4gLS0tIGEvc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMw
X2kycy5jCj4+PiBAQCAtNjcsNiArNjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX3NldF9m
bXQoc3RydWN0IHNuZF9zb2NfZGFpCj4+PiAqZGFpLAo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgdGVncmEzMF9pMnMgKmkycyA9IHNuZF9zb2NfZGFpX2dldF9kcnZkYXRhKGRhaSk7Cj4+
PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrID0gMCwgdmFsID0gMDsKPj4+ICvCoMKgwqAg
dW5zaWduZWQgaW50IGNoX21hc2ssIGNoX3ZhbCA9IDA7Cj4+PiDCoCDCoMKgwqDCoMKgIHN3aXRj
aCAoZm10ICYgU05EX1NPQ19EQUlGTVRfSU5WX01BU0spIHsKPj4+IMKgwqDCoMKgwqAgY2FzZSBT
TkRfU09DX0RBSUZNVF9OQl9ORjoKPj4+IEBAIC03NSw2ICs3Niw3IEBAIHN0YXRpYyBpbnQgdGVn
cmEzMF9pMnNfc2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19kYWkKPj4+ICpkYWksCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgICvCoMKg
wqAgY2hfbWFzayA9IFRFR1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJMX01BU0s7Cj4+PiDCoMKg
wqDCoMKgIG1hc2sgfD0gVEVHUkEzMF9JMlNfQ1RSTF9NQVNURVJfRU5BQkxFOwo+Pj4gwqDCoMKg
wqDCoCBzd2l0Y2ggKGZtdCAmIFNORF9TT0NfREFJRk1UX01BU1RFUl9NQVNLKSB7Cj4+PiDCoMKg
wqDCoMKgIGNhc2UgU05EX1NPQ19EQUlGTVRfQ0JTX0NGUzoKPj4+IEBAIC05MCwxMCArOTIsMTIg
QEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19zZXRfZm10KHN0cnVjdCBzbmRfc29jX2RhaQo+Pj4g
KmRhaSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBURUdSQTMwX0kyU19DVFJMX0xSQ0tfTUFTSzsK
Pj4+IMKgwqDCoMKgwqAgc3dpdGNoIChmbXQgJiBTTkRfU09DX0RBSUZNVF9GT1JNQVRfTUFTSykg
ewo+Pj4gwqDCoMKgwqDCoCBjYXNlIFNORF9TT0NfREFJRk1UX0RTUF9BOgo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGNoX3ZhbCA9IFRFR1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJMX05FR19FREdFOwo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCB8PSBURUdSQTMwX0kyU19DVFJMX0ZSQU1FX0ZPUk1B
VF9GU1lOQzsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gVEVHUkEzMF9JMlNfQ1RSTF9M
UkNLX0xfTE9XOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoCBj
YXNlIFNORF9TT0NfREFJRk1UX0RTUF9COgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNoX3ZhbCA9IFRF
R1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJMX05FR19FREdFOwo+Pgo+PiBEb3duc3RyZWFtIGNv
ZGUgc2V0cyBEU1BfQiB0byBQT1NfRURHRSwgbG9va3MgbGlrZSB5b3UgaGF2ZSBhIHR5cG8gaGVy
ZS4KPj4gT3IgZG9lcyBEU1BfQiBoYXBwZW4gdG8gd29yayB3aXRoIHRoZSBORUdfRURHRT8KPiAK
PiBvaywgd2lsbCBjaGFuZ2UsIHdlJ3ZlIG9ubHkgYmVlbiB1c2luZyBTTkRfU09DX0RBSUZNVF9E
U1BfQQo+IAo+IEZvciByZWZlcmVuY2UsIGlzIHRoZXJlIGEgZ2l0IHJlcG8gd2l0aCB0aGlzIHZl
cnNpb24gb2YgdGVncmEgdGRtIHN1cHBvcnQ/CgpMb29rcyBsaWtlIGFsbCBkb3duc3RyZWFtIGtl
cm5lbHMgdGhhdCBzdXBwb3J0ZWQgVDMwIGFyZSBkb2luZyB0aGUgc2FtZQp0aGluZy4KClRha2Ug
YSBsb29rIGhlcmUgZm9yIGV4YW1wbGU6CgpodHRwczovL252LXRlZ3JhLm52aWRpYS5jb20vZ2l0
d2ViLz9wPWxpbnV4LTMuMTAuZ2l0O2E9Y29tbWl0O2g9NDk4MzRlZWY5ZDUxYTZlZmY5NTBlMGY1
MmRkYzUzNDNkOTYwNjUyZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
