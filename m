Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B644126FA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 21:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22F116E5;
	Mon, 20 Sep 2021 21:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22F116E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632166895;
	bh=YtHsuDi4Fv45Zo4EExuZpDjnry3x1PtzQhUjDAzui/g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JfWWJLn0ISSfgCacE00/NCn62deNAFh7aKXzg3t5fCqy2r52Uo4b471wNaW5yLQW8
	 i4YOL2yc35TuMtBjFGkrdMLAUJ9utiLACMz9OISDVFbncBCBsvu70dXLdlApmvLk5v
	 SGxyuk7kOokUWJEHaHSQyjgLljxu5FkcpUkEF7S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29003F80279;
	Mon, 20 Sep 2021 21:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820F3F8025D; Mon, 20 Sep 2021 21:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5425F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 21:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5425F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z27HSHOX"
Received: by mail-lf1-x132.google.com with SMTP id p29so71356446lfa.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d+1u0/MGOf1Q+rRJjNzrlBMOxR6V08d5yL0PRRuFjk=;
 b=Z27HSHOXeONBAxoy541SkWEavFdL299blXuqc2n5ujiwo7gG80cp8+qYAGh1PzTLb+
 f1D74ClKDHTv+VFv1IgQbF9kOYYPrg8ok2OnadReIJlKhVlN5AJv1Ab9aakm5RA6DB+u
 25Hgq7Qaj11btnrGSzWCi3PdFes+eWMGo5CWJ9rR8fnAeltDP4NffLDjv9NbnQeisFu8
 TH7U86NaUg3q/hLUOoxnXUZfBk23sEjy9c1uaFLcQ4JY7VWeHNBD2J2VZ6UHy4WyFTmZ
 FIru+MgsMYPAx9e7JVmxk2COcGnYkK/9RXdjoimhDOO76gKDZOLWvfQIKehOGJTPtqNo
 t74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d+1u0/MGOf1Q+rRJjNzrlBMOxR6V08d5yL0PRRuFjk=;
 b=CqVSZjfsZFIYoyJkWiQagOY+g0RokYp2nOwG8l/77NABZDcJ5jerLHyrtjVja8f7Jv
 ntWs9v3pF2UPxUGd34603V8RHboKAZWX/riZtkmQKGzT9ys3nS2zq5cbw9ODNvn6bCOL
 4QH2VV28tKjb2m1fs/j98Imyp6p3Li5alDibdhm4MiuA80Jpb7bskiUcIfAgzriP1Xq8
 y2WyRfGRH46v7CK3rh4rWFF0NmYRSmJI3rrkgHqntAJ5lK2f9Q5DhSwCfNZ/MBtRjdPV
 Q3F+8TSHwnbF1L2WzZSG89WTbnplaf78cWUWjyhTIry1Mr2NW8BicsZ82FFLQKpV+ZbM
 0QyQ==
X-Gm-Message-State: AOAM532cgMlUbso6hmHcWb6HwXdZb91FihyZn3LYKb3iMP4mEU/uP5dL
 OOFoKx936PWOzqe7RxP7eFFBvUz42gY=
X-Google-Smtp-Source: ABdhPJxkMxrniDwwp6a9hFc5k/MvdsynqXqzCzYiuyoNQHhMjqhkhBiYHRLG4GrNFJMcpZTnzrtiTw==
X-Received: by 2002:a2e:bd8b:: with SMTP id o11mr14743218ljq.321.1632166802693; 
 Mon, 20 Sep 2021 12:40:02 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id y11sm475899lfs.135.2021.09.20.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:40:02 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ASoC: fsl: Constify static snd_soc_ops
Date: Mon, 20 Sep 2021 21:39:47 +0200
Message-Id: <20210920193947.10237-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org
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

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 sound/soc/fsl/imx-card.c   | 4 ++--
 sound/soc/fsl/imx-hdmi.c   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index a364e2415de0..0d637929bfef 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -132,12 +132,12 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops imx_audmix_fe_ops = {
+static const struct snd_soc_ops imx_audmix_fe_ops = {
 	.startup = imx_audmix_fe_startup,
 	.hw_params = imx_audmix_fe_hw_params,
 };
 
-static struct snd_soc_ops imx_audmix_be_ops = {
+static const struct snd_soc_ops imx_audmix_be_ops = {
 	.hw_params = imx_audmix_be_hw_params,
 };
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 58fd0639a069..05dff2dc1d19 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -442,12 +442,12 @@ static int imx_aif_startup(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static struct snd_soc_ops imx_aif_ops = {
+static const struct snd_soc_ops imx_aif_ops = {
 	.hw_params = imx_aif_hw_params,
 	.startup = imx_aif_startup,
 };
 
-static struct snd_soc_ops imx_aif_ops_be = {
+static const struct snd_soc_ops imx_aif_ops_be = {
 	.hw_params = imx_aif_hw_params,
 };
 
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 34a0dceae621..2b663c39edb2 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -59,7 +59,7 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops imx_hdmi_ops = {
+static const struct snd_soc_ops imx_hdmi_ops = {
 	.hw_params = imx_hdmi_hw_params,
 };
 
-- 
2.33.0

