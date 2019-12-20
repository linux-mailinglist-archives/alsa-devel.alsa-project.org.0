Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75A127C17
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:59:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC8D1682;
	Fri, 20 Dec 2019 14:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC8D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576850367;
	bh=NniZQkzj0CEBP/2veEj3i4TzCi0CoNgf1C1ghL93zkI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4B/GV/6ceLCG0zY2kA+ZJfPuS3wRPRi85ePlb/NRZht0JzCS3mQNDe8bkbJ9Q80h
	 tuFvt8i5OLxrZlYMZZ2z3xt7BMXwFyiRs/Hh9+GakEOtnCfCwzuGgrNn+swtQiRqWJ
	 8ueaWhLGw7gZCS+WBTuoFu5dgFeFsnES7uhoFsFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD6D3F8014C;
	Fri, 20 Dec 2019 14:57:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF4AF8014F; Fri, 20 Dec 2019 14:57:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224C5F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224C5F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="A7cvrGvX"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfcd3420000>; Fri, 20 Dec 2019 05:57:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 05:57:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 20 Dec 2019 05:57:35 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 13:57:30 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>, 
 <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
Date: Fri, 20 Dec 2019 13:57:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576850245; bh=3ktswGmg8hsE2oxKtIrThdozNJJy/HxC3QZHdrlcLBI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=A7cvrGvXmpJc9+6wP8OT5pOlePhzDUVA6iGphyboKl75D0tKf7blDcQzmiwRfrG7c
 +ZlASq5d1svieEv7i9tCslSIfjButmbVyc/zJRx4BvlowXmWhvTEVeTl+8ZTi+RJld
 Q32ERzhPJ9lK2ScuDGFInvPmhwOQzcJLn+sWLKzxLlTjUxF468jcPYo99I70zbkXBL
 xHbZDu+7BlQuhn5kA6Ay62Dx2/baeGeFTgObsOBk0aHviXLGUk5UYJsAQgTMLralu4
 aWHnK8suoG1Ap8cAeTxrDD6Xh/8pdrt/3rEA+lo8LgwoYmo91Zv8cYnwi3jMVrpGpp
 YoqiDzLvBhaqQ==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

Ck9uIDIwLzEyLzIwMTkgMTE6MzgsIEJlbiBEb29rcyB3cm90ZToKPiBPbiAyMC8xMi8yMDE5IDEx
OjMwLCBKb24gSHVudGVyIHdyb3RlOgo+Pgo+PiBPbiAyNS8xMS8yMDE5IDE3OjI4LCBEbWl0cnkg
T3NpcGVua28gd3JvdGU6Cj4+PiAyNS4xMS4yMDE5IDIwOjIyLCBEbWl0cnkgT3NpcGVua28g0L/Q
uNGI0LXRgjoKPj4+PiAyNS4xMS4yMDE5IDEzOjM3LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+
Pj4gT24gMjMvMTEvMjAxOSAyMTowOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4gMTgu
MTAuMjAxOSAxODo0OCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4gRnJvbTogRWR3YXJk
IENyYWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhl
IHRlZ3JhMyBhdWRpbyBjYW4gc3VwcG9ydCAyNCBhbmQgMzIgYml0IHNhbXBsZSBzaXplcyBzbyBh
ZGQgdGhlCj4+Pj4+Pj4gb3B0aW9uIHRvIHRoZSB0ZWdyYTMwX2kyc19od19wYXJhbXMgdG8gY29u
ZmlndXJlIHRoZSBTMjRfTEUgb3IKPj4+Pj4+PiBTMzJfTEUKPj4+Pj4+PiBmb3JtYXRzIHdoZW4g
cmVxdWVzdGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIENyYWdnIDxl
ZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5r
LmNvLnVrOiBmaXh1cCBtZXJnZSBvZiAyNCBhbmQgMzJiaXRdCj4+Pj4+Pj4gW2Jlbi5kb29rc0Bj
b2RldGhpbmsuY28udWs6IGFkZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4+Pj4+Pj4g
W2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcgdG8gZGV2X2Ri
Z10KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gc3F1YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdy
YTogaTJzOiBwbV9ydW50aW1lX2dldF9zeW5jKCkgaXMKPj4+Pj4+PiBuZWVkZWQKPj4+Pj4+PiBp
biB0ZG0gY29kZQo+Pj4+Pj4+Cj4+Pj4+Pj4gQVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9n
ZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IMKgwqAg
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVn
cmEzMF9pMnMuYwo+Pj4+Pj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+
PiBpbmRleCA3M2YwZGRkZWFlZjMuLjA2M2YzNGM4ODJhZiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9z
b3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4+Pj4+Pj4gQEAgLTEyNyw3ICsxMjcsNyBAQCBzdGF0aWMgaW50IHRl
Z3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vi
c3RyZWFtLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWktPmRl
djsKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfaTJzICppMnMgPSBzbmRfc29j
X2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
bWFzaywgdmFsLCByZWc7Cj4+Pj4+Pj4gLcKgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3Jh
dGUsIGkyc2Nsb2NrLCBiaXRjbnQ7Cj4+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6
ZSwgc3JhdGUsIGkyc2Nsb2NrLCBiaXRjbnQsIGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIHN0cnVjdCB0ZWdyYTMwX2FodWJfY2lmX2NvbmYgY2lmX2NvbmY7Cj4+Pj4+Pj4gwqDCoCDC
oMKgwqDCoMKgIGlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAyKQo+Pj4+Pj4+IEBAIC0x
MzcsOCArMTM3LDE5IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+
Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
IHN3aXRjaCAocGFyYW1zX2Zvcm1hdChwYXJhbXMpKSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGNh
c2UgU05EUlZfUENNX0ZPUk1BVF9TMTZfTEU6Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8xNjsKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDE2Owo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MyNF9MRToK
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8y
NDsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZf
QklUU18yNDsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAyNDsKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIFNORFJWX1BDTV9G
T1JNQVRfUzMyX0xFOgo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19D
VFJMX0JJVF9TSVpFXzMyOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVH
UkEzMF9BVURJT0NJRl9CSVRTXzMyOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6
ZSA9IDMyOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+PiDCoMKgwqDCoMKg
wqAgZGVmYXVsdDoKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsK
Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IEBAIC0xNzAsOCArMTgxLDggQEAgc3RhdGlj
IGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+Pj4+Pj4gc25kX3BjbV9zdWJzdHJl
YW0gKnN1YnN0cmVhbSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgY2lmX2NvbmYudGhyZXNob2xkID0g
MDsKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuYXVkaW9fY2hhbm5lbHMgPSAyOwo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoCBjaWZfY29uZi5jbGllbnRfY2hhbm5lbHMgPSAyOwo+Pj4+Pj4+IC3C
oMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+
Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmNsaWVudF9iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRT
XzE2Owo+Pj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IGF1ZGlvX2JpdHM7Cj4+
Pj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgIGNpZl9jb25mLmV4cGFuZCA9IDA7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGNp
Zl9jb25mLnN0ZXJlb19jb252ID0gMDsKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgY2lmX2NvbmYucmVw
bGljYXRlID0gMDsKPj4+Pj4+PiBAQCAtMzA2LDE0ICszMTcsMTggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIKPj4+Pj4+PiB0ZWdyYTMwX2kyc19kYWlfdGVtcGxhdGUg
PSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUgfAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9G
TVRCSVRfUzE2X0xFLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oCAuY2FwdHVyZSA9IHsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RyZWFtX25hbWUg
PSAiQ2FwdHVyZSIsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9
IDIsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAw
MCwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklU
X1MzMl9MRSB8Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENN
X0ZNVEJJVF9TMjRfTEUgfAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoCAub3BzID0gJnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgIC5zeW1tZXRyaWNfcmF0ZXMgPSAxLAo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSGVsbG8sCj4+
Pj4+Pgo+Pj4+Pj4gVGhpcyBwYXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBz
ZWUgZXJyb3JzIGFueXdoZXJlLCBidXQKPj4+Pj4+IHRoZXJlIGlzIG5vIGF1ZGlvIGFuZCByZXZl
cnRpbmcgdGhpcyBwYXRjaCBoZWxwcy4gUGxlYXNlIGZpeCBpdC4KPj4+Pj4KPj4+Pj4gV2hhdCBp
cyB0aGUgZmFpbHVyZSBtb2RlPyBJIGNhbiB0cnkgYW5kIHRha2UgYSBsb29rIGF0IHRoaXMgc29t
ZSB0aW1lCj4+Pj4+IHRoaXMgd2VlaywgYnV0IEkgYW0gbm90IHN1cmUgaWYgSSBoYXZlIGFueSBi
b2FyZHMgd2l0aCBhbiBhY3R1YWwKPj4+Pj4gdXNlZnVsCj4+Pj4+IGF1ZGlvIG91dHB1dD8KPj4+
Pgo+Pj4+IFRoZSBmYWlsdXJlIG1vZGUgaXMgdGhhdCB0aGVyZSBubyBzb3VuZC4gSSBhbHNvIG5v
dGljZWQgdGhhdCB2aWRlbwo+Pj4+IHBsYXliYWNrIHN0dXR0ZXJzIGEgbG90IGlmIG1vdmllIGZp
bGUgaGFzIGF1ZGlvIHRyYWNrLCBzZWVtcyBzb21ldGhpbmcKPj4+PiB0aW1lcyBvdXQgZHVyaW5n
IG9mIHRoZSBhdWRpbyBwbGF5YmFjay4gRm9yIG5vdyBJIGRvbid0IGhhdmUgYW55Cj4+Pj4gbW9y
ZSBpbmZvLgo+Pj4+Cj4+Pgo+Pj4gT2gsIEkgZGlkbid0IHNheSBob3cgdG8gcmVwcm9kdWNlIGl0
Li4gZm9yIGV4YW1wbGUgc2ltcGx5IHBsYXlpbmcKPj4+IGJpZ19idWNrX2J1bm55XzcyMHBfaDI2
NC5tb3YgaW4gTVBWIGhhcyB0aGUgYXVkaW8gcHJvYmxlbS4KPj4+Cj4+PiBodHRwczovL2Rvd25s
b2FkLmJsZW5kZXIub3JnL3BlYWNoL2JpZ2J1Y2tidW5ueV9tb3ZpZXMvYmlnX2J1Y2tfYnVubnlf
NzIwcF9oMjY0Lm1vdgo+Pj4KPj4KPj4gR2l2ZW4gdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2Vz
IHJlZ21hcCwgaXQgY291bGQgYmUgZ29vZCB0byBkdW1wIHRoZQo+PiBJMlMvQUhVQiByZWdpc3Rl
cnMgd2hpbGUgdGhlIGNsaXAgaWYgcGxheWluZyB3aXRoIGFuZCB3aXRob3V0IHRoaXMgcGF0Y2gK
Pj4gdG8gc2VlIHRoZSBkaWZmZXJlbmNlcy4gSSBhbSBjdXJpb3VzIGlmIHRoZSBhdWRpbyBpcyBu
b3cgYmVpbmcgcGxheWVkIGFzCj4+IDI0IG9yIDMyLWJpdCBpbnN0ZWFkIG9mIDE2LWJpdCBub3cg
dGhlc2UgYXJlIGF2YWlsYWJsZS4KPj4KPj4gWW91IGNvdWxkIGFsc28gZHVtcCB0aGUgaHdfcGFy
YW1zIHRvIHNlZSB0aGUgZm9ybWF0IHdoaWxlIHBsYXlpbmcgYXMKPj4gd2VsbCAuLi4KPj4KPj4g
JCAvcHJvYy9hc291bmQvPHNjYXJkLW5hbWU+L3BjbTBwL3N1YjAvaHdfcGFyYW1zCj4gCj4gSSBz
dXBwb3NlIGl0IGlzIGFsc28gcG9zc2libGUgdGhhdCB0aGUgY29kZWMgaXNuJ3QgcHJvcGVybHkg
ZG9pbmcgPjE2Cj4gYml0cyBhbmQgdGhlIGZhY3Qgd2Ugbm93IG9mZmVyIDI0IGFuZCAzMiBjb3Vs
ZCBiZSBhbiBpc3N1ZS4gSSd2ZSBub3QKPiBnb3QgYW55dGhpbmcgd2l0aCBhbiBhdWRpbyBvdXRw
dXQgb24gaXQgdGhhdCB3b3VsZCBiZSBlYXN5IHRvIHRlc3QuCgpJIHRob3VnaHQgSSBoYWQgdGVz
dGVkIG9uIGEgSmV0c29uIFRLMSAoVGVncmExMjQpIGJ1dCBpdCB3YXMgc29tZXRpbWUKYmFjay4g
SG93ZXZlciwgYWRtaXR0ZWRseSBJIG1heSBoYXZlIG9ubHkgZG9uZSBzaW1wbGUgMTYtYml0IHRl
c3RpbmcKd2l0aCBzcGVha2VyLXRlc3QuCgpXZSBkbyB2ZXJpZnkgdGhhdCBhbGwgc291bmRjYXJk
cyBhcmUgZGV0ZWN0ZWQgYW5kIHJlZ2lzdGVyZWQgYXMgZXhwZWN0ZWQKZHVyaW5nIGRhaWx5IHRl
c3RpbmcsIGJ1dCBhdCB0aGUgbW9tZW50IHdlIGRvbid0IGhhdmUgYW55dGhpbmcgdGhhdAp2ZXJp
ZmllcyBhY3R1YWwgcGxheWJhY2suCgpKb24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
