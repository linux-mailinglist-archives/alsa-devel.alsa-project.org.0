Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7814CFF0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:54:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FF81683;
	Wed, 29 Jan 2020 18:53:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FF81683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580320456;
	bh=zM3dTYoKVGMxDTRfkVwldZFuu0v94S1DtxfcU09V1EU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/8pc/mYWS/g7a4FpKqhrIrUukl2TYPXwjMwu8SALO+k9HEcjMTYJ1aYFgsawufev
	 Eh3Nb5tYKyqlyLhU9rIDw11Oa/04ssIhLwxkHnw8QfxR2dzYoADnzXnfwAWFYyYKFp
	 E3htAWtq1Bo1sq+gOU0+3q9aMEKjtoFwfPN84n9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E9BF80122;
	Wed, 29 Jan 2020 18:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C13CDF8021E; Wed, 29 Jan 2020 18:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8890AF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:52:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8890AF80123
Received: from [167.98.27.226] (helo=[172.16.102.1])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iwrVm-00040q-HW; Wed, 29 Jan 2020 17:52:22 +0000
To: Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f225524b-91a4-e87d-6834-1b776de774c1@codethink.co.uk>
Date: Wed, 29 Jan 2020 17:52:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128121315.GD4689@sirena.org.uk>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

T24gMjgvMDEvMjAyMCAxMjoxMywgTWFyayBCcm93biB3cm90ZToKPiBPbiBNb24sIEphbiAyNywg
MjAyMCBhdCAxMDoyMDoyNVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDI0LjAx
LjIwMjAgMTk6NTAsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPiAKPj4+ICAgICAgICAgICAgICAg
ICAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+ICAgICAgICAgICAgICAg
ICAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUgfAo+IAo+PiBJdCBzaG91bGQg
c29sdmUgdGhlIHByb2JsZW0gaW4gbXkgcGFydGljdWxhciBjYXNlLCBidXQgSSdtIG5vdCBzdXJl
IHRoYXQKPj4gdGhlIHNvbHV0aW9uIGlzIGNvcnJlY3QuCj4gCj4gSWYgdGhlIGZvcm1hdCBpbXBs
ZW1lbnRlZCBieSB0aGUgZHJpdmVyIGlzIFMyNF8zTEUgdGhlIGRyaXZlciBzaG91bGQKPiBhZHZl
cnRpc2UgUzI0XzNMRS4KCkkgYW0gZmFpcmx5IHN1cmUgdGhlIGZvcm1hdCBpcyBTMjRfTEUsIHRo
ZSB0ZWdyYTMgaGFyZHdhcmUgb25seQpzdXBwb3J0cyAyNGJpdHMgcGFkZGVkIHRvIDMyIGJpdHMu
Cgo+PiBUaGUgdjUuNSBrZXJuZWwgaXMgcmVsZWFzZWQgbm93IHdpdGggdGhlIGJyb2tlbiBhdWRp
byBhbmQgYXBwYXJlbnRseQo+PiBnZXR0aW5nIDI0Yml0IHRvIHdvcmsgd29uJ3QgYmUgdHJpdmlh
bCAoaWYgcG9zc2libGUgYXQgYWxsKS4gQmVuLCBjb3VsZAo+PiB5b3UgcGxlYXNlIHNlbmQgYSBw
YXRjaCB0byBmaXggdjUuNSBieSByZW1vdmluZyB0aGUgUzI0IHN1cHBvcnQKPj4gYWR2ZXJ0aXNl
bWVudCBmcm9tIHRoZSBkcml2ZXI/Cj4gCj4gV2h5IGlzIHRoYXQgdGhlIGJlc3QgZml4IHJhdGhl
ciB0aGFuIGp1c3QgYWR2ZXJ0aXNpbmcgdGhlIGZvcm1hdAo+IGltcGxlbWVudGVkIGJ5IHRoZSBk
cml2ZXI/Cj4gCj4gSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBhbGwgdGFr
aW5nIHNvIGxvbmcsIHRoaXMgdGhyZWFkCj4ganVzdCBzZWVtcyB0byBiZSBnb2luZyByb3VuZCBp
biBpbnRlcm1pbmFibGUgY2lyY2xlcyBsb25nIGFmdGVyIGl0Cj4gbG9va2VkIGxpa2UgdGhlIGlz
c3VlIHdhcyB1bmRlcnN0b29kLiAgSSBoYXZlIHRvIGFkbWl0IEkndmUgbm90IHJlYWQKPiBldmVy
eSBzaW5nbGUgbWVzc2FnZSBpbiB0aGUgdGhyZWFkIGJ1dCBpdCdzIGRpZmZpY3VsdCB0byBzZWUg
d2h5IGl0Cj4gZG9lc24ndCBzZWVtIHRvIGJlIG1ha2luZyBhbnkgcHJvZ3Jlc3MuCj4gCgoKLS0g
CkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVy
CQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5j
by51ay9wcml2YWN5Lmh0bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
