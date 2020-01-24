Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263B148C9C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 17:58:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3F5168B;
	Fri, 24 Jan 2020 17:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3F5168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579885117;
	bh=YjcQ/HBPIvkoKYqYunbrsFHBGUMJ3Dz8Qk5sve/qA7M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiyvJESL+JPD9ynZZ7kDO5ADHEZ1i4wNSBmjlSD56vn27NMKYr65rVJZt5SRdBc0A
	 XrCdoSIWULUXI4R0dxDBNcORKYc4OMDZw4scJnqPYU9SPMv8nsqiXN1R2907TBTewI
	 1+edD/FSsKfG13ZUtJXGBXJXgI5yaw5Od8sO9K3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875B4F8020C;
	Fri, 24 Jan 2020 17:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C04EF8020C; Fri, 24 Jan 2020 17:56:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A521F800DE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 17:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A521F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="S1jw5ZDm"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2b21bc0000>; Fri, 24 Jan 2020 08:56:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 24 Jan 2020 08:56:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 24 Jan 2020 08:56:45 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 16:56:43 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>
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
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
Date: Fri, 24 Jan 2020 16:56:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579884988; bh=DnxLEe/tcLG8OVj4J+TQCZVsSNoC1OJ9n43A5kILK6c=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=S1jw5ZDmrK5cvVAzaWEnEqjw8q7YHodLdLtBF3UAffWQ+K8wd5GTXrTd8rpWNHZqj
 DAs6u1RNPHTdC8jxIPkDK191jeuHn52q4FLMQBUArK4Pr1D0v9/9tgfNatO6kRxlYz
 dyGC7SE+hprSPVOLBAC56H6z+2RZDqXK+Ig3ke/h0kb5wyYpQ/MmxiRrkovPr7Cisl
 Yg9oOwavJcBfPo9Z6wSFQQADrDde4Khu4+HvNPBQo02EFFDc1nad2vElYP9bBXiXcY
 AMixRG8ic2Qrm7KRexsdqJGhYB+alf0KnV60VBQfPzspdRw/+fB/o353TIRkcMX98u
 zqCeiaVXnaU2g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDIzLzAxLzIwMjAgMjE6NTksIEJlbiBEb29rcyB3cm90ZToKPiBPbiAyMy8wMS8yMDIwIDE5
OjM4LCBCZW4gRG9va3Mgd3JvdGU6Cj4+IE9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBPc2lw
ZW5rbyB3cm90ZToKPj4+IDA2LjAxLjIwMjAgMjI6MDAsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+
Pj4+IE9uIDA1LzAxLzIwMjAgMTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+
Pj4gT24gMjAyMC0wMS0wNSAwMTo0OCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4gMDUu
MDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4gW3NuaXBdCj4+Pj4+
Pj4KPj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+Pj4+Pj4KPj4+Pj4+
PiBTb21lIHNpbXBsZSBkYXRhIHRlc3RzIHNob3cgMTYgYW5kIDMyLWJpdHMgd29yay4KPj4+Pj4+
Pgo+Pj4+Pj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwgaXQgbG9va3MgbGlr
ZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+Pj4+PiAyNCBiaXQgc2FtcGxlcyBpbiAzMiBiaXQgd29y
ZHMuIEkgY2FuJ3Qgc2VlIGFueSBwYWNraW5nIG9wdGlvbnMgdG8KPj4+Pj4+PiBkbyAyNCBiaXQg
aW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBwb3J0
Cj4+Pj4+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pj4+Pj4KPj4+Pj4+PiBNeSBwcmVmZXJlbmNl
IGlzIHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdAo+Pj4+
Pj4+IGluLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxkIHlv
dSBwbGVhc2UgY29uZmlybSB0aGF0IDI0Yml0IGZvcm1hdCBpc24ndAo+Pj4+Pj4gdXNhYmxlIG9u
IFQzMD8KPj4+Pj4KPj4+Pj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9uIG9mIDI0IHBhY2tlZCBpbnRv
IDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZAo+Pj4+PiB3b3JrLgo+Pj4+Pgo+Pj4+PiBJIGNh
biB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5Lgo+Pj4+Cj4+Pj4gSSBu
ZWVkIHRvIGNoZWNrIHNvbWUgdGhpbmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRz
LCBpdCBsb29rcwo+Pj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQgaW4gMzIgYml0cyBzbyB3ZSBt
YXkgYmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+Pj4gcmUtd3JpdGUgbXkgdGVzdCBjYXNlIHdo
aWNoIGFzc3VtZWQgaXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRfM0xFKS4KPj4+Pgo+Pj4+
IEknbGwgZm9sbG93IHVwIGxhdGVyLAo+Pj4KPj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1
cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSSBicmllZmx5Cj4+PiBsb29rZWQg
dGhyb3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNvdWxkIHJl
LXBhY2sKPj4+IGRhdGEgc3RyZWFtIGludG8gc29tZXRoaW5nIHRoYXQgY29kZWMgc3VwcG9ydHMs
IGJ1dCBtYXliZSBpdCdzIGEgd3JvbmcKPj4+IGltcHJlc3Npb24uCj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4KPj4gSSBkaWQgYSBxdWljayB0ZXN0IHdpdGggdGhlIGZv
bGxvd2luZzoKPj4KPj4gwqDCoHNveCAtbiAtYiAxNiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndh
dsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4gwqDCoHNveCAtbiAtYiAyNCAtYyAyIC1yIDQ0
MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4gwqDCoHNveCAtbiAt
YiAzMiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUK
Pj4KPj4gVGhlIDE2IGFuZCAzMiB3b3JrIGZpbmUsIHRoZSAyNCBpcyBzaG93aW5nIGEgcGxheWJh
Y2sgb3V0cHV0IGZyZXEKPj4gb2YgNDQwSHogaW5zdGVhZCBvZiA1MDBIei4uLiB0aGlzIHN1Z2dl
c3RzIHRoZSBjbG9jayBpcyBvZmYsIG9yIHRoZXJlCj4+IGlzIHNvbWV0aGluZyBlbHNlIHdlaXJk
IGdvaW5nIG9uLi4uCj4+Cj4gCj4gSSBzaG91bGQgaGF2ZSBjaGVja2VkIHBsbF9hX291dDAgcmF0
ZSwgZm9yIDI0Yml0IDJjaCwgSSBnZXQKPiBwbGxfYV9vdXQgYXQgd2hpY2ggbWFrZXM6Cj4gCj4g
MTEyODk2MDAvKDI0KjIqNDQxMDApID0gNS4zMzMzMzMzMzMzCj4gCj4gRm9yIHNvbWUgcmVhc29u
IHRoZSBQTEwgY2FuJ3QgZ2V0IGEgZGVjZW50IGRpdmlzb3IgZm9yIHRoaXMuCgpZZXMgdGhhdCBp
cyBnb2luZyB0byBiZSBhIHByb2JsZW0uIEkgYXNzdW1lIHRoYXQgeW91ciBjb2RlYyB3YW50cyBh
CjI1NipmcyBNQ0xLPyBNYXliZSBpbiB0aGF0IGNhc2UgeW91IGFyZSBiZXR0ZXIgb2ZmIGhhdmlu
ZyB0aGUgY29kZWMKZHJpdmUgdGhlIGJpdCBjbG9jayBhbmQgZnN5bmM/CgpJcyAyNC1iaXQgY3Jp
dGljYWwgdG8gd2hhdCB5b3UgYXJlIGRvaW5nPwoKT3RoZXJ3aXNlIG1heWJlIHdlIHNob3VsZCBk
cm9wIHRoZSAyNC1iaXQgc3VwcG9ydCBmb3Igbm93IGFuZCBqdXN0IGtlZXAKMzItYml0LgoKSm9u
CgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
