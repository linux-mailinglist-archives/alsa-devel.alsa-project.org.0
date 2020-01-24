Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D814147C9C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 10:53:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FCE166C;
	Fri, 24 Jan 2020 10:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FCE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579859601;
	bh=hrousJUPx6JUZakj7kBAqNxi/A15KXZYOvJmvpr9Vgg=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixHg/6bvgQ7eflZSM5S0v3IdhB+gKQwXNs8+nvIlAj/gYNFK8q/h52QksMpgR2rjY
	 JqVTnOCgShdJl4Qwk5e7scwGPJtFV8VG28sS4YVLiIHSQpZBg1BlKKhU9jHVlLLVAH
	 BWnliSaUtFbRrP5a3pw0reQqEdrILVfNaF9nidEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0FCF80229;
	Fri, 24 Jan 2020 10:51:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD64F8020C; Fri, 24 Jan 2020 10:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AAD4F800BA
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 10:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AAD4F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Bk1vimbW"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2abe130000>; Fri, 24 Jan 2020 01:51:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 24 Jan 2020 01:51:29 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 24 Jan 2020 01:51:29 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 09:51:26 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
Message-ID: <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
Date: Fri, 24 Jan 2020 09:51:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579859475; bh=BhDleast9LuvQxUZx9yNqe9Bj3o/7udKwCoxfMF5oWM=;
 h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Bk1vimbW6xL2jVwyO3bsS9EMmPp9GMv3D0o09KKBs/88NO9R/NTNvb2y0qQVeobI5
 nT9rCtDZgysjY5JjLfrce5yczLEqXQzXXLuYXTCdQN6s/Xa5/PpBE58P72HpZlBhHz
 SpuYYN7iG1Uo6ftnK5RWM2ZZwyt47IJUj9ppG5mX3qV7ewtGuJlVqdGxkL+VScZ4En
 y1J6NHo07k8AStlbILkvphRCSRhTp1hQz8OWz53WaFpQBiYCvR3i03yPGETTDrfr3/
 4yPKm/H4MVIyVE3Biq7oTocZPOAO6SKojFfO3REoQt9HLy4ESP9OH19TJmEE/bI54J
 Of8r+Dj7uOBHA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, atalambedu@nvidia.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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

Ck9uIDI0LzAxLzIwMjAgMDk6MDcsIEpvbiBIdW50ZXIgd3JvdGU6Cj4gCj4gT24gMjMvMDEvMjAy
MCAxNToxNiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyMy4wMS4yMDIwIDEyOjIyLCBTYW1l
ZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4+Cj4+Pgo+Pj4gT24gMS8yMi8yMDIwIDk6NTcgUE0sIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Bl
bmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Pj4+Cj4+Pj4KPj4+PiAyMi4wMS4yMDIwIDE0OjUy
LCBKb24gSHVudGVyINC/0LjRiNC10YI6Cj4+Pj4+IE9uIDIyLzAxLzIwMjAgMDc6MTYsIFNhbWVl
ciBQdWphciB3cm90ZToKPj4+Pj4KPj4+Pj4gLi4uCj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiArc3RhdGlj
IGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+
Pj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJsZSgm
cGRldi0+ZGV2KTsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVz
X3N1c3BlbmRlZCgmcGRldi0+ZGV2KSkKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+Pj4+Pj4+
Pj4gVGhpcyBicmVha3MgZGV2aWNlJ3MgUlBNIHJlZmNvdW50aW5nIGlmIGl0IHdhcyBkaXNhYmxl
ZCBpbiB0aGUKPj4+Pj4+Pj4+Pj4gYWN0aXZlCj4+Pj4+Pj4+Pj4+IHN0YXRlLiBUaGlzIGNvZGUg
c2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4KPj4+Pj4+Pj4+Pj4gYWJv
dXQgdGhlCj4+Pj4+Pj4+Pj4+IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3Vs
ZG4ndCBiZSBuZWNlc3NhcnkuCj4+Pj4+Pj4+Pj4gSSBndWVzcyB0aGlzIHdhcyBhZGRlZCBmb3Ig
c2FmZXR5IGFuZCBleHBsaWNpdCBzdXNwZW5kIGtlZXBzIGNsb2NrCj4+Pj4+Pj4+Pj4gZGlzYWJs
ZWQuCj4+Pj4+Pj4+Pj4gTm90IHN1cmUgaWYgcmVmLWNvdW50aW5nIG9mIHRoZSBkZXZpY2UgbWF0
dGVycyB3aGVuIHJ1bnRpbWUgUE0gaXMKPj4+Pj4+Pj4+PiBkaXNhYmxlZCBhbmQgZGV2aWNlIGlz
IHJlbW92ZWQuCj4+Pj4+Pj4+Pj4gSSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3YXkuCj4+
Pj4+Pj4+PiBJdCBzaG91bGQgbWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBi
ZWNhdXNlIFJQTSBzaG91bGQKPj4+Pj4+Pj4+IGJlIGluCj4+Pj4+Pj4+PiBhIHdyZWNrZWQgc3Rh
dGUgb25jZSB5b3UnbGwgdHJ5IHRvIHJlLWxvYWQgdGhlIGRyaXZlcidzIG1vZHVsZS4KPj4+Pj4+
Pj4+IExpa2VseQo+Pj4+Pj4+Pj4gdGhhdCB0aG9zZSBmZXcgb3RoZXIgZHJpdmVycyBhcmUgd3Jv
bmcuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gW3NuaXBdCj4+Pj4+Pj4+IE9uY2UgdGhlIGRyaXZlciBp
cyByZS1sb2FkZWQgYW5kIFJQTSBpcyBlbmFibGVkLCBJIGRvbid0IHRoaW5rIGl0Cj4+Pj4+Pj4+
IHdvdWxkIHVzZQo+Pj4+Pj4+PiB0aGUgc2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcg
cmVmIGNvdW50LiBEb2Vzbid0IGl0IHVzZSB0aGUKPj4+Pj4+Pj4gbmV3Cj4+Pj4+Pj4+IGNvdW50
ZXJzPwo+Pj4+Pj4+PiBJZiBSUE0gaXMgbm90IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uLCBtb3N0
IGxpa2VseSBpdCB3b3VsZCBiZSB0aGUKPj4+Pj4+Pj4gY2FzZQo+Pj4+Pj4+PiBmb3Igb3RoZXIK
Pj4+Pj4+Pj4gZGV2aWNlcy4gV2hhdCBiZXN0IGRyaXZlciBjYW4gZG8gaXMgcHJvYmFibHkgZG8g
YSBmb3JjZSBzdXNwZW5kCj4+Pj4+Pj4+IGR1cmluZwo+Pj4+Pj4+PiByZW1vdmFsIGlmCj4+Pj4+
Pj4+IGFscmVhZHkgbm90IGRvbmUuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAsIHNpbmNlIG11bHRp
cGxlIGRyaXZlcnMKPj4+Pj4+Pj4gc3RpbGwKPj4+Pj4+Pj4gaGF2ZSBpdCwKPj4+Pj4+Pj4gdW5s
ZXNzIHRoZXJlIGlzIGEgcmVhbCBoYXJtIGluIGRvaW5nIHNvLgo+Pj4+Pj4+IEkgdG9vayBhIGNs
b3NlciBsb29rIGFuZCBsb29rcyBsaWtlIHRoZSBjb3VudGVyIGFjdHVhbGx5IHNob3VsZCBiZQo+
Pj4+Pj4+IHJlc2V0LiBTdGlsbCBJIGRvbid0IHRoaW5rIHRoYXQgaXQncyBhIGdvb2QgcHJhY3Rp
Y2UgdG8gbWFrZSBjaGFuZ2VzCj4+Pj4+Pj4gdW5kZXJuZWF0aCBvZiBSUE0sIGl0IG1heSBzdHJp
a2UgYmFjay4KPj4+Pj4+IElmIFJQTSBpcyBicm9rZW4sIGl0IHByb2JhYmx5IHdvdWxkIGhhdmUg
YmVlbiBjYXVnaHQgZHVyaW5nIGRldmljZQo+Pj4+Pj4gdXNhZ2UuCj4+Pj4+PiBJIHdpbGwgcmVt
b3ZlIGV4cGxpY2l0IHN1c3BlbmQgaGVyZSBpZiBubyBhbnkgY29uY2VybnMgZnJvbSBvdGhlcgo+
Pj4+Pj4gZm9sa3MuCj4+Pj4+PiBUaGFua3MuCj4+Pj4+IEkgcmVjYWxsIHRoYXQgdGhpcyB3YXMg
dGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcgdGhpcyBmcm9tIHRoZSBSUE0KPj4+Pj4gZm9sa3Mu
IFRlZ3JhMzAgSTJTIGRyaXZlciBkb2VzIHRoZSBzYW1lIGFuZCBTdGVwaGVuIGhhZCBwb2ludGVk
IG1lIHRvCj4+Pj4+IHRoaXMgYXMgYSByZWZlcmVuY2UuCj4+Pj4+IEkgYmVsaWV2ZSB0aGF0IHRo
aXMgaXMgbWVhbnQgdG8gZW5zdXJlIHRoYXQgdGhlCj4+Pj4+IGRldmljZSBpcyBhbHdheXMgcG93
ZXJlZC1vZmYgcmVnYXJkbGVzcyBvZiBpdCBSUE0gaXMgZW5hYmxlZCBvciBub3QgYW5kCj4+Pj4+
IHdoYXQgdGhlIGN1cnJlbnQgc3RhdGUgaXMuCj4+Pj4gWWVzLCBpdCB3YXMga2luZGEgYWN0dWFs
IGZvciB0aGUgY2FzZSBvZiB1bmF2YWlsYWJsZSBSUE0uCj4+Pgo+Pj4+IEFueXdheXMsIC9JIHRo
aW5rLyB2YXJpYW50IGxpa2UgdGhpcyBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgcHJlZmVycmVkOgo+
Pj4+Cj4+Pj4gaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoJnBkZXYtPmRldikpCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+Pj4+
IGVsc2UKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2
KTsKPj4+Cj4+PiBJIHRoaW5rIGl0IGxvb2tzIHRvIGJlIHNpbWlsYXIgdG8gd2hhdCBpcyB0aGVy
ZSBhbHJlYWR5Lgo+Pj4KPj4+IHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsgLy8gaXQg
d291bGQgdHVybiBvdXQgdG8gYmUgYSBkdW1teSBjYWxsCj4+PiBpZiAhUlBNCj4+PiBpZiAoIXBt
X3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+ZGV2KSkgLy8gaXQgaXMgdHJ1ZSBhbHdh
eXMgaWYgIVJQTQo+Pj4gwqDCoMKgwqDCoMKgwqAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVu
ZCgmcGRldi0+ZGV2KTsKPj4KPj4gTWF5YmUgdGhpcyBpcyBmaW5lIGZvciAhUlBNLCBidXQgbm90
IHJlYWxseSBmaW5lIGluIGEgY2FzZSBvZiBlbmFibGVkCj4+IFJQTS4gRGV2aWNlIGNvdWxkIGJl
IGluIHJlc3VtZWQgc3RhdGUgYWZ0ZXIgcG1fcnVudGltZV9kaXNhYmxlKCkgaWYgaXQKPj4gd2Fz
bid0IHN1c3BlbmRlZCBiZWZvcmUgdGhlIGRpc2FibGluZy4KPiAKPiBJIGRvbid0IHNlZSBhbnkg
cHJvYmxlbSB3aXRoIHRoaXMgZm9yIHRoZSAhUlBNIGNhc2UuCgpTb3JyeSBJIG1lYW50IHRoZSBS
UE0gY2FzZS4gSW4gb3RoZXIgd29yZHMsIEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSBmb3IKbmVpdGhl
ciB0aGUgUlBNIGNhc2Ugb2YgdGhlICFSUE0gY2FzZS4KCkpvbgoKLS0gCm52cHVibGljCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
