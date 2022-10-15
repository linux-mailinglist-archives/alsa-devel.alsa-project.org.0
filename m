Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1525FF789
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Oct 2022 02:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8790872D2;
	Sat, 15 Oct 2022 02:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8790872D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665792841;
	bh=shOX9kfX1Rh6vXzWbwOdxyQ42SN6zQjnm/Kdib8Mep4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g4N+9aikP5yNQOQlNPHcWL61FhBB0/7ui/QDnaELXVwMpfNLQ0bc1HoaM6TNSErKk
	 8bMBbmoyXWQP1fKTioDwLLwqNf6zB3b3OJ9q0cYuh8Md0Qfq2eXf7mGGRctFLsWY+E
	 Y6mKu8VPs1YXPvim4FWOAVc3IJ2byhzwjizK73kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FC8F80240;
	Sat, 15 Oct 2022 02:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 225B5F801F5; Sat, 15 Oct 2022 02:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4749BF80115
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 02:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4749BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="ekN/1fFj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KNt+pCSIUZ9+O3L8HoQe1tmbspN8QLuURkdKt3vda7s=; b=ekN/1fFjDh8HdTdr8OyIHH1VZ3
 1B+vgd01iZnf/itUErKgBI6cOUZdEIryUBIi7QTCLZGMstfAxWfeAYPvlo3CFivnE+wQHPSrzYW0O
 acGL9OA49uWn03sKPDxKg9XgnpIgYs7zv2QE1LejVxnphyYME/cn0Z9O0uxztpw28nhncRyD5EPMw
 YL6p078s0zH3RMzpqf6tf/Tzbk1fhu2M1tVDsUJ1FQ3ZNU7XYm8ayN/CBGM7fmOHr4k+sCDcKWDiK
 yuvHZaN6xhThWecIgpyts8ItC2+Qhr8BU1QHxeKVvY8o+yFEHtquMgk/zRwPnCcND2K6HpV6LMg2h
 +ZTgzp5A==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ojUn8-0081ai-Hl; Sat, 15 Oct 2022 00:12:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: SND_SOC_SC7180 optionally depends on SOUNDWIRE
Date: Fri, 14 Oct 2022 17:12:28 -0700
Message-Id: <20221015001228.18990-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Ajit Pandey <ajitp@codeaurora.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If SOUNDWIRE is enabled, then SND_SOC_SC7180 should depend on
SOUNDWIRE to prevent SOUNDWIRE=m and SND_SOC_SC7180=y, which causes
build errors:

s390-linux-ld: sound/soc/qcom/common.o: in function `qcom_snd_sdw_prepare':
common.c:(.text+0x140): undefined reference to `sdw_disable_stream'
s390-linux-ld: common.c:(.text+0x14a): undefined reference to `sdw_deprepare_stream'
s390-linux-ld: common.c:(.text+0x158): undefined reference to `sdw_prepare_stream'
s390-linux-ld: common.c:(.text+0x16a): undefined reference to `sdw_enable_stream'
s390-linux-ld: common.c:(.text+0x17c): undefined reference to `sdw_deprepare_stream'
s390-linux-ld: sound/soc/qcom/common.o: in function `qcom_snd_sdw_hw_free':
common.c:(.text+0x344): undefined reference to `sdw_disable_stream'
s390-linux-ld: common.c:(.text+0x34e): undefined reference to `sdw_deprepare_stream'

Fixes: 3bd975f3ae0a ("ASoC: qcom: sm8250: move some code to common")
Fixes: 9e3ecb5b1681 ("ASoC: qcom: sc7180: Add machine driver for sound card registration")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ajit Pandey <ajitp@codeaurora.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org
Cc: alsa-devel@alsa-project.org
---
Sorry, I can't tell which Fixes: hash is appropriate here.

 sound/soc/qcom/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_SC8280XP
 config SND_SOC_SC7180
 	tristate "SoC Machine driver for SC7180 boards"
 	depends on I2C && GPIOLIB
+	depends on SOUNDWIRE || SOUNDWIRE=n
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
