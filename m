Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7251279FB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 12:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B30E1655;
	Fri, 20 Dec 2019 12:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B30E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576841527;
	bh=gzbrjWpiQxNddxTYSBI7HnJNeDeoCzsC8WYiTb9uaYw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqDqZduVH4AdxlEuHoUJ+moHSV4xPvcIoR6s8OpFElmB4Wg1edVAi0TmOTjw/BGYb
	 5sQRXDYixz2T2BpeXxUInSq4uW3dTWQ4+VCxncYNZDxf/Eb6QiI6YZnsXCGBP+ReIg
	 L9ScbFdLpZOBCZlXR7xA5MAday8fXo65ZNvyhggA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDB4F8015A;
	Fri, 20 Dec 2019 12:30:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05D9F8015A; Fri, 20 Dec 2019 12:30:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ECC0F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 12:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ECC0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WSp2y5HI"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfcb0a80000>; Fri, 20 Dec 2019 03:29:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 03:30:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 03:30:15 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 11:30:10 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
Date: Fri, 20 Dec 2019 11:30:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576841384; bh=XQv7Wecv1Az6SmSy/jfN57j28sMZixanijdPr0h5FaU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WSp2y5HId0Mq0shhE3DufndFB3bx3aW1FAdMWDRe5JvXBWtMvVA6hDoUdeTYOWlbQ
 9XjpHVkamv4+tCAJieBShchdlm2277bL+6fB5R/nC/55IImlFJDYRJz11qrkVehn1b
 ueAKiUV4VAfleXPimVk5mR5V9AakjnbyGRmJnZhz/lUTw4rIQ4Tv+Jql38cjpFQlmC
 +NaDkjFcPwvolMhz/6RD0gOMg4luREiQ6K7OE263U5YT1lUzAkFE08MURDoiDQI/Zt
 jO8vNkSjejFOISDYs4QRxjY86tD4FJaFaWUFyza98BrFbaWt4TElh4ekpnHvjYqb8z
 fY7+B2i2N1lug==
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

Ck9uIDI1LzExLzIwMTkgMTc6MjgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyNS4xMS4yMDE5
IDIwOjIyLCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPj4gMjUuMTEuMjAxOSAxMzozNywg
QmVuIERvb2tzINC/0LjRiNC10YI6Cj4+PiBPbiAyMy8xMS8yMDE5IDIxOjA5LCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+Pj4gMTguMTAuMjAxOSAxODo0OCwgQmVuIERvb2tzINC/0LjRiNC10YI6
Cj4+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4K
Pj4+Pj4KPj4+Pj4gVGhlIHRlZ3JhMyBhdWRpbyBjYW4gc3VwcG9ydCAyNCBhbmQgMzIgYml0IHNh
bXBsZSBzaXplcyBzbyBhZGQgdGhlCj4+Pj4+IG9wdGlvbiB0byB0aGUgdGVncmEzMF9pMnNfaHdf
cGFyYW1zIHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9yIFMzMl9MRQo+Pj4+PiBmb3JtYXRzIHdo
ZW4gcmVxdWVzdGVkLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVk
d2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNv
LnVrOiBmaXh1cCBtZXJnZSBvZiAyNCBhbmQgMzJiaXRdCj4+Pj4+IFtiZW4uZG9va3NAY29kZXRo
aW5rLmNvLnVrOiBhZGQgcG0gY2FsbHMgYXJvdW5kIHl0ZG0gY29uZmlnXQo+Pj4+PiBbYmVuLmRv
b2tzQGNvZGV0aGluay5jby51azogZHJvcCBkZWJ1ZyBwcmludGluZyB0byBkZXZfZGJnXQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Cj4+
Pj4+IC0tLQo+Pj4+PiBzcXVhc2ggNWFlY2E1YTA1NWZkIEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSBpcyBuZWVkZWQKPj4+Pj4gaW4gdGRtIGNvZGUKPj4+Pj4KPj4+Pj4g
QVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0g
Y29kZQo+Pj4+PiAtLS0KPj4+Pj4gwqAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAy
NSArKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvc291
bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVncmEz
MF9pMnMuYwo+Pj4+PiBpbmRleCA3M2YwZGRkZWFlZjMuLjA2M2YzNGM4ODJhZiAxMDA2NDQKPj4+
Pj4gLS0tIGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4gKysrIGIvc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4gQEAgLTEyNyw3ICsxMjcsNyBAQCBzdGF0aWMg
aW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwKPj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWktPmRl
djsKPj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGVncmEzMF9pMnMgKmkycyA9IHNuZF9zb2NfZGFp
X2dldF9kcnZkYXRhKGRhaSk7Cj4+Pj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG1hc2ssIHZh
bCwgcmVnOwo+Pj4+PiAtwqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xv
Y2ssIGJpdGNudDsKPj4+Pj4gK8KgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGky
c2Nsb2NrLCBiaXRjbnQsIGF1ZGlvX2JpdHM7Cj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHRlZ3Jh
MzBfYWh1Yl9jaWZfY29uZiBjaWZfY29uZjsKPj4+Pj4gwqAgwqDCoMKgwqDCoCBpZiAocGFyYW1z
X2NoYW5uZWxzKHBhcmFtcykgIT0gMikKPj4+Pj4gQEAgLTEzNyw4ICsxMzcsMTkgQEAgc3RhdGlj
IGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFt
ICpzdWJzdHJlYW0sCj4+Pj4+IMKgwqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFt
cykpIHsKPj4+Pj4gwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8xNjsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNf
MTY7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDE2Owo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFU
X1MyNF9MRToKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklU
X1NJWkVfMjQ7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJ
T0NJRl9CSVRTXzI0Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAyNDsKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZP
Uk1BVF9TMzJfTEU6Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJM
X0JJVF9TSVpFXzMyOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBf
QVVESU9DSUZfQklUU18zMjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMzI7
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0Ogo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+IMKgwqDCoMKgwqAg
fQo+Pj4+PiBAQCAtMTcwLDggKzE4MSw4IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFy
YW1zKHN0cnVjdAo+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+PiDCoMKg
wqDCoMKgIGNpZl9jb25mLnRocmVzaG9sZCA9IDA7Cj4+Pj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYu
YXVkaW9fY2hhbm5lbHMgPSAyOwo+Pj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmNsaWVudF9jaGFu
bmVscyA9IDI7Cj4+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVE
SU9DSUZfQklUU18xNjsKPj4+Pj4gLcKgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IFRFR1JB
MzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5hdWRpb19iaXRzID0g
YXVkaW9fYml0czsKPj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IGF1ZGlvX2Jp
dHM7Cj4+Pj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYuZXhwYW5kID0gMDsKPj4+Pj4gwqDCoMKgwqDC
oCBjaWZfY29uZi5zdGVyZW9fY29udiA9IDA7Cj4+Pj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYucmVw
bGljYXRlID0gMDsKPj4+Pj4gQEAgLTMwNiwxNCArMzE3LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc25kX3NvY19kYWlfZHJpdmVyCj4+Pj4+IHRlZ3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4gPSAyLAo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAu
cmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
LmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+PiDCoMKg
wqDCoMKgIH0sCj4+Pj4+IMKgwqDCoMKgwqAgLmNhcHR1cmUgPSB7Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCAuc3RyZWFtX25hbWUgPSAiQ2FwdHVyZSIsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAuY2hhbm5lbHNfbWluID0gMiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19t
YXggPSAyLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVf
ODAwMF85NjAwMCwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZN
VEJJVF9TMTZfTEUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9G
TVRCSVRfUzMyX0xFIHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZf
UENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
TkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4gwqDCoMKgwqDCoCB9LAo+Pj4+PiDCoMKgwqDC
oMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4gwqDCoMKgwqDCoCAuc3ltbWV0
cmljX3JhdGVzID0gMSwKPj4+Pj4KPj4+Pgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gVGhpcyBwYXRj
aCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3JzIGFueXdoZXJlLCBi
dXQKPj4+PiB0aGVyZSBpcyBubyBhdWRpbyBhbmQgcmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggaGVscHMu
IFBsZWFzZSBmaXggaXQuCj4+Pgo+Pj4gV2hhdCBpcyB0aGUgZmFpbHVyZSBtb2RlPyBJIGNhbiB0
cnkgYW5kIHRha2UgYSBsb29rIGF0IHRoaXMgc29tZSB0aW1lCj4+PiB0aGlzIHdlZWssIGJ1dCBJ
IGFtIG5vdCBzdXJlIGlmIEkgaGF2ZSBhbnkgYm9hcmRzIHdpdGggYW4gYWN0dWFsIHVzZWZ1bAo+
Pj4gYXVkaW8gb3V0cHV0Pwo+Pgo+PiBUaGUgZmFpbHVyZSBtb2RlIGlzIHRoYXQgdGhlcmUgbm8g
c291bmQuIEkgYWxzbyBub3RpY2VkIHRoYXQgdmlkZW8KPj4gcGxheWJhY2sgc3R1dHRlcnMgYSBs
b3QgaWYgbW92aWUgZmlsZSBoYXMgYXVkaW8gdHJhY2ssIHNlZW1zIHNvbWV0aGluZwo+PiB0aW1l
cyBvdXQgZHVyaW5nIG9mIHRoZSBhdWRpbyBwbGF5YmFjay4gRm9yIG5vdyBJIGRvbid0IGhhdmUg
YW55IG1vcmUgaW5mby4KPj4KPiAKPiBPaCwgSSBkaWRuJ3Qgc2F5IGhvdyB0byByZXByb2R1Y2Ug
aXQuLiBmb3IgZXhhbXBsZSBzaW1wbHkgcGxheWluZwo+IGJpZ19idWNrX2J1bm55XzcyMHBfaDI2
NC5tb3YgaW4gTVBWIGhhcyB0aGUgYXVkaW8gcHJvYmxlbS4KPiAKPiBodHRwczovL2Rvd25sb2Fk
LmJsZW5kZXIub3JnL3BlYWNoL2JpZ2J1Y2tidW5ueV9tb3ZpZXMvYmlnX2J1Y2tfYnVubnlfNzIw
cF9oMjY0Lm1vdgoKR2l2ZW4gdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2VzIHJlZ21hcCwgaXQg
Y291bGQgYmUgZ29vZCB0byBkdW1wIHRoZQpJMlMvQUhVQiByZWdpc3RlcnMgd2hpbGUgdGhlIGNs
aXAgaWYgcGxheWluZyB3aXRoIGFuZCB3aXRob3V0IHRoaXMgcGF0Y2gKdG8gc2VlIHRoZSBkaWZm
ZXJlbmNlcy4gSSBhbSBjdXJpb3VzIGlmIHRoZSBhdWRpbyBpcyBub3cgYmVpbmcgcGxheWVkIGFz
CjI0IG9yIDMyLWJpdCBpbnN0ZWFkIG9mIDE2LWJpdCBub3cgdGhlc2UgYXJlIGF2YWlsYWJsZS4K
CllvdSBjb3VsZCBhbHNvIGR1bXAgdGhlIGh3X3BhcmFtcyB0byBzZWUgdGhlIGZvcm1hdCB3aGls
ZSBwbGF5aW5nIGFzCndlbGwgLi4uCgokIC9wcm9jL2Fzb3VuZC88c2NhcmQtbmFtZT4vcGNtMHAv
c3ViMC9od19wYXJhbXMKCkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
