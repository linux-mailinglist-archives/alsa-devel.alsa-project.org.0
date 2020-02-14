Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFE15D793
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 13:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FCE81674;
	Fri, 14 Feb 2020 13:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FCE81674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581684200;
	bh=AFTc/H9xwlLItXm5/LDVHvGvliCZzAkVyVx6V1mwH+Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2SY6KWKjjWWwggwOL0dR40IHujm/Y5bKEAs6Pz/W2RvWK83i8dv6FVwOAR6/0609
	 0ZGLWcYJfx+cs1ooSQb40KIGA/fBtQXUgcgmMjyExWULC/Cjj4Z2q/wzls8SFtGQXU
	 PN03JLpu2wx9sHLpeRe95pQN4S0eMkCqDzqEFlH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D3E1F80086;
	Fri, 14 Feb 2020 13:41:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD6CF8014F; Fri, 14 Feb 2020 13:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E122F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 13:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E122F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QAmNcTKH"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ECfTWa026882;
 Fri, 14 Feb 2020 06:41:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581684089;
 bh=y7tnLvi1wMpor7S1zrbL6DotuoQylxvUc8QfJzKUkgM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QAmNcTKHFUnzVmtgcVYHTIZLd4wSjhbw6MqVRYHXpUN6DZq8M31M4k3wqnh1wORBR
 noZnkviZ+tIG7+83Yz6XUom9leNwJZb/w3udw3Pg0QOIukrVjaP5AXUAhFz66jOb1W
 W5TnBt50gXMn8lxDof4rlCl034iHFxSx7tbwLoIg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ECfTco023629
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Feb 2020 06:41:29 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 06:41:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 06:41:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ECfPKC088492;
 Fri, 14 Feb 2020 06:41:25 -0600
To: Tony Lindgren <tony@atomide.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
Date: Fri, 14 Feb 2020 14:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212143543.GI64767@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, "Arthur D
 ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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

SGkgVG9ueSwKCk9uIDEyLzAyLzIwMjAgMTYuMzUsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4gKiBQ
ZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPiBbMjAwMjEyIDA4OjAyXToKPj4K
Pj4KPj4gT24gMTEvMDIvMjAyMCAxOS4xNiwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPj4+IFdlIGNh
biBoYXZlIG11bHRpcGxlIGNvbm5lY3Rpb25zIG9uIGEgc2luZ2xlIE1jQlNQIGluc3RhbmNlIGNv
bmZpZ3VyZWQKPj4+IHdpdGggYXVkaW8gZ3JhcGggY2FyZCB3aGVuIHVzaW5nIFRETSAoVGltZSBE
aXZpc2lvbiBNdWx0aXBsZXhpbmcpLiBMZXQncwo+Pj4gYWxsb3cgdGhhdCBieSBjb25maWd1cmlu
ZyBkYWlzIGR5bmFtaWNhbGx5Lgo+Pgo+PiBJdCBpcyBzdGlsbCBvbmUgREFJLi4uCj4+IElmIHlv
dSBoYXZlIG11bHRpcGxlIGNvZGVjIGNvbm5lY3RlZCB0byB0aGUgc2FtZSBJMlMgbGluZXMsIGJ1
dCB0aGUKPj4gY29kZWNzIGNvbW11bmljYXRlIHdpdGhpbiBkaWZmZXJlbnQgdGltZSBzbG90cywg
eW91IHN0aWxsIGhhdmUgb25lIERBSQo+PiBvbiB0aGUgQ1BVIHNpZGUsIGJ1dCBtdWx0aXBsZSBj
b2RlY3MgKGNvZGVjIERBSXMpIHdpdGggZGlmZmVyZW50IFRETSBzbG90Lgo+IAo+IE9LIHNvIHN1
YmplY3Qgc2hvdWxkIHNheSAiZG9kZWMgREFJcyIgdGhlbiBJIGd1ZXNzPwo+IAo+Pj4gU2VlIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hdWRpby1ncmFwaC1jYXJkLnR4
dCBhbmQKPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQgZm9y
IG1vcmUgZGV0YWlscyBmb3IKPj4+IG11bHRpcGxlIGVuZHBvaW50cy4KPj4KPj4gU2VlIHRoZSBl
eGFtcGxlIGZvciAnTXVsdGkgREFJIHdpdGggRFBDTScgaW4gYXVkaW8tZ3JhcGgtY2FyZC50eHQK
Pj4gVGhlIFBDTTMxNjhhIGhhdmUgMiBEQUlzOiBwbGF5YmFjayBhbmQgY2FwdHVyZSwgYnV0IHlv
dSBjYW4gaGF2ZQo+PiBtdWx0aXBsZSBlbmRwb2ludHMgd2l0aGluIGEgREFJLgo+IAo+IFllcyB0
aGlzIHNob3VsZCBmb2xsb3cgdGhlIGF1ZGlvLWdyYXBoLWNhcmQudHh0IGV4YW1wbGUuIFdlIGVu
ZCB1cCB3aXRoCj4gbWNic3AzIGR0cyBub2RlIGFzIGJlbG93IG9uIGRyb2lkNDoKPiAKPiAmbWNi
c3AzIHsKPiAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47Cj4gICAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOwo+ICAgICAgICAgcGluY3RybC0wID0gPCZtY2JzcDNfcGlucz47
Cj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gCj4gICAgICAgICBwb3J0cyB7Cj4gICAgICAg
ICAgICAgICAgIG1jYnNwM19wb3J0OiBwb3J0QDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Owo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9kYWkzOiBlbmRwb2lu
dEAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhaS1mb3JtYXQgPSAiZHNwX2EiOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJhbWUtbWFzdGVyID0gPCZjcGNhcF9hdWRpb19j
b2RlYzE+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYml0Y2xvY2stbWFzdGVy
ID0gPCZjcGNhcF9hdWRpb19jb2RlYzE+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVtb3RlLWVuZHBvaW50ID0gPCZjcGNhcF9hdWRpb19jb2RlYzE+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1X2RhaV9tZG06
IGVuZHBvaW50QDEgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGFpLWZvcm1hdCA9ICJkc3BfYSI7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFtZS1tYXN0ZXIgPSA8JmNwY2Fw
X2F1ZGlvX2NvZGVjMT47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRjbG9j
ay1tYXN0ZXIgPSA8JmNwY2FwX2F1ZGlvX2NvZGVjMT47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1vdF9tZG02NjAwX2F1ZGlvX2NvZGVjMD47
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgICAgICAgICAgfTsKPiAgICAg
ICAgIH07Cj4gfTsKCkFjY29yZGluZyB0bwpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvYXVkaW8tZ3JhcGgtY2FyZC50eHQKaXQgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtl
IHRoaXM6CiZtY2JzcDMgewogICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47CiAgICAgICAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKICAgICAgICBwaW5jdHJsLTAgPSA8Jm1jYnNwM19w
aW5zPjsKICAgICAgICBzdGF0dXMgPSAib2theSI7CgogICAgICAgIHBvcnRzIHsKCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKCQkjc2l6ZS1jZWxscyA9IDwwPjsKICAgICAgICAgICAgICAgIHBvcnRA
MCB7CgkJCXJlZyA9IDwwPjsKCgkJCWNwdV9kYWkzOiBlbmRwb2ludEAwIHsKCQkJCWRhaS1mb3Jt
YXQgPSAiZHNwX2EiOwoJCQkJZnJhbWUtbWFzdGVyID0gPCZjcGNhcF9hdWRpb19jb2RlYzE+OwoJ
CQkJYml0Y2xvY2stbWFzdGVyID0gPCZjcGNhcF9hdWRpb19jb2RlYzE+OwoJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZjcGNhcF9hdWRpb19jb2RlYzE+OwoJCQl9OwoKCQkJY3B1X2RhaV9tZG06IGVu
ZHBvaW50QDEgewoJCQkJZGFpLWZvcm1hdCA9ICJkc3BfYSI7CgkJCQlmcmFtZS1tYXN0ZXIgPSA8
JmNwY2FwX2F1ZGlvX2NvZGVjMT47CgkJCQliaXRjbG9jay1tYXN0ZXIgPSA8JmNwY2FwX2F1ZGlv
X2NvZGVjMT47CgkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jm1vdF9tZG02NjAwX2F1ZGlvX2NvZGVj
MD47CgkJCX07CgkJfTsKCX07Cn07CgpJZiB5b3Ugc3BhbiBvdXQgZHVtbXkgREFJcyBnb3QgZGFp
MSsgdGhlbiBob3cgeW91IHdpbGwgZ2V0IGFueXRoaW5nCndvcmtpbmcgdmlhIGVuZHBvaW50MSs/
ClRoZXJlIHdpbGwgYmUgbm8gb3BzIGZvciBNY0JTUCwgc28gaXQgaXMgbm90IGdvaW5nIHRvIGRv
IGFueXRoaW5nLi4uCgoKPiBUaGF0IGlzIHByZXR0eSBtdWNoIHRoZSBzYW1lIGFzIHRoZSAnTXVs
dGkgREFJIHdpdGggRFBDTScgZXhhbXBsZSwgd2l0aAo+IGRuZSBkYWksIGFuZCBtdWx0aXBsZSBl
bmRwb2ludHMuIEkgdGhpbmsgd2Ugc3RpbGwgaGF2ZSBqdXN0IG9uZSBwb3J0Cj4gZm9yIG9uZSBp
MnMgdHJhbnNwb3J0IG9uIHRoZSBtY2JzcCA6KQo+IAo+IERvZXMgdGhlIGFib3ZlIGxvb2sgYXMg
d2hhdCB5b3Ugd291bGQgZXhwZWN0IGJhc2VkIG9uIHRoZSBiaW5kaW5nPwoKVGhlIGF1ZGlvLWdy
YXBoLWNhcmQudHh0IGV4YW1wbGUgc2hvd3MgcGNtMzE2OGEgd2hpY2ggaGF2ZSB0d28gREFJcywK
b25lIGZvciBwbGF5YmFjayBhbmQgb25lIGZvciBjYXB0dXJlLgoKSSBndWVzcyBNb3JpbW90by1z
YW4gY2FuIGV4cGxhaW4gaWYgaGUgY2FycmllcyBvdXQgb2YgdHJlZSBwYXRjaGVzIHRvCmdldCB0
aGUgZGVzY3JpYmVkIHNldHVwIHdvcmtpbmcgb24gdG9wIG9mIG1haW5saW5lLi4uCgpCdXQsIG5v
LCBiYXNlZCBvbiB0aGUgZG9jdW1lbnRhdGlvbiBJIGRvbid0IDspCgo+Pj4gSSd2ZSB0ZXN0ZWQg
dGhpcyB3aXRoIGRyb2lkNCB3aGVyZSBjcGNhcCBwbWljIGFuZCBtb2RlbSB2b2ljZSBhcmUgYm90
aAo+Pj4gYm90aCB3aXJlZCB0byBtY2JzcDMuIEkndmUgYWxzbyB0ZXN0ZWQgdGhpcyBvbiBkcm9p
ZDQgYm90aCB3aXRoIGFuZAo+Pj4gd2l0aG91dCB0aGUgcGVuZGluZyBtb2RlbSBhdWRpbyBjb2Rl
YyBkcml2ZXIgdGhhdCBpcyB3YWl0aW5nIGZvciBuX2dzbQo+Pj4gc2VyZGV2IGRlcGVuZGVuY2ll
cyB0byBjbGVhci4KPj4KPj4gV2hhdCB0aGlzIHBhdGNoIHlvdSBlZmZlY3RpdmVseSBqdXN0IGNy
ZWF0aW5nIGR1bW15LWRhaXMgb24gdG9wIG9mIHRoZQo+PiByZWFsIE1jQlNQIERBSS4KPiAKPiBZ
ZXMgSSB0aGluayB0aGlzIGlzIG5lZWRlZCBmb3Igc25kLXNvYy1hdWRpby1ncmFwaC1jYXJkLCBh
bmQgdGhpcyBhbGxvd3MKPiBjb25maWd1cmluZyB3aGF0ZXZlciBpcyBuZWVkZWQgZm9yIHRoZSBp
MnMgc2xvdC4gQnV0IG1heWJlIHlvdSBoYXZlIHNvbWUKPiBiZXR0ZXIgd2F5IG9mIGRvaW5nIGl0
IGluIG1pbmQ/Cj4gCj4+IFlvdSBhbHNvIHJlbmFtZSB0aGUgREFJcywgd2hpY2ggbWlnaHQgYnJl
YWsgYW1zLWRlbHRhLgo+IAo+IE9vcHMsIHRoYXQncyBub3QgZ29vZC4gU28gc2hvdWxkIHdlIGp1
c3Qga2VlcCB0aGUgb2xkIG5hbWluZyBpZiB0aGVyZSdzCj4gb25seSBvbmUgZW5kcG9pbnQ/CgpU
aGF0J3MgYW4gb3B0aW9uLCB5ZXMsIGlmIHdlIHJlYWxseSBuZWVkIGV4dHJhIGR1bW15IE1jQlNQ
IERBSXMgYXQgYWxsLAphZ2FpbiwgbGV0J3MgaGVhciBmcm9tIE1vcmltb3RvLXNhbiBvciBNYXJr
LgogCj4+IFdlIHN0aWxsIGhhdmUgbGVnYWN5IHN1cHBvcnQgaW4KPj4gb21hcC10d2w0MDMwLmMK
Pj4gb21hcDNwYW5kb3JhLmMKPj4gb3NrNTkxMi5jCj4+IHJ4NTEuYwo+Pgo+PiB3aGljaCB3aWxs
IGJyZWFrIHdpdGggdGhlIHJlbmFtZWQgREFJLiBPbiB0aGUgb3RoZXIgaGFuZCBJIHRoaW5rIHRo
ZQo+PiBsZWdhY3kgc3VwcG9ydCBjYW4gYmUgZHJvcHBlZCBmcm9tIHRoZW0uCj4gCj4gSSdtIG5v
dCBzdXJlIHdoYXQgYWxsIHRoYXQgd291bGQgdGFrZS4KCkZvciBzb21lIGl0IHNob3VsZCBub3Qg
YmUgYSBiaWcgZGVhbCBhcyB0aGV5IG9ubHkgYm9vdCBpbiBEVCBtb2RlLgovbWUgYWRkcyB0aGlz
IHRvIHRoZSBUT0RPIGxpc3QuCiAKPj4gSSBrbm93IGl0IHdhcyBkaXNjdXNzZWQsIGJ1dCBjYW4g
bm90IGZpbmQgdGhlIG1haWw6Cj4+IENhbiB5b3UgYnJpZWYgYWdhaW4gb24gdGhlIGF1ZGlvIGNv
bm5lY3Rpb24/Cj4gCj4gQmVsb3cgaXMgYSBsaW5rIHRvIGEgbWFpbGluZyBsaXN0IHRocmVhZCB3
aGVyZSBTZWJhc3RpYW4gZGVzY3JpYmVzCj4gdGhlIGF1ZGlvIGNvbm5lY3Rpb246Cj4gCj4gaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMy8yOC84ODEKClRoYW5rcyEKIAo+PiBEbyB5b3UgaGF2
ZSBicmFuY2ggd2l0aCB3b3JraW5nIGNvZGU/Cj4gCj4gWWVhaCBJIGhhdmUgc2xpZ2h0bHkgb2xk
ZXIgc2V0IG9mIHRoZSBwYXRjaGVzIGluIG15IGRyb2lkNC1wZW5kaW5nLXY1LjUKPiBrZXJuZWwu
b3JnIGdpdCBicmFuY2ggd2l0aCB2b2ljZSBjYWxscyB3b3JraW5nLgoKSSB0aGluayBJIHNob3Vs
ZCBwdXQgbXkgZHJvaWQ0IG91dCBhbmQgdHJ5IHRvIGdldCBpdCB3b3JraW5nLi4uCkRvIHlvdSBo
YXZlIGEgbGluayBmb3IgZHVtbWllcyB0byBmb2xsb3cgdG8gZ2V0IHN0YXJ0ZWQ/IDspCgo+IAo+
IFJlZ2FyZHMsCj4gCj4gVG9ueQo+IAoKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZpbmxh
bmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVz
cyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
