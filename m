Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BC945BE0
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 12:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7841F3F93;
	Fri,  2 Aug 2024 12:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7841F3F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722593981;
	bh=GJ6YXFu2+K8t2pLjzgjjVxGLhJLL/2uUOaQIag8CUIY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YQqNQadHoVyZkyqtqaWfn+Pn5OTxDt3xrbEYF7hQtSceBfMKmXFZT3C/15HMmO1Ga
	 peujJUVi8UtB1EoJ/UfFFpWCI1p8MJwXZ6Eyg3yyTagOGl2zgEnNW+5zpMbq/dbcDo
	 fQx0yX5mTO/HFt83oCLSwQcPa2ZJZ3SVK5a2DG50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EF0BF805A0; Fri,  2 Aug 2024 12:19:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C31F805AF;
	Fri,  2 Aug 2024 12:19:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C585AF8026A; Fri,  2 Aug 2024 12:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9566F8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 12:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9566F8019B
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wb1q23pTwzxVrb;
	Fri,  2 Aug 2024 18:12:30 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B5F0618005F;
	Fri,  2 Aug 2024 18:12:44 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 2 Aug
 2024 18:12:44 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <jonathan.downing@nautel.com>, <piotr.wojtaszczyk@timesys.com>,
	<vz@mleia.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <yuehaibing@huawei.com>
CC: <alsa-devel@alsa-project.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ASoC: fsl: lpc3xxx: Make some symbols static
Date: Fri, 2 Aug 2024 18:10:44 +0800
Message-ID: <20240802101044.3302251-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
Message-ID-Hash: XRSS6HDGYEYURTSJRW2X5YEFC3F3ON3W
X-Message-ID-Hash: XRSS6HDGYEYURTSJRW2X5YEFC3F3ON3W
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRSS6HDGYEYURTSJRW2X5YEFC3F3ON3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These symbols are not used outside of the files, make them static to fix
sparse warnings:

sound/soc/fsl/lpc3xxx-i2s.c:261:30: warning: symbol 'lpc3xxx_i2s_dai_ops' was not declared. Should it be static?
sound/soc/fsl/lpc3xxx-i2s.c:271:27: warning: symbol 'lpc3xxx_i2s_dai_driver' was not declared. Should it be static?
sound/soc/fsl/lpc3xxx-pcm.c:55:39: warning: symbol 'lpc3xxx_soc_platform_driver' was not declared. Should it be static?

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 4 ++--
 sound/soc/fsl/lpc3xxx-pcm.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 62ef624d6dd4..bdb320bb3719 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -258,7 +258,7 @@ static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
+static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.probe	= lpc3xxx_i2s_dai_probe,
 	.startup = lpc3xxx_i2s_startup,
 	.shutdown = lpc3xxx_i2s_shutdown,
@@ -268,7 +268,7 @@ const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
 };
 
-struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
+static struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
diff --git a/sound/soc/fsl/lpc3xxx-pcm.c b/sound/soc/fsl/lpc3xxx-pcm.c
index c0d499b9b8ba..e6abaf63895a 100644
--- a/sound/soc/fsl/lpc3xxx-pcm.c
+++ b/sound/soc/fsl/lpc3xxx-pcm.c
@@ -52,7 +52,7 @@ static const struct snd_dmaengine_pcm_config lpc3xxx_dmaengine_pcm_config = {
 	.prealloc_buffer_size = 128 * 1024,
 };
 
-const struct snd_soc_component_driver lpc3xxx_soc_platform_driver = {
+static const struct snd_soc_component_driver lpc3xxx_soc_platform_driver = {
 	.name = "lpc32xx-pcm",
 };
 
-- 
2.34.1

