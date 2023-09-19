Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBD7A5D83
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F17DEB;
	Tue, 19 Sep 2023 11:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F17DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695114819;
	bh=REY00H1IKOM9EVltB5CNERJFupy7PyIu6HFjaEMSsYk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W/yGMoquUKY5laXtXzvBMJJMQNTFQLNzda22B1L+XL44rds9oGEncz+C/+Vi1Xp/j
	 SlffWX1NOHpx+KdPmvaXF4awKxEvr7ovpZPrENNz2ZTOUdl1KUxxcLUuJVggMVVbyR
	 AKQ0xgyISXA4tVgv77GjcTMT6Alg72Mn2t2Mew/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A0C7F800F4; Tue, 19 Sep 2023 11:12:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C72E3F80125;
	Tue, 19 Sep 2023 11:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6C93F80124; Tue, 19 Sep 2023 11:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2CA0F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CA0F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZQPZJFuY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695114742; x=1726650742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=REY00H1IKOM9EVltB5CNERJFupy7PyIu6HFjaEMSsYk=;
  b=ZQPZJFuYiJu2xAkQ0lMnTlgs+ZObEsRojpOoTYIZA1oAxgf+IsijSD9c
   uWuzntdX2loVqY2dKZXkmMVuUsD5Jxski6vR/sG/I0CtPWcDoUEbhdfmf
   YhhcUhovH9s20EflXBsXiGl8PhhYqzXL6s6UiewR5ED+dfaJ/8xCqW0pL
   N/wO0dEXlSPaEZ6INBqE69SMZC2YH53QxnuJmaV6Jfr6z/g1BP0c5ywbp
   zxlZ4KCEjfooqChwHg6rhNm7R9Lyo9oFG5f4U+/OdGsC5XYSFxPrPNAWR
   LtNEVoOCv3//FXnA+L7Nlh4t2UVxGLFrtHHPiFy8lEGv4vVfN4PHMpRFB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364939302"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="364939302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811658459"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="811658459"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:12:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: add support for SKU 0B14
Date: Tue, 19 Sep 2023 17:21:25 +0800
Message-Id: <20230919092125.1922468-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQNP7GXFJGWD37SATKHJ4KWRNVKXRJ5S
X-Message-ID-Hash: JQNP7GXFJGWD37SATKHJ4KWRNVKXRJ5S
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQNP7GXFJGWD37SATKHJ4KWRNVKXRJ5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

One more missing SKU in the list.

Closes: https://github.com/thesofproject/linux/issues/4543
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b36cdf374a82..9cb666588fe6 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -369,6 +369,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		/* No Jack */
 		.driver_data = (void *)SOF_SDW_TGL_HDMI,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B14"),
+		},
+		/* No Jack */
+		.driver_data = (void *)SOF_SDW_TGL_HDMI,
+	},
+
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.25.1

