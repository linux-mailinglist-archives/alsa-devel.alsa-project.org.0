Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA956D9CC6
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43A0F31;
	Thu,  6 Apr 2023 17:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43A0F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796407;
	bh=xHujsAQTpvAPe1kf0nrgb7MHuHI3sWwbm59LCK4URYQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H2Pw90st1XUbz7qZAxiXQkTRMPi5r9aCM0FoIaPmX9AOs41//EgD8OHMV2JICaiKX
	 H9dT8OK9QHjqdXFS9oCrzKfxVide9ihm5x8VZA/8axRIdXdY/oGva+GXh++bOfOmko
	 qWX0DzvLG68u3k3UaWwcd+9NV9q3N7kNcJ0ES6/o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AFE0F80171;
	Thu,  6 Apr 2023 17:52:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38EF4F80249; Thu,  6 Apr 2023 17:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D34A9F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34A9F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R1Y6hBC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680796352; x=1712332352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xHujsAQTpvAPe1kf0nrgb7MHuHI3sWwbm59LCK4URYQ=;
  b=R1Y6hBC4PVMOpGmb139vpXClcDiLx4pWWgzw1vI9AyB/lK+vM7Y/EqJB
   q/WRDUJex6gy4IfB7tX0gdfvca91tgdn5BXNjL0fuwvu/4qgH4pxZ8ueR
   +BsbhjPbjf54g4ngRnZgiVbOHyYQ2re7A87kmg4YVtVV7U8MJ9E3s3NbN
   d15L9oOgYNKZyKFVkaurrKcIf2WweB7Y0maFXf0D3+fSnnV3lOzPdSLR0
   7Q4Ma1IOOWWfbJOwmGVw0WJbzDz3I4RQrPlNVO6zC+6DQLk+iteDGJZtR
   5R2m6rsS5DoH8rMKeiNLai5fcp6PpQp+PCbvCe6kGdtemv+viNNgbUYKK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345395138"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="345395138"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811048201"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="811048201"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:52:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda-dai: Print the format_val as
 hexadecimal number
Date: Thu,  6 Apr 2023 10:52:19 -0500
Message-Id: <20230406155219.18997-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C2SZGWMIRPDK7G4KABRRLOP264LXYM2D
X-Message-ID-Hash: C2SZGWMIRPDK7G4KABRRLOP264LXYM2D
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2SZGWMIRPDK7G4KABRRLOP264LXYM2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The format_val is a set of bitfileds, printing it as a decimal just makes
interpreting it complicated.

In other HDA core code the format_val is printed as hexadecimal also.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 0435b7f251aa..44a5d94c5050 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -177,8 +177,8 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
 						 params_format(params), link_bps, 0);
 
-	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
-		format_val, params_rate(params), params_channels(params), params_format(params));
+	dev_dbg(bus->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
+		params_rate(params), params_channels(params), params_format(params));
 
 	if (ops->setup_hext_stream)
 		ops->setup_hext_stream(sdev, hext_stream, format_val);
-- 
2.37.2

