Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C988652F63
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03EEA16AA;
	Wed, 21 Dec 2022 11:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03EEA16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618326;
	bh=j75+GQMfZzd93kQa99FoNldTV6DKPzwFwdFw+LvtnBk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JHiXqsNRa9lkaB/ZD+hQDn81VFyLoFjaNYtCmPofNqtI34KQ28Y/TunupMIZaqZ2z
	 xwbEGi7aYG5ya9n9deKjFOOdoqzCLAnq+gvPPTT7jWZHt2a730imm/TBJgK2M1SqBV
	 4GLxLBpXpjLi1Q6W99mXJn9AJw4uiyXfOBb1BU6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE0F4F80423;
	Wed, 21 Dec 2022 11:24:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6644F804B0; Wed, 21 Dec 2022 11:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3755DF8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3755DF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JaG04Jat
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618211; x=1703154211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j75+GQMfZzd93kQa99FoNldTV6DKPzwFwdFw+LvtnBk=;
 b=JaG04JathCzumQT17IaPb/uZL9gWrfh2uzzECc80arQCORfWIgTWKWeq
 gsqJysqLuNIGyRVWWtoDa/SkcWuSimG/nv7jY6u33qMXS93meHo/WU6LK
 0WNHos1twag5oyBg/IUKPBy01sppG9AU50AdHV1AHnOw+CT1hjlbTnzmw
 3wbiVfJqjsFoyoBVtC/pGROnqCfKdMvWkfBNL8YMg4CUWzPd6Yh9ebwwy
 UmSAaqkxUO1+uUaREmPASLh88PBxRlsf/0xHG9tYjeijmaSZeTKkYMwds
 UZCKRy3jdoYw7beYmSi0NyzgIdriTHGed+x2oq13FbvC8NM7A5wNX4i3N g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078617"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078617"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984288"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984288"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/11] ASoC: SOF: sof-audio: Update documentation for
 sof_ipc_tplg_ops
Date: Wed, 21 Dec 2022 12:23:19 +0200
Message-Id: <20221221102328.9635-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The core treats all function pointer in sof_ipc_tplg_ops as optional.
Update the documentation to reflect this.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/sof-audio.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 29cf951e3526..8e4abb1f5f73 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -166,7 +166,7 @@ struct sof_ipc_tplg_widget_ops {
  *	    initialized to 0.
  * @control: Pointer to the IPC-specific ops for topology kcontrol IO
  * @route_setup: Function pointer for setting up pipeline connections
- * @route_free: Optional op for freeing pipeline connections.
+ * @route_free: Function pointer for freeing pipeline connections.
  * @token_list: List of all tokens supported by the IPC version. The size of the token_list
  *		array should be SOF_TOKEN_COUNT. The unused elements in the array will be
  *		initialized to 0.
@@ -179,7 +179,9 @@ struct sof_ipc_tplg_widget_ops {
  * @dai_get_clk: Function pointer for getting the DAI clock setting
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
- * @parse_manifest: Optional function pointer for ipc4 specific parsing of topology manifest
+ * @parse_manifest: Function pointer for ipc4 specific parsing of topology manifest
+ *
+ * Note: function pointers (ops) are optional
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
-- 
2.39.0

