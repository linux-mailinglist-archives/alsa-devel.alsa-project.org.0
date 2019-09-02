Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81892A5D13
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 22:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB6B16F3;
	Mon,  2 Sep 2019 22:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB6B16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567455785;
	bh=mnp6Q6s8+fReFQ3oA+ozU23Sx1/Bd6cSNCUTg/y8CFk=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNADQlOjDiRhOG67GTvkhx61Pko2hlE9cONvm5530VuXMdmwFu/CwKTb9sIdirAP0
	 X7stkS9Ka82eKrnjXAhOOZ4JHi9djaNKpgtv31/p66THETI5WNqmV/Kv8AJpZRTmxf
	 seRxylZkA8nQa2HMpRorZi8mQPF17VB62VLN9zys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B79F803D0;
	Mon,  2 Sep 2019 22:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FE26F803D0; Mon,  2 Sep 2019 22:21:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F113F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 22:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F113F8011E
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id BC238100008;
 Mon,  2 Sep 2019 20:21:12 +0000 (UTC)
Date: Mon, 2 Sep 2019 22:21:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@xilinx.com>
Message-ID: <20190902222111.045ede17@xps13>
In-Reply-To: <df36fc2d-ed62-2556-513d-158a7707d5cd@xilinx.com>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <df36fc2d-ed62-2556-513d-158a7707d5cd@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praveenv@xilinx.com,
 alexandre@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: xlnx: add Xilinx logicPD-I2S
	FPGA IP support
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

SGkgTWljaGFsLAoKTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4gd3JvdGUg
b24gTW9uLCAyIFNlcCAyMDE5CjA5OjM5OjExICswMjAwOgoKPiBIaSBNaXF1ZWwKPiAKPiBPbiAz
MC4gMDguIDE5IDIzOjA2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gVGhpcyBJUCBpcyB2ZXJ5
IHNpbXBsZSBzbyB0aGlzIGRyaXZlciBtYW5hZ2UgYm90aCB0aGUgREFJIGFuZCB0aGUgUENNCj4g
PiBzdHJlYW1zLCBoZW5jZSB0aGUgcHJlc2VuY2Ugb2YgYm90aCBjb21wb25lbnRzIGluIHRoaXMg
ZHJpdmVyLgo+ID4gCj4gPiBUaGVyZSBhcmUgcGxlbnR5IGF2YWlsYWJsZSBpbnRlcnJ1cHRpb25z
IHdoZW4gY2FwdHVyaW5nIG9yIHBsYXlpbmcKPiA+IGJhY2sgYXVkaW8gdGhhdCBjYW4gYmUgdHJp
Z2dlcmVkIGJ1dCB0aGUgb25seSBvbmUgdGhhdCBmaXRzIHRoZSBBTFNBCj4gPiBzb3VuZCBzeXN0
ZW0gaXMgdGhlIFhGRVJfRE9ORSB3aGljaCBpcyB1c2VkIHRvIGJvdW5kIHNvdW5kCj4gPiBwZXJp
b2RzLiBPdGhlciBpbnRlcnJ1cHRzIGFyZSBtYXNrZWQuIFBsZWFzZSBub3RlIHRoYXQgY2FwdHVy
ZSBhbmQKPiA+IHBsYXliYWNrIGFyZSBub3QgcG9zc2libGUgYXQgdGhlIHNhbWUgdGltZSB0aG91
Z2guCj4gPiAKPiA+IENhcHR1cmUgc2VlbXMgdG8gd29yayAoYXQgbGVhc3QgaXQgY3JlYXRlcyBh
IGZpbGUgd2l0aCBzb21ldGhpbmcKPiA+IGluc2lkZSkgYnV0IEkgaGF2ZSBubyBjYXB0dXJlIG1l
Y2hhbmlzbSBvbiB0aGUgYm9hcmQgdG8gYWN0dWFsbHkgdGVzdAo+ID4gdGhhdCBpdCB3b3JrcyBj
b3JyZWN0bHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IFRoaXMg
aXMgbXkgZmlyc3QgY29udHJpYnV0aW9uIGluIHRoZSBzb3VuZCBzdWJzeXN0ZW0sIEkgaG9wZSBJ
J3ZlCj4gPiB1bmRlcnN0b29kIHRoZSBjb3JlIGJ1dCBJIG1pZ2h0IGJlIGVudGlyZWx5IHdyb25n
IGFzIHdlbGwsIHNvIHBsZWFzZQo+ID4gZG8gbm90IGhlc2l0YXRlIHRvIGJlIGNyaXRpY2FsIG9u
IG15IGNob2ljZXMuCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPiA+IAo+ID4gIHNvdW5k
L3NvYy94aWxpbngvS2NvbmZpZyAgICAgICAgICAgIHwgICA3ICsKPiA+ICBzb3VuZC9zb2MveGls
aW54L01ha2VmaWxlICAgICAgICAgICB8ICAgMiArCj4gPiAgc291bmQvc29jL3hpbGlueC94bG54
LWxvZ2ljcGQtaTJzLmMgfCA0NjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKyAgCj4gCj4g
V2hhdCBJUCBpcyB0aGlzPwo+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vcHJvZHVjdHMvaW50ZWxs
ZWN0dWFsLXByb3BlcnR5L2F1ZGlvLWkycy5odG1sCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL1hp
bGlueC9saW51eC14bG54L2Jsb2IvbWFzdGVyL3NvdW5kL3NvYy94aWxpbngveGxueF9pMnMuYwo+
IAo+IEFueXdheSBJIGFtIGFkZGluZyBQcmF2ZWVuIGFuZCBNYXJ1dGhpIHRvIHRha2UgYSBsb29r
LgoKQWN0dWFsbHkgSSBoYXZlIGJlZW4gdHJpY2tlZCBieSBhIGRhdGFzaGVldCB3aXRoIHRoZSB3
cm9uZyB0aXRsZTogdGhpcwppcyBhIExvZ2ljUEQgSVAsIGl0IGlzIG5vdCBmcm9tIFhpbGlueC4g
SSB3aWxsIHJlc3VibWl0IHdpdGggYSBuZXcKZHJpdmVyIG5hbWUvY29tcGF0aWJsZSBhbmQgYWRk
IHRoZSByZWxldmFudCBwZW9wbGUuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
