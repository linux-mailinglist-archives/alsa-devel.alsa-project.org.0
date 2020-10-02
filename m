Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5E281D93
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 23:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF9B1AE1;
	Fri,  2 Oct 2020 23:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF9B1AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601673765;
	bh=JEv1R7ufJJNlF7m4O08r2tCqGDA4LjUzQoGo9gGjsOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LneHWDKcDrz9tPP5dvDXRiv6H2x1rwFYmmN+Zi1VNbKoCsUbX+H6EiY+PuYdDJZMI
	 YatNY9iJrn+CF6PmIg2bJLuRLbGV+svbaypVIPFXogMpJC4bLOP58yUulbB15Bu0L9
	 2meQPiuv1lLI3diMKkiZ1nJnlsp6Cb1TQdYVaryw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D69F801F9;
	Fri,  2 Oct 2020 23:19:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA08BF802E9; Fri,  2 Oct 2020 23:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD50F801F9
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 23:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD50F801F9
IronPort-SDR: mqAx8oVvYjVDbpbn8hSkO+yE1aReDLCzBUuKVUUBIDacQKWUHiGLqizIru62Mial/R5mjh/Z4a
 KPYdjDyUwqyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247823961"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="247823961"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:17 -0700
IronPort-SDR: 6pqZJ++6pgl8Hq9t4oLfzp4boyRzLcEV9x3ENBK2u5DlPB5AbD4ejTQpXmBvtr0powQA1HDQp8
 CJSikQBACnXA==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="346580608"
Received: from johnthom-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.158.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: sof_sdw_rt1316: add missing component string
Date: Fri,  2 Oct 2020 16:19:00 -0500
Message-Id: <20201002211902.287692-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
References: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Without this string UCM cannot fetch the relevant configurations.

Fixes: b75bea4b8834c ('ASoC: intel: sof_sdw: add rt711 rt1316 rt714 SDCA codec support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt1316.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_rt1316.c b/sound/soc/intel/boards/sof_sdw_rt1316.c
index 2c566330f236..d6e1ebf18d57 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1316.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1316.c
@@ -39,6 +39,12 @@ static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:rt1316",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
 	ret = snd_soc_add_card_controls(card, rt1316_controls,
 					ARRAY_SIZE(rt1316_controls));
 	if (ret) {
-- 
2.25.1

