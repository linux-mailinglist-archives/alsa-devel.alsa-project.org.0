Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD937A04C3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 15:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D5293A;
	Thu, 14 Sep 2023 15:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D5293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694696568;
	bh=7J6zGfmKiKybIvvJHZv7azTE81gKt5XfGe/TdLIfMPw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EZamPsUiYpWoB93/0Mf/M7TBi2EqGJx6LXmhcgr9SGUPHEvT9EtJrPpCpApX/dI1S
	 iAikAX7JO26IFqXgbMpOUXHfk4nBuCo0j9z2zxaAR+LSIbfOOjkLHqxJaeWE7AHfor
	 DP9fspTmMoIuRXdWz35ZQevsQ65u00lPRz9tepRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF988F80537; Thu, 14 Sep 2023 15:01:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C8AF80246;
	Thu, 14 Sep 2023 15:01:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6655DF80425; Thu, 14 Sep 2023 15:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D471CF80212
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 15:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D471CF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hcH36OWO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694696502; x=1726232502;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7J6zGfmKiKybIvvJHZv7azTE81gKt5XfGe/TdLIfMPw=;
  b=hcH36OWO/uyMZ1P7IchPdhIIRPOgThS/fbaU2aJq28tkl6gZ37lSgSYW
   2K10v+SGiItChir9zGPvLO2cSB4fqJ3FFQit1pI0me8tU0/PdlfshFxIt
   BRCshewryBYF+vR5+LZNTLcinlK+PYpUReTLpybQ7atVniyqp8fyuecnz
   oN9iTekoqCI/+TgJtVSGxfxX3fd+A7Oz0jvrLw3fLmM+GGt4vQ3nAnsC+
   QJencnSzIDkMoMxkqTV4UeEwbTGJ4INiGkB3n7um6lSkqpxrJ5bfli+Am
   AWg4TXZHR/V0Oy8JoeM7oDA81aMWz7W6dsuIfmalqs4Oi4oMvmjhUj9Ku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="442971513"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="442971513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918241169"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="918241169"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.37.8])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:01:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: fix wrong sizeof argument
Date: Thu, 14 Sep 2023 16:01:40 +0300
Message-ID: <20230914130140.1128-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4TZBP2MHWX2EB7JTO7QBQEZ4W6MNGIZ2
X-Message-ID-Hash: 4TZBP2MHWX2EB7JTO7QBQEZ4W6MNGIZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TZBP2MHWX2EB7JTO7QBQEZ4W6MNGIZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

available_fmt is a pointer.

Fixes: 4fdef47a44d6 ("ASoC: SOF: ipc4-topology: Add new tokens for input/output pin format count")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f2a30cd31378..7cb63e6b24dc 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -231,7 +231,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 
 	ret = sof_update_ipc_object(scomp, available_fmt,
 				    SOF_AUDIO_FMT_NUM_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(available_fmt), 1);
+				    swidget->num_tuples, sizeof(*available_fmt), 1);
 	if (ret) {
 		dev_err(scomp->dev, "Failed to parse audio format token count\n");
 		return ret;
-- 
2.42.0

