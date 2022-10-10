Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565D5F9E1B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D6E8293F;
	Mon, 10 Oct 2022 13:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D6E8293F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402987;
	bh=757jksTD/InYrlah3Xg03lR97thx/bEezOxBraQzLUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XsdsNOLdCmI1dNm9UPsInQa/sUM6yp/v2p+njSD9oxY7kZL7i+5aPPMG/qLD7QbIS
	 f8eeeOwJBv/FOyQMlJiSiUOraiXSXmQ3Kgim7DuBq7+k5GA2OWXhXrN5/jR+RZrXBy
	 y05ZX+o9nGmSd44bplep7kYXaRTNz2/+QUoIbHDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E97FFF805BB;
	Mon, 10 Oct 2022 13:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99C3F805AF; Mon, 10 Oct 2022 13:52:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 133A9F805BA
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133A9F805BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DLWXHOhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402726; x=1696938726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=757jksTD/InYrlah3Xg03lR97thx/bEezOxBraQzLUY=;
 b=DLWXHOhCOxYhyh7DUGVRlMdLIdsGH0y/Lhszy8N0Gd2KxyLyjilpImB0
 RmGq9NrTOedebjSOEft8ALqOtY8dsOwT+HOz2RXbJBTb44YasBzTzd8xk
 bbpND+JLAsztw/7AT8gMaXVhZm3Oqlqoaz0v6nhLeeswcRGrATmLEPKki
 eU1QyTfDh8YOIzfhIgOBSCnyUQJ48joMAfhXbGtJFb4qv0WRdofLsANjw
 I/eGrpTrBnVcj0YIcNSK9bOOXfao0O3IRdP9aTiTdQu5bjBBvAdUQNlPg
 4zjXEXBnfgQJRGKau02Oif44EYPhH6fKE77mDbOCVcNFGGN0gXNgkDX3B g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513270"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889196"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889196"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:52:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 15/15] ASoC: codecs: hda: Fix spelling error in log message
Date: Mon, 10 Oct 2022 14:07:49 +0200
Message-Id: <20221010120749.716499-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
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

