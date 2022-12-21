Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7235652F64
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:25:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE57416C8;
	Wed, 21 Dec 2022 11:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE57416C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618344;
	bh=0dyPtu5RmOOuyfytvq/zHlFW7uUAOVR4m4Qh7vrwxxk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XM1cKDaaCVCeuucHS+Gztes27n+dbA9ORhMbLNlpvjqbxK6paOfbAD1fWymf/24Fb
	 rXe/T3/0HPLEDmzWYNnEh3dbsdYlN5BKSR6jpuLDiD3UamUZ6nRmZh+VA07wOASe4c
	 io9OSiCa/dNArEPGmIVu9QoXY1DJzVg3qw1MHA/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7241EF8051D;
	Wed, 21 Dec 2022 11:24:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2A9F804AD; Wed, 21 Dec 2022 11:23:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F6AF80022
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F6AF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VgpvtnlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618212; x=1703154212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0dyPtu5RmOOuyfytvq/zHlFW7uUAOVR4m4Qh7vrwxxk=;
 b=VgpvtnlECd/HDJ7WgELbonYWhPvreIe06vdTjXRz0T45OAa1NC48OMpC
 DSXAB3gID8dZxtaUBSI7DpiFZV1nokFVmohQPkaLDaZxwPsYQdPmo5W7e
 frJdHRSPW4Gj2XQ/GfW9Rl6PgHvBoTBdJBss5CGXp/hP/iSuYRgpnuECv
 PU6ETFdv2g2k3bYC07J2ohVVbyGdI1da+JnfeQZvlg4GD70P1i4BW7EYR
 Wpl6D1ymeHB2fWx6xvTvdiK5/ptd5l+Zf+UiJCSvRD1EN1oa590GfOi/O
 BlLgjipVIrA1oSdruMEjhkoxc2xcZ0AegoLrYDn5Hpms3o5IC10PvRzKV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078624"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984298"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984298"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/11] ASoC: SOF: Add helper macro to be used to get an IPC ops
Date: Wed, 21 Dec 2022 12:23:20 +0200
Message-Id: <20221221102328.9635-4-peter.ujfalusi@linux.intel.com>
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

In preparation to a case when the DSP is not used.
In this case the IPC communication itself has no meaning and we might
not even have sdev->ipc allocated at all.

The sof_ipc_get_ops() macro can be used to get a named IPC ops struct or
return NULL if the sdev->ipc is not allocated.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/sof-priv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6760fd895950..144906c4cb63 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -502,6 +502,10 @@ struct snd_sof_ipc {
 	const struct sof_ipc_ops *ops;
 };
 
+/* Helper to retrieve the IPC ops */
+#define sof_ipc_get_ops(sdev, ops_name)		\
+		(((sdev)->ipc && (sdev)->ipc->ops) ? (sdev)->ipc->ops->ops_name : NULL)
+
 /*
  * SOF Device Level.
  */
-- 
2.39.0

