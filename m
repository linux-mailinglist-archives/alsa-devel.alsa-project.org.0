Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB65F9E5E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066B7299E;
	Mon, 10 Oct 2022 14:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066B7299E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403722;
	bh=757jksTD/InYrlah3Xg03lR97thx/bEezOxBraQzLUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXSB4x6h70JlBZfFHdN0qC42RjPf7EJgGVnnehXhgHr0cX7fxNpqHuBtp3tXOZZwc
	 4JPrd7EMTWfAxoA1gNV9u3ldXSLDWAmU1wfHSRRiEtWS2gTkMrVPZbVlzLS3cqoBqh
	 /B2DIS6J0DWoG5QUP18Oz2CYBEbxx8ZqPnEAmM3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 976B8F805BE;
	Mon, 10 Oct 2022 14:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5513DF805BA; Mon, 10 Oct 2022 14:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41A4F805AE
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41A4F805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P6o1Su5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403458; x=1696939458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=757jksTD/InYrlah3Xg03lR97thx/bEezOxBraQzLUY=;
 b=P6o1Su5ZWa8nGGHFwLN+0WS7o8V1+qlAB6aoHENAZ2FkBBKAl4d8YvgJ
 DofjMXbouem3Ur/lTJIDd1gW1x7+rl5tCh/spUXC5FYHu19zeTFwR5dZ8
 K8UVz1N1B2zo99kHeqKSqiSbVUuCnBlyJTsb8x1PpXRpJeH9fsGF1yqas
 CubsyrMLLu0PmMzj4Zj3bum9kY0mZecg2dJPmVDwMII47WBus6ieDUpgc
 eYMm/CzfqBylmoYMYpUoksopY4foHav5r8ucz2Kf2bnJZDO2MPSBvCioS
 FYROimkJvUfpbrMTIjMgmcbT0vQ+LP7u8Dsi9lqBU5j8THlGN3qQ7ufyA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346135"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346135"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078965"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078965"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:15 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 15/15] ASoC: codecs: hda: Fix spelling error in log message
Date: Mon, 10 Oct 2022 14:19:55 +0200
Message-Id: <20221010121955.718168-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

To improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index ad20a3dff9b7..712d8ba85f0e 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -213,7 +213,7 @@ static int hda_codec_probe(struct snd_soc_component *component)
 
 	patch = (hda_codec_patch_t)codec->preset->driver_data;
 	if (!patch) {
-		dev_err(&hdev->dev, "no patch specified?\n");
+		dev_err(&hdev->dev, "no patch specified\n");
 		ret = -EINVAL;
 		goto err;
 	}
-- 
2.25.1

