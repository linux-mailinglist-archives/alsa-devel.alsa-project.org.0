Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FA7A045E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 14:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E691886;
	Thu, 14 Sep 2023 14:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E691886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694695847;
	bh=o7XAkoHWEe0PzHFj43gi9qsBG5nuLm4Tl260GSgs3/Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hIeYrjDfs057R6soXY1oBePYqWPa8owZzEGUkjkZAJAl7xvdQB0izf+4VjuVwAoKA
	 6lkr4zExLYK2103xh3KgROo07l+2t2G+nUJkT3t7IcmqompLo7aMoYjvJqIRS7yd5S
	 p3ODAbCTUm4fm9TiCNFI7BaX2d8O1NLBE4n0WgSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB51F8055B; Thu, 14 Sep 2023 14:49:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C388F80551;
	Thu, 14 Sep 2023 14:49:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1656DF80552; Thu, 14 Sep 2023 14:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D436F80537
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 14:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D436F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aSz9OAZp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694695784; x=1726231784;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o7XAkoHWEe0PzHFj43gi9qsBG5nuLm4Tl260GSgs3/Q=;
  b=aSz9OAZpHTtnN0mmPVZi6p78OjffCBn8NeoQYPK/VtdFFJuILqjFUXMT
   r2bxvHz2V2sZcasmWAMjEenZYChsYq7ULCxbYKn+Sy76fhUx6ys6U6LOH
   UIN0pW8Y7VJCmJvzFt84AoMjbGlhuj4E8OroGmM8vtlyhgCZiSaIo3oN+
   zq394Z9myriYgv1pX1xuKPg64oKh4E+72Me3j66AwHXyyN4wX04tG1ZL1
   5oXwjBStWtAof+jBoeSbHQgRm1bJTbrpIxMkXgi9pej5rPKvWWU5GHrlF
   2ucpSzggnJWoEzCN1HXD5vdRePUo3ltYN9qsBBwyqT3WoycB/xGvf1oGP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378858741"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="378858741"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744522286"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="744522286"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.37.8])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:49:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.intel.com
Cc: alsa-devel@alsa-project.org,
	rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: ops.h: Change the error code for not supported to
 EOPNOTSUPP
Date: Thu, 14 Sep 2023 15:49:43 +0300
Message-ID: <20230914124943.24399-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SIM5DX2Q5RUC5ZWYHIY3K6BY2Y7EB4NQ
X-Message-ID-Hash: SIM5DX2Q5RUC5ZWYHIY3K6BY2Y7EB4NQ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIM5DX2Q5RUC5ZWYHIY3K6BY2Y7EB4NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New code uses ENOTSUPP as per checkpatch recommendation:
ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/ops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 9ab7b9be765b..a494bdef3739 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -202,7 +202,7 @@ static inline int snd_sof_dsp_get_mailbox_offset(struct snd_sof_dev *sdev)
 		return sof_ops(sdev)->get_mailbox_offset(sdev);
 
 	dev_err(sdev->dev, "error: %s not defined\n", __func__);
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static inline int snd_sof_dsp_get_window_offset(struct snd_sof_dev *sdev,
@@ -212,7 +212,7 @@ static inline int snd_sof_dsp_get_window_offset(struct snd_sof_dev *sdev,
 		return sof_ops(sdev)->get_window_offset(sdev, id);
 
 	dev_err(sdev->dev, "error: %s not defined\n", __func__);
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 /* power management */
 static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
-- 
2.42.0

