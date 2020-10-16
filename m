Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DA290AED
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA3E1825;
	Fri, 16 Oct 2020 19:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA3E1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602870064;
	bh=f7zC+LzjoGoUsVNQSBcrys5LQD5IsmCu4Kqgrw+Pegk=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PLT9THaofNk9hsqw6aZ04k+bSt0d9D8DTu5x+M08K7kL6CWPNi8q7Kfd8I1VISTu6
	 B+znfAqcRphpO5vzzFxJByiD1R61c4eqj/IfEyYsNDGm7T6RZArNuNRBSDXYLQd3UB
	 AP3Y0cY1D0gAEF6CXVA3W6J0yWUOmYcp18OV8kkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 450DAF80226;
	Fri, 16 Oct 2020 19:40:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12114F80225; Fri, 16 Oct 2020 19:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDBA9F8020D
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBA9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="I7mTumPX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=R0mypQamIs9PrXy5bHGToqca7ODD6+Ny7S1/CFfb2yc=; b=I7mTumPXDmlb+ddOtYMIsVyKjn
 qKb8I8MfJ5cxJTMLFcPFQoTsVO0Fl951lKjgPvGaL2ahtCyM9MOvPw9Cjji3yH4Mh8DkmQVYulDvE
 Du2T4G1AsIneiXXcH04DxDeFqp3DBPBtadu70dDtq4FzQ4+EBV92sq/Exjzzl4EjFihAPJZfOyq/k
 xH4M8XPM3QGtwElVYAKp8d+PdEOwmbezQD/D0EM3Hoq9gMV/y0jHjEzFXXm+0T7/u25oV+K6dLZqn
 juN2MpQPKv6YLbFH1UDiKRnR8feur3yEYtgz8RbbYBBvVE2CBpKg/2bZF9dfKCYp5fsyw0FTLLC74
 9Ue92Khw==;
Received: from [2601:1c0:6280:3f0::507c]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTThn-00023v-8b; Fri, 16 Oct 2020 17:39:51 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ASoC: qcom: MSM8996 depends on COMMON_CLK
Message-ID: <548bb7f8-672d-3d95-0d78-cef1c9837a42@infradead.org>
Date: Fri, 16 Oct 2020 10:39:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
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

From: Randy Dunlap <rdunlap@infradead.org>

Fix a kconfig warning in sound/soc/qcom:

WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && COMMON_CLK [=n]
  Selected by [y]:
  - SND_SOC_MSM8996 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y]

This is needed because 'select' does not follow dependency chains.

Fixes: a6f933f63f2f ("ASoC: qcom: apq8096: Add db820c machine driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
Found in linux-next but applies to mainline.

 sound/soc/qcom/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20201016.orig/sound/soc/qcom/Kconfig
+++ linux-next-20201016/sound/soc/qcom/Kconfig
@@ -106,6 +106,7 @@ config SND_SOC_QDSP6
 config SND_SOC_MSM8996
 	tristate "SoC Machine driver for MSM8996 and APQ8096 boards"
 	depends on QCOM_APR
+	depends on COMMON_CLK
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	help

