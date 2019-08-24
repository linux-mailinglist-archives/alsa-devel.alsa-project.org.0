Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6089C01B
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AC5165D;
	Sat, 24 Aug 2019 22:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AC5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678527;
	bh=m5Zq2+oJZPx7TFZzG+bG/twLuWWbJ/KLLGyS3GnDVEo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mtz4+2ei9SlGrZmFpFnrlINnsWe1f4Ib0hvYxgs827RYP8BMwQ+fECURjSbfKvn5X
	 O6pOA34XiZKW6OjIjFKPp+1NXIQqHvGhiWTh5jky1vBWMXxNXmG+Fy5ynu1+dQ3iKI
	 KozmZrK8WILqzM2+gyyd7C5JZDs/V6DCuHk+Z3M4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE63F8036E;
	Sat, 24 Aug 2019 22:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A3AF803D5; Sat, 24 Aug 2019 22:26:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83BFBF8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83BFBF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="Qy14nzbf"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8s64hS6zw;
 Sat, 24 Aug 2019 22:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678316; bh=cjKOovDL+bRYnoSIR5KoHK4uHeLbz95Ofcl724n69I8=;
 h=Date:From:Subject:To:Cc:From;
 b=Qy14nzbf1OgvFwcEdGs/WQZj/XWXrU6g157AJRvrsXx3oKLN0xPeltoxNUESbPO2g
 k1k49Sh6r4oMEKGd+h61L1MvwwqHgs3k3NJZ3LnZBitxsYWQYDmFiSceXKVxXsEVjX
 N9PQ4aEkRZnO8wm+jC76ojyXEhtS5S1SqI/O5T/VLcnfSxf2Vf0ilhCrXeLdrgItuE
 dh72p4KWtN9zwr78X7KF9H6r52CaghFFIcazQEiWQP3LLlrIDXm+CZmLEAS5n1ZRau
 bwF7UMR5jztspvx9GW+YV6CyiIvIS6S/z4pAiDgAp0CTNoYCMnv5vd5IvdI098BL24
 KXvjzGDbP51dA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:49 +0200
Message-Id: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
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
Subject: [alsa-devel] [PATCH v2 0/6] ] ASoC: atmel: extend SSC support
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

VGhpcyBzZXJpZXMgaW1wcm92ZXMgc3VwcG9ydCBmb3IgdmFyaW91cyBjb25maWd1cmF0aW9ucyB1
c2luZyBTU0MgbW9kdWxlCmFzIGltcGxlbWVudGVkIGluIEF0bWVsIFNBTUE1RHggU29Dcy4gUGF0
Y2hlcyBhcmU6CgoxLiBlbmFibGUgU1NDIGluIEtjb25maWcgZm9yIGF1ZGlvLWdyYXBoLWNhcmQg
c3VwcG9ydAoyLiBEUlkgbW9kZSBzZXR0aW5nIGNvZGUKMy4gaW1wbGVtZW50IGxlZnQtanVzdGlm
aWVkIGRhdGEgbW9kZQo0LTYuIGVuYWJsZSBzaGFyZWQgRlNZTkMgc291cmNlIGZvciBzbGF2ZSBt
b2RlCgpQYXRjaGVzIGFnYWluc3QgdGl3YWkvc291bmQvZm9yLW5leHQgdHJlZS4gWW91IGNhbiBh
bHNvIHB1bGwgZnJvbQogICBodHRwczovL3JlcmUucW1xbS5wbC9naXQvbGludXgKYnJhbmNoOgog
ICBhdG1lbC1zc2MKCgpNaWNoYcWCIE1pcm9zxYJhdyAoNik6CiAgQVNvQzogYXRtZWw6IGVuYWJs
ZSBTT0NfU1NDX1BEQyBhbmQgU09DX1NTQ19ETUEgaW4gS2NvbmZpZwogIEFTb0M6IGF0bWVsX3Nz
Y19kYWk6IHJld29yayBEQUkgZm9ybWF0IGNvbmZpZ3VyYXRpb24KICBBU29DOiBhdG1lbF9zc2Nf
ZGFpOiBpbXBsZW1lbnQgbGVmdC1qdXN0aWZpZWQgZGF0YSBtb2RlCiAgZHQtYmluZGluZ3M6IG1p
c2M6IGF0bWVsLXNzYzogTFJDTEsgZnJvbSBURi9SRiBwaW4gb3B0aW9uCiAgbWlzYzogYXRtZWwt
c3NjOiBnZXQgTFJDTEsgcGluIHNlbGVjdGlvbiBmcm9tIERUCiAgQVNvQzogYXRtZWxfc3NjX2Rh
aTogRW5hYmxlIHNoYXJlZCBGU1lOQyBzb3VyY2UgaW4gZnJhbWUtc2xhdmUgbW9kZQoKIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvYXRtZWwtc3NjLnR4dCAgICB8ICAgNSArCiBkcml2ZXJz
L21pc2MvYXRtZWwtc3NjLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwogaW5jbHVkZS9s
aW51eC9hdG1lbC1zc2MuaCAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIHNvdW5kL3NvYy9h
dG1lbC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAzMCArLQogc291bmQvc29jL2F0
bWVsL2F0bWVsX3NzY19kYWkuYyAgICAgICAgICAgICAgIHwgMzA1ICsrKysrKy0tLS0tLS0tLS0t
LQogNSBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0aW9ucygrKSwgMjE0IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
