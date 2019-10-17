Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8357DB249
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4C816B3;
	Thu, 17 Oct 2019 18:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4C816B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571329546;
	bh=AP/ASChex5Wal+mMnBWxTG2d0BbMnsFWm86iAEzD03w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EB8jIvf25iiEAlKqq9bxGvxcMkIl1s0LmW6jj4pswcHYv3nMqLpqWm8NmM87JOUJQ
	 WV4eb6C9TqsYWoY9da3l2hgf1L3AYtZbcXlAnFYpGJz4eh/HuOzfgoFcRqUyntRNUJ
	 wmRmInHCDdAGxcGstV09ssF7KnBWbwudQwWY+/xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B74DF80276;
	Thu, 17 Oct 2019 18:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9B3EF804AA; Thu, 17 Oct 2019 18:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31994F80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 18:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31994F80276
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL8Yy-0004Hd-Sv; Thu, 17 Oct 2019 17:23:44 +0100
To: Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
Date: Thu, 17 Oct 2019 17:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMDgvMTAvMjAxOSAxNjoyOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEhlbGxvIEJlbiwK
PiAKPiAwNy4xMC4yMDE5IDE4OjMxLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4gRnJvbTogRWR3
YXJkIENyYWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pgo+PiBUaGUgQ0lGIGNv
bmZpZ3VyYXRpb24gYW5kIGNsb2NrIHNldHRpbmcgaXMgY3VycmVudGx5IGhhcmQgY29kZWQgZm9y
IDIKPj4gY2hhbm5lbHMuIFNpbmNlIHRoZSBoYXJkd2FyZSBpcyBjYXBhYmxlIG9mIHN1cHBvcnRp
bmcgMS04IGNoYW5uZWxzIGFkZAo+PiBzdXBwb3J0IGZvciByZWFkaW5nIHRoZSBjaGFubmVsIGNv
dW50IGZyb20gdGhlIHN1cHBsaWVkIHBhcmFtZXRlcnMgdG8KPj4gYWxsb3cgZm9yIGJldHRlciBU
RE0gc3VwcG9ydC4gSXQgc2VlbXMgdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIG9mIHRoaXMK
Pj4gZHJpdmVyIHdhcyBmaXhlZCBhdCAyIGNoYW5uZWxzIGZvciBzaW1wbGljaXR5LCBhbmQgbm90
IGltcGxlbWVudGluZyBURE0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3
YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6
IGFkZGVkIGlzX3RkbSBhbmQgY2hhbm5lbCBuciBjaGVja10KPj4gW2Jlbi5kb29rc0Bjb2RldGhp
bmsuY28udWs6IG1lcmdlIGVkZ2UgY29udHJvbCBpbnRvIHNldC1mb3JtYXRdCj4+IFtiZW4uZG9v
a3NAY29kZXRoaW5rLmNvLnVrOiByZW1vdmVkIGlzX3RkbSBhbmQgbW92ZWQgZWRnZSB0byBod19w
YXJhbXNdCj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4KPj4gLS0tCj4+ICAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAyMSArKysr
KysrKysrKysrLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMw
X2kycy5jIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4gaW5kZXggMDYzZjM0Yzg4
MmFmLi43MzgyZjc5NDliZjQgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMw
X2kycy5jCj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+IEBAIC02Nyw2
ICs2Nyw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfc2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaSwKPj4gICB7Cj4+ICAgCXN0cnVjdCB0ZWdyYTMwX2kycyAqaTJzID0gc25kX3NvY19k
YWlfZ2V0X2RydmRhdGEoZGFpKTsKPj4gICAJdW5zaWduZWQgaW50IG1hc2sgPSAwLCB2YWwgPSAw
Owo+PiArCXVuc2lnbmVkIGludCBjaF9tYXNrLCBjaF92YWwgPSAwOwo+PiAgIAo+PiAgIAlzd2l0
Y2ggKGZtdCAmIFNORF9TT0NfREFJRk1UX0lOVl9NQVNLKSB7Cj4+ICAgCWNhc2UgU05EX1NPQ19E
QUlGTVRfTkJfTkY6Cj4+IEBAIC03NSw2ICs3Niw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNf
c2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4gICAJCXJldHVybiAtRUlOVkFMOwo+
PiAgIAl9Cj4+ICAgCj4+ICsJY2hfbWFzayA9IFRFR1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJM
X01BU0s7Cj4+ICAgCW1hc2sgfD0gVEVHUkEzMF9JMlNfQ1RSTF9NQVNURVJfRU5BQkxFOwo+PiAg
IAlzd2l0Y2ggKGZtdCAmIFNORF9TT0NfREFJRk1UX01BU1RFUl9NQVNLKSB7Cj4+ICAgCWNhc2Ug
U05EX1NPQ19EQUlGTVRfQ0JTX0NGUzoKPj4gQEAgLTkwLDEwICs5MiwxMiBAQCBzdGF0aWMgaW50
IHRlZ3JhMzBfaTJzX3NldF9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+ICAgCQlURUdS
QTMwX0kyU19DVFJMX0xSQ0tfTUFTSzsKPj4gICAJc3dpdGNoIChmbXQgJiBTTkRfU09DX0RBSUZN
VF9GT1JNQVRfTUFTSykgewo+PiAgIAljYXNlIFNORF9TT0NfREFJRk1UX0RTUF9BOgo+PiArCQlj
aF92YWwgPSBURUdSQTMwX0kyU19DSF9DVFJMX0VHREVfQ1RSTF9ORUdfRURHRTsKPj4gICAJCXZh
bCB8PSBURUdSQTMwX0kyU19DVFJMX0ZSQU1FX0ZPUk1BVF9GU1lOQzsKPj4gICAJCXZhbCB8PSBU
RUdSQTMwX0kyU19DVFJMX0xSQ0tfTF9MT1c7Cj4+ICAgCQlicmVhazsKPj4gICAJY2FzZSBTTkRf
U09DX0RBSUZNVF9EU1BfQjoKPj4gKwkJY2hfdmFsID0gVEVHUkEzMF9JMlNfQ0hfQ1RSTF9FR0RF
X0NUUkxfTkVHX0VER0U7Cj4gCj4gRG93bnN0cmVhbSBjb2RlIHNldHMgRFNQX0IgdG8gUE9TX0VE
R0UsIGxvb2tzIGxpa2UgeW91IGhhdmUgYSB0eXBvIGhlcmUuCj4gT3IgZG9lcyBEU1BfQiBoYXBw
ZW4gdG8gd29yayB3aXRoIHRoZSBORUdfRURHRT8KCm9rLCB3aWxsIGNoYW5nZSwgd2UndmUgb25s
eSBiZWVuIHVzaW5nIFNORF9TT0NfREFJRk1UX0RTUF9BCgpGb3IgcmVmZXJlbmNlLCBpcyB0aGVy
ZSBhIGdpdCByZXBvIHdpdGggdGhpcyB2ZXJzaW9uIG9mIHRlZ3JhIHRkbSBzdXBwb3J0PwoKCi0t
IApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVl
cgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsu
Y28udWsvcHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
