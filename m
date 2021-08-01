Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C13DCA84
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 09:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CFB918B5;
	Sun,  1 Aug 2021 09:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CFB918B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627803149;
	bh=4G10nVQJkrQltnOTrznYvxzJZvczMCBK7/8KU1oeR88=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=omQEA7jMPSJeuJQBMP37zmgiHqlQrse7CXQOlvpNdXcDPSIbLJLaFDIzv2q0WTg4C
	 plX2caeoorCv957kT5HosQ/gNvFX41qam1zyHlJyHiHAng1MiaVKR6Z1Y9o8IUxApr
	 h0kQ3LtrrXiCYCz0H27BYqwT7vjvEEbZrhlCentM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50D1F8014D;
	Sun,  1 Aug 2021 09:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEDBF802E8; Sun,  1 Aug 2021 09:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D335CF8012E
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 09:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D335CF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="eBUwieR1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1627803011; bh=4G10nVQJkrQltnOTrznYvxzJZvczMCBK7/8KU1oeR88=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=eBUwieR1Jcmb5GNy2OCAfoRL07rmcEzJrloVfNwd8Su77lb82ETEQucE5RnzTB/RO
 xfWu7A2kYnBkPnUey4Wyw6p5A0BR/trF0X9hCEG10evkCJCeO9swPawWdHctTWwbqI
 QQ8S+PRfLmSnLCmxz2sN7kkdyAljdDeMoghPDWNo=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun,  1 Aug 2021 09:30:11 +0200 (CEST)
X-EA-Auth: ZR/HJzMxTWSmhw2LBY8jJO+wEhwbhSwSmMdyX7IU/oyZLhWZY6TfL/dPrWEE0YA7ybC/EhpxzXNGH1WMdyWhfMlCG/30t8t9bMiEKc0TZ5A=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
Date: Sun,  1 Aug 2021 09:29:51 +0200
Message-Id: <20210801072951.1403241-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

This patch adds external codec support on secondary mi2s.
It is used for headphones on some devices, eg. alcatel-idol347.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/qcom/apq8016_sbc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 08a05f0ecad7..53460272eb1e 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -30,6 +30,11 @@ struct apq8016_sbc_data {
 #define MIC_CTRL_QUA_WS_SLAVE_SEL_10	BIT(17)
 #define MIC_CTRL_TLMM_SCLK_EN		BIT(1)
 #define	SPKR_CTL_PRI_WS_SLAVE_SEL_11	(BIT(17) | BIT(16))
+#define SPKR_CTL_TLMM_MCLK_EN		BIT(1)
+#define SPKR_CTL_TLMM_SCLK_EN		BIT(2)
+#define SPKR_CTL_TLMM_DATA1_EN		BIT(3)
+#define SPKR_CTL_TLMM_WS_OUT_SEL	BIT(6)
+#define SPKR_CTL_TLMM_WS_EN_SEL		BIT(18)
 #define DEFAULT_MCLK_RATE		9600000
 
 static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
@@ -53,6 +58,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 			MIC_CTRL_TLMM_SCLK_EN,
 			pdata->mic_iomux);
 		break;
+	case MI2S_SECONDARY:
+		/* Configure the Sec MI2S to TLMM */
+		writel(readl(pdata->spkr_iomux) | SPKR_CTL_TLMM_MCLK_EN |
+			SPKR_CTL_TLMM_SCLK_EN | SPKR_CTL_TLMM_DATA1_EN |
+			SPKR_CTL_TLMM_WS_OUT_SEL | SPKR_CTL_TLMM_WS_EN_SEL,
+			pdata->spkr_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
-- 
2.31.1



