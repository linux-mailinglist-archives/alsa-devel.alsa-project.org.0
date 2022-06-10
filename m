Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E9D545F51
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9021F8C;
	Fri, 10 Jun 2022 10:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9021F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850216;
	bh=Gg0dxjveR/D7flJ2gPooC+cxPmSvyAUJcaOx2Ha8hkA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfFWkymmzzBUlM43Q0+6O6vHvzwJ7wSJGR+Q4NwBaoxT9wZ5Jx07PhlXF/CD9q6BI
	 YKAACb1ak9vSAOg4rbOAeZGpfuOkzDQ74Rn8V7D93UET9/AHXesJcE3IKy0SoL8IUF
	 0UwYcE0vwk93WgfDGV2rkft06jHb5syMhvO0Hr7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8741F80528;
	Fri, 10 Jun 2022 10:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBE5F804CF; Fri, 10 Jun 2022 10:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76EAFF804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76EAFF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J/5TSCPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850123; x=1686386123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gg0dxjveR/D7flJ2gPooC+cxPmSvyAUJcaOx2Ha8hkA=;
 b=J/5TSCPEPvWQoSBglm2jgoVZ8aPh5hRC9vvuAZ2xGz6/hFjKc1Xv9Wo6
 LX/vYqEDHCtKW0tH9gz/8WzDl6Ov4z/TFZq0+mesQE10buRkKyVBqoH9d
 HDAx2v0n0W2ZpyNV/i3vN9+05ufwDmtHau50FOXqhu5wnQGVNCeNYtXr4
 63c1pUIbsx/94Ixr5f5IDLPsRLfLPx0Q/dRdR0Qi8V/ZyD5/QHXI3VJh5
 WBMlCSgdTDOEdNTwr6NougY/ghHmWXU/quus3KT65mZpnuE08O59ptACR
 iPjeVeKMnIR94EJ7h6NnTLp7aI6m2UJBRa7d9RhKXo8J6yLA/xdqhL1cB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936598"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020817"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/6] ASoC: SOF: make ctx_store and ctx_restore as optional
Date: Fri, 10 Jun 2022 11:35:44 +0300
Message-Id: <20220610083549.16773-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Commit 657774acd00f ("ASoC: SOF: Make sof_suspend/resume IPC agnostic")
did not marked ctx_store and ctx_restore as Optional.

Fixes: 657774acd00f ("ASoC: SOF: Make sof_suspend/resume IPC agnostic")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9d7f53ff9c70..58bcb8d6f72b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -376,8 +376,8 @@ struct sof_ipc_fw_tracing_ops {
 
 /**
  * struct sof_ipc_pm_ops - IPC-specific PM ops
- * @ctx_save:		Function pointer for context save
- * @ctx_restore:	Function pointer for context restore
+ * @ctx_save:		Optional function pointer for context save
+ * @ctx_restore:	Optional function pointer for context restore
  */
 struct sof_ipc_pm_ops {
 	int (*ctx_save)(struct snd_sof_dev *sdev);
-- 
2.36.1

