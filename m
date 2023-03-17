Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87E6BE161
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 07:40:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B768FB6;
	Fri, 17 Mar 2023 07:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B768FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679035200;
	bh=YdzJtfVv/f8E0Pw5lfKJZk1i185rf+CEnK0xP/V7oBo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FN2S1wr9psv+5Z6PXB4B4qzsJM9H5R951YtW0jEqbzHiEqSShOQ7RYXBWTaJlz2gr
	 80PMvXP9MLdhcJd+qKYZ46XquMwenZLZk6MPx33PrdMCN+GwdersU7Ro+zi1qp0iMV
	 +3bk3np+6pXyeSbFT36AIKIoFcB8KnYz88TjpxQk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 969FBF804B1;
	Fri, 17 Mar 2023 07:38:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6787EF80425; Fri, 17 Mar 2023 07:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0CE2F80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 07:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CE2F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cZvFlPbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679034929; x=1710570929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YdzJtfVv/f8E0Pw5lfKJZk1i185rf+CEnK0xP/V7oBo=;
  b=cZvFlPbdUZmw3XEilu9awb+W9h5xXNL6JTxKxOzvf3cPZh0udKagelpU
   G+urzrEIB9qd7tCOLae88F5305rQRfzD8zAE8QAYpa82EtJVqVFXgzPEX
   raxhULrnFj3Gxto3Vg5BfyYjvgX6vQ4ighNAeJCRDOd9+TMpb7z93gMLT
   lT1WTQmc4CUahwCRqR/oviCfuZrKQSw+BZPtfTjE/gTI3ShcVjql1Ssw7
   GHOXuW2mWCTRTzL08e/w7QlvsN7TYMeEFP+ZaRXJhOlPoC1DTt7piBZHI
   qPHTGL33arpm4OCKdjN7lsJdRNxAsUmfGNKNZHLFuPjhFRnDgmKxd2td3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340559385"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400";
   d="scan'208";a="340559385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 23:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823544008"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400";
   d="scan'208";a="823544008"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.221.123])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 23:34:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: Initialize in_format to NULL in
 sof_ipc4_get_audio_fmt
Date: Fri, 17 Mar 2023 08:35:24 +0200
Message-Id: <20230317063524.8280-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6IIQRBQ6NII4FPICS4XIXAW46WHBPJ6C
X-Message-ID-Hash: 6IIQRBQ6NII4FPICS4XIXAW46WHBPJ6C
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IIQRBQ6NII4FPICS4XIXAW46WHBPJ6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the available_fmt->num_input_formats is 0 and there is a failure during
the output format parsing then a kfree() would be called on the
uninitialized in_format pointer.

By initializing the in_format to NULL, this error can be avoided.

Fixes: 7ab6b1e8302c ("ASoC: SOF: ipc4-topology: Modify the type of available input/output formats")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index e7b3bdc95dd7..2a2c4cda63fd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -179,7 +179,8 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  struct sof_ipc4_available_audio_format *available_fmt,
 				  struct sof_ipc4_base_module_cfg *module_base_cfg)
 {
-	struct sof_ipc4_pin_format *out_format, *in_format;
+	struct sof_ipc4_pin_format *in_format = NULL;
+	struct sof_ipc4_pin_format *out_format;
 	int ret;
 
 	ret = sof_update_ipc_object(scomp, available_fmt,
-- 
2.40.0

