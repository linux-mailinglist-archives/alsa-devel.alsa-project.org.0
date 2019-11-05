Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFCF06C9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 21:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2F316DA;
	Tue,  5 Nov 2019 21:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2F316DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572985266;
	bh=bgFL9aSr0c1cIMdAw88N/xSekbdxZytmyW131jSq8GA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsHrejk4KVtPq10rzuGAHOXN6zQmz3yDLE46v1W/o093V0y51ce+aVx5/prJKsAaA
	 SfpXofT2fDmWKmd44aC8JonrB9qhoBKJE1icu6C/7IeIixaWjkFpNlZt4PoF+eDE8X
	 zmHpkJX+PQ/q9Rjt2qtcTmNkB/GEvDmV5F6igwvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A71F8053B;
	Tue,  5 Nov 2019 21:19:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B68F8049B; Tue,  5 Nov 2019 21:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D644F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 21:19:15 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1F909A0042;
 Tue,  5 Nov 2019 21:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1F909A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572985155; bh=MRp6rCcBkxaHccXVe1WYmbv7/8EkhSkZRCwyrKA+bEQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cSAtyrQMCTBnMH6/qhI+Bdj8xCcYuAAR342rFAvkYJkRG/VB6QNcjjS4KKpkYNlEK
 2iys6CjsgQzz0hJjpPqZgnVmsuorkhxDpRHRBdu8pLifgqtH0L6eugMCOpUC/62YNn
 mDN3JOzNgrMvQpiNNyEotp87N6WzacMjNU65LlfI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  5 Nov 2019 21:19:10 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <2598c6a8-ce64-ad7e-ee34-8ea930b3cf7d@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f16e60b0-dd72-d84f-a01c-886e48a86bbc@perex.cz>
Date: Tue, 5 Nov 2019 21:19:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2598c6a8-ce64-ad7e-ee34-8ea930b3cf7d@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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

RG5lIDA1LiAxMS4gMTkgdiAyMDo1MiBQaWVycmUtTG91aXMgQm9zc2FydCBuYXBzYWwoYSk6Cj4g
Cj4gCj4gT24gMTEvNS8xOSAxOjM2IFBNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4+IEhpIGFs
bCwKPj4KPj4gICDCoMKgwqDCoEkgbWFrZSBzb21lIGludGVybmFsIHVjbSBjb2RlIGNsZWFudXBz
IGluIGFsc2EtbGliIGFuZCBhZGRlZCB0aHJlZQo+PiBtYWpvciBleHRlbnNpb25zIHRvIGFsbG93
IG1vcmUgY29tcGxleCBjb25maWd1cmF0aW9ucyB3aGljaCB3ZSByZXF1aXJlCj4+IGZvciB0aGUg
U09GIGtlcm5lbCBkcml2ZXIuCj4gCj4gR3JlYXQsIHRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlz
IQo+IAo+Pgo+PiAgIMKgwqDCoMKgVGhlIGZpcnN0IHRoaW5nIGlzIHRoZSBhZGRlZCBzdWJzdGl0
dXRpb24gZm9yIHRoZSB2YWx1ZSBzdHJpbmdzOgo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vYWxz
YS1wcm9qZWN0L2Fsc2EtbGliL2NvbW1pdC9mMWU2MzdiMjg1ZThlMDRlNjc2MTI0OGEwNzBmNThm
M2E4ZmRlNmZjCj4+Cj4+Cj4+ICAgwqDCoMKgwqBUaGUgc2Vjb25kIHRoaW5nIGlzIHRoZSBJZiBi
bG9jazoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21t
aXQvOTg1NzE1Y2U4MTQ4ZGM3ZWY2MmM4ZTNkOGNlNWEwYzJhYzUxZjhkZgo+IAo+IGlzIGl0IHBv
c3NpYmxlIGZvciB0aGUgQ29uZGl0aW9uIHRvIGNoZWNrIGlmIHRoZSBjYXJkIGNvbnRhaW5zIHRo
ZSBTT0YKPiBwcmVmaXg/Cj4gCj4gRm9yIEJheXRyYWlsL0NoZXJyeXRyYWlsIHN1cHBvcnQsIHdl
IGhhdmUgYSB0b24gb2YgZXhpc3RpbmcgVUNNIGZpbGVzLAo+IGFuZCB0aGUgb25seSB0aGluZyBu
ZWVkZWQgaXMgZS5nLgo+IC0gdG8gY2hhbmdlIGZyb20gaHc6Ynl0Y3JydDU2NDAgdG8gaHc6c29m
Ynl0Y3J0NTY0MAoKSXQgaXMgZWFzeSB3aXRoIHRoZSBwcm9wb3NlZCBzdWJzdGl0dXRpb24sIGp1
c3QgdXNlIGh3OiR7Q2FyZElkfSBoZXJlLiBJdCBjYW4gCmZvciBhbnkgdmFsdWVzIChsaWtlIFBD
TSBkZXZpY2UgbmFtZXMgZXRjLikuCgo+IC0gbWFrZSB0aGUgY29udHJvbHMgZm9yIHRoZSBsZWdh
Y3kgZHJpdmVyIGNvbmRpdGlvbmFsCj4gCj4gU2VjdGlvblZlcmIgewo+IAlFbmFibGVTZXF1ZW5j
ZSBbCj4gCQkKPiAJCWlmIChjYXJkIG5hbWUgZG9lcyBub3QgY29udGFpbiBTT0YpCj4gCQk8cGxh
dGZvcm1zL2J5dGNyL1BsYXRmb3JtRW5hYmxlU2VxLmNvbmY+Cj4gCQllbmRpZgo+IAkJPGNvZGVj
cy9ydDU2NDAvRW5hYmxlU2VxLmNvbmY+Cj4gCV0KClRoZSBJZiBibG9ja3MgY2Fubm90IGJlIHVz
ZWQgaW4gc2VxdWVuY2VzLCBidXQgeW91IGNhbiBkbyBiYXNpY2FsbHkgdGhpcyB3aXRoIAp0aGUg
cHJvcG9zZWQgSWYgZXh0ZW5zaW9uOgoKU2VjdGlvblZlcmIgewoJSWYuMSB7CgkJQ29uZGl0aW9u
IHsKCQkJVHlwZSBTdHJpbmdFcXVhbAoJCQlTdHJpbmcxICIke0NhcmROYW1lfSIKCQkJU3RyaW5n
MiAiYnl0Y3J0NTY0MCIKCQl9CgkJVHJ1ZSB7CgkJCUVuYWJsZVNlcXVlbmNlIFsKCQkJCTxwbGF0
Zm9ybXMvYnl0Y3IvUGxhdGZvcm1FbmFibGVTZXEuY29uZj4KCQkJCTxjb2RlY3MvcnQ1NjQwL0Vu
YWJsZVNlcS5jb25mPgoJCQldCgkJfQoJCUZhbHNlIHsKCQkJRW5hYmxlU2VxdWVuY2UgWwoJCQkJ
PGNvZGVjcy9ydDU2NDAvRW5hYmxlU2VxLmNvbmY+CgkJCV0KCQl9Cgl9Cn0KClRoZSBjb25kaXRp
b24gd2l0aCAiVHlwZSBTdHJpbmdFcXVhbCIgaXMgbm90IGltcGxlbWVudGVkIHlldCwgYnV0IGl0
J3MgZWFzeSB0byAKYWRkIG5ldyBjb25kaXRpb25zIHRvIG15IHByb3Bvc2VkIGNvZGUuIElmIHlv
dSBzZWUgc29tZXRoaW5nIGVsc2UgdG8gYmUgCmNvbXBhcmVkLCBqdXN0IGxldCBtZSBrbm93IHRv
IGFkZCB0aG9zZSBjb25kaXRpb25zIGluIHRoZSBmaXJzdCBwaGFzZS4KCj4gTW9zdCBvZiB0aGUg
aW5mb3JtYXRpb24gdGhhdCBtYXR0ZXJzIGZvciB0aG9zZSBVQ00gZmlsZXMgaXMgdGhlIHR5cGUg
b2YKPiBwZXJpcGhlcmFscyBhbmQgdGhlIG1hdGNoaW5nIG1peGVyIGNvbmZpZ3VyYXRpb24gZm9y
IHRoZSBjb2RlYyBkcml2ZXIsCj4gYW5kIHdlIHNob3VsZCByZXVzZSB0aGlzIGluZm9ybWF0aW9u
IGJldHdlZW4gbGVnYWN5IGFuZCBTT0YuCgpZZXMsIEkgc2VlIHRoZSBkZW1hbmQgdG8gbWFrZSB0
aGUgZGVzY3JpcHRpb24gbW9yZSB1bml2ZXJzYWwgYW5kIGVhc3kgdG8gcmVhZC4KCk5vdGUgdGhh
dCBjZGV2IGlzIGFscmVhZHkgaW5pdGlhbGl6ZWQgZnJvbSB0aGUgVmFsdWVEZWZhdWx0cyB7fSBz
ZWN0aW9uIApQbGF5YmFja0NUTC9DYXB0dXJlQ1RMIHZhbHVlcyBldmVuIGluIHRoZSBvbGQgY29k
ZSwgc28gdGhlIG1vc3Qgb2YgY2RldiAKZGVjbGFyYXRpb25zIGFyZSBub3QgbmVjZXNzYXJ5IGlu
IHRoZSBjdXJyZW50IFVDTSBjb25maWdzIHRvby4gV2hlbiB0aGUgCnVzZS1jYXNlIGNvbmZpZ3Vy
YXRpb24gaXMgdGllZCB0byB0aGUgb25lIGNhcmQsIEkgYWRkZWQgdGhlIGNvZGUgdG8gdXNlIGl0
IAppbXBsaWNpdGx5LCBzbyBjZGV2IGNhbiBiZSByZWFsbHkgb21pdHRlZC4gV2l0aCB0aGUgcHJv
cG9zZWQgY29kZSwgdGhlIApQbGF5YmFja0NUTC9DYXB0dXJlQ1RMIGFyZSBhbHdheXMgYXZhaWxh
YmxlIGZvciB0aGUgb25lIGNhcmQgY29uZmlnczoKCmh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS1saWIvY29tbWl0L2MwOTkzMjljZTZmZmRiMjZmYzdhNGE2ZmZiNmZiYjE2NmEx
ZTg1NmIKCgkJCQkJSmFyb3NsYXYKCi0tIApKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6
PgpMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
