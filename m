Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C812E9D198
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 16:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C129169B;
	Mon, 26 Aug 2019 16:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C129169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566829531;
	bh=lDi5SpjHLs01PymPa9E5K5lm5aqbe1kA+hzMdH0nwyA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtwwVMwDYZmRIsldtquVbFXgFSqh2iFvXx6gDsa0XK3Qk4TmAdW6ZcSdrssjd+ADl
	 hW+McJWGVb7zWDoOf1LFttxwxzhyzGpFeIuGyNVgrpkSFMUnbsGr1OpdQ08UL454QB
	 f7wzDtsER1in8XcPAbaCtKOwwp8/NMSFBS7hyjvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69865F80377;
	Mon, 26 Aug 2019 16:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02573F80362; Mon, 26 Aug 2019 16:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42495F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 16:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42495F8014A
X-Originating-IP: 86.207.98.53
Received: from localhost
 (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3C75C1BF205;
 Mon, 26 Aug 2019 14:23:38 +0000 (UTC)
Date: Mon, 26 Aug 2019 16:23:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190826142337.GE21713@piout.net>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <233d5461f4448df151755de7b69a0cd3ad310d5c.1566677788.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <233d5461f4448df151755de7b69a0cd3ad310d5c.1566677788.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Rob Herring <robh-dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/6] ASoC: atmel: enable SOC_SSC_PDC and
 SOC_SSC_DMA in Kconfig
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

T24gMjQvMDgvMjAxOSAyMjoyNjo1MiswMjAwLCBNaWNoYcWCIE1pcm9zxYJhdyB3cm90ZToKPiBB
bGxvdyBTU0MgdG8gYmUgdXNlZCBvbiBwbGF0Zm9ybXMgZGVzY3JpYmVkIHVzaW5nIGF1ZGlvLWdy
YXBoLWNhcmQKPiBpbiBEZXZpY2UgVHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1p
cm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+CkFja2VkLWJ5OiBBbGV4YW5kcmUgQmVs
bG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+Cgo+IAo+IC0tLQo+ICB2MjogZXh0
ZW5kZWQgdG8gUERDIG1vZGUKPiAgICAgIHJld29ya2VkIGFuZCBmaXhlZCBLY29uZmlnIG9wdGlv
biBkZXBlbmRlbmNpZXMKPiAKPiAtLS0KPiAgc291bmQvc29jL2F0bWVsL0tjb25maWcgfCAzMCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRt
ZWwvS2NvbmZpZyBiL3NvdW5kL3NvYy9hdG1lbC9LY29uZmlnCj4gaW5kZXggMDZjMWQ1Y2U2NDJj
Li5mMTE4YzIyOWVkODIgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL2F0bWVsL0tjb25maWcKPiAr
KysgYi9zb3VuZC9zb2MvYXRtZWwvS2NvbmZpZwo+IEBAIC0xMiwyNSArMTIsMzEgQEAgaWYgU05E
X0FUTUVMX1NPQwo+ICBjb25maWcgU05EX0FUTUVMX1NPQ19QREMKPiAgCXRyaXN0YXRlCj4gIAlk
ZXBlbmRzIG9uIEhBU19ETUEKPiAtCWRlZmF1bHQgbSBpZiBTTkRfQVRNRUxfU09DX1NTQ19QREM9
bSAmJiBTTkRfQVRNRUxfU09DX1NTQz1tCj4gLQlkZWZhdWx0IHkgaWYgU05EX0FUTUVMX1NPQ19T
U0NfUERDPXkgfHwgKFNORF9BVE1FTF9TT0NfU1NDX1BEQz1tICYmIFNORF9BVE1FTF9TT0NfU1ND
PXkpCj4gLQo+IC1jb25maWcgU05EX0FUTUVMX1NPQ19TU0NfUERDCj4gLQl0cmlzdGF0ZQo+ICAK
PiAgY29uZmlnIFNORF9BVE1FTF9TT0NfRE1BCj4gIAl0cmlzdGF0ZQo+ICAJc2VsZWN0IFNORF9T
T0NfR0VORVJJQ19ETUFFTkdJTkVfUENNCj4gLQlkZWZhdWx0IG0gaWYgU05EX0FUTUVMX1NPQ19T
U0NfRE1BPW0gJiYgU05EX0FUTUVMX1NPQ19TU0M9bQo+IC0JZGVmYXVsdCB5IGlmIFNORF9BVE1F
TF9TT0NfU1NDX0RNQT15IHx8IChTTkRfQVRNRUxfU09DX1NTQ19ETUE9bSAmJiBTTkRfQVRNRUxf
U09DX1NTQz15KQo+IC0KPiAtY29uZmlnIFNORF9BVE1FTF9TT0NfU1NDX0RNQQo+IC0JdHJpc3Rh
dGUKPiAgCj4gIGNvbmZpZyBTTkRfQVRNRUxfU09DX1NTQwo+ICAJdHJpc3RhdGUKPiAtCWRlZmF1
bHQgeSBpZiBTTkRfQVRNRUxfU09DX1NTQ19ETUE9eSB8fCBTTkRfQVRNRUxfU09DX1NTQ19QREM9
eQo+IC0JZGVmYXVsdCBtIGlmIFNORF9BVE1FTF9TT0NfU1NDX0RNQT1tIHx8IFNORF9BVE1FTF9T
T0NfU1NDX1BEQz1tCj4gKwo+ICtjb25maWcgU05EX0FUTUVMX1NPQ19TU0NfUERDCj4gKwl0cmlz
dGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxlciB1c2luZyBQ
REMiCj4gKwlkZXBlbmRzIG9uIEFUTUVMX1NTQwo+ICsJc2VsZWN0IFNORF9BVE1FTF9TT0NfUERD
Cj4gKwlzZWxlY3QgU05EX0FUTUVMX1NPQ19TU0MKPiArCWhlbHAKPiArCSAgU2F5IFkgb3IgTSBp
ZiB5b3Ugd2FudCB0byBhZGQgc3VwcG9ydCBmb3IgQXRtZWwgU1NDIGludGVyZmFjZQo+ICsJICBp
biBQREMgbW9kZSBjb25maWd1cmVkIHVzaW5nIGF1ZGlvLWdyYXBoLWNhcmQgaW4gZGV2aWNlLXRy
ZWUuCj4gKwo+ICtjb25maWcgU05EX0FUTUVMX1NPQ19TU0NfRE1BCj4gKwl0cmlzdGF0ZSAiU29D
IFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxlciB1c2luZyBETUEiCj4gKwlk
ZXBlbmRzIG9uIEFUTUVMX1NTQwo+ICsJc2VsZWN0IFNORF9BVE1FTF9TT0NfRE1BCj4gKwlzZWxl
Y3QgU05EX0FUTUVMX1NPQ19TU0MKPiArCWhlbHAKPiArCSAgU2F5IFkgb3IgTSBpZiB5b3Ugd2Fu
dCB0byBhZGQgc3VwcG9ydCBmb3IgQXRtZWwgU1NDIGludGVyZmFjZQo+ICsJICBpbiBETUEgbW9k
ZSBjb25maWd1cmVkIHVzaW5nIGF1ZGlvLWdyYXBoLWNhcmQgaW4gZGV2aWNlLXRyZWUuCj4gIAo+
ICBjb25maWcgU05EX0FUOTFfU09DX1NBTTlHMjBfV004NzMxCj4gIAl0cmlzdGF0ZSAiU29DIEF1
ZGlvIHN1cHBvcnQgZm9yIFdNODczMS1iYXNlZCBBdDkxc2FtOWcyMCBldmFsdWF0aW9uIGJvYXJk
Igo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
