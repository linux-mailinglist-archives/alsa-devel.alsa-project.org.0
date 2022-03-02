Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45E4CA036
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F7F2229;
	Wed,  2 Mar 2022 10:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F7F2229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211761;
	bh=2mmj0TWLm2W7cxuzBm4uSKeuTZ9NMMhXiXSJNbuiKKc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NQzPWpeyAjt5ItkeaPnyy/2L9ZFI9dfXYyweNF2ENjWo5lFxXT6qb7REpd7WEts16
	 3jWxQ9SQ4Cg501qGfc13rXPQMH3+4OGphkaWs8ZGiETZfh27KcM1/C/RnCxjVOPuLw
	 nZc4CDwQJfpI8SVT3kqK1pGiyM8GiGyLDMyfWsjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05268F80C0F;
	Wed,  2 Mar 2022 09:34:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0376FF80167; Wed,  2 Mar 2022 09:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 872B2F80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 09:15:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 872B2F80167
X-QQ-mid: bizesmtp77t1646208909tozdlr7p
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 02 Mar 2022 16:15:04 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: 5MyhjOca6cU9yUHIx9no9FannyNiVghnXH98EgzPBbBOKRtYKGMkPzrxP6ZcP
 SfPZp5NObV+KqN/0JwIfl/Shg3ay3rpsjTqRMbdyT1839CS/uvOzRyZJI9wHHhPvFPWrBPL
 U31gkgtSJUxKsHEWOFuBgxtXzpCXay5/qIB0oSbTrxoZj8FDKGaJOO7iU5N3M0WUJEihT0+
 /sOpEzyeCJHI6PV2NKWwCmWm74aU5RgYWBOzr94xzWt6oQKA2RdkkGLvPNI4VXQrkMlEKFy
 xSpL+MRvgKiP1lFAYX1xXCcpNdPBdqWOlnM2Rgs8+17MW6hdcU97KK/RTRqBfIa0q4sLc47
 VvXuG5M1B5nOHOMHqCJeTYXduLYsS/fzbfmY9lY
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: amd: use asoc_substream_to_rtd()
Date: Wed,  2 Mar 2022 16:15:02 +0800
Message-Id: <20220302081502.25367-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
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

Uses asoc_substream_to_rtd() helper.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 14cf325e4b23..f2c32e5ed24f 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -101,7 +101,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -119,7 +119,7 @@ static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai =
 			snd_soc_card_get_codec_dai(card,
@@ -141,7 +141,7 @@ static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
 static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -158,7 +158,7 @@ static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
-- 
2.20.1



