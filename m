Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4457000C6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 08:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 567B514E;
	Fri, 12 May 2023 08:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 567B514E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683873854;
	bh=ieEJg8torSpPfmEqEpMqWZeWb2xldKWjqk95B0rn6hI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ST5kUt01oqGB89J+wruVfjQRiRzHTZ/aXVSahPeJ115BDV+QErtbTV0LD1GHV4XYg
	 nqIkmp+tKQEZCz1Bb3hVo7wqZI05oO7pUiNKKC23d31R/BBudfFHU63/CqW0QvgwQo
	 lCKAVuEh2lsfUxBCsizfHw6vKwgb3gyO52e53p6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC5EF80542; Fri, 12 May 2023 08:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57ED4F8032D;
	Fri, 12 May 2023 08:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11A74F8052E; Fri, 12 May 2023 08:42:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51936F8014C;
	Fri, 12 May 2023 08:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51936F8014C
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0ViO.dao_1683873748;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0ViO.dao_1683873748)
          by smtp.aliyun-inc.com;
          Fri, 12 May 2023 14:42:35 +0800
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
Subject: [PATCH] ASoC: SOF: Simplify the calculation of variables
Date: Fri, 12 May 2023 14:42:25 +0800
Message-Id: <20230512064225.75358-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3A3V2YSIUDRD4CXUROH47HODAWDV6HHS
X-Message-ID-Hash: 3A3V2YSIUDRD4CXUROH47HODAWDV6HHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A3V2YSIUDRD4CXUROH47HODAWDV6HHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

./sound/soc/sof/pcm.c:372:27-29: WARNING !A || A && B is equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4938
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 567db32173a8..d14e7fd2c2ee 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -369,7 +369,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* invoke platform trigger to stop DMA even if pcm_ops isn't set or if it failed */
-		if (!pcm_ops || (pcm_ops && !pcm_ops->platform_stop_during_hw_free))
+		if (!pcm_ops || !pcm_ops->platform_stop_during_hw_free)
 			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 		break;
 	default:
-- 
2.20.1.7.g153144c

