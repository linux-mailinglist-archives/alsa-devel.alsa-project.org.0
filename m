Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8D4F0803
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 08:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494DC16AD;
	Sun,  3 Apr 2022 08:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494DC16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648966302;
	bh=Or4lQWJUiihLs0iEezChU3vKBmOUv26uj33w0ktLa3w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GGyxODLK01sljPRHlA5jLUSGi37/oSEI2cynjXhPu7eP5zbmlCWzLBdJsldaQXyf9
	 8tb64ybubmYNCaknIHA2+yE+ZfF+IGNJoLUEwe2BpDSROA0RWIleVm55r1s8uYEwqH
	 s8zObCQ4sLvofUBYgPp8lztexu+y5iBfsIuGz1g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CFBF8028B;
	Sun,  3 Apr 2022 08:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 958B6F80248; Sun,  3 Apr 2022 08:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F33BF80100
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 08:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F33BF80100
Received: from pop-os.home ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id atRRnoSgJN7CcatRSnMr9N; Sun, 03 Apr 2022 08:10:27 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 03 Apr 2022 08:10:27 +0200
X-ME-IP: 90.126.236.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH] ASoC: codecs: Fix an error handling path in va_macro_probe()
Date: Sun,  3 Apr 2022 08:10:24 +0200
Message-Id: <6d08311472e272fdc1a184f019ec98ade6e9dc46.1648966195.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

After a successful lpass_macro_pds_init() call, lpass_macro_pds_exit() must
be called.

Add the missing call in the error handling path of the probe function and
use it.

Fixes: 9e3d83c52844 ("ASoC: codecs: Add power domains support in digital macro codecs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index f3cb596058e0..d18b56e60433 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1434,8 +1434,10 @@ static int va_macro_probe(struct platform_device *pdev)
 		va->dmic_clk_div = VA_MACRO_CLK_DIV_2;
 	} else {
 		ret = va_macro_validate_dmic_sample_rate(sample_rate, va);
-		if (!ret)
-			return -EINVAL;
+		if (!ret) {
+			ret = -EINVAL;
+			goto err;
+		}
 	}
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -1492,6 +1494,8 @@ static int va_macro_probe(struct platform_device *pdev)
 err_dcodec:
 	clk_disable_unprepare(va->macro);
 err:
+	lpass_macro_pds_exit(va->pds);
+
 	return ret;
 }
 
-- 
2.32.0

