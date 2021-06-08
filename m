Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD539FC13
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 18:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD2717CB;
	Tue,  8 Jun 2021 18:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD2717CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623168626;
	bh=wpAfp3qUoMFfJe+Pdvo4bHsTHmlMu+nKKGrhYFiiY6w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QgTuwjZmHtPIwLhJQ04XRncBCYuakONpe4PerThmGn5hYlVR9FfXaZANHPer6SY7y
	 /MBMSd9aBRmvTA+1QMGxZZsPdPSyKDYR+0okRWTOractXTtp1QVqmePeXNjiT6LTvk
	 bhjC2rjpQyLtuY5fcnZWRzs+dh0XyB3RdSrCJOB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC2CF804D2;
	Tue,  8 Jun 2021 18:08:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C83BEF804DA; Tue,  8 Jun 2021 18:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CA26F804D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 18:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA26F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hG6rxBdz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91BCB61351;
 Tue,  8 Jun 2021 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623168478;
 bh=wpAfp3qUoMFfJe+Pdvo4bHsTHmlMu+nKKGrhYFiiY6w=;
 h=From:To:Cc:Subject:Date:From;
 b=hG6rxBdzTwfY/h0LUNB/MTMlERhVg+wF6SwFnyhSv0EZzmI/kMU2rFKtcZkGRA6Dm
 lIllWjN/KRV3ZdYSTM2Ipj/uASJV8kXCPZb1fgs8CuphSvI+DWOyscprFq9MLzoc7/
 5AoSgNnag3YrfOq01mITccE0eP5ddepeP2qDeuAEowxRyM/mKJ/heallGHa6KO1VSD
 mxFG8zOgJJycIHul+BNVv/bj+3uG9XvC8CYWbgAdpEU0MGpC2u8YCFTa4ngRLFM9Gk
 2nnvu0ySizqPMjWU7UeUnvtxrUkkm3GR7LyrFjWF+pY5yyElhb8lGYAKniRu5qg9j/
 ajr5iU4Yny4bA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5645: Avoid upgrading static warnings to errors
Date: Tue,  8 Jun 2021 17:07:13 +0100
Message-Id: <20210608160713.21040-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4116; h=from:subject;
 bh=wpAfp3qUoMFfJe+Pdvo4bHsTHmlMu+nKKGrhYFiiY6w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBgv5VGYc46d0YKEj6RI61ZgNqHX3bcNVqNZu2WWY83
 9kAR6IWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYL+VRgAKCRAk1otyXVSH0IusB/
 41Q9tGncDk8n8T0PG1VWvkN3ogLl4XzwF8Aq48JfXumeFSNN8QBlt+sjmlUn8RXEzxACEOYOR96TTR
 dJsy8PH+jeWxP0XdClnY9Hser69els5S4WRPC+Un11FLgESRteuD59FRwTE/ouAAW9HYzrLDQsNT0t
 5ccvPPh1MbP8JKq/GYQgFMbIVq3RaAkWSJ2G20la6oUdFk8J8wZsGSZZXrnAuv99d3Beus1aPZbO1e
 G2bPcf/hHR14AkHoodpF/QG2f5slKRjhYr1Dd3+MYwJ6kYCasJuT83oUunnZKz9R1ijpJsoXHcsXPI
 EUWhgktXfL+tiY47Tv7BqNxZ/EM3C/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Phillip Potter <phil@philpotter.co.uk>
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

One of the fixes reverted as part of the UMN fallout was actually fine,
however rather than undoing the revert the process that handled all this
stuff resulted in a patch which attempted to add extra error checks
instead.  Unfortunately this new change wasn't really based on a good
understanding of the subsystem APIs and bypassed the usual patch flow
without ensuring it was reviewed by people with subsystem knowledge and
was merged as a fix rather than during the merge window.

The effect of the new fix is to upgrade what were previously warnings on
static data in the code to hard errors on that data.  If this actually
happens then it would break existing systems, if it doesn't happen then
the change has no effect so this was not a safe change to apply as a fix
to the release candidates.  Since the new code has not been tested and
doesn't in practice improve error handling revert it instead, and also
drop the original revert since the original fix was fine.  This takes
the driver back to what it was in -rc1.

Fixes: 5e70b8e22b64e ("ASoC: rt5645: add error checking to rt5645_probe function")
Fixes: 1e0ce84215dbf ("Revert "ASoC: rt5645: fix a NULL pointer dereference")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Phillip Potter <phil@philpotter.co.uk>
---
 sound/soc/codecs/rt5645.c | 49 +++++++++------------------------------
 1 file changed, 11 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 438fa18bcb55..9408ee63cb26 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3388,44 +3388,30 @@ static int rt5645_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
-	int ret = 0;
 
 	rt5645->component = component;
 
 	switch (rt5645->codec_type) {
 	case CODEC_TYPE_RT5645:
-		ret = snd_soc_dapm_new_controls(dapm,
+		snd_soc_dapm_new_controls(dapm,
 			rt5645_specific_dapm_widgets,
 			ARRAY_SIZE(rt5645_specific_dapm_widgets));
-		if (ret < 0)
-			goto exit;
-
-		ret = snd_soc_dapm_add_routes(dapm,
+		snd_soc_dapm_add_routes(dapm,
 			rt5645_specific_dapm_routes,
 			ARRAY_SIZE(rt5645_specific_dapm_routes));
-		if (ret < 0)
-			goto exit;
-
 		if (rt5645->v_id < 3) {
-			ret = snd_soc_dapm_add_routes(dapm,
+			snd_soc_dapm_add_routes(dapm,
 				rt5645_old_dapm_routes,
 				ARRAY_SIZE(rt5645_old_dapm_routes));
-			if (ret < 0)
-				goto exit;
 		}
 		break;
 	case CODEC_TYPE_RT5650:
-		ret = snd_soc_dapm_new_controls(dapm,
+		snd_soc_dapm_new_controls(dapm,
 			rt5650_specific_dapm_widgets,
 			ARRAY_SIZE(rt5650_specific_dapm_widgets));
-		if (ret < 0)
-			goto exit;
-
-		ret = snd_soc_dapm_add_routes(dapm,
+		snd_soc_dapm_add_routes(dapm,
 			rt5650_specific_dapm_routes,
 			ARRAY_SIZE(rt5650_specific_dapm_routes));
-		if (ret < 0)
-			goto exit;
 		break;
 	}
 
@@ -3433,17 +3419,9 @@ static int rt5645_probe(struct snd_soc_component *component)
 
 	/* for JD function */
 	if (rt5645->pdata.jd_mode) {
-		ret = snd_soc_dapm_force_enable_pin(dapm, "JD Power");
-		if (ret < 0)
-			goto exit;
-
-		ret = snd_soc_dapm_force_enable_pin(dapm, "LDO2");
-		if (ret < 0)
-			goto exit;
-
-		ret = snd_soc_dapm_sync(dapm);
-		if (ret < 0)
-			goto exit;
+		snd_soc_dapm_force_enable_pin(dapm, "JD Power");
+		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
+		snd_soc_dapm_sync(dapm);
 	}
 
 	if (rt5645->pdata.long_name)
@@ -3454,14 +3432,9 @@ static int rt5645_probe(struct snd_soc_component *component)
 		GFP_KERNEL);
 
 	if (!rt5645->eq_param)
-		ret = -ENOMEM;
-exit:
-	/*
-	 * If there was an error above, everything will be cleaned up by the
-	 * caller if we return an error here.  This will be done with a later
-	 * call to rt5645_remove().
-	 */
-	return ret;
+		return -ENOMEM;
+
+	return 0;
 }
 
 static void rt5645_remove(struct snd_soc_component *component)
-- 
2.20.1

