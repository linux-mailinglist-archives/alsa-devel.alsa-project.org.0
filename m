Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF63A586C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 15:53:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B1016C5;
	Mon,  2 Sep 2019 15:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B1016C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567432390;
	bh=n8kuquQRZx8Yh6VTTam9tibyvBjzHEIaSEDDHmIP9WY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwR9Ve7vNfIs1dOBKeubpnopbECZEI0EWw/W1Jh3C4T3S3BygEM0jKvINeAzeyzqq
	 z5DF2mCqhAZJEefBuOoBqLSKpY+0rGxPNXbOrPdwr5L9894McfugeCs8zYVlrAY75i
	 G9GmIEUgH/v9eiFL3WVuOGU8uNXtAxrhAjIWByjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3A3F80394;
	Mon,  2 Sep 2019 15:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E2F1F803D0; Mon,  2 Sep 2019 15:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C7ADF8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 15:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C7ADF8011E
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4FE5EFF80E;
 Mon,  2 Sep 2019 13:51:14 +0000 (UTC)
Date: Mon, 2 Sep 2019 15:51:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190902155113.40b00fa0@xps13>
In-Reply-To: <20190902044231.GA17348@bogus>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <20190830210607.22644-2-miquel.raynal@bootlin.com>
 <20190902044231.GA17348@bogus>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alexandre@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/3] dt-bindings: sound: Add Xilinx
 logicPD-I2S FPGA IP bindings
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

SGkgUm9iLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBvbmUgcXVlc3Rpb24gYmVsb3cuCgpSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZSBvbiBNb24sIDAyIFNlcCAyMDE5IDE0OjM5
OjA5ICswMTAwOgoKPiBPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCAxMTowNjowNlBNICswMjAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIGxvZ2ljUEQgSTJTIEZQR0EgYmxv
Y2sgYmluZGluZ3MgaW4geWFtbC4KPiA+IAo+ID4gU3ludGF4IHZlcmlmaWVkIHdpdGggZHQtZG9j
LXZhbGlkYXRlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5kL3hsbngs
bG9naWNwZC1pMnMueWFtbCAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC94bG54LGxvZ2ljcGQtaTJzLnlhbWwK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC94bG54LGxvZ2ljcGQtaTJzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQveGxueCxsb2dpY3BkLWkycy55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYmZmNjQxYWYxOTkKPiA+IC0tLSAvZGV2L251bGwK
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC94bG54LGxv
Z2ljcGQtaTJzLnlhbWwKPiA+IEBAIC0wLDAgKzEsNTcgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiAr
LS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC94bG54LGxv
Z2ljcGQtaTJzLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IERldmljZS1UcmVlIGJpbmRpbmdz
IGZvciBYaWxpbnggbG9naWNQRCBJMlMgRlBHQSBibG9jawo+ID4gKwo+ID4gK21haW50YWluZXJz
Ogo+ID4gKyAgLSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
Kwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUgSVAgc3VwcG9ydHMgSTJTIHBsYXliYWNr
L2NhcHR1cmUgYXVkaW8uIEl0IGFjdHMgYXMgYSBzbGF2ZSBhbmQKPiA+ICsgIGNsb2NrcyBzaG91
bGQgY29tZSBmcm9tIHRoZSBjb2RlYy4gSXQgb25seSBzdXBwb3J0cyB0d28gY2hhbm5lbHMgYW5k
Cj4gPiArICBTMTZfTEUgZm9ybWF0Lgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21w
YXRpYmxlOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGNvbnN0OiB4bG54LGxvZ2ljcGQt
aTJzCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArICAgIGRlc2Ny
aXB0aW9uOgo+ID4gKyAgICAgIEJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgSVAgY29yZSBp
bnN0YW5jZS4KPiA+ICsKPiA+ICsgIGludGVycnVwdHM6Cj4gPiArICAgIG1pbkl0ZW1zOiAxCj4g
PiArICAgIG1heEl0ZW1zOiAyCj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IHR4IGludGVycnVwdAo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IHJ4IGludGVycnVwdAo+
ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBFaXRoZXIgdGhlIFR4IGludGVycnVwdGlv
biBvciB0aGUgUnggaW50ZXJydXB0aW9uIG9yIGJvdGguICAKPiAKPiBUaGUgc2NoZW1hIHNheXMg
ZWl0aGVyIHR4IG9yIGJvdGguIERvZXNuJ3QgcmVhbGx5IG1hdHRlciBoZXJlIGFzIGl0J3MgCj4g
anVzdCBudW1iZXJzLgoKSSBzZWUgLCBJJ2xsIGRyb3AgdGhlICdpdGVtcycgZW50cnkuCgo+IAo+
ID4gKwo+ID4gKyAgaW50ZXJydXB0LW5hbWVzOgo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gKyAg
ICBtYXhJdGVtczogMgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGNvbnN0OiB0eAo+ID4g
KyAgICAgIC0gY29uc3Q6IHJ4ICAKPiAKPiBCdXQgaGVyZSBpdCBkb2VzIG1hdHRlci4KPiAKPiBU
aGUgZWFzaWVzdCB3YXkgdG8gZXhwcmVzcyB0aGlzIGlzOgo+IAo+IG9uZU9mOgo+ICAgLSBpdGVt
czoKPiAgICAgICAtIGVudW06IFsgdHgsIHJ4IF0KPiAgIC0gaXRlbXM6Cj4gICAgICAgLSBjb25z
dDogdHgKPiAgICAgICAtIGNvbnN0OiByeAo+IAoKRG9lcyB0aGlzIGVuZm9yY2UgYW4gb3JkZXI/
IChJIGRvbid0IGtub3cgaWYgaXQgbWF0dGVycywgdGhvdWdoLCBidXQgaW4KdGhlIGJlbGxvdyBl
eGFtcGxlIEkgcHV0IHRoZSBSeCBpbnRlcnJ1cHQgZmlyc3QpLgoKPiA+ICsKPiA+ICtyZXF1aXJl
ZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gaW50ZXJydXB0cwo+
ID4gKyAgLSBpbnRlcnJ1cHRzLWNvbnRyb2xsZXIKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsg
IC0gfAo+ID4gKyAgICBsb2dpaTJzX2RhaTogbG9naWkycy1kYWlANDNjMTAwMDAgewo+ID4gKyAg
ICAgICAgcmVnID0gPDB4NDNjMTAwMDAgMHgxMDAwPjsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUg
PSAieGxueCxsb2dpY3BkLWkycy1kYWkiOwo+ID4gKyAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwmaW50Yz47Cj4gPiArICAgICAgICBpbnRlcnJ1cHRzID0gPDAgMjkgSVJRX1RZUEVfTEVWRUxf
SElHSD4sIDwwIDMwIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ID4gKyAgICAgICAgaW50ZXJydXB0
LW5hbWVzID0gInJ4IiwgInR4IjsKPiA+ICsgICAgfTsKPiA+IC0tIAo+ID4gMi4yMC4xCj4gPiAg
IAo+IAoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
