Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F066E1092B8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 18:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6347916AB;
	Mon, 25 Nov 2019 18:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6347916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574702656;
	bh=TNfht0yKrH3Spc7zIeHKHLtERGgLm6PABG8U4xR4N68=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDSco3zEiyr9Uc0NcMGYeOKjGn0xo/eKxMmptEOBS9W40jWEnenea4oCyUxorMowA
	 HeIgPsZh/ysv+kUA7SJe4HO8itloLiCTjXd1rwHaODV6vVlTG0E5idjIL6LbYbBMr+
	 bcw1LBVeimoE2PaLfBVIKKWoSGxE/IDwB652Z4OY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B31F8016F;
	Mon, 25 Nov 2019 18:22:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376A2F8016F; Mon, 25 Nov 2019 18:22:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558BBF800E5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 18:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558BBF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G24mMKMY"
Received: by mail-lj1-x244.google.com with SMTP id k8so6294297ljh.5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qowBNgaS/cG3o3F9j5AsS7/c0rWS5qJJ/Vo+sJ+Tscg=;
 b=G24mMKMYtAaa38fkEKFBamsoFa1mqjTOOcuJD6J8rydd9ZSTW9SCUypcs3WZ/j5d1+
 iNMA6eYVSZ7K/idgUktQt6QOgO0qzbD1Zyd310kMr4CwxBV2fKMKDg9FzthsuJu4sRh+
 Nos+OBegfPNFutrSpKAauvXx4V8ynCnuzFUGDaP52Hza4O4okUA6FHtAbp+Sl/DfcZe/
 Szc+Ftd3A6WZD6bQ+4ibwJed4dT6BTQo4Cc/VaHeq8BO6O39xiHgfRVl06RTA18hM9Li
 gXwjcaA8yw0n+/xh1zaUYnB03n7TCYubPb/HGMAddcjjagwLwNBro1P9fZJUSWsyyEYi
 Hb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qowBNgaS/cG3o3F9j5AsS7/c0rWS5qJJ/Vo+sJ+Tscg=;
 b=Z5usLToH5T+Ayp1aQXPO5V00LavkmejFzxHhTCXZjTKwm+zZP0cxr+okQYPY1RzDww
 MHxe6r7gwl7ShW/xDEwwJXJecbFgdxYJVVdz0nNX3We7tLMVcoK0CUcsQlyJJWaMDCA8
 bKbHdd/039RfdOO+z1xVbnNBnmxLJOmQCazgvkQ8+epdjWsGdPKH0bYqjy/Ej/Fdqoe9
 jcOKLA+Su1YZgmYHeZtKogqTUXy2Qg8Q5THt74b0wPlQFwMareBRUa35urSAk8SJ+nWI
 N9HqmScH88Gi+dPEBYv8WeHvwx+R6D4Bj+e4YdakVBDSE9Hc8mkm3zxD3OUIAvmwScON
 ECeQ==
X-Gm-Message-State: APjAAAWk5JAL9/wuX+FCniDLXg63Wt/65kyVAuX0ngYzCPhhyusmosZV
 2Io3ZwXDoWV0xPTLNK5greM=
X-Google-Smtp-Source: APXvYqw0fYwsRdy4FHHLcYbxlAlM2QvVT0BkyTH2WfULzDXRA8VBboYRRHY0XILX9SwO35N8BewoSg==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr23125341ljj.243.1574702545877; 
 Mon, 25 Nov 2019 09:22:25 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id t17sm4265309ljc.88.2019.11.25.09.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 09:22:24 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
Date: Mon, 25 Nov 2019 20:22:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
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

MjUuMTEuMjAxOSAxMzozNywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMjMvMTEvMjAxOSAy
MTowOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAxOC4xMC4yMDE5IDE4OjQ4LCBCZW4gRG9v
a3Mg0L/QuNGI0LXRgjoKPj4+IEZyb206IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0
aGluay5jby51az4KPj4+Cj4+PiBUaGUgdGVncmEzIGF1ZGlvIGNhbiBzdXBwb3J0IDI0IGFuZCAz
MiBiaXQgc2FtcGxlIHNpemVzIHNvIGFkZCB0aGUKPj4+IG9wdGlvbiB0byB0aGUgdGVncmEzMF9p
MnNfaHdfcGFyYW1zIHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9yIFMzMl9MRQo+Pj4gZm9ybWF0
cyB3aGVuIHJlcXVlc3RlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVk
d2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51
azogZml4dXAgbWVyZ2Ugb2YgMjQgYW5kIDMyYml0XQo+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs6IGFkZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4+PiBbYmVuLmRvb2tzQGNv
ZGV0aGluay5jby51azogZHJvcCBkZWJ1ZyBwcmludGluZyB0byBkZXZfZGJnXQo+Pj4gU2lnbmVk
LW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+Pj4gLS0tCj4+
PiBzcXVhc2ggNWFlY2E1YTA1NWZkIEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKSBpcyBuZWVkZWQKPj4+IGluIHRkbSBjb2RlCj4+Pgo+Pj4gQVNvQzogdGVncmE6IGkyczog
cG1fcnVudGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+Pj4gLS0tCj4+PiDC
oCBzb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysr
LS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+
Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4gaW5kZXggNzNmMGRkZGVhZWYz
Li4wNjNmMzRjODgyYWYgMTAwNjQ0Cj4+PiAtLS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9p
MnMuYwo+Pj4gKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+IEBAIC0xMjcs
NyArMTI3LDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+PiBz
bmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBkYWktPmRldjsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfaTJzICppMnMg
PSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgbWFzaywgdmFsLCByZWc7Cj4+PiAtwqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0
ZSwgaTJzY2xvY2ssIGJpdGNudDsKPj4+ICvCoMKgwqAgaW50IHJldCwgc2FtcGxlX3NpemUsIHNy
YXRlLCBpMnNjbG9jaywgYml0Y250LCBhdWRpb19iaXRzOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
dGVncmEzMF9haHViX2NpZl9jb25mIGNpZl9jb25mOwo+Pj4gwqAgwqDCoMKgwqDCoCBpZiAocGFy
YW1zX2NoYW5uZWxzKHBhcmFtcykgIT0gMikKPj4+IEBAIC0xMzcsOCArMTM3LDE5IEBAIHN0YXRp
YyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+Pj4gc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwKPj4+IMKgwqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykp
IHsKPj4+IMKgwqDCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRToKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzE2Owo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAxNjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MyNF9MRToKPj4+ICvC
oMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMjQ7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAyNDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBicmVh
azsKPj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MzMl9MRToKPj4+ICvCoMKgwqDC
oMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzMyOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMzI7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgc2FtcGxlX3NpemUgPSAzMjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+
IMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZB
TDsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gQEAgLTE3MCw4ICsxODEsOCBAQCBzdGF0aWMgaW50IHRl
Z3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJl
YW0sCj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLnRocmVzaG9sZCA9IDA7Cj4+PiDCoMKgwqDCoMKg
IGNpZl9jb25mLmF1ZGlvX2NoYW5uZWxzID0gMjsKPj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYuY2xp
ZW50X2NoYW5uZWxzID0gMjsKPj4+IC3CoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9IFRFR1JB
MzBfQVVESU9DSUZfQklUU18xNjsKPj4+IC3CoMKgwqAgY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBU
RUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+PiArwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2JpdHMg
PSBhdWRpb19iaXRzOwo+Pj4gK8KgwqDCoCBjaWZfY29uZi5jbGllbnRfYml0cyA9IGF1ZGlvX2Jp
dHM7Cj4+PiDCoMKgwqDCoMKgIGNpZl9jb25mLmV4cGFuZCA9IDA7Cj4+PiDCoMKgwqDCoMKgIGNp
Zl9jb25mLnN0ZXJlb19jb252ID0gMDsKPj4+IMKgwqDCoMKgwqAgY2lmX2NvbmYucmVwbGljYXRl
ID0gMDsKPj4+IEBAIC0zMDYsMTQgKzMxNywxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9z
b2NfZGFpX2RyaXZlcgo+Pj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4gPSAyLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5j
aGFubmVsc19tYXggPSAyLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BD
TV9SQVRFXzgwMDBfOTYwMDAsCj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9Q
Q01fRk1UQklUX1MxNl9MRSwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BD
TV9GTVRCSVRfUzMyX0xFIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJW
X1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4gwqDCoMKgwqDCoCB9LAo+Pj4gwqDCoMKgwqDCoCAu
Y2FwdHVyZSA9IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RyZWFtX25hbWUgPSAiQ2FwdHVy
ZSIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnJh
dGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+IC3CoMKgwqDCoMKgwqDCoCAuZm9y
bWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mb3Jt
YXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+PiDCoMKgwqDCoMKgIH0sCj4+
PiDCoMKgwqDCoMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+IMKgwqDCoMKgwqAg
LnN5bW1ldHJpY19yYXRlcyA9IDEsCj4+Pgo+Pgo+PiBIZWxsbywKPj4KPj4gVGhpcyBwYXRjaCBi
cmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3JzIGFueXdoZXJlLCBidXQK
Pj4gdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNoIGhlbHBzLiBQbGVh
c2UgZml4IGl0Lgo+IAo+IFdoYXQgaXMgdGhlIGZhaWx1cmUgbW9kZT8gSSBjYW4gdHJ5IGFuZCB0
YWtlIGEgbG9vayBhdCB0aGlzIHNvbWUgdGltZQo+IHRoaXMgd2VlaywgYnV0IEkgYW0gbm90IHN1
cmUgaWYgSSBoYXZlIGFueSBib2FyZHMgd2l0aCBhbiBhY3R1YWwgdXNlZnVsCj4gYXVkaW8gb3V0
cHV0PwoKVGhlIGZhaWx1cmUgbW9kZSBpcyB0aGF0IHRoZXJlIG5vIHNvdW5kLiBJIGFsc28gbm90
aWNlZCB0aGF0IHZpZGVvCnBsYXliYWNrIHN0dXR0ZXJzIGEgbG90IGlmIG1vdmllIGZpbGUgaGFz
IGF1ZGlvIHRyYWNrLCBzZWVtcyBzb21ldGhpbmcKdGltZXMgb3V0IGR1cmluZyBvZiB0aGUgYXVk
aW8gcGxheWJhY2suIEZvciBub3cgSSBkb24ndCBoYXZlIGFueSBtb3JlIGluZm8uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
