Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8491092D6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 18:30:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA5117C8;
	Mon, 25 Nov 2019 18:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA5117C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574703048;
	bh=82l49+dz9fCog4CUY2Kas0At039q9hK8YY6F50bsd+o=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNwh8lajik2I2nhupViO3ZebaT61evujIhMqrf5f/xyb6DV2XynV2HYyLLJFcDuBy
	 wmG6/vB77t5F4GB2x6qK/RDLQanjlHIhAA6yJufbHJ6DRKUACMlu55WBr/x1L9ZVsQ
	 WIEuuImGvllgKN+mvztoI2LH9WoWww15m+Aa5oCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC5AFF800AB;
	Mon, 25 Nov 2019 18:29:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8BDCF8016F; Mon, 25 Nov 2019 18:28:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEA2BF800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 18:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEA2BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RRZYiTi2"
Received: by mail-lj1-x243.google.com with SMTP id e10so7698405ljj.6
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 09:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F06CJ+JlKnOuUWn1ubQ4DCOdsfyHx8+XO8bExvyHTQ8=;
 b=RRZYiTi2E61gwkIyQr4JHzAKWUDaTGOoLFjIZaK+HylH2vzceFTTqgWGXUUfmno8iw
 BksIOE2BqnsFPAaXOZm1/Cq8TJHSGRV3gajzCurQYHDvi/ZbcKDLpRiL60NX4I+YQn5j
 ulSjJv+NIQNqALEDudVMo8+lDSsCiljv3AMdTvvx0l2F+3kDKzU9gFpfJ1zNHOEDzaEc
 vv5AQVO6zyPrQO0XjeTMwqjF4hEqb10WHMVYPwxrYs1POO8YxWIAJBhxuv/6QgqofQW2
 UJ1VHQRnRFWXT8Y0/f3WCpP7qsApfblRBuQsymLMjlOZkoSaiaKe5x4gkC52zS60Mb9S
 pmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F06CJ+JlKnOuUWn1ubQ4DCOdsfyHx8+XO8bExvyHTQ8=;
 b=ANgipbLlspcOZgTJJz1zZPjc83DUvnPQswu7g0B+yQO4lCiJ7AvvJ5swCyjUA6+efE
 J8P12QchHlQUs3LKfh9dm5tVchqhWsLlh+EKT9edbv3vZlN14Zuyt2cZ0zF6qtOMzetR
 ttEbs4H76exAKP7Vzv6DRhOMYgFKrL3QdF+WmlOMaLux1leVx1qJmJzgUsL2JpxtagUJ
 7yW1kYAL31b//pdc39Lk67xE+H8cCZL669lx/8P+jNkTmHZkK1DtSx/PV8V3+c4H971o
 86sKz/x+Nl/aKYGN7LTzAXvIAMMfXDnfW8GrSkZcq0trwnavuGPZXlx5w1bsEnOqRkdL
 7Nww==
X-Gm-Message-State: APjAAAXFxuYvDGI1ZW7/SuGv8YeNQS7ZN8EivOwUpKv1+5XncVCZcZQh
 z4NWmFB0gOqjgLG/wRin0Xc=
X-Google-Smtp-Source: APXvYqynl6JEYfXu2DI+buf8Gwt7XO7eDI3Ugen9KTdtYGKoZRfYcO/PkyiXsUx6eBQ+FW/mMRh/kA==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr23392150ljc.130.1574702935605; 
 Mon, 25 Nov 2019 09:28:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id x12sm3968503lfq.52.2019.11.25.09.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 09:28:55 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
Message-ID: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
Date: Mon, 25 Nov 2019 20:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
Content-Language: en-US
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

MjUuMTEuMjAxOSAyMDoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjUuMTEuMjAx
OSAxMzozNywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+IE9uIDIzLzExLzIwMTkgMjE6MDksIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDE4LjEwLjIwMTkgMTg6NDgsIEJlbiBEb29rcyDQv9C4
0YjQtdGCOgo+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5j
by51az4KPj4+Pgo+Pj4+IFRoZSB0ZWdyYTMgYXVkaW8gY2FuIHN1cHBvcnQgMjQgYW5kIDMyIGJp
dCBzYW1wbGUgc2l6ZXMgc28gYWRkIHRoZQo+Pj4+IG9wdGlvbiB0byB0aGUgdGVncmEzMF9pMnNf
aHdfcGFyYW1zIHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9yIFMzMl9MRQo+Pj4+IGZvcm1hdHMg
d2hlbiByZXF1ZXN0ZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVk
d2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28u
dWs6IGZpeHVwIG1lcmdlIG9mIDI0IGFuZCAzMmJpdF0KPj4+PiBbYmVuLmRvb2tzQGNvZGV0aGlu
ay5jby51azogYWRkIHBtIGNhbGxzIGFyb3VuZCB5dGRtIGNvbmZpZ10KPj4+PiBbYmVuLmRvb2tz
QGNvZGV0aGluay5jby51azogZHJvcCBkZWJ1ZyBwcmludGluZyB0byBkZXZfZGJnXQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4+PiAt
LS0KPj4+PiBzcXVhc2ggNWFlY2E1YTA1NWZkIEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1bnRpbWVf
Z2V0X3N5bmMoKSBpcyBuZWVkZWQKPj4+PiBpbiB0ZG0gY29kZQo+Pj4+Cj4+Pj4gQVNvQzogdGVn
cmE6IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+Pj4+
IC0tLQo+Pj4+IMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIHwgMjUgKysrKysrKysr
KysrKysrKysrKystLS0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90
ZWdyYTMwX2kycy5jCj4+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+IGlu
ZGV4IDczZjBkZGRlYWVmMy4uMDYzZjM0Yzg4MmFmIDEwMDY0NAo+Pj4+IC0tLSBhL3NvdW5kL3Nv
Yy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4gKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBf
aTJzLmMKPj4+PiBAQCAtMTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdf
cGFyYW1zKHN0cnVjdAo+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWktPmRldjsKPj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCB0ZWdyYTMwX2kycyAqaTJzID0gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoZGFpKTsKPj4+
PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWwsIHJlZzsKPj4+PiAtwqDCoMKgIGlu
dCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudDsKPj4+PiArwqDCoMKg
IGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudCwgYXVkaW9fYml0
czsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdyYTMwX2FodWJfY2lmX2NvbmYgY2lmX2NvbmY7
Cj4+Pj4gwqAgwqDCoMKgwqDCoCBpZiAocGFyYW1zX2NoYW5uZWxzKHBhcmFtcykgIT0gMikKPj4+
PiBAQCAtMTM3LDggKzEzNywxOSBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhz
dHJ1Y3QKPj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+IMKgwqDCoMKgwqAg
c3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykpIHsKPj4+PiDCoMKgwqDCoMKgIGNhc2UgU05E
UlZfUENNX0ZPUk1BVF9TMTZfTEU6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JB
MzBfSTJTX0NUUkxfQklUX1NJWkVfMTY7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMg
PSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNhbXBs
ZV9zaXplID0gMTY7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+ICvCoMKgwqAg
Y2FzZSBTTkRSVl9QQ01fRk9STUFUX1MyNF9MRToKPj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0g
VEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8yNDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9f
Yml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18yNDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc2Ft
cGxlX3NpemUgPSAyNDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gK8KgwqDCoCBj
YXNlIFNORFJWX1BDTV9GT1JNQVRfUzMyX0xFOgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBU
RUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzMyOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19i
aXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzMyOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzYW1w
bGVfc2l6ZSA9IDMyOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+PiDCoMKgwqDCoMKg
IGRlZmF1bHQ6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+IMKg
wqDCoMKgwqAgfQo+Pj4+IEBAIC0xNzAsOCArMTgxLDggQEAgc3RhdGljIGludCB0ZWdyYTMwX2ky
c19od19wYXJhbXMoc3RydWN0Cj4+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4+
PiDCoMKgwqDCoMKgIGNpZl9jb25mLnRocmVzaG9sZCA9IDA7Cj4+Pj4gwqDCoMKgwqDCoCBjaWZf
Y29uZi5hdWRpb19jaGFubmVscyA9IDI7Cj4+Pj4gwqDCoMKgwqDCoCBjaWZfY29uZi5jbGllbnRf
Y2hhbm5lbHMgPSAyOwo+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IFRFR1JBMzBf
QVVESU9DSUZfQklUU18xNjsKPj4+PiAtwqDCoMKgIGNpZl9jb25mLmNsaWVudF9iaXRzID0gVEVH
UkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9
IGF1ZGlvX2JpdHM7Cj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IGF1ZGlvX2Jp
dHM7Cj4+Pj4gwqDCoMKgwqDCoCBjaWZfY29uZi5leHBhbmQgPSAwOwo+Pj4+IMKgwqDCoMKgwqAg
Y2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYucmVwbGlj
YXRlID0gMDsKPj4+PiBAQCAtMzA2LDE0ICszMTcsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
bmRfc29jX2RhaV9kcml2ZXIKPj4+PiB0ZWdyYTMwX2kyc19kYWlfdGVtcGxhdGUgPSB7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4gPSAyLAo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0g
U05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMg
PSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMg
PSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+IMKgwqDCoMKgwqAgfSwKPj4+
PiDCoMKgwqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RyZWFt
X25hbWUgPSAiQ2FwdHVyZSIsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4g
PSAyLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+PiAt
wqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xF
LAo+Pj4+IMKgwqDCoMKgwqAgfSwKPj4+PiDCoMKgwqDCoMKgIC5vcHMgPSAmdGVncmEzMF9pMnNf
ZGFpX29wcywKPj4+PiDCoMKgwqDCoMKgIC5zeW1tZXRyaWNfcmF0ZXMgPSAxLAo+Pj4+Cj4+Pgo+
Pj4gSGVsbG8sCj4+Pgo+Pj4gVGhpcyBwYXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBk
b24ndCBzZWUgZXJyb3JzIGFueXdoZXJlLCBidXQKPj4+IHRoZXJlIGlzIG5vIGF1ZGlvIGFuZCBy
ZXZlcnRpbmcgdGhpcyBwYXRjaCBoZWxwcy4gUGxlYXNlIGZpeCBpdC4KPj4KPj4gV2hhdCBpcyB0
aGUgZmFpbHVyZSBtb2RlPyBJIGNhbiB0cnkgYW5kIHRha2UgYSBsb29rIGF0IHRoaXMgc29tZSB0
aW1lCj4+IHRoaXMgd2VlaywgYnV0IEkgYW0gbm90IHN1cmUgaWYgSSBoYXZlIGFueSBib2FyZHMg
d2l0aCBhbiBhY3R1YWwgdXNlZnVsCj4+IGF1ZGlvIG91dHB1dD8KPiAKPiBUaGUgZmFpbHVyZSBt
b2RlIGlzIHRoYXQgdGhlcmUgbm8gc291bmQuIEkgYWxzbyBub3RpY2VkIHRoYXQgdmlkZW8KPiBw
bGF5YmFjayBzdHV0dGVycyBhIGxvdCBpZiBtb3ZpZSBmaWxlIGhhcyBhdWRpbyB0cmFjaywgc2Vl
bXMgc29tZXRoaW5nCj4gdGltZXMgb3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2suIEZv
ciBub3cgSSBkb24ndCBoYXZlIGFueSBtb3JlIGluZm8uCj4gCgpPaCwgSSBkaWRuJ3Qgc2F5IGhv
dyB0byByZXByb2R1Y2UgaXQuLiBmb3IgZXhhbXBsZSBzaW1wbHkgcGxheWluZwpiaWdfYnVja19i
dW5ueV83MjBwX2gyNjQubW92IGluIE1QViBoYXMgdGhlIGF1ZGlvIHByb2JsZW0uCgpodHRwczov
L2Rvd25sb2FkLmJsZW5kZXIub3JnL3BlYWNoL2JpZ2J1Y2tidW5ueV9tb3ZpZXMvYmlnX2J1Y2tf
YnVubnlfNzIwcF9oMjY0Lm1vdgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
