Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13CA1C89
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:17:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DCAC1684;
	Thu, 29 Aug 2019 16:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DCAC1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088276;
	bh=gZu4Ckev4v3sN7bDdlvmbwiPOLLsYLGArJrwjr8XMYc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d2Z2m3e/ebv7IZFfp+4DINpbowa5FdlmrtzMVWb3wZjbY0fnyjoWCkz8JCOKSI2SR
	 LKHXSAV1ifJkmOsISS+3gC/HRjCcHM+n7y/7qdfkIeGlPKwbWauo2YEi6VCoihCKCp
	 yxqRYTNg/TG/WHivCTO9qGOKs3GuEw3jkzODje54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 111F0F89625;
	Wed, 28 Aug 2019 07:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A572F8014A; Sun, 25 Aug 2019 14:27:37 +0200 (CEST)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3FFDF8014A
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 14:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FFDF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="eauM8c1/"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46GYy30s3Vz55;
 Sun, 25 Aug 2019 14:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566735358; bh=midx80iUy3avtT/Mo/OB+mMlAmfHoL2kDdpN3DL3rD8=;
 h=Date:From:Subject:To:Cc:From;
 b=eauM8c1/MyDyDyTQkcK2LHoYBiaBO2oi7tltzy+B3oKUvTdU7jf2D3eAGtrOJgUDb
 agOVBJfxzwopF+7o3MXULCFvrXUwKhsSQCnjmn5/P+YIQZzWG3LgGV5x9Q/8TeThkt
 uRswhsbFHFStN3YzbTU4qZUnu0oLiVkv4ude3S9Yz9YZL0vAjaImIIBgvQocCsVQ5I
 cJAf0aAjFSHAoflws+z/SIOF7XHXbUenP8C8u4RqkJp2Qjxr2RWKMLD9Qc4rLqzsLZ
 3soSE+Q01tFJl4y9Hoa8ZrA61vnG+P561zUNpudqou0DPwsqYw//n/WIGE05Cbj73/
 xO1ZgVPYLvOtQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sun, 25 Aug 2019 14:17:30 +0200
Message-Id: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:25 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Maxime Jourdan <mjourdan@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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
Subject: [alsa-devel] [PATCH v2 0/4] wm8904: adapt driver for use with
	audio-graph-card
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

VGhpcyBzZXJpZXMgYWxsb3dzIHRvIHVzZSBXTTg5MDQgY29kZWMgYXMgYXVkaW8tZ3JhcGgtY2Fy
ZCBjb21wb25lbnQuCkl0IHN0YXJ0cyB3aXRoIHJld29yayBvZiBGTEwgaGFuZGxpbmcgaW4gdGhl
IGNvZGVjJ3MgZHJpdmVyLCBhbmQgYXMgYW4KZXhhbXBsZSBpbmNsdWRlcyAodW50ZXN0ZWQpIHJl
d29yayBmb3IgY29kZWMgd2l0aCBzaW1pbGFyIEZMTDogV004OTk0LgoKU2VyaWVzIGJhc2VkIG9u
IHRpd2FpL3NvdW5kL2Zvci1uZXh0IHRyZWUuIFlvdSBjYW4gYWxzbyBwdWxsIGZyb206CiAgIGh0
dHBzOi8vcmVyZS5xbXFtLnBsL2dpdC9saW51eApicmFuY2g6CiAgIHdtODkwNAoKKGJyYW5jaCBp
bmNsdWRlcyB0d28gZml4ZXMgYWxyZWFkeSBzZW50IHRvIGFsc2EtZGV2ZWwsIGJ1dCBub3QgbWVy
Z2VkIHlldCkuCgpNaWNoYcWCIE1pcm9zxYJhdyAoNCk6CiAgQVNvQzogd21fZmxsOiBleHRyYWN0
IGNvbW1vbiBjb2RlIGZvciBXb2xmc29uIEZMTHMKICBBU29DOiB3bTg5MDQ6IHVzZSBjb21tb24g
RkxMIGNvZGUKICBBU29DOiB3bTg5MDQ6IGF1dG9tYXRpY2FsbHkgY2hvb3NlIGNsb2NrIHNvdXJj
ZQogIFtSRlRdIEFTb0M6IHdtODk5NDogdXNlIGNvbW1vbiBGTEwgY29kZQoKIHNvdW5kL3NvYy9h
dG1lbC9hdG1lbF93bTg5MDQuYyB8ICAxMSArLQogc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAg
ICAgIHwgICA5ICsKIHNvdW5kL3NvYy9jb2RlY3MvTWFrZWZpbGUgICAgICB8ICAgMiArCiBzb3Vu
ZC9zb2MvY29kZWNzL3dtODkwNC5jICAgICAgfCA1MTYgKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIHNvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmggICAgICB8ICAgNSAtCiBzb3VuZC9z
b2MvY29kZWNzL3dtODk5NC5jICAgICAgfCAyODEgKysrKystLS0tLS0tLS0tLS0tCiBzb3VuZC9z
b2MvY29kZWNzL3dtODk5NC5oICAgICAgfCAgIDQgKy0KIHNvdW5kL3NvYy9jb2RlY3Mvd21fZmxs
LmMgICAgICB8IDUxOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHNvdW5kL3Nv
Yy9jb2RlY3Mvd21fZmxsLmggICAgICB8ICA2MCArKysrCiA5IGZpbGVzIGNoYW5nZWQsIDg0OSBp
bnNlcnRpb25zKCspLCA1NTcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQv
c29jL2NvZGVjcy93bV9mbGwuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3Mv
d21fZmxsLmgKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
