Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6293E29F5
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 13:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E3116E1;
	Fri,  6 Aug 2021 13:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E3116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628250295;
	bh=chhPzgGlHlmsI2aXic5J0cn66W0OA9yfV1Ne08AgXr4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W1ZnMPvZxWdop88IVcUSCaw9q5xW4cla076mfXZNfqS9RxIbDlgdy6Qsf/XNWjL/l
	 YtIHgRMM4+p8BS2quNgnc6ZlFtc6mUYvScku3crvO9+j8wvk9pDIs+uNFlZYu2s7vt
	 LGnozpfSNe0DVcLhkZfwEaA1hZroxQsnY1H2ynvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D6AF80169;
	Fri,  6 Aug 2021 13:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 831D7F801F7; Fri,  6 Aug 2021 13:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 011D4F8010A
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 13:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 011D4F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="LftT4vEU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1628250147; bh=chhPzgGlHlmsI2aXic5J0cn66W0OA9yfV1Ne08AgXr4=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=LftT4vEUS3JYLqt4eQZJRY2sGHsCJDr3rARelYCOU+2+1h5GOgfw0K+Z4a8IVAEmo
 CVsYTA4cVUkgQc64ZKc4gecrJp+oIjnnM2vw84JUujR6XQGxLgMDCOlMT3CoJY5MrW
 BWtOUhbMm3RUIL/1OzsyyEAAH2fpC+TUc77FAkog=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Fri,  6 Aug 2021 13:42:27 +0200 (CEST)
X-EA-Auth: 8DhMzZZrEP2yfjEUnkrIZeRAg9eb4SA3Djlt8yEJXqLYwqs+EH5Dgaq3W/ifqIT2E9wwbfOiH+3BpMkUTz/OcJ20/nE7+CBOgyrNnk5SALA=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH v2] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
Date: Fri,  6 Aug 2021 13:41:16 +0200
Message-Id: <20210806114116.895473-1-vincent.knecht@mailoo.org>
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
v1->v2: thanks Srinivas for the review, and Stephan for guidance
- Add _SEC suffix to defines to highlight usage for secondary mi2s
- Clear TLMM_WS_OUT_SEL and TLMM_WS_EN_SEL fields before setting value
---
 sound/soc/qcom/apq8016_sbc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 08a05f0ecad7..ba2a98268ee4 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -30,6 +30,13 @@ struct apq8016_sbc_data {
 #define MIC_CTRL_QUA_WS_SLAVE_SEL_10	BIT(17)
 #define MIC_CTRL_TLMM_SCLK_EN		BIT(1)
 #define	SPKR_CTL_PRI_WS_SLAVE_SEL_11	(BIT(17) | BIT(16))
+#define SPKR_CTL_TLMM_MCLK_EN		BIT(1)
+#define SPKR_CTL_TLMM_SCLK_EN		BIT(2)
+#define SPKR_CTL_TLMM_DATA1_EN		BIT(3)
+#define SPKR_CTL_TLMM_WS_OUT_SEL_MASK	GENMASK(7, 6)
+#define SPKR_CTL_TLMM_WS_OUT_SEL_SEC	BIT(6)
+#define SPKR_CTL_TLMM_WS_EN_SEL_MASK	GENMASK(19, 18)
+#define SPKR_CTL_TLMM_WS_EN_SEL_SEC	BIT(18)
 #define DEFAULT_MCLK_RATE		9600000
 
 static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
@@ -40,6 +47,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
 	int i, rval;
+	u32 value;
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -53,6 +61,15 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 			MIC_CTRL_TLMM_SCLK_EN,
 			pdata->mic_iomux);
 		break;
+	case MI2S_SECONDARY:
+		/* Clear TLMM_WS_OUT_SEL and TLMM_WS_EN_SEL fields */
+		value = readl(pdata->spkr_iomux) &
+			~(SPKR_CTL_TLMM_WS_OUT_SEL_MASK | SPKR_CTL_TLMM_WS_EN_SEL_MASK);
+		/* Configure the Sec MI2S to TLMM */
+		writel(value | SPKR_CTL_TLMM_MCLK_EN | SPKR_CTL_TLMM_SCLK_EN |
+			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
+			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
-- 
2.31.1



