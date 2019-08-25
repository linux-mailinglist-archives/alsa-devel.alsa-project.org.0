Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC04A1CC4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BC11677;
	Thu, 29 Aug 2019 16:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BC11677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089003;
	bh=CE6R76MMGVSloRRvAulEnKYQP+3R4V1n6B8VrgmKIXU=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcCbX21MSgjqV+o3pRNVyix2k4qeLUTemYr8nLAC1HA2BJAWi3aMw9XSzZUu5AjMH
	 LHFps1UOFTndGyIpjPews93k3UPvzg9zS5U+jwfelVX8lxtCMNsCHc0dQEHOjqarRR
	 6NrP+/7q/s/P+NWiL2r0jyi84KUY93LvR1hwNBJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D58F89670;
	Wed, 28 Aug 2019 07:58:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39517F8014A; Sun, 25 Aug 2019 14:27:40 +0200 (CEST)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D1BF80212
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 14:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D1BF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="AUtdOu+1"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46GYyB0Qd1zM6;
 Sun, 25 Aug 2019 14:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566735362; bh=Al1lbbPw+zZcMOPjHh4luaJeNVrX1Hy7lFV9zPv3gns=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=AUtdOu+12L8K334By+FEnF5Sz8vjG/7tlzwrridx/BYCNe1nDD8qbDIXTCIGlTHC4
 JJY9OdYg474V+1OT1P4kqrH9WlT1AmltPhjkpH3AXlibgJ8P8sgJGFwfVYbERr0p6z
 1H0w93OxlvbHTrC9Z2AhilyUgS4AJMiBFBd4YE88ir9xv/IOUdzaTsZMENESU379Vn
 UBLu9T3+5CY97OzHZxoBOvux0csC2S7TpFv56DfdeRKaOirB0qhBgsbUnZPXLeiDuT
 J25VmB+hOeat6/A0o8USeCMQ6+TjfUl0N3DIgaMPHTQVv/RkcnVLVlVzr1EycZ86bQ
 zK90APevAdooQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sun, 25 Aug 2019 14:17:37 +0200
Message-Id: <0b92f741a4c382cb8d50c1aebfa9da15d7e470ae.1566734631.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
References: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:25 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Maxime Jourdan <mjourdan@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
 Annaliese McDermond <nh6z@nh6z.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Nariman Poushin <npoushin@opensource.cirrus.com>,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nikesh Oswal <nikesh@opensource.cirrus.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Enrico Weigelt <info@metux.net>
Subject: [alsa-devel] [PATCH v2 3/4] ASoC: wm8904: automatically choose
	clock source
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

Q2hvb3NlIGNsb2NrIHNvdXJjZSBhdXRvbWF0aWNhbGx5IGlmIG5vdCBwcm92aWRlZC4gVGhpcyB3
aWxsIGJlIHRoZSBjYXNlCndpdGggZWcuIGF1ZGlvLWdyYXBoLWNhcmQuCgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+Ci0tLQogc291bmQv
c29jL2NvZGVjcy93bTg5MDQuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy93bTg5MDQuYyBiL3NvdW5kL3NvYy9jb2Rl
Y3Mvd204OTA0LmMKaW5kZXggYzkzMThmZTM0ZjkxLi45NDYzMTVkNGNlY2YgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy93bTg5MDQu
YwpAQCAtMzY3LDE1ICszNjcsMzQgQEAgc3RhdGljIGludCB3bTg5MDRfZW5hYmxlX3N5c2Nsayhz
dHJ1Y3Qgd204OTA0X3ByaXYgKnByaXYpCiAJcmV0dXJuIGVycjsKIH0KIAorc3RhdGljIGludCB3
bTg5MDRfYnVtcF9mbGxfc3lzY2xrKHVuc2lnbmVkIGludCAqcmF0ZSk7CisKIHN0YXRpYyBpbnQg
d204OTA0X3NldF9zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBjbGtfaWQsCiAJ
CQkgICAgIHVuc2lnbmVkIGludCByYXRlLCBpbnQgZGlyKQogewogCXN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50ID0gZGFpLT5jb21wb25lbnQ7CiAJc3RydWN0IHdtODkwNF9wcml2
ICp3bTg5MDQgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOwogCXVu
c2lnbmVkIGludCBjbG9jazAsIGNsb2NrMjsKLQlpbnQgZXJyOworCWludCBlcnIsIGRvX2RpdiA9
IGZhbHNlOwogCiAJc3dpdGNoIChjbGtfaWQpIHsKKwljYXNlIDA6CisJCWlmIChyYXRlID09IGNs
a19yb3VuZF9yYXRlKHdtODkwNC0+bWNsaywgcmF0ZSkpIHsKKwkJCWNsa19pZCA9IFdNODkwNF9D
TEtfTUNMSzsKKwkJfSBlbHNlIGlmIChyYXRlICogMiA9PSBjbGtfcm91bmRfcmF0ZSh3bTg5MDQt
Pm1jbGssIHJhdGUgKiAyKSkgeworCQkJcmF0ZSAqPSAyOworCQkJY2xrX2lkID0gV004OTA0X0NM
S19NQ0xLOworCQkJZG9fZGl2ID0gdHJ1ZTsKKwkJfSBlbHNlIHsKKwkJCWNsa19pZCA9IFdNODkw
NF9DTEtfRkxMOworCQkJZXJyID0gd204OTA0X2J1bXBfZmxsX3N5c2NsaygmcmF0ZSk7CisJCQlp
ZiAoZXJyKSB7CisJCQkJZGV2X2RiZyhjb21wb25lbnQtPmRldiwgIkNhbid0IG1hdGNoICV1IG92
ZXIgRkxMIDE0MDYyNTAgSHogbWluaW11bVxuIiwgcmF0ZSk7CisJCQkJcmV0dXJuIGVycjsKKwkJ
CX0KKwkJfQorCQlicmVhazsKKwogCWNhc2UgV004OTA0X0NMS19NQ0xLOgogCWNhc2UgV004OTA0
X0NMS19GTEw6CiAJCWJyZWFrOwpAQCAtNDIxLDcgKzQ0MCw5IEBAIHN0YXRpYyBpbnQgd204OTA0
X3NldF9zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBjbGtfaWQsCiAJfQogCiAJ
LyogU1lTQ0xLIHNob3VsZG4ndCBiZSBvdmVyIDEzLjVNSHogKi8KLQlpZiAocmF0ZSA+IDEzNTAw
MDAwKSB7CisJaWYgKHJhdGUgPiAxMzUwMDAwMCkKKwkJZG9fZGl2ID0gdHJ1ZTsKKwlpZiAoZG9f
ZGl2KSB7CiAJCWNsb2NrMCA9IFdNODkwNF9NQ0xLX0RJVjsKIAkJd204OTA0LT5zeXNjbGtfcmF0
ZSA9IHJhdGUgLyAyOwogCX0gZWxzZSB7CkBAIC0xMzUwLDYgKzEzNzEsMjMgQEAgc3RhdGljIHN0
cnVjdCB7CiAJeyA0ODAsIDIwIH0sCiB9OwogCitzdGF0aWMgaW50IHdtODkwNF9idW1wX2ZsbF9z
eXNjbGsodW5zaWduZWQgaW50ICpyYXRlKQoreworCWludCBpOworCisJLyogYnVtcCBTWVNDTEsg
cmF0ZSBpZiBiZWxvdyBtaW5pbWFsIEZMTCBvdXRwdXQgKi8KKworCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGJjbGtfZGl2cyk7IGkrKykgeworCQlpZiAoKnJhdGUgKiBiY2xrX2RpdnNbaV0u
ZGl2ID49IDE0MDYyNTAgKiAxMCkKKwkJCWJyZWFrOworCX0KKworCWlmIChpID09IEFSUkFZX1NJ
WkUoYmNsa19kaXZzKSkKKwkJcmV0dXJuIC1FUkFOR0U7CisKKwkqcmF0ZSA9ICgqcmF0ZSAqIGJj
bGtfZGl2c1tpXS5kaXYpIC8gMTA7CisJcmV0dXJuIDA7Cit9CiAKIHN0YXRpYyBpbnQgd204OTA0
X2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIAkJCSAgICBz
dHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKnBhcmFtcywKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
