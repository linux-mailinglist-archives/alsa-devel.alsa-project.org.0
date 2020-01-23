Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE52146487
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 10:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A953168E;
	Thu, 23 Jan 2020 10:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A953168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579771454;
	bh=H8qROHQHhqa0fxcMu0QOXWyKYGuhkH8DUFIN0oH+0oQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxbz5TebLdT90VAM5JHihyV2JphO9RFvGSOWu8K7Fe5N0a4gTJ5X80KvH6fh3lzMn
	 vznu0ABXGDFG8CO/osmE9qns+ZJ4319iu938Goq1rDLNW2fsuqjyspjDUeUjQbQy2r
	 G39KjlSZS+sG6L4C8PF7SA948wX/zUTPxasQ833g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC1CF801ED;
	Thu, 23 Jan 2020 10:22:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668B1F801D9; Thu, 23 Jan 2020 10:22:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36407F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 10:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36407F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="CnIey0gh"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2965a10000>; Thu, 23 Jan 2020 01:21:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jan 2020 01:22:22 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jan 2020 01:22:22 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 09:22:17 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
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
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
Date: Thu, 23 Jan 2020 14:52:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579771297; bh=W73gVUmkU4iyhPeM1GjN5RD8ETiMnoanQX2UieDd3Rw=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=CnIey0ghCRC/n4tFmo3bopQyZk5SDOV0BWv3LXEUuReEEwe10a/yb+43qvSNXNPXW
 62DxKirTbhxa1nkfJI+Z5pqNSob6hO4l5UzA/6Z9RFRUzes2XdT+VzfJaf3LoaNMgF
 OCoTqniXGmAp7+9n0IOzEwThzzcFJpruKuO16EtOY9s9bFPRkIUKklDiprGDp/z1BV
 AM13q7aA72hVd9wla4i4+k75NK157rsT5BfqoPqJPNu2u0sSlenmP8qyXqOGG6G/tm
 z/3t6CJbNoLeIOOdxP/Ddq5zG4CLB89lgnLtLLhzl2Av2qzPncJEdcMvMLav7U/Ol4
 NAHxD8YJxLOqw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxLzIyLzIwMjAgOTo1NyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDIy
LjAxLjIwMjAgMTQ6NTIsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4gT24gMjIvMDEvMjAyMCAw
NzoxNiwgU2FtZWVyIFB1amFyIHdyb3RlOgo+Pgo+PiAuLi4KPj4KPj4+Pj4+Pj4+ICtzdGF0aWMg
aW50IHRlZ3JhMjEwX2kyc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+
Pj4+Pj4+ICt7Cj4+Pj4+Pj4+PiArICAgICBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7
Cj4+Pj4+Pj4+PiArICAgICBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+
ZGV2KSkKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVu
ZCgmcGRldi0+ZGV2KTsKPj4+Pj4+Pj4gVGhpcyBicmVha3MgZGV2aWNlJ3MgUlBNIHJlZmNvdW50
aW5nIGlmIGl0IHdhcyBkaXNhYmxlZCBpbiB0aGUgYWN0aXZlCj4+Pj4+Pj4+IHN0YXRlLiBUaGlz
IGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4gYWJvdXQgdGhl
Cj4+Pj4+Pj4+IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3VsZG4ndCBiZSBu
ZWNlc3NhcnkuCj4+Pj4+Pj4gSSBndWVzcyB0aGlzIHdhcyBhZGRlZCBmb3Igc2FmZXR5IGFuZCBl
eHBsaWNpdCBzdXNwZW5kIGtlZXBzIGNsb2NrCj4+Pj4+Pj4gZGlzYWJsZWQuCj4+Pj4+Pj4gTm90
IHN1cmUgaWYgcmVmLWNvdW50aW5nIG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3aGVuIHJ1bnRpbWUg
UE0gaXMKPj4+Pj4+PiBkaXNhYmxlZCBhbmQgZGV2aWNlIGlzIHJlbW92ZWQuCj4+Pj4+Pj4gSSBz
ZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3YXkuCj4+Pj4+PiBJdCBzaG91bGQgbWF0dGVyIChp
ZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBiZWNhdXNlIFJQTSBzaG91bGQKPj4+Pj4+IGJl
IGluCj4+Pj4+PiBhIHdyZWNrZWQgc3RhdGUgb25jZSB5b3UnbGwgdHJ5IHRvIHJlLWxvYWQgdGhl
IGRyaXZlcidzIG1vZHVsZS4gTGlrZWx5Cj4+Pj4+PiB0aGF0IHRob3NlIGZldyBvdGhlciBkcml2
ZXJzIGFyZSB3cm9uZy4KPj4+Pj4+Cj4+Pj4+PiBbc25pcF0KPj4+Pj4gT25jZSB0aGUgZHJpdmVy
IGlzIHJlLWxvYWRlZCBhbmQgUlBNIGlzIGVuYWJsZWQsIEkgZG9uJ3QgdGhpbmsgaXQKPj4+Pj4g
d291bGQgdXNlCj4+Pj4+IHRoZSBzYW1lICdkZXYnIGFuZCB0aGUgY29ycmVzcG9uZGluZyByZWYg
Y291bnQuIERvZXNuJ3QgaXQgdXNlIHRoZSBuZXcKPj4+Pj4gY291bnRlcnM/Cj4+Pj4+IElmIFJQ
TSBpcyBub3Qgd29ya2luZyBmb3Igc29tZSByZWFzb24sIG1vc3QgbGlrZWx5IGl0IHdvdWxkIGJl
IHRoZSBjYXNlCj4+Pj4+IGZvciBvdGhlcgo+Pj4+PiBkZXZpY2VzLiBXaGF0IGJlc3QgZHJpdmVy
IGNhbiBkbyBpcyBwcm9iYWJseSBkbyBhIGZvcmNlIHN1c3BlbmQgZHVyaW5nCj4+Pj4+IHJlbW92
YWwgaWYKPj4+Pj4gYWxyZWFkeSBub3QgZG9uZS4gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCwgc2lu
Y2UgbXVsdGlwbGUgZHJpdmVycyBzdGlsbAo+Pj4+PiBoYXZlIGl0LAo+Pj4+PiB1bmxlc3MgdGhl
cmUgaXMgYSByZWFsIGhhcm0gaW4gZG9pbmcgc28uCj4+Pj4gSSB0b29rIGEgY2xvc2VyIGxvb2sg
YW5kIGxvb2tzIGxpa2UgdGhlIGNvdW50ZXIgYWN0dWFsbHkgc2hvdWxkIGJlCj4+Pj4gcmVzZXQu
IFN0aWxsIEkgZG9uJ3QgdGhpbmsgdGhhdCBpdCdzIGEgZ29vZCBwcmFjdGljZSB0byBtYWtlIGNo
YW5nZXMKPj4+PiB1bmRlcm5lYXRoIG9mIFJQTSwgaXQgbWF5IHN0cmlrZSBiYWNrLgo+Pj4gSWYg
UlBNIGlzIGJyb2tlbiwgaXQgcHJvYmFibHkgd291bGQgaGF2ZSBiZWVuIGNhdWdodCBkdXJpbmcg
ZGV2aWNlIHVzYWdlLgo+Pj4gSSB3aWxsIHJlbW92ZSBleHBsaWNpdCBzdXNwZW5kIGhlcmUgaWYg
bm8gYW55IGNvbmNlcm5zIGZyb20gb3RoZXIgZm9sa3MuCj4+PiBUaGFua3MuCj4+IEkgcmVjYWxs
IHRoYXQgdGhpcyB3YXMgdGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcgdGhpcyBmcm9tIHRoZSBS
UE0KPj4gZm9sa3MuIFRlZ3JhMzAgSTJTIGRyaXZlciBkb2VzIHRoZSBzYW1lIGFuZCBTdGVwaGVu
IGhhZCBwb2ludGVkIG1lIHRvCj4+IHRoaXMgYXMgYSByZWZlcmVuY2UuCj4+IEkgYmVsaWV2ZSB0
aGF0IHRoaXMgaXMgbWVhbnQgdG8gZW5zdXJlIHRoYXQgdGhlCj4+IGRldmljZSBpcyBhbHdheXMg
cG93ZXJlZC1vZmYgcmVnYXJkbGVzcyBvZiBpdCBSUE0gaXMgZW5hYmxlZCBvciBub3QgYW5kCj4+
IHdoYXQgdGhlIGN1cnJlbnQgc3RhdGUgaXMuCj4gWWVzLCBpdCB3YXMga2luZGEgYWN0dWFsIGZv
ciB0aGUgY2FzZSBvZiB1bmF2YWlsYWJsZSBSUE0uCgo+IEFueXdheXMsIC9JIHRoaW5rLyB2YXJp
YW50IGxpa2UgdGhpcyBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgcHJlZmVycmVkOgo+Cj4gaWYgKCFw
bV9ydW50aW1lX2VuYWJsZWQoJnBkZXYtPmRldikpCj4gICAgICAgICAgdGVncmEyMTBfaTJzX3J1
bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPiBlbHNlCj4gICAgICAgICAgcG1fcnVudGltZV9k
aXNhYmxlKCZwZGV2LT5kZXYpOwoKSSB0aGluayBpdCBsb29rcyB0byBiZSBzaW1pbGFyIHRvIHdo
YXQgaXMgdGhlcmUgYWxyZWFkeS4KCnBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsgLy8g
aXQgd291bGQgdHVybiBvdXQgdG8gYmUgYSBkdW1teSBjYWxsIAppZiAhUlBNCmlmICghcG1fcnVu
dGltZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKSAvLyBpdCBpcyB0cnVlIGFsd2F5cyBp
ZiAhUlBNCiDCoMKgwqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2
LT5kZXYpOwo+PiBOb3cgZm9yIFRlZ3JhMjEwIChvciBhY3R1YWxseSA2NC1iaXQgVGVncmEpIFJQ
TSBpcyBhbHdheXMgZW5hYmxlZCBhbmQgc28KPj4gd2UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91
dCB0aGUgIVJQTSBjYXNlLiBIb3dldmVyLCBJIHN0aWxsIGRvbid0IHNlZQo+PiB0aGUgaGFybSBp
biB0aGlzLgo+IFRoZXJlIGlzIG5vIHJlYWwgaGFybSB0b2RheSwgYnV0Ogo+Cj4gMS4gSSdkIHBy
ZWZlciB0byBiZSB2ZXJ5IGNhcmVmdWwgd2l0aCBSUE0gaW4gZ2VuZXJhbCwgYmFzZWQgb24KPiAg
ICAgcHJldmlvdXMgZXhwZXJpZW5jZS4KPgo+IDIuIEl0IHNob3VsZCBiZSBhIGJ1ZyBpZiBkZXZp
Y2UgaXNuJ3QgUlBNLXN1c3BlbmRlZCBkdXJpbmcKPiAgICAgb2YgZHJpdmVyJ3MgcmVtb3ZhbC4g
VGh1cyB0aGUgcmVhbCBwcm9ibGVtIG5lZWRzIHRvIGJlIGZpeGVkCj4gICAgIHJhdGhlciB0aGFu
IHdvcmtlZCBhcm91bmQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
