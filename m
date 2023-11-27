Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D17FA129
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA97DF8;
	Mon, 27 Nov 2023 14:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA97DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092216;
	bh=jRaXOSXDE1K5341Pb1GB9MXvuna1NA6z35RR4HXhW9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cwCf16nihMMax7wI6Ost08j+SdrMonThSa2eO8LOp76OazdkrmT8oYufhClHJ9qSp
	 Gan8RL/AQL+cY35uJ20EgZf1707yzTTAuc0pmkqIcKCTq1kFdfdHEP+oO0Hy6GfhJw
	 xPqa8pX+SRrLePNLZulJ52ihZTmW5FGvoacXsnwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 677A0F805D8; Mon, 27 Nov 2023 14:36:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD591F805C1;
	Mon, 27 Nov 2023 14:36:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB8CEF80254; Mon, 27 Nov 2023 14:36:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 272B0F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 272B0F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ARyLCSzq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092157; x=1732628157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jRaXOSXDE1K5341Pb1GB9MXvuna1NA6z35RR4HXhW9g=;
  b=ARyLCSzqO70VFmKlXlY5e922RjjVv6dMtdfLYWsUs6bwxpJ8AIai7IcW
   a9d8wWAk1IPgu0UPwBk4y/st4HMtpGrcOCM9/l+VpHACYHv0Wuw6imPTh
   UwgXfYRZo77HvRcqsmra4LxONeTFkiN3K532eyCRyJI4X6L/abaJhF6kD
   cphahDAdD3WdMaJzYAWXj+bf+VaVomTvelriGITxFXrjYPPOaWOo4IudC
   aUP/LxCAfifQOtA36v/9BOxiIb6SbLIQzXMwJHBnPLculeAQMZWiwFFBq
   2jY+sVLsdiI8zhM5HaRjTbGO/LpdF3jg7x0BKuCHAg5lXl9eMiaTcnkvq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578519"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578519"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743752"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743752"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 1/7] ASoC: Intel: sof_sdw: Make use of dev_err_probe()
Date: Mon, 27 Nov 2023 15:34:42 +0200
Message-ID: <20231127133448.18449-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AZ6MSRO5MEGTGIXUTHYYVLQEZCYC2FVE
X-Message-ID-Hash: AZ6MSRO5MEGTGIXUTHYYVLQEZCYC2FVE
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZ6MSRO5MEGTGIXUTHYYVLQEZCYC2FVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The devm_snd_soc_register_card() can return with
-EPROBE_DEFER and in that case the driver should not print
an error message.

Closes: https://github.com/thesofproject/linux/issues/4668
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1e788859c863..13089182dc17 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1947,7 +1947,7 @@ static int mc_probe(struct platform_device *pdev)
 	/* Register the card */
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		dev_err(card->dev, "snd_soc_register_card failed %d\n", ret);
+		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
 		mc_dailink_exit_loop(card);
 		return ret;
 	}
-- 
2.43.0

