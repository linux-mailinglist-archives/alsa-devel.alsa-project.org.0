Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DF700638
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 13:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4A34E;
	Fri, 12 May 2023 13:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4A34E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683889444;
	bh=vXKjzsPnBepBXyxQvhPx1zV8ifkuAjlPZXvTtvyyNKw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V3zgeaOWqf6/z35p7fz9MbMpgTScndgj/JGqK6ynbKeGAwkgLkPIqHwUXVe2eeAg7
	 2fdaWC4bG2UtcVF9H06iNO4sLYreB8wiPeYKpNExy3FzGPBf545acOF0495nkX/CyN
	 RnZaJpxl3tKOfQvkLz6dsFItS051U4eZ+tcwsrCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD7EBF8052E; Fri, 12 May 2023 13:02:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F2BF8032D;
	Fri, 12 May 2023 13:02:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD988F8052E; Fri, 12 May 2023 13:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A667DF802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 13:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A667DF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SJm6d8J6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683889364; x=1715425364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vXKjzsPnBepBXyxQvhPx1zV8ifkuAjlPZXvTtvyyNKw=;
  b=SJm6d8J6lAncozq0XKXH3L8WCowi9muAK85li1DUVnzTdRqFvA3jGM57
   6zs3XIF7qOgp1RAqfCEaIiUNzyWDrkzPiSFESaI/OAF0N9p2+SAIaJQk7
   vb6PpeFmoqZMDcQpiUbJQYpPKDmf2kD0efxoAu0cky8TGv+mu5IrO//+p
   bgaABmOvHVJbExXltPtJDUEDLZ8pOD3FROuTACpp1qw1yupE7tRbss5n7
   YiBbLz4h7ovnn4MOdOKhL7PIYd6I1CV0smSSh+SeigIHsGQreojdE5s37
   tcBDs/atjw6fm9GZwdqeYXBVsB2qzNQxvYZSNTljjcPlX8B1Hyz5l/rTU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353012586"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="353012586"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703152535"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="703152535"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.38.84])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 04:02:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Make sure that only one cmd is sent
 in dai_config
Date: Fri, 12 May 2023 14:03:17 +0300
Message-Id: <20230512110317.5180-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QL3BYXXSWTWWEYXRHSDOO5BAE755G62Q
X-Message-ID-Hash: QL3BYXXSWTWWEYXRHSDOO5BAE755G62Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL3BYXXSWTWWEYXRHSDOO5BAE755G62Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The commands in sof_ipc_dai_config.flags are encoded as bits:
1 (bit0) - hw_params
2 (bit1) - hw_free
4 (bit2) - pause

These are commands, they cannot be combined as one would assume, for
example
3 (bit0 | bit1) is invalid.

This can happen right at the second start of a stream as at the end of the
first stream we set the hw_free command (bit1) and on the second start we
would OR on top of it the hw_params (bit0).

Fixes: b66bfc3a9810 ("ASoC: SOF: sof-audio: Fix broken early bclk feature for SSP")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index fc1eb8e2de2c..ba4ef290b634 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2103,10 +2103,13 @@ static int sof_ipc3_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	 * For the case of PAUSE/HW_FREE, since there are no quirks, flags can be used as is.
 	 */
 
-	if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS)
+	if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+		/* Clear stale command */
+		config->flags &= ~SOF_DAI_CONFIG_FLAGS_CMD_MASK;
 		config->flags |= flags;
-	else
+	} else {
 		config->flags = flags;
+	}
 
 	/* only send the IPC if the widget is set up in the DSP */
 	if (swidget->use_count > 0) {
-- 
2.40.1

