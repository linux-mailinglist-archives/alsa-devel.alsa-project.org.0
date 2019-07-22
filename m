Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8B708A7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 20:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E869182E;
	Mon, 22 Jul 2019 20:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E869182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563820349;
	bh=vXCmpyHdczzxjtlORzGfjNWwCO68keE+vU+d5jXCpZY=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbWb+yGPiwzphJyIRU5NxSEFxpkluz/4xbdykKXUmNv0IOVFHWUsZHdtwOHOQXRzN
	 8qJTuTVIsXMsxOW90W5pp45Wbqt0d9xVWcQUFRz2zzl90VWb8LFRTGPXn8JVX83p+/
	 PbbF4OlGs1IU001DP41n4L8BYeB4xs3G1kKYPDaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DA7F80506;
	Mon, 22 Jul 2019 20:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7E66F80481; Mon, 22 Jul 2019 20:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B05BF80481
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 20:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B05BF80481
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="RUZuuVyA"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sqmp2BlBzKH;
 Mon, 22 Jul 2019 20:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563819962; bh=VdkVzwoOtZlqZueF8/cl4Cw/TEd5aeM0H0H+HkKBuHw=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=RUZuuVyAeEN08aQbW1aMBGHCntMzvEQsWdZxsnV2TlF6VAHLXArCKYrnuuj36S7mg
 2qWx/TLjBSSR6CZk7m5jRtdBSNt8cceRKCfVNhR2JN+yUN9Bnren11ECGv7NA6KSb6
 E3iWesF/2y7vRobyqmMapyKQu1lj741wKFYJQf/poAs/E8adqu90kYe1+C+EEodrnk
 KRmbQ6Fvle1+zSacZp2Tvk70Mtgdyd6HVdVhehmMqXRa66g+Cjnk3N5FO6uNO/J/aw
 8d/dktp4sRjoFl+NdsfJY/QPNdinmKY8wOGJUImuEpDUqhBrzb1CkSIjiX6Xju4x7e
 ZEEwZKewbbucw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 20:27:21 +0200
Message-Id: <ca3d0b124cdf6e2d0ec158a7948f08dd8abfd3b7.1563819483.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 3/5] ASoC: atmel_ssc_dai: implement
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

U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PgotLS0KIHNvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMgfCAxMyArKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMgYi9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5j
CmluZGV4IGIyOTkyNDk2ZTUyZi4uMDQ1NDFkN2MzM2ZlIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mv
YXRtZWwvYXRtZWxfc3NjX2RhaS5jCisrKyBiL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFp
LmMKQEAgLTU2NCw3ICs1NjQsMjAgQEAgc3RhdGljIGludCBhdG1lbF9zc2NfaHdfcGFyYW1zKHN0
cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCiAJc3dpdGNoIChzc2NfcC0+ZGFp
Zm10ICYgU05EX1NPQ19EQUlGTVRfRk9STUFUX01BU0spIHsKIAorCWNhc2UgU05EX1NPQ19EQUlG
TVRfTEVGVF9KOgorCQkvKiBsZWZ0LWp1c3RpZmllZCBmb3JtYXQgKi8KKwkJZnNfb3N5bmMgPSBT
U0NfRlNPU19QT1NJVElWRTsKKworCQlyY21yID0JICBTU0NfQkYoUkNNUl9TVFRETFksIDApCisJ
CQl8IFNTQ19CRihSQ01SX1NUQVJULCBTU0NfU1RBUlRfUklTSU5HX1JGKTsKKworCQl0Y21yID0J
ICBTU0NfQkYoVENNUl9TVFRETFksIDApCisJCQl8IFNTQ19CRihUQ01SX1NUQVJULCBTU0NfU1RB
UlRfUklTSU5HX1JGKTsKKworCQlicmVhazsKKwogCWNhc2UgU05EX1NPQ19EQUlGTVRfSTJTOgor
CQkvKiBJMlMgZm9ybWF0ID0gbGVmdC1qdXN0aWZpZWQgd2l0aCBzdGFydCBiaXQgYW5kIGludmVy
dGVkIExSQ0xLICovCiAJCWZzX29zeW5jID0gU1NDX0ZTT1NfTkVHQVRJVkU7CiAKIAkJcmNtciA9
CSAgU1NDX0JGKFJDTVJfU1RURExZLCAxKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
