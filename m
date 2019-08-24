Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F779C01C
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC281667;
	Sat, 24 Aug 2019 22:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC281667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678573;
	bh=cRzoGGGVVzLhoDEBpUC2FpYN04PQtvdJU85BFZVACVU=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9F2IDDKG9R4kFu1VMbg25g7n78nozvkY66qX6UNXUZAn8MdvSYN85dzUfDVsxhEa
	 mKkZIsxqC5u15bigu+NInVCJUMdOQae01dW+R7ihSrTi0l1LOtGoYaa2U6BkWvOJUT
	 HPR3/e7WxCF7x7H8Anbq8bIw6cJxz/oAw+GHeeP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BF0F803D5;
	Sat, 24 Aug 2019 22:27:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B96EF803F3; Sat, 24 Aug 2019 22:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3917CF80147
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3917CF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="kV9Oso3/"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8s91604zGl;
 Sat, 24 Aug 2019 22:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678317; bh=bI4z6h+GTprYkJG4UIeziaeNCROEh3xOu5vMoCUwBkc=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=kV9Oso3/S7TQywbIKVaxb9X+muAQ/SPO73jIs0Vf8pfH0YJ8qKetq8TQw0wt3F5Yc
 EFQ1cVLJujArhDaMGce+XLp/EO8kbUa+jH9EdpqeT1UTA3w9yZhkontd88bW/Y4qAP
 fKdrgW7cc/rYdqhxV2FJgkjHnhMB5sRFC6TBV9IXALS4YEmrvVWWdHwgATCU1DnDhn
 +jeGIkW91SqGkpTJb1VP7fPxb8msf27AfCLQruKYWn5bwiAA4p1szQMgw0QccJaQh5
 cLu3zJaBVKi/Kq+LqBAWbkZUd9gKb7rV89d2PhCz4ywvm8/JASyxGtfAcBKkgQagFn
 9xsjFe4s3wHeQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:52 +0200
Message-Id: <233d5461f4448df151755de7b69a0cd3ad310d5c.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Rob Herring <robh-dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 1/6] ASoC: atmel: enable SOC_SSC_PDC and
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

QWxsb3cgU1NDIHRvIGJlIHVzZWQgb24gcGxhdGZvcm1zIGRlc2NyaWJlZCB1c2luZyBhdWRpby1n
cmFwaC1jYXJkCmluIERldmljZSBUcmVlLgoKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WC
YXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgoKLS0tCiB2MjogZXh0ZW5kZWQgdG8gUERDIG1v
ZGUKICAgICByZXdvcmtlZCBhbmQgZml4ZWQgS2NvbmZpZyBvcHRpb24gZGVwZW5kZW5jaWVzCgot
LS0KIHNvdW5kL3NvYy9hdG1lbC9LY29uZmlnIHwgMzAgKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL0tjb25maWcgYi9zb3VuZC9zb2MvYXRtZWwv
S2NvbmZpZwppbmRleCAwNmMxZDVjZTY0MmMuLmYxMThjMjI5ZWQ4MiAxMDA2NDQKLS0tIGEvc291
bmQvc29jL2F0bWVsL0tjb25maWcKKysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcKQEAgLTEy
LDI1ICsxMiwzMSBAQCBpZiBTTkRfQVRNRUxfU09DCiBjb25maWcgU05EX0FUTUVMX1NPQ19QREMK
IAl0cmlzdGF0ZQogCWRlcGVuZHMgb24gSEFTX0RNQQotCWRlZmF1bHQgbSBpZiBTTkRfQVRNRUxf
U09DX1NTQ19QREM9bSAmJiBTTkRfQVRNRUxfU09DX1NTQz1tCi0JZGVmYXVsdCB5IGlmIFNORF9B
VE1FTF9TT0NfU1NDX1BEQz15IHx8IChTTkRfQVRNRUxfU09DX1NTQ19QREM9bSAmJiBTTkRfQVRN
RUxfU09DX1NTQz15KQotCi1jb25maWcgU05EX0FUTUVMX1NPQ19TU0NfUERDCi0JdHJpc3RhdGUK
IAogY29uZmlnIFNORF9BVE1FTF9TT0NfRE1BCiAJdHJpc3RhdGUKIAlzZWxlY3QgU05EX1NPQ19H
RU5FUklDX0RNQUVOR0lORV9QQ00KLQlkZWZhdWx0IG0gaWYgU05EX0FUTUVMX1NPQ19TU0NfRE1B
PW0gJiYgU05EX0FUTUVMX1NPQ19TU0M9bQotCWRlZmF1bHQgeSBpZiBTTkRfQVRNRUxfU09DX1NT
Q19ETUE9eSB8fCAoU05EX0FUTUVMX1NPQ19TU0NfRE1BPW0gJiYgU05EX0FUTUVMX1NPQ19TU0M9
eSkKLQotY29uZmlnIFNORF9BVE1FTF9TT0NfU1NDX0RNQQotCXRyaXN0YXRlCiAKIGNvbmZpZyBT
TkRfQVRNRUxfU09DX1NTQwogCXRyaXN0YXRlCi0JZGVmYXVsdCB5IGlmIFNORF9BVE1FTF9TT0Nf
U1NDX0RNQT15IHx8IFNORF9BVE1FTF9TT0NfU1NDX1BEQz15Ci0JZGVmYXVsdCBtIGlmIFNORF9B
VE1FTF9TT0NfU1NDX0RNQT1tIHx8IFNORF9BVE1FTF9TT0NfU1NDX1BEQz1tCisKK2NvbmZpZyBT
TkRfQVRNRUxfU09DX1NTQ19QREMKKwl0cmlzdGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3Ig
QVQ5MSBTU0MgY29udHJvbGxlciB1c2luZyBQREMiCisJZGVwZW5kcyBvbiBBVE1FTF9TU0MKKwlz
ZWxlY3QgU05EX0FUTUVMX1NPQ19QREMKKwlzZWxlY3QgU05EX0FUTUVMX1NPQ19TU0MKKwloZWxw
CisJICBTYXkgWSBvciBNIGlmIHlvdSB3YW50IHRvIGFkZCBzdXBwb3J0IGZvciBBdG1lbCBTU0Mg
aW50ZXJmYWNlCisJICBpbiBQREMgbW9kZSBjb25maWd1cmVkIHVzaW5nIGF1ZGlvLWdyYXBoLWNh
cmQgaW4gZGV2aWNlLXRyZWUuCisKK2NvbmZpZyBTTkRfQVRNRUxfU09DX1NTQ19ETUEKKwl0cmlz
dGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxlciB1c2luZyBE
TUEiCisJZGVwZW5kcyBvbiBBVE1FTF9TU0MKKwlzZWxlY3QgU05EX0FUTUVMX1NPQ19ETUEKKwlz
ZWxlY3QgU05EX0FUTUVMX1NPQ19TU0MKKwloZWxwCisJICBTYXkgWSBvciBNIGlmIHlvdSB3YW50
IHRvIGFkZCBzdXBwb3J0IGZvciBBdG1lbCBTU0MgaW50ZXJmYWNlCisJICBpbiBETUEgbW9kZSBj
b25maWd1cmVkIHVzaW5nIGF1ZGlvLWdyYXBoLWNhcmQgaW4gZGV2aWNlLXRyZWUuCiAKIGNvbmZp
ZyBTTkRfQVQ5MV9TT0NfU0FNOUcyMF9XTTg3MzEKIAl0cmlzdGF0ZSAiU29DIEF1ZGlvIHN1cHBv
cnQgZm9yIFdNODczMS1iYXNlZCBBdDkxc2FtOWcyMCBldmFsdWF0aW9uIGJvYXJkIgotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
