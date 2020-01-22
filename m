Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B514541C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 12:54:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765C6168B;
	Wed, 22 Jan 2020 12:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765C6168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579694053;
	bh=DabACMylQvXObdWmau+tQpTk53Okzpt2XowLzwVwmYo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IW7xOsEK5BYlTOpxlZelR2wL8macsEu4vWdIaZgsPpBFJLPIt2aOtM75eDKB+RtuT
	 4WUumY+eCZ16dwQxUfcGOWWKfX2ty1gCqgiavJD9spnDI4lu4vQjxcBIYTx/0Jiqph
	 RElnbdGFPrRCTVeY+ZTwcK3yZ3vLpmEBTFbw/QGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36999F8020C;
	Wed, 22 Jan 2020 12:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E9C2F8020C; Wed, 22 Jan 2020 12:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8129DF800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 12:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8129DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WdjJGNZ+"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2837640000>; Wed, 22 Jan 2020 03:52:06 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 22 Jan 2020 03:52:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 22 Jan 2020 03:52:21 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jan
 2020 11:52:17 +0000
To: Sameer Pujar <spujar@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
Date: Wed, 22 Jan 2020 11:52:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579693926; bh=L+WKarEuaJmFD3C6XaQOv9lM1k6insdFfgdLwCP9YYM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WdjJGNZ+SKYDjmcbQLw7ufIdQm17d7TcWNRdgZG20fNLJegRVnOWw4PFuLOGPSfrh
 2beUm9Vzys0K+h84AQjGZx4cXK91lcIToww0+UsbK/8RAnU6AUIkEc1e5OWc5LIM6i
 wIMM1yCjRsdpoDCPv1rSNIVfWQjtbphOBTIRHpFw4wyGXqu67KK6d/SefllbB8F3p2
 Jy6zM5UoopaGL0SZtkoH2Np/g0Wm0PjaFU4dAsDtXZ+g3ipTtRhm5BaWPCC/qdWw5A
 npys/yOwLnsGh+qSN9ljgdNDDQZC3ySqAZPrKhgNzbZa2nfrGCboW0JFAbva3jBMU9
 abyF6R5zOlpvA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, atalambedu@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com, rlokhande@nvidia.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDIyLzAxLzIwMjAgMDc6MTYsIFNhbWVlciBQdWphciB3cm90ZToKCi4uLgoKPj4+Pj4+PiAr
c3RhdGljIGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2
LT5kZXYpOwo+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRl
ZCgmcGRldi0+ZGV2KSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlZ3JhMjEw
X2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pj4+PiBUaGlzIGJyZWFrcyBkZXZp
Y2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluIHRoZSBhY3RpdmUKPj4+
Pj4+IHN0YXRlLiBUaGlzIGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxk
IHdhcm4gYWJvdXQgdGhlCj4+Pj4+PiB1bnhwZWN0ZWQgUlBNIHN0YXRlIGhlcmUsIGJ1dCBpdCBz
aG91bGRuJ3QgYmUgbmVjZXNzYXJ5Lgo+Pj4+PiBJIGd1ZXNzIHRoaXMgd2FzIGFkZGVkIGZvciBz
YWZldHkgYW5kIGV4cGxpY2l0IHN1c3BlbmQga2VlcHMgY2xvY2sKPj4+Pj4gZGlzYWJsZWQuCj4+
Pj4+IE5vdCBzdXJlIGlmIHJlZi1jb3VudGluZyBvZiB0aGUgZGV2aWNlIG1hdHRlcnMgd2hlbiBy
dW50aW1lIFBNIGlzCj4+Pj4+IGRpc2FibGVkIGFuZCBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+Pj4g
SSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3YXkuCj4+Pj4gSXQgc2hvdWxkIG1hdHRlciAo
aWYgSSdtIG5vdCBtaXNzaW5nIHNvbWV0aGluZykgYmVjYXVzZSBSUE0gc2hvdWxkCj4+Pj4gYmUg
aW4KPj4+PiBhIHdyZWNrZWQgc3RhdGUgb25jZSB5b3UnbGwgdHJ5IHRvIHJlLWxvYWQgdGhlIGRy
aXZlcidzIG1vZHVsZS4gTGlrZWx5Cj4+Pj4gdGhhdCB0aG9zZSBmZXcgb3RoZXIgZHJpdmVycyBh
cmUgd3JvbmcuCj4+Pj4KPj4+PiBbc25pcF0KPj4+IE9uY2UgdGhlIGRyaXZlciBpcyByZS1sb2Fk
ZWQgYW5kIFJQTSBpcyBlbmFibGVkLCBJIGRvbid0IHRoaW5rIGl0Cj4+PiB3b3VsZCB1c2UKPj4+
IHRoZSBzYW1lICdkZXYnIGFuZCB0aGUgY29ycmVzcG9uZGluZyByZWYgY291bnQuIERvZXNuJ3Qg
aXQgdXNlIHRoZSBuZXcKPj4+IGNvdW50ZXJzPwo+Pj4gSWYgUlBNIGlzIG5vdCB3b3JraW5nIGZv
ciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUgdGhlIGNhc2UKPj4+IGZvciBv
dGhlcgo+Pj4gZGV2aWNlcy4gV2hhdCBiZXN0IGRyaXZlciBjYW4gZG8gaXMgcHJvYmFibHkgZG8g
YSBmb3JjZSBzdXNwZW5kIGR1cmluZwo+Pj4gcmVtb3ZhbCBpZgo+Pj4gYWxyZWFkeSBub3QgZG9u
ZS4gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCwgc2luY2UgbXVsdGlwbGUgZHJpdmVycyBzdGlsbAo+
Pj4gaGF2ZSBpdCwKPj4+IHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBzby4K
Pj4gSSB0b29rIGEgY2xvc2VyIGxvb2sgYW5kIGxvb2tzIGxpa2UgdGhlIGNvdW50ZXIgYWN0dWFs
bHkgc2hvdWxkIGJlCj4+IHJlc2V0LiBTdGlsbCBJIGRvbid0IHRoaW5rIHRoYXQgaXQncyBhIGdv
b2QgcHJhY3RpY2UgdG8gbWFrZSBjaGFuZ2VzCj4+IHVuZGVybmVhdGggb2YgUlBNLCBpdCBtYXkg
c3RyaWtlIGJhY2suCj4gCj4gSWYgUlBNIGlzIGJyb2tlbiwgaXQgcHJvYmFibHkgd291bGQgaGF2
ZSBiZWVuIGNhdWdodCBkdXJpbmcgZGV2aWNlIHVzYWdlLgo+IEkgd2lsbCByZW1vdmUgZXhwbGlj
aXQgc3VzcGVuZCBoZXJlIGlmIG5vIGFueSBjb25jZXJucyBmcm9tIG90aGVyIGZvbGtzLgo+IFRo
YW5rcy4KCkkgcmVjYWxsIHRoYXQgdGhpcyB3YXMgdGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcg
dGhpcyBmcm9tIHRoZSBSUE0KZm9sa3MuIFRlZ3JhMzAgSTJTIGRyaXZlciBkb2VzIHRoZSBzYW1l
IGFuZCBTdGVwaGVuIGhhZCBwb2ludGVkIG1lIHRvCnRoaXMgYXMgYSByZWZlcmVuY2UuIEkgYmVs
aWV2ZSB0aGF0IHRoaXMgaXMgbWVhbnQgdG8gZW5zdXJlIHRoYXQgdGhlCmRldmljZSBpcyBhbHdh
eXMgcG93ZXJlZC1vZmYgcmVnYXJkbGVzcyBvZiBpdCBSUE0gaXMgZW5hYmxlZCBvciBub3QgYW5k
CndoYXQgdGhlIGN1cnJlbnQgc3RhdGUgaXMuCgpOb3cgZm9yIFRlZ3JhMjEwIChvciBhY3R1YWxs
eSA2NC1iaXQgVGVncmEpIFJQTSBpcyBhbHdheXMgZW5hYmxlZCBhbmQgc28Kd2UgZG9uJ3QgbmVl
ZCB0byB3b3JyeSBhYm91dCB0aGUgIVJQTSBjYXNlLiBIb3dldmVyLCBJIHN0aWxsIGRvbid0IHNl
ZQp0aGUgaGFybSBpbiB0aGlzLgoKSm9uCgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
