Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98471471E2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 20:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A359166F;
	Thu, 23 Jan 2020 20:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A359166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579808440;
	bh=F2pF/8tM1dCcKUqcndlymlTj/rt5lKP/8EA+RUahqRU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXXfMbVOhgnoZW0lIzTQEJ9+5qHVgCJozw5e21h5pUcg2N7vF0597AewVzAyH/g4f
	 WKKXjvTmr9DbO6THSgd27dWfxN1FssWd86Gf79ApPqepW4Hp0iwP0NWMROMTp+2Y5e
	 8/9L/AIeBnqRoIeG7gddcxiISXSX3rHCGZqDspfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6608F801D9;
	Thu, 23 Jan 2020 20:38:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 156C5F801D9; Thu, 23 Jan 2020 20:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61654F80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 20:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61654F80112
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iuiJL-0002aX-3C; Thu, 23 Jan 2020 19:38:39 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
Date: Thu, 23 Jan 2020 19:38:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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

T24gMDcvMDEvMjAyMCAwMTozOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA2LjAxLjIwMjAg
MjI6MDAsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+PiBPbiAwNS8wMS8yMDIwIDEwOjUzLCBCZW4g
RG9va3Mgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lw
ZW5rbyB3cm90ZToKPj4+PiAwNS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoK
Pj4+Pj4gW3NuaXBdCj4+Pj4+Cj4+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGluZy4K
Pj4+Pj4KPj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRzIHdv
cmsuCj4+Pj4+Cj4+Pj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwgaXQgbG9v
a3MgbGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIgYml0
IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4+IGRvIDI0IGJp
dCBpbiAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2FtcGxlIHN1cHBv
cnQKPj4+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pj4+Cj4+Pj4+IE15IHByZWZlcmVuY2UgaXMg
dG8gcmVtb3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0aGUgMzIgYml0IGluLgo+Pj4+
Pgo+Pj4+Cj4+Pj4gSW50ZXJlc3RpbmcuLiBKb24sIGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB0
aGF0IDI0Yml0IGZvcm1hdCBpc24ndAo+Pj4+IHVzYWJsZSBvbiBUMzA/Cj4+Pgo+Pj4gSWYgdGhl
cmUgaXMgYW4gb3B0aW9uIG9mIDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3
b3VsZCB3b3JrLgo+Pj4KPj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBv
biBNb25kYXkuCj4+Cj4+IEkgbmVlZCB0byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0
IHdhcyAyNCBwYWNrZWQgYml0cywgaXQgbG9va3MKPj4gbGlrZSB0aGUgZGVmYXVsdCBpcyAyNCBp
biAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4gSG93ZXZlciBJIG5lZWQgdG8KPj4gcmUtd3JpdGUg
bXkgdGVzdCBjYXNlIHdoaWNoIGFzc3VtZWQgaXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRf
M0xFKS4KPj4KPj4gSSdsbCBmb2xsb3cgdXAgbGF0ZXIsCj4gCj4gT2theSwgdGhlIFMyNF8zTEUg
aXNuJ3Qgc3VwcG9ydGVkIGJ5IFJUNTY0MCBjb2RlYyBpbiBteSBjYXNlLiBJIGJyaWVmbHkKPiBs
b29rZWQgdGhyb3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJlc3Npb24gdGhhdCBBSFVCIGNv
dWxkIHJlLXBhY2sKPiBkYXRhIHN0cmVhbSBpbnRvIHNvbWV0aGluZyB0aGF0IGNvZGVjIHN1cHBv
cnRzLCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4gaW1wcmVzc2lvbi4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KCkkgZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dp
bmc6CgogIHNveCAtbiAtYiAxNiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdiAgc3ludGggc2lu
ZSA1MDAgdm9sIDAuNQogIHNveCAtbiAtYiAyNCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdiAg
c3ludGggc2luZSA1MDAgdm9sIDAuNQogIHNveCAtbiAtYiAzMiAtYyAyIC1yIDQ0MTAwIC90bXAv
dG1wLndhdiAgc3ludGggc2luZSA1MDAgdm9sIDAuNQoKVGhlIDE2IGFuZCAzMiB3b3JrIGZpbmUs
IHRoZSAyNCBpcyBzaG93aW5nIGEgcGxheWJhY2sgb3V0cHV0IGZyZXEKb2YgNDQwSHogaW5zdGVh
ZCBvZiA1MDBIei4uLiB0aGlzIHN1Z2dlc3RzIHRoZSBjbG9jayBpcyBvZmYsIG9yIHRoZXJlCmlz
IHNvbWV0aGluZyBlbHNlIHdlaXJkIGdvaW5nIG9uLi4uCgotLSAKQmVuIERvb2tzCQkJCWh0dHA6
Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJv
dmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
