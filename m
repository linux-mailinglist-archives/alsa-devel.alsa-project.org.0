Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9187276A8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 07:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51BAA100;
	Thu,  8 Jun 2023 07:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51BAA100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686202109;
	bh=pUsSeN+HfDRdU0OEQ7xNBDLWDoa5UUMnpmd+LQ/GiM8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JmSS72ulN2NqCfKpraVdbePoIgHJol4WmJdw6Z8110A4PRNytsMvRBOfHKxruH2xO
	 /w525soRzP/NkfhsOASfsQKZd0VpQCCzyyOsrHpPSfwyOtJ193x0ovl7UGgNlFxhzz
	 ahsDzZDSiAhLkdukuoANyMhLZlq4zeIcB12vOtjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 573F2F800ED; Thu,  8 Jun 2023 07:27:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D443EF8016C;
	Thu,  8 Jun 2023 07:27:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E93F80199; Thu,  8 Jun 2023 07:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 664FBF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 07:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 664FBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=Lg2L8LSF
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 78BAqQV8E5y9n78BAqmbdj; Thu, 08 Jun 2023 07:27:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1686202046;
	bh=NC7exZWD31sFeAwipTt4OgnGAif/dXKMSn2/zIDOEiQ=;
	h=From:To:Cc:Subject:Date;
	b=Lg2L8LSFWbJeuTvjlyjI7VHKdR4+wJ2HclIeWo3/25PD6YibOWY2yYSUShhHI1oWf
	 sa8/rcyF2vvXwO7SzG8DxnsSyf6H/GhxIN2SA10AsHw5b8W517fKLASoy0REEGghXt
	 NqBs3z5eXSIsEnKjA3O7cGa9Eg4wT5a/FW8b1P6qF87R7dTPE6EmCf1E/xEvjEFglQ
	 wCUwwY8oP6iBpl4s8SCWBRfW5f3jIo72jTdCW5ToXjY7tun/qA8co4TvDA8eYRvYsD
	 vilvFZG9NqFNXK2ijn8QKcUsmFogds4Lc3VXEIfvhq+6lBYJMU50Y2QRHmrrZVngqX
	 O8hBytCNDkVHg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Jun 2023 07:27:26 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Simplify code around clk_get_rate() handling
Date: Thu,  8 Jun 2023 07:27:22 +0200
Message-Id: 
 <53f928290f08f50ff43031e17fe1d88443c2c441.1686202022.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A3OPWK7OJEWDV5WPTASVFW4DOOEJ2G2L
X-Message-ID-Hash: A3OPWK7OJEWDV5WPTASVFW4DOOEJ2G2L
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3OPWK7OJEWDV5WPTASVFW4DOOEJ2G2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clk_get_rate() returns an unsigned long, so there is no point in storing it
in a long, and test for negative values.

So, turn 'parent_rate' into an unsigned long, simplify the sanity check,
the error message and the return value, in case of error (i.e. 0).

Doing so also turns 'i' and 'valid_rates' into unsigned long, but it is
fine and harmless.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/tegra/tegra20_i2s.c   | 9 ++++-----
 sound/soc/tegra/tegra20_spdif.c | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index e1a0f50969c1..d38b58305c6b 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -273,13 +273,12 @@ static int tegra20_i2s_filter_rates(struct snd_pcm_hw_params *params,
 	struct snd_soc_dai *dai = rule->private;
 	struct tegra20_i2s *i2s = dev_get_drvdata(dai->dev);
 	struct clk *parent = clk_get_parent(i2s->clk_i2s);
-	long i, parent_rate, valid_rates = 0;
+	unsigned long i, parent_rate, valid_rates = 0;
 
 	parent_rate = clk_get_rate(parent);
-	if (parent_rate <= 0) {
-		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
-			parent_rate);
-		return parent_rate ?: -EINVAL;
+	if (!parent_rate) {
+		dev_err(dai->dev, "Can't get parent clock rate\n");
+		return -EINVAL;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tegra20_i2s_rates); i++) {
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 86bef54dfdf2..d034803695a0 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -187,13 +187,12 @@ static int tegra20_spdif_filter_rates(struct snd_pcm_hw_params *params,
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	struct clk *parent = clk_get_parent(spdif->clk_spdif_out);
 	static const unsigned int rates[] = { 32000, 44100, 48000 };
-	long i, parent_rate, valid_rates = 0;
+	unsigned long i, parent_rate, valid_rates = 0;
 
 	parent_rate = clk_get_rate(parent);
-	if (parent_rate <= 0) {
-		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
-			parent_rate);
-		return parent_rate ?: -EINVAL;
+	if (!parent_rate) {
+		dev_err(dai->dev, "Can't get parent clock rate\n");
+		return -EINVAL;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(rates); i++) {
-- 
2.34.1

