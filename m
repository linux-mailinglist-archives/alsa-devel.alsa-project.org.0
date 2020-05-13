Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BB1D1112
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 13:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E381666;
	Wed, 13 May 2020 13:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E381666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589368785;
	bh=oq0yqvHNT3/6ZgIfAIuvYvhB7CYQtCI1+wx+EecQMuM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KfDFczZFXa6wkhLTcWXhONvJxTpNU3j1b4wWha9xFG6JR7nULiPoz8y3nP+LBuEKD
	 wkHTFyqtcMjtPKIUCTs4bbVMpYxpVhG99uDDKtJPoO+CYpTny1eG3gMXyz6nseXpN+
	 kwgQUReNlnhtlj2usU6acFGbGWAQNks9/Q4BorY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E43E9F80253;
	Wed, 13 May 2020 13:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19593F80247; Wed, 13 May 2020 13:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 0FB95F800E3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 13:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB95F800E3
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35ebbd658feb-cf5ea;
 Wed, 13 May 2020 19:13:28 +0800 (CST)
X-RM-TRANSID: 2ee35ebbd658feb-cf5ea
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65ebbd655ed9-e0e21;
 Wed, 13 May 2020 19:13:28 +0800 (CST)
X-RM-TRANSID: 2ee65ebbd655ed9-e0e21
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz
Subject: [PATCH] ASoC: fsl: imx-audmix: Fix unused assignment to variable 'ret'
Date: Wed, 13 May 2020 19:14:08 +0800
Message-Id: <20200513111408.11452-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

Omit unused initialized value, because 'ret' will be assigined
by the function snd_soc_component_read().

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/fsl/fsl_audmix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 5faecbeb5..8b9027f76 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -116,7 +116,7 @@ static int fsl_audmix_put_mix_clk_src(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
 	unsigned int reg_val, val, mix_clk;
-	int ret = 0;
+	int ret;
 
 	/* Get current state */
 	ret = snd_soc_component_read(comp, FSL_AUDMIX_CTR, &reg_val);
@@ -159,7 +159,7 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	u32 out_src, mix_clk;
 	unsigned int reg_val, val, mask = 0, ctr = 0;
-	int ret = 0;
+	int ret;
 
 	/* Get current state */
 	ret = snd_soc_component_read(comp, FSL_AUDMIX_CTR, &reg_val);
-- 
2.20.1.windows.1



