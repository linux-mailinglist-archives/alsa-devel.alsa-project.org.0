Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C912806B7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:37:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B82FF18BE;
	Thu,  1 Oct 2020 20:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B82FF18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601577423;
	bh=BFIwTvkKl84G/KK0zM7dsMUPPmUNo+ZpaTVP4vuWqkA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gx//okZIzSHSR/3uxCLS/bor7ZwdAPd8y0UxXyJtaPazRh9jYPS0yAko6J2pI1tlV
	 9DVFomNNECZzfvM3CUW1jhqJ8+D7Z+pxVvxiVJv6w8MDiPbv+E8S9OwYpWZJolVS7n
	 bkEtiiLuBaI8Ik2O15XZUxW5j4jBt//238DEMh3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A66C0F8022D;
	Thu,  1 Oct 2020 20:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9E3CF80105; Thu,  1 Oct 2020 20:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 248B7F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 248B7F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="g/TbC4Yb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NLKA4WpPXheXIY0bbRPMMEUjTjZjozvEydHHIexa+Yk=; b=g/TbC4YbQPH8dALRZx/yj1WJ05
 upa+c9yNoUfwo2RdfDzMsrOlaZSYbuyPQaTvA31dSkO4W1GRTbKLT4XPn4Qp5tvXHDv820PE6tZzL
 sbLcNcaBT/WdBuorAf7p0Sk14FX+bhU9rNXsNKkP3JYN89+F3eogNZmaOKSLXV7gnZ2NCQzHlElYA
 Y/UeEfNV5jt8HRApWBqtM3KafedS14M/8B2CJYbhFR77TsUiuzSsycYLk4EYKK0iR9puVSoG0NbkO
 yDCptntIPc4IEWuUJCQNCFtN70Lbom/o7/KIOB3xI/7a/t7mrlSpJYx+OllGPj9bjKTnuXA7C2r8k
 NMefPFow==;
Received: from [2601:1c0:6280:3f0::863] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO3Qb-00050P-UE; Thu, 01 Oct 2020 18:35:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] ASoC: qcom: fix SDM845 & QDSP6 dependencies more
Date: Thu,  1 Oct 2020 11:35:37 -0700
Message-Id: <20201001183537.5781-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Fix a build error and Kconfig warning in sound/soc/qcom/.

ld: sound/soc/qcom/qdsp6/q6afe-clocks.o: in function `q6afe_clock_dev_probe':
q6afe-clocks.c:(.text+0x182): undefined reference to `devm_clk_hw_register'
ld: q6afe-clocks.c:(.text+0x19d): undefined reference to `of_clk_add_hw_provider'

After adding "depends on COMMON_CLK" for SND_SOC_QDSP6, the Kconfig
warning appears because "select" does not honor any "depends on"
clauses, so fix the dependency for SND_SOC_SDM845 also.

WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && COMMON_CLK [=n]
  Selected by [y]:
  - SND_SOC_SDM845 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && I2C [=y] && SOUNDWIRE [=y]

Fixes: 520a1c396d19 ("ASoC: q6afe-clocks: add q6afe clock controller")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/qcom/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20201001.orig/sound/soc/qcom/Kconfig
+++ linux-next-20201001/sound/soc/qcom/Kconfig
@@ -82,6 +82,7 @@ config SND_SOC_QDSP6_ASM_DAI
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
 	depends on QCOM_APR
+	depends on COMMON_CLK
 	select SND_SOC_QDSP6_COMMON
 	select SND_SOC_QDSP6_CORE
 	select SND_SOC_QDSP6_AFE
@@ -110,6 +111,7 @@ config SND_SOC_MSM8996
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
 	depends on QCOM_APR && I2C && SOUNDWIRE
+	depends on COMMON_CLK
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
