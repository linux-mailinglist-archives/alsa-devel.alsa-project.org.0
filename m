Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A553F132399
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 11:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0EE1829;
	Tue,  7 Jan 2020 11:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0EE1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578393070;
	bh=AaeN88vnxhQQOF+uA7JkF0YDxYmATbl3/EDY5KoFNck=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoJEtPB43Wnj2rdFqU4cGTHVENMsfwSGP+MM8ihwU6xJGaFp4KyGg16H+jg3F1iow
	 o32asO5Cubj5uedAZAqz5OvfgGh6PVN0HP7XlCFlyV9R7qz7nTezC5ip8NoMA22kdV
	 0zVlkVRs1vzVvSGc4E61gnYGUqC6AldH2My12cHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2158DF801EB;
	Tue,  7 Jan 2020 11:29:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B33F8F8014A; Tue,  7 Jan 2020 11:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35100F8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 11:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35100F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ewltzzOl"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e145d6a0001>; Tue, 07 Jan 2020 02:28:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 02:29:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 02:29:15 -0800
Received: from [10.26.11.139] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 10:29:12 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
Date: Tue, 7 Jan 2020 10:29:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578392938; bh=ghrWzqR+Il25vRA7uKkivAXM49dZWPDzH/vxwem+cas=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ewltzzOlx8zA+PK2OMCzEo2kLVbVMAgZaKvtE1pFztBz5xBZbnl8opZn1fcA5/Ulb
 5VqMVFX7H0ZnqFnUnGZ2cmzNp2VyY4BSw116n4xwgluUifyIHdO6Nh5iXiURIAS7NQ
 3Xv+aEXawh2+Hrdndlam5QX0vU3jSyNWcmeWAPO8iygvCaXpw2LeWa+DBZZDxC7cg0
 GhUDKP/ai7doUGP2uVLWFge9+w6JavOonExySEGEx8zOpMcbytBwLpUFRvgDbPei+f
 fO3lV2s+aqrzVTEW3NUlSc2rHN31jt26hmUKGeQ9yIad3I3jKjV6meAI/KMcAT+j7u
 oIYkJ3rUcPzWg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDA1LzAxLzIwMjAgMTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPiAKPiAKPiBPbiAyMDIwLTAx
LTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDA1LjAxLjIwMjAgMDM6MDQsIEJl
biBEb29rcyDQv9C40YjQtdGCOgo+Pj4gW3NuaXBdCj4+Pgo+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhy
b3VnaCB0ZXN0aW5nLgo+Pj4KPj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQg
MzItYml0cyB3b3JrLgo+Pj4KPj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwg
aXQgbG9va3MgbGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+IDI0IGJpdCBzYW1wbGVzIGluIDMy
IGJpdCB3b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4gZG8gMjQg
Yml0IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3Vw
cG9ydAo+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pgo+Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byBy
ZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+Pgo+Pgo+
PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRiaXQg
Zm9ybWF0IGlzbid0Cj4+IHVzYWJsZSBvbiBUMzA/Cj4gCj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9u
IG9mIDI0IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZCB3b3JrLgo+IAo+
IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCgpJIHdpbGwg
Y2hlY2sgb24gdGhpcy4gSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhhdCBTMjRfTEUgKDI0LWJpdHMg
cGFja2VkCmludG8gMzItYml0IGVsZW1lbnRzKSB3b3VsZCBiZSBmaW5lLiBUeXBpY2FsbHkgd2Ug
ZG9uJ3Qgc3VwcG9ydCBTMjRfM0xFCigyNC1iaXRzIGluIDI0LWJpdCBlbGVtZW50cykuCgpKb24K
Ci0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
