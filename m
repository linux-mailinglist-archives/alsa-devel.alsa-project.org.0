Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86C50A55E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48432166F;
	Thu, 21 Apr 2022 18:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48432166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558466;
	bh=31qebvS+eu2WieqWNzfbBF8k6AsSIQmfDm0pDdSskTM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Eu8rdhMU64qCVKOZMD+n/tAxPZdEngovFSg4uI77BwktD6bk5C9Vv8f22VsaCoyxf
	 /K16irRVvE1Fcg+j8Uxvt+JUfnQMBCpiowRX2vd0Q9/ukWHq1LUvCKIiOYiQ6vfugv
	 HJVImitAFhmG6TIZIfHYk7rmWE0CKR1cS6ofeL9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7FB3F8047D;
	Thu, 21 Apr 2022 18:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B525F800C1; Thu, 21 Apr 2022 18:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1485F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1485F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a3o9guU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558400; x=1682094400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=31qebvS+eu2WieqWNzfbBF8k6AsSIQmfDm0pDdSskTM=;
 b=a3o9guU1Ibbs1raB01nl1o4bAoFjan2sE3uS8UGIqyoJqvwEU4ewn6oY
 nMaWl/KoYe3TxtJWGZuIx85cpvDXDUWvJ7CZla63ZcOLORGpgto5rUyq8
 yQRJYwCFLRISlxCYo4ACbGA/m6oHRAb500SuSWlOk+8hwXnrNXf3uaTIe
 JhX5vYUbONtaA/B4szxRTLs/2/zPfo/6XwNROL6NWpJp54qNnnSdtqED2
 YowkD+WDbWW2n3doJ7juDMssCsN2kAMfoLSez9zcrwrAY7owbtO7tQReA
 vDD/pD/x3o00VM1H7nwD05PT0l3krj3qnL9t66HdLqW+/JXWOzLbd3G1z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264575231"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="264575231"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:26:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="511144357"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:26:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: sof-audio: remove useless assignment
Date: Thu, 21 Apr 2022 11:26:00 -0500
Message-Id: <20220421162600.302230-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

There is no need to assign spcm to NULL. Removing this assignment also
removes a false alarm reported by cppcheck.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 0898f4dbe29f8..a0af7c421fd9b 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -404,8 +404,7 @@ struct snd_sof_pcm *snd_sof_find_spcm_dai(struct snd_soc_component *scomp,
 					  struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-
-	struct snd_sof_pcm *spcm = NULL;
+	struct snd_sof_pcm *spcm;
 
 	list_for_each_entry(spcm, &sdev->pcm_list, list) {
 		if (le32_to_cpu(spcm->pcm.dai_id) == rtd->dai_link->id)
-- 
2.30.2

