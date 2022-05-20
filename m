Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E80DA52F4EC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911381727;
	Fri, 20 May 2022 23:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911381727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081553;
	bh=hnKKp+x2OFF7w/kV5A3LK4iejUEMYtF3UORFuFEazF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5f7hBYC7RISmepD36Otxu1sw363s2mGkC/RotQO4TPJi8SpCq0EgY52FGp35W6iw
	 oBvLXZpKDODcwbh6nK+aIWO0MEVkLU0mgJ/Kpw1StS5cbhINVgKIadyxqoWS6EFtam
	 a6YHNnQV53udsKevbSktLllxiwyNW8Q6Cb7xJKzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47EC8F80524;
	Fri, 20 May 2022 23:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D2FF80153; Fri, 20 May 2022 23:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC3ABF80153
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3ABF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j7LRX0dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081457; x=1684617457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hnKKp+x2OFF7w/kV5A3LK4iejUEMYtF3UORFuFEazF8=;
 b=j7LRX0dwtivboaJ02bkV0GBRUnpZj8N0Beyk1nE3W4Ldy6Ujc5zrOCAB
 fhaUGEOevQrE0Bv10q1XGR7nZ4RgcsI/jUywovi1Md1YNJUn1efiPU1Pv
 7zV8lkK6cDSObVG+xmNKBXMHUGW+IH/hTN93xc3ls4OYtOINjAvfUNgTF
 BGUGl18bhAFiVehkW1n2h6QA8piHUELJMqmZ1Ny7vAkLs/94cTx701hRu
 TKlJaG/KFzrNrhWvm1u8cunGcPep7q6wOBI6rfI1FkTTgtv2uujJBpsnH
 6mLQmLY/FP7Wui61Zgw6YJfuqsil5X4Oyf3p/0FspE1+0xAf7DK9lsmTk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324219"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324219"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796009"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/16] ASoC: cs35l45: typo in argument definition
Date: Fri, 20 May 2022 16:17:04 -0500
Message-Id: <20220520211719.607543-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/cs35l45-tables.c:36:49: style:inconclusive: Function
'cs35l45_apply_patch' argument 1 names different: declaration
'cs43l45' definition 'cs35l45'. [funcArgNamesDifferent]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/cs35l45.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 4e266d19cd1cd..8f98cbbf6209f 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -209,7 +209,7 @@ struct cs35l45_private {
 extern const struct dev_pm_ops cs35l45_pm_ops;
 extern const struct regmap_config cs35l45_i2c_regmap;
 extern const struct regmap_config cs35l45_spi_regmap;
-int cs35l45_apply_patch(struct cs35l45_private *cs43l45);
+int cs35l45_apply_patch(struct cs35l45_private *cs35l45);
 unsigned int cs35l45_get_clk_freq_id(unsigned int freq);
 int cs35l45_probe(struct cs35l45_private *cs35l45);
 int cs35l45_remove(struct cs35l45_private *cs35l45);
-- 
2.30.2

