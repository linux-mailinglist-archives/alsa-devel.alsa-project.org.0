Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEA145298
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 11:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B088167C;
	Wed, 22 Jan 2020 11:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B088167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579688949;
	bh=LBFsTftv7u1A38xtJeKOj5zJPYSvffU5X9lu0ybemIU=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5AMVnh4Owi21VcoklqIxlxx6KUFDvg8dVlUnUnUQ7ZsXnhjC/CWXPCsUrXKVc0P9
	 hMHzHhJ72lRzsgQklx2jp+5dcfuWOvKGadUdq9o2PX/c4HsL58yxFPCw3KTMxhPHs+
	 9ud1brzkLo5m8PAe7XK+MO6nzkTQkoG5wv/dn/MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A0AF80229;
	Wed, 22 Jan 2020 11:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57743F8020C; Wed, 22 Jan 2020 11:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924A4F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 11:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924A4F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UT+V8Myz"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e28235b0000>; Wed, 22 Jan 2020 02:26:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 22 Jan 2020 02:27:18 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 22 Jan 2020 02:27:18 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jan
 2020 10:27:17 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <oder_chiou@realtek.com>, <tiwai@suse.com>, <perex@perex.cz>
References: <1579501059-27936-1-git-send-email-spujar@nvidia.com>
 <74a42452-f19c-1175-9928-da12ccad621d@nvidia.com>
Message-ID: <c700f22c-a053-7f39-dddf-41abe52cad77@nvidia.com>
Date: Wed, 22 Jan 2020 15:57:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <74a42452-f19c-1175-9928-da12ccad621d@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579688795; bh=aOUpxcs01cAOKV7qZxiqe8Ru3nWAKUx3d66imq+9Gc8=;
 h=X-PGP-Universal:CC:Subject:From:To:References:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=UT+V8MyzsoZwqaheHe11ny+p2EYWQQpzLLwRbECavHI77aKmrMj65Dn2ZJEr76dpW
 1ZuCKOlYzS/9zsponl4ftlITWjxKCgTEodFSu/VQynzjMLNWmaZfUbCvqZHsBBg3q1
 RXoAYhQyoxop+j1E9E1D+MBI+bJ8pBrhQpIvNu4GXrQzAq4N4DSCmajmD98k+9z41C
 QHgp3BnGRcLtPXxRq3ht9BLAjRiirgoye/4JDP5U1dWYyJwU4B1uApuwa6RiDAnmdh
 231OeUlu+uy53fjsersCopfge1onr8U58DKu+2TvZ+X7FBHLtagI2oRk40p7ig7wT/
 tOgTGgjXiA21Q==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5659: add S32_LE format
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

SGkgUmV2aWV3ZXJzLAoKS2luZGx5IHJldmlldy4gVGhhbmtzLgoKT24gMS8yMC8yMDIwIDExOjU0
IEFNLCBTYW1lZXIgUHVqYXIgd3JvdGU6Cj4gUmVtb3ZpbmcgQmFyZChiYXJkbGlhb0ByZWFsdGVr
LmNvbSkgZnJvbSAidG8iIGxpc3Qgc2luY2UgSSBhbSBnZXR0aW5nIAo+IHVuZGVsaXZlcmVkIG1l
c3NhZ2UuCj4KPiBPZGVyLAo+IFBsZWFzZSBhZGQgcmlnaHQgZm9sa3MgYXMgeW91IGZlZWwgbmVj
ZXNzYXJ5LiBUaGFua3MuCj4KPiBPbiAxLzIwLzIwMjAgMTE6NDcgQU0sIFNhbWVlciBQdWphciB3
cm90ZToKPj4gQUxDNTY1OSBzdXBwb3J0cyBtYXhpbXVtIGRhdGEgbGVuZ3RoIG9mIDI0LWJpdC4g
Q3VycmVudGx5IGRyaXZlciAKPj4gc3VwcG9ydHMKPj4gUzI0X0xFIHdoaWNoIGlzIGEgMzItYml0
IGNvbnRhaW5lciB3aXRoIHZhbGlkIGRhdGEgaW4gWzIzOjBdIGFuZCAwcyAKPj4gaW4gTVNCLgo+
PiBTMjRfM0xFIGlzIG5vdCBjb21tb25seSB1c2VkIGFuZCBpcyBoYXJkIHRvIGZpbmQgYXVkaW8g
c3RyZWFtcyB3aXRoIHRoaXMKPj4gZm9ybWF0LiBBbHNvIG1hbnkgU29DIEhXIGRvIG5vdCBzdXBw
b3J0IFMyNF9MRSBhbmQgUzMyX0xFIGlzIHVzZWQgaW4KPj4gZ2VuZXJhbC4gVGhlIDI0LWJpdCBk
YXRhIGNhbiBiZSByZXByZXNlbnRlZCBpbiBTMzJfTEUgWzMxOjhdIGFuZCAwcyBhcmUKPj4gcGFk
ZGVkIGluIExTQi4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIFMzMl9MRSB0byBBTEM1NjU5IGRyaXZl
ciBhbmQgZGF0YSBsZW5ndGggZm9yIHRoaXMgaXMgc2V0Cj4+IHRvIDI0IGFzIHBlciBjb2RlYydz
IG1heGltdW0gZGF0YSBsZW5ndGggc3VwcG9ydC4gVGhpcyBoZWxwcyB0byBwbGF5Cj4+IDI0LWJp
dCBhdWRpbywgcGFja2VkIGluIFMzMl9MRSwgb24gSFcgd2hpY2ggZG8gbm90IHN1cHBvcnQgUzI0
X0xFLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW1lZXIgUHVqYXIgPHNwdWphckBudmlkaWEuY29t
Pgo+PiAtLS0KPj4gwqAgc291bmQvc29jL2NvZGVjcy9ydDU2NTkuYyB8IDQgKysrLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NTY1OS5jIGIvc291bmQvc29jL2NvZGVjcy9ydDU2
NTkuYwo+PiBpbmRleCBmYzc0ZGQ2My4uZjkxMGRkZiAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29j
L2NvZGVjcy9ydDU2NTkuYwo+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY1OS5jCj4+IEBA
IC0zMzM5LDYgKzMzMzksNyBAQCBzdGF0aWMgaW50IHJ0NTY1OV9od19wYXJhbXMoc3RydWN0IAo+
PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmFs
X2xlbiB8PSBSVDU2NTlfSTJTX0RMXzIwOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
IMKgwqDCoMKgwqAgY2FzZSAyNDoKPj4gK8KgwqDCoCBjYXNlIDMyOgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgdmFsX2xlbiB8PSBSVDU2NTlfSTJTX0RMXzI0Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4+IMKgwqDCoMKgwqAgY2FzZSA4Ogo+PiBAQCAtMzczMyw3ICszNzM0LDggQEAgc3Rh
dGljIGludCBydDU2NTlfcmVzdW1lKHN0cnVjdCAKPj4gc25kX3NvY19jb21wb25lbnQgKmNvbXBv
bmVudCkKPj4gwqAgwqAgI2RlZmluZSBSVDU2NTlfU1RFUkVPX1JBVEVTIFNORFJWX1BDTV9SQVRF
XzgwMDBfMTkyMDAwCj4+IMKgICNkZWZpbmUgUlQ1NjU5X0ZPUk1BVFMgKFNORFJWX1BDTV9GTVRC
SVRfUzE2X0xFIHwgCj4+IFNORFJWX1BDTV9GTVRCSVRfUzIwXzNMRSB8IFwKPj4gLcKgwqDCoMKg
wqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwgU05EUlZfUENNX0ZNVEJJVF9TOCkKPj4g
K8KgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwgU05EUlZfUENNX0ZNVEJJ
VF9TMzJfTEUgfCBcCj4+ICvCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1M4KQo+PiDC
oCDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29wcyBydDU2NTlfYWlmX2RhaV9v
cHMgPSB7Cj4+IMKgwqDCoMKgwqAgLmh3X3BhcmFtcyA9IHJ0NTY1OV9od19wYXJhbXMsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
