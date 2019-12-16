Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D78122D26
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7EFB1672;
	Tue, 17 Dec 2019 14:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7EFB1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576590077;
	bh=uhBKKAeysKNXBJjvZLmJCSzfUwQ83xIe7GC74GBMmW8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npByXTBaS15qPO5V4Cgsq9lyYgWAaNFMUmZiALSO7eFHumlarrYPdoCqrZPYPRFN4
	 uu7FDIHWJD0YwcnMzPtN11QNbODLu7o1Y+osVLW+FOjTo6r9bfdEcMbjN3pmzj/Wrt
	 BCgMWqVnG8b39wmkfN90n3Dq8LeR7kdB94PFyef0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C65F8025F;
	Tue, 17 Dec 2019 14:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB89AF80255; Mon, 16 Dec 2019 13:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 495BBF8014F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495BBF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nM/NgqQU"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df7766f0000>; Mon, 16 Dec 2019 04:19:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 04:20:08 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 04:20:08 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 16 Dec 2019 12:20:07 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
 id 944924280E; Mon, 16 Dec 2019 14:20:05 +0200 (EET)
Date: Mon, 16 Dec 2019 14:20:05 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
References: <288a1701-def6-d628-26bc-a305f817bdb1@gmail.com>
 <78644d45-2ae3-121f-99fc-0a46f205907d@nvidia.com>
 <b35916e1-c6ee-52ca-9111-5ae109437b6e@nvidia.com>
 <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576498800; bh=b7XXctcmXb2fLo5udKQt//zAFp8PM7nufwkYOLIsnKo=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To:X-NVConfidentiality:
 User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=nM/NgqQUcSdZRcFF7d0Yn96EQPMCJJewZs/5fXVF74Go86ZnMyQwERe7ZTQTnlbfj
 ZcvR6MojJdcvYsx4lauCFN2Ya+MLViVVuzS34lOkzq1S2prnU5TqXaZCv+5edNo1SM
 Km5wJjXWUiokMRJK2NPDugSZinOdkdcXkkonttZB2qxecYprJ0V9NbkzCFVPYF0Zq9
 TcXUgZihL0RnrDL3rgiLkB24ZO94eZg1Jtu6Ly4DWyZO4bHT/MVPbIYQ4piIV7pxtR
 /fuo+JDplJ5G9jQjchl9xQzDko/KvOOvOsLoLn7UMbIgo6dekW5fXziGIF2jY+6rAS
 mQEZWXAt/zm6g==
X-Mailman-Approved-At: Tue, 17 Dec 2019 14:39:17 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, mturquette@baylibre.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, spujar@nvidia.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, broonie@kernel.org,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDQ6NDM6NTNBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0
dGFjaG1lbnRzCj4gCj4gCj4gMTEuMTIuMjAxOSAxODoxMCwgUGV0ZXIgRGUgU2NocmlqdmVyINC/
0LjRiNC10YI6Cj4gPiBPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAwODo0MTo1NlBNICswMzAwLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPgo+ID4gLi4KPiA+Cj4gPj4+Cj4gPj4+IFBNQyBjbG9j
ayBnYXRlIGlzIGJhc2VkIG9uIHRoZSBzdGF0ZSBvZiBDTEt4X0FDQ0VQVF9SRVEgYW5kIEZPUkNF
X0VOCj4gPj4+IGxpa2UgZXhwbGFpbmVkIGFib3ZlLgo+ID4+Pgo+ID4+PiBDTEt4X0FDQ0VQVF9S
RVEgaXMgMCBkZWZhdWx0IGFuZCBGT1JDRV9FTiBhY3RzIGFzIGdhdGUgdG8gZW5hYmxlL2Rpc2Fi
bGUKPiA+Pj4gRVhUUEVSSVBIIGNsb2NrIG91dHB1dCB0byBQTUMgQ0xLX09VVF8xLzIvMy4KPiA+
Pgo+ID4+IFthbmQgdG8gZW5hYmxlIE9TQyBhcyB3ZWxsXQo+ID4+Cj4gPj4+IFNvIEkgYmVsaWV2
ZSB3ZSBuZWVkIHRvIHJlZ2lzdGVyIGFzIE1VWCBhbmQgR2F0ZSByYXRoZXIgdGhhbiBhcyBhIHNp
bmdsZQo+ID4+PiBjbG9jay4gUGxlYXNlIGNvbmZpcm0uCj4gPj4KPiA+PiAxLiBUaGUgZm9yY2Ut
ZW5hYmxpbmcgaXMgYXBwbGllZCB0byBib3RoIE9TQyBhbmQgRVhURVJOIHNvdXJjZXMgb2YKPiA+
PiBQTUNfQ0xLX09VVF94IGJ5IFBNQyBhdCBvbmNlLgo+ID4+Cj4gPj4gMi4gQm90aCBvZiBQTUMn
cyBmb3JjZS1lbmFibGluZyBhbmQgT1NDL0VYVEVSTiBzZWxlY3Rpb24gaXMgaW50ZXJuYWwgdG8g
UE1DLgo+ID4+Cj4gPj4gU2hvdWxkIGJlIGJldHRlciB0byBkZWZpbmUgaXQgYXMgYSBzaW5nbGUg
InBtY19jbGtfb3V0X3giLiBJIGRvbid0IHNlZQo+ID4+IGFueSBnb29kIHJlYXNvbnMgZm9yIGRp
ZmZlcmVudGlhdGluZyBQTUMncyBHYXRlIGZyb20gdGhlIE1VWCwgaXQncyBhCj4gPj4gc2luZ2xl
IGhhcmR3YXJlIHVuaXQgZnJvbSBhIHBvaW50IG9mIHZpZXcgb2YgdGhlIHJlc3Qgb2YgdGhlIHN5
c3RlbS4KPiA+Pgo+ID4+IFBldGVyLCBkbyB5b3UgaGF2ZSBhbnkgb2JqZWN0aW9ucz8KPiA+Cj4g
PiBUaGUgcmVhc29uIHRvIGhhdmUgc2VwYXJhdGUgZ2F0ZSBhbmQgbXV4IGNsb2NrcywgaXMgdG8g
cHJlc2VydmUgY29tcGF0aWJpbGl0eQo+ID4gd2l0aCBleGlzdGluZyB1c2Vycy4KPiA+IE90aGVy
d2lzZSB0aGUgY3VycmVudCB1c2VycyB3b3VsZCBuZWVkIHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUn
cyBhCj4gPiBzaW5nbGUgY2xvY2sgb3IgMiBjbG9ja3MgdG8gY29uZmlndXJlLiBJIGRvbid0IHRo
aW5rIGFkZGluZyB0aGF0IGNvZGUgaW4KPiA+IGVhY2ggdXNlciBpcyB3b3J0aCBpdCBvbmx5IHRv
IGhhdmUgYSBzbGlndGhseSBuaWNlciBtb2RlbGxpbmcgb2YgdGhlCj4gPiBoYXJkd2FyZS4KPiAK
PiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgd2hhdCBkbyB5b3UgbWVhbiBieSB0aGUgImV4aXN0
aW5nIHVzZXJzIj8KPiBBRkFJSywgbm90aGluZyBpbiBrZXJuZWwgdXNlcyBtdXggY2xvY2tzLgoK
VGhlIERUIGNsayBiaW5kaW5ncyBhbGxvdyBmb3IgcGFyZW50IGluaXRpYWxpemF0aW9uLCBzbyBp
dCdzIGNlcnRhaW5seQpwb3NzaWJsZSB0aGVyZSBhcmUgc29tZSBEVHMgd2hpY2ggcmVseSBvbiB0
aGlzLiBXZSBwcm9taXNlZCB0byBuZXZlcgpicmVhayB0aGUgYmluZGluZ3MsIHdoaWNoIGNoYW5n
aW5nIHRvIDEgY2xvY2sgd291bGQgZG8uIAoKUGV0ZXIuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
