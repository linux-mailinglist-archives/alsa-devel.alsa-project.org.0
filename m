Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30C1430E2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 18:39:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF9D166E;
	Mon, 20 Jan 2020 18:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF9D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579541940;
	bh=vCfPxexBSFe9kUkJlI3XI433vDeTVfaVs2RKkihehTQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txuzs+USWHkz93EanIc0n8yACTqNXiOlALBoOH7zhErX82ccOLAnJJGFwzNnF6VKS
	 HCp77MNoMHsXdsdO5ONImyarVgZ54BwjIYpqi8/GGiWP/3tPYv70t4rriMD4Q8JvaE
	 OEtOeJYoDbndX1JrOdmoghPhiW9eaW2j/4rEYYM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 208BCF80217;
	Mon, 20 Jan 2020 18:37:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38CB0F8020C; Mon, 20 Jan 2020 18:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 108EBF8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 18:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108EBF8012F
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1itays-0004aj-J2; Mon, 20 Jan 2020 17:36:54 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
 <ebfaa0d3-1236-cac4-4bd8-4456a171d773@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f1f56dc5-c2d0-eb01-d68f-50f3f5d9fce1@codethink.co.uk>
Date: Mon, 20 Jan 2020 17:36:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ebfaa0d3-1236-cac4-4bd8-4456a171d773@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
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

T24gMjAvMDEvMjAyMCAxNjo1MCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA4LjAxLjIwMjAg
MTQ6MzcsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4KPj4gT24gMDcvMDEvMjAyMCAwMTozOSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/
0LjRiNC10YI6Cj4+Pj4gT24gMDUvMDEvMjAyMCAxMDo1MywgQmVuIERvb2tzIHdyb3RlOgo+Pj4+
Pgo+Pj4+Pgo+Pj4+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4+PiAwNS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+PiBb
c25pcF0KPj4+Pj4+Pgo+Pj4+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGluZy4KPj4+
Pj4+Pgo+Pj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3
b3JrLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBp
dCBsb29rcyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGlu
IDMyIGJpdCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+Pj4+
IGRvIDI0IGJpdCBpbiAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2Ft
cGxlIHN1cHBvcnQKPj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Pgo+Pj4+Pj4+IE15
IHByZWZlcmVuY2UgaXMgdG8gcmVtb3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0aGUg
MzIgYml0IGluLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxk
IHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IDI0Yml0IGZvcm1hdCBpc24ndAo+Pj4+Pj4gdXNhYmxl
IG9uIFQzMD8KPj4+Pj4KPj4+Pj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9uIG9mIDI0IHBhY2tlZCBp
bnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCB3b3JrLgo+Pj4+Pgo+Pj4+PiBJIGNhbiB0
cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5Lgo+Pj4+Cj4+Pj4gSSBuZWVk
IHRvIGNoZWNrIHNvbWUgdGhpbmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBp
dCBsb29rcwo+Pj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQgaW4gMzIgYml0cyBzbyB3ZSBtYXkg
YmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+Pj4gcmUtd3JpdGUgbXkgdGVzdCBjYXNlIHdoaWNo
IGFzc3VtZWQgaXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRfM0xFKS4KPj4+Pgo+Pj4+IEkn
bGwgZm9sbG93IHVwIGxhdGVyLAo+Pj4KPj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBv
cnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSSBicmllZmx5Cj4+PiBsb29rZWQgdGhy
b3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBh
Y2sKPj4+IGRhdGEgc3RyZWFtIGludG8gc29tZXRoaW5nIHRoYXQgY29kZWMgc3VwcG9ydHMsIGJ1
dCBtYXliZSBpdCdzIGEgd3JvbmcKPj4+IGltcHJlc3Npb24uCj4+Cj4+IEkgY2hhdHRlZCB3aXRo
IFNhbWVlciBhYm91dCB0aGlzLCBzbyB5ZXMgdGhlIEFIVUIgY2FuIHJlcGFjaywgYnV0IHRoZXJl
Cj4+IGlzIGEgcHJvYmxlbSB3aXRoIFMyNF9MRSB3aGVyZSBpZiB3ZSB0cnkgdG8gZXh0cmFjdCAy
NC1iaXRzIHdlIGFjdHVhbGx5Cj4+IGdldCB0aGUgdXBwZXIgMjQtYml0cyBhbmQgbm90IHRoZSBs
b3dlciBMU0JzIGluIHRoZSAzMi1iaXQgZGF0YSBlbGVtZW50Lgo+PiBTbyBhY3R1YWxseSB3ZSBk
b24ndCBzdXBwb3J0IFMyNF9MRS4KPj4KPj4gQmVuIGRvIHlvdSBuZWVkIDI0LWJpdCBzdXBwb3J0
IG9yIDMyLWJpdCBvciBib3RoPwoKSSB0aGluayB0aGUgUzI0IHNob3VsZCB3b3JrIHVucGFja2Vk
LiBUaGUgcGFja2VkIGp1c3QgZG9lc24ndCBzZWVtIHRvCmJlIGFuIG9wdGlvbiBvbiB0ZWdyYTIv
dGVncmEzIGhhcmR3YXJlICh0aGUgbWFudWFsIGRvZXMgbm90IHRhbGsgYWJvdXQKaXQgZWl0aGVy
KS4KCkkgd2lsbCB0cnkgYW5kIGdldCB0aGlzIGxvb2tlZCBhdCBhZ2FpbiBvbiBUaHVyc2RheSAy
M3JkIGFuZCBzZWUgaWYKSSBjYW4gcnVuIHNvbWUgbW9yZSB0ZXN0cyB3aXRoIDI0IHNhbXBsZSBk
YXRhIGluIHRoZSBpbnB1dCBmb3JtYXQgYW5kCmEgbG9naWMgYW5hbHlzZXIgb24gdGhlIG91dHB1
dC4KCgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3Ig
RW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29k
ZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
