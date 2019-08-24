Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7179C01F
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23EB1670;
	Sat, 24 Aug 2019 22:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23EB1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678649;
	bh=pBx1rtyoXk7ob4rE8PkwkxJ4y1P2i+/wacwBEvwA19k=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LIQ0yHZBoYi1qoN6q6l5uLttCgfnpxH+Kex2q+k7Ws+dr+MOnxIPUL0DCKA02qolB
	 uSDHrXuR0TRA6MvxyHBGWZdnzn+k0AOGGn3qmthXRMLz7mAjNxnyOtLcdTHoDz5ltA
	 oOdnSC38CfxNZqGzq4yOncsm8Xq9wgc9bU0AS+LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 045B7F8060E;
	Sat, 24 Aug 2019 22:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26DB9F80391; Sat, 24 Aug 2019 22:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA950F80391
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA950F80391
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="anw28Gsh"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8sC3TJ3zTs;
 Sat, 24 Aug 2019 22:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678319; bh=VdbgtZ09Jmhv6nJYzpWS3ntFIzMHLWp5KKJVlktY88w=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=anw28Gshlg7ioShZh4jMUTbNhZLisNCofQ7YU/mNq1U957DdsRYUy0eFjOFaT5i53
 5mP8AKvzz4Vl324o0DRvozaxEUsX3Aohg9XUhRjGDB9ewFakBsSD1Xw0+nz9dxeiza
 1RPw2S12ZiNB55qaCwIK8xqfcbSM3fiYYAKifSbPZx9PnpG6U1kWCvWEV3lB6JwbI3
 3yP8CTo02S2cKCt3uOKj0SzOugCwJPrYoyKtxs+MIibEG77Ra/mlfqqKza0ba+DJx7
 KMsgfp+ulEIu7vzox++YCmsKj6TYM93ykMNsPY8RZAaijYzhmqcINdd+1KQ1jr0YVl
 SS2AmLbJejucw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:54 +0200
Message-Id: <44fa6b700421e80778f20ff9ead2b148cf6d2e92.1566677788.git.mirq-linux@rere.qmqm.pl>
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
Subject: [alsa-devel] [PATCH v2 3/6] ASoC: atmel_ssc_dai: implement
 left-justified data mode
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

RW5hYmxlIHN1cHBvcnQgZm9yIGxlZnQtanVzdGlmaWVkIGRhdGEgbW9kZSBmb3IgU1NDLWNvZGVj
IGxpbmsuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJl
LnFtcW0ucGw+CgotLS0KIHYyOiByZWJhc2VkCgotLS0KIHNvdW5kL3NvYy9hdG1lbC9hdG1lbF9z
c2NfZGFpLmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMgYi9zb3VuZC9zb2Mv
YXRtZWwvYXRtZWxfc3NjX2RhaS5jCmluZGV4IDdkYzZlYzliOGM3YS4uNDhlOWVlZjM0YzBmIDEw
MDY0NAotLS0gYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jCisrKyBiL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMKQEAgLTU2NCw2ICs1NjQsMTUgQEAgc3RhdGljIGludCBh
dG1lbF9zc2NfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAog
CiAJc3dpdGNoIChzc2NfcC0+ZGFpZm10ICYgU05EX1NPQ19EQUlGTVRfRk9STUFUX01BU0spIHsK
IAorCWNhc2UgU05EX1NPQ19EQUlGTVRfTEVGVF9KOgorCQlmc19vc3luYyA9IFNTQ19GU09TX1BP
U0lUSVZFOworCQlmc19lZGdlID0gU1NDX1NUQVJUX1JJU0lOR19SRjsKKworCQlyY21yID0JICBT
U0NfQkYoUkNNUl9TVFRETFksIDApOworCQl0Y21yID0JICBTU0NfQkYoVENNUl9TVFRETFksIDAp
OworCisJCWJyZWFrOworCiAJY2FzZSBTTkRfU09DX0RBSUZNVF9JMlM6CiAJCWZzX29zeW5jID0g
U1NDX0ZTT1NfTkVHQVRJVkU7CiAJCWZzX2VkZ2UgPSBTU0NfU1RBUlRfRkFMTElOR19SRjsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
