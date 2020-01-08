Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B831340A8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 12:38:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA5D1724;
	Wed,  8 Jan 2020 12:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA5D1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578483536;
	bh=vUzDFxZeRBFmBsKHcYpNjOuWi3gn599H/lpzZ/7RZBE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVU9nNvrv2KU3D/+Ha2xCAGF31a6jgB1su70oBKKHHPeu9ll/DISnnnVLyj47JVDg
	 mMh1jgzwPY73CWVf0t0n99MInlbNrpguQu/mtSjXA9ohzDL21Z9J7Hpc1yw5IS+6nx
	 /uV0frOPzTQBy9PWyQAU81+muHQzx34q3MFI9UDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F15C5F801DA;
	Wed,  8 Jan 2020 12:37:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C260AF80159; Wed,  8 Jan 2020 12:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9FBAF8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 12:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9FBAF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XbeUcaL2"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e15beb10000>; Wed, 08 Jan 2020 03:36:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 08 Jan 2020 03:37:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 08 Jan 2020 03:37:05 -0800
Received: from [10.26.11.166] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jan
 2020 11:37:03 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
Date: Wed, 8 Jan 2020 11:37:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578483377; bh=dYqCYpyA+YSDumfzCyTXML6rROERaETgBf76DVaUj+s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XbeUcaL2L1P0MY/s9+CmgLadUUKXJxTmaE3xy0PCNSkmR6m4ERO4prDp2ptGhgZzD
 YxGmdiyca1OdGveGQ6zJcKrEaGgS5d/urR+/aZ8LIzfucITeGYNcvu24+Te4a7N9WW
 edUwI92TqFCXnR3HXjnevciWx+FQY/AjxglrHuEjm+2ygSAweXrlKjlaPS178Hl61L
 Ulk9JzJ/DybyuHPTl+GygiSOwdQdasjFEFh+UmcNoat35dahN9h7UxDmlTxIz6PKmw
 xVRmvW2UohfjfDel4IcrVSJ1kkwDnrwUY0pgP78YXMnpd6D6NhunObKfWphGaZINAi
 7Jve9ivest5pg==
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

Ck9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNi4wMS4yMDIw
IDIyOjAwLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4gT24gMDUvMDEvMjAyMCAxMDo1MywgQmVu
IERvb2tzIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+Pj4gMDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6
Cj4+Pj4+IFtzbmlwXQo+Pj4+Pgo+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3Rpbmcu
Cj4+Pj4+Cj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3
b3JrLgo+Pj4+Pgo+Pj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxv
b2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJp
dCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+PiBkbyAyNCBi
aXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBw
b3J0Cj4+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Pgo+Pj4+PiBNeSBwcmVmZXJlbmNlIGlz
IHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBpbi4KPj4+
Pj4KPj4+Pgo+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0g
dGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+PiB1c2FibGUgb24gVDMwPwo+Pj4KPj4+IElmIHRo
ZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQg
d291bGQgd29yay4KPj4+Cj4+PiBJIGNhbiB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEg
b24gTW9uZGF5Lgo+Pgo+PiBJIG5lZWQgdG8gY2hlY2sgc29tZSB0aGluZ3MsIEkgYXNzdW1lZCAy
NCB3YXMgMjQgcGFja2VkIGJpdHMsIGl0IGxvb2tzCj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQg
aW4gMzIgYml0cyBzbyB3ZSBtYXkgYmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+IHJlLXdyaXRl
IG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0
XzNMRSkuCj4+Cj4+IEknbGwgZm9sbG93IHVwIGxhdGVyLAo+IAo+IE9rYXksIHRoZSBTMjRfM0xF
IGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4gbXkgY2FzZS4gSSBicmllZmx5Cj4g
bG9va2VkIHRocm91Z2ggdGhlIFRSTSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBj
b3VsZCByZS1wYWNrCj4gZGF0YSBzdHJlYW0gaW50byBzb21ldGhpbmcgdGhhdCBjb2RlYyBzdXBw
b3J0cywgYnV0IG1heWJlIGl0J3MgYSB3cm9uZwo+IGltcHJlc3Npb24uCgpJIGNoYXR0ZWQgd2l0
aCBTYW1lZXIgYWJvdXQgdGhpcywgc28geWVzIHRoZSBBSFVCIGNhbiByZXBhY2ssIGJ1dCB0aGVy
ZQppcyBhIHByb2JsZW0gd2l0aCBTMjRfTEUgd2hlcmUgaWYgd2UgdHJ5IHRvIGV4dHJhY3QgMjQt
Yml0cyB3ZSBhY3R1YWxseQpnZXQgdGhlIHVwcGVyIDI0LWJpdHMgYW5kIG5vdCB0aGUgbG93ZXIg
TFNCcyBpbiB0aGUgMzItYml0IGRhdGEgZWxlbWVudC4KU28gYWN0dWFsbHkgd2UgZG9uJ3Qgc3Vw
cG9ydCBTMjRfTEUuCgpCZW4gZG8geW91IG5lZWQgMjQtYml0IHN1cHBvcnQgb3IgMzItYml0IG9y
IGJvdGg/CgpKb24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
