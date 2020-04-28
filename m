Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE31BCEAF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 23:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D279B169C;
	Tue, 28 Apr 2020 23:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D279B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588109453;
	bh=n6EOrFbNlRyOni08Xmza/+ml16DI3DOWSj6m+38S1kk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L1JANYsZYzeWwL4AMB/9hKgSZfh59PN5zyBaP9gseZsuSrzDSz2+YmUlA6gxGoj5T
	 HGaQ7AgrawPIRPs6xSVXfN4EMK4oKhRV+KvNxX4HM1xM1AYwlWDA0rvpHTB7V5wRtr
	 ZGgdCy02fMebDtUFKce4VNA1UBOKMr8CuUK2sDVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94177F80290;
	Tue, 28 Apr 2020 23:29:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B23EF80299; Tue, 28 Apr 2020 23:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=RCVD_IN_MSPIKE_BL,
 RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CA25F80290
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA25F80290
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MowOm-1ipG1f4B2s-00qQ8m; Tue, 28 Apr 2020 23:28:50 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: fsl_easrc: mark PM functions __maybe_unused
Date: Tue, 28 Apr 2020 23:28:08 +0200
Message-Id: <20200428212847.2926376-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g/lhTMinUlzKjoBIslu8GiMzNGRtNXY/jrd3tcEcByZM7OBbtB4
 ni0GNMk8eCslNsbQoe99tiGfiOdXiREgzjYzJbkoU6Gk+JZ4JeO5sI2qj8P4KGpZT9P+Qpv
 OP3lNJVvxL9erFHGc981EEpzkjD0ZH4y9R0sxGfaYsFoMgqhsVLURA0ObNL/JoA4VJawBEQ
 5h4lwzodX+tMpvTYcnD/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBdNdq+NZP4=:b+wToa9B5rVpLOXSchgxRB
 6JY0FVY34Rhc/GAf+tjSYKy4MXV4qaTgTG6dYN5wSPegJebeSwS27m7aZuVQ2p0V0JvHtZlM2
 CZAdNivvwKyM8DqbHTmeOP8Ws3J6nV9hEySSUhGRlXBzi58wIqlk6I7aKeV++u1eXpQXarLWP
 Y4WeHJ5mJJpfoSBgECD62/Zw40cdE8e4wSNjxd7gqdjHEqP836JTXitS+jN7wYNRGORmEF900
 wiqiRd+7+LlP6OzSZzmAMWJ1AVFeRys93KH7Zr443pSex6o5J7I2MP3+DOOQDUH2JNq2oNJsK
 2PRFyvv0TxXvwbbxCxNLyYd+BE9QIp2qp2drXnC0Zo6k38X0hyIwYBOLGtnmMf2OQh3Ej2UR/
 BCCkSgysFjYNvrcPfRa7nmL3iz6KznihwJRTK+xLt2O6260HCIaDPAMQZQ6yAJwtaQaGltI5G
 gU7rRMRvOZ4jbBsj9TJpYh1EhjBuOy4kfHaf/X7++BoQmxYGNcO1/pukW8WHEbtprO/aFGwFz
 q5CWlPa6aRn7YY/S58jjmBQQBlPJJ6jXSKK2/mixiYwJujqPAc2q5JrMk6rFUdwTot1xfe58e
 pfG+CFfKV8UF/KDG1ONndrFM48axdxESV5ixK3Q+0mQaXFsHjZBglGRHxmsPuJ1fcuQUaxI+C
 eDJ2InmaQ4R26ibq7h3Bciv8hZurL2Hu/GvN74+utBermv8ICEKLI5EKwkadkfIfMx2pajs0d
 /BnMA4iVnSHHe4tP+6d7IMw65Yywf9QYytTzzNb/FMoaD+VnesyzDykKjEdRSat74JWPLxLOx
 jvcfhBtX3IIJoZYEHghRrBDMSt0Vbn+431jQTOXs6VwECwR+FQ=
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
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

ifdefs are hard, and in this driver the suspend/resume functions are
the only callers of some other helpers that trigger a harmless warning
when CONFIG_PM is disabled:

sound/soc/fsl/fsl_easrc.c:1807:12: warning: 'fsl_easrc_get_firmware' defined but not used [-Wunused-function]
 1807 | static int fsl_easrc_get_firmware(struct fsl_asrc *easrc)
      |            ^~~~~~~~~~~~~~~~~~~~~~
sound/soc/fsl/fsl_easrc.c:303:12: warning: 'fsl_easrc_resampler_config' defined but not used [-Wunused-function]
  303 | static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~

Remove the #ifdef and just mark the callers as __maybe_unused to
suppress the warnings altogether.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/fsl_easrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 20326bffab64..c6b5eb2d2af7 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1997,8 +1997,7 @@ static int fsl_easrc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int fsl_easrc_runtime_suspend(struct device *dev)
+static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2015,7 +2014,7 @@ static int fsl_easrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int fsl_easrc_runtime_resume(struct device *dev)
+static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2094,7 +2093,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	clk_disable_unprepare(easrc->mem_clk);
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
-- 
2.26.0

