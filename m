Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD96FFF16
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 04:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AF49F6;
	Fri, 12 May 2023 04:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AF49F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683860127;
	bh=I+dlY4O4bxWc/K85nwpH1nqjFktPiV0pZFwfoBrV0rM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tes1dVQx5UX4keKnjVvu6WlVzRHUKdDnCcxGLP9/hewCkq0ahFdW570YOdMzp3Qcl
	 8FbK7Wl4gTjLtxyRGPLs02ZTcJHwIrmH1lbWmwLkYs/wo71XZpbMKTZmCv9hfY7c5f
	 mlqUxevQ8+pTv0guXYxbPXm9SH3I1BS7EVY54u2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D26F6F8052E; Fri, 12 May 2023 04:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2D7F80087;
	Fri, 12 May 2023 04:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE13F8052E; Fri, 12 May 2023 04:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0E7EF8014C;
	Fri, 12 May 2023 04:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E7EF8014C
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0ViNAMMq_1683860051;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0ViNAMMq_1683860051)
          by smtp.aliyun-inc.com;
          Fri, 12 May 2023 10:54:13 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: pierre-louis.bossart@linux.intel.com
Cc: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] ASoC: SOF: topology: Fix missing error code in
 sof_route_load()
Date: Fri, 12 May 2023 10:54:10 +0800
Message-Id: <20230512025410.52832-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZXEVPMLUTS3KF4YU45TURPULE5RUE3UG
X-Message-ID-Hash: ZXEVPMLUTS3KF4YU45TURPULE5RUE3UG
X-MailFrom: jiapeng.chong@linux.alibaba.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXEVPMLUTS3KF4YU45TURPULE5RUE3UG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'err'.

sound/soc/sof/topology.c:2060 sof_route_load() warn: missing error code 'ret'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4935
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d3d536b0a8f5..3ca3a72f1805 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2045,7 +2045,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	if (!source_swidget) {
 		dev_err(scomp->dev, "error: source %s not found\n",
 			route->source);
-		ret = -EINVAL;
 		goto err;
 	}
 
@@ -2064,7 +2063,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	if (!sink_swidget) {
 		dev_err(scomp->dev, "error: sink %s not found\n",
 			route->sink);
-		ret = -EINVAL;
 		goto err;
 	}
 
@@ -2087,6 +2085,8 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	return 0;
 err:
 	kfree(sroute);
+	ret = -EINVAL;
+
 	return ret;
 }
 
-- 
2.20.1.7.g153144c

