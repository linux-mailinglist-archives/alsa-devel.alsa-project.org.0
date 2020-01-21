Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB3144424
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 19:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47A3285D;
	Tue, 21 Jan 2020 19:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47A3285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579630652;
	bh=2TtVyCaIkEyEcz/aN+y4/9dm4nq/5GbQ7ESTYOYwCtk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kg7ggb36TUyyxqgNhXki4lAl58frd2RmKJF1pgX3M4E9oiCH5g7/15hvGwQmwBoUL
	 Yr2f8fjdx6X7zPBTxD5+roFPAYNQ7otlFUFZ4J5zrQJis8xSOjXOFpSbk2bWtr+cjL
	 s/NbB3ZWxTSuWG/4eVVGIYYacpXe7flBQkXImPMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0D8F801D9;
	Tue, 21 Jan 2020 19:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0CCFF801D9; Tue, 21 Jan 2020 19:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0308F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 19:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0308F800CB
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ity3m-0001jr-ND; Tue, 21 Jan 2020 18:15:30 +0000
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
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
 <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <9fc97644-b679-ef9f-41ca-1d3a5f296f3a@codethink.co.uk>
Date: Tue, 21 Jan 2020 18:15:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMDcvMDEvMjAyMCAxMDoyOSwgSm9uIEh1bnRlciB3cm90ZToKPiAKPiBPbiAwNS8wMS8yMDIw
IDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDA1LjAxLjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C4
0YjQtdGCOgo+Pj4+IFtzbmlwXQo+Pj4+Cj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0
aW5nLgo+Pj4+Cj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRz
IHdvcmsuCj4+Pj4KPj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxv
b2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIgYml0
IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4gZG8gMjQgYml0
IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3VwcG9y
dAo+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Cj4+Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byBy
ZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+Pj4KPj4+
Cj4+PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRi
aXQgZm9ybWF0IGlzbid0Cj4+PiB1c2FibGUgb24gVDMwPwo+Pgo+PiBJZiB0aGVyZSBpcyBhbiBv
cHRpb24gb2YgMjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGluayB0aGF0IHdvdWxkIHdvcmsu
Cj4+Cj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4g
Cj4gSSB3aWxsIGNoZWNrIG9uIHRoaXMuIEkgd291bGQgaGF2ZSB0aG91Z2h0IHRoYXQgUzI0X0xF
ICgyNC1iaXRzIHBhY2tlZAo+IGludG8gMzItYml0IGVsZW1lbnRzKSB3b3VsZCBiZSBmaW5lLiBU
eXBpY2FsbHkgd2UgZG9uJ3Qgc3VwcG9ydCBTMjRfM0xFCj4gKDI0LWJpdHMgaW4gMjQtYml0IGVs
ZW1lbnRzKS4KPiAKCkkndmUganVzdCBoYWQgdG8gc3BlbmQgdGltZSBmaXhpbmcgcHVsc2V2aWV3
L3NpZ3JvaydzIGkycyBoYW5kbGluZyBmb3IKdGhpcywgYnV0IGhhdmUgcnVuIGEgc2ltcGxlIHRl
c3Qgb2YgUzI0X0xFIHVzaW5nIGEgcGF0dGVybiBnZW5lcmF0b3IKYW5kIHRoZSBsb3cgbGV2ZWwg
b3V0cHV0IGxvb2tzIG9rLgoKSSB3aWxsIHRlc3QgYSBiaXQgbW9yZSB0b21vcnJvdywgYnV0IEkg
c3VzcGVjdCBzb21ldGhpbmcgZWxzZSBpcyBlaXRoZXIKZ2V0dGluZyBTMjRfTEUgd3Jvbmcgb3Ig
d2UgaGF2ZSBzb21lIG90aGVyIGlzc3VlLgoKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5j
b2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcg
R2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
