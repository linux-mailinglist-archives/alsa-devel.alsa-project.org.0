Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98E57434E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7CF18DF;
	Thu, 14 Jul 2022 06:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7CF18DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773190;
	bh=lcLO34MoPCLKVA/bKtAqWCoHH3fr4L1nHGwf+6hf4KU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jj/OyGTVPSwHoFKV8mCKlmTXWLgCAG3c2B2zM80ZcEZKCbsNjTcPstae8xDJ4m0AG
	 NW08p5hUoC8opk6/Jt5tL7Onxkok52FwBrkfeIXI4gib9JoirpjypMNO5mvYiT6SSJ
	 AqPisSMIYrMzP7SRa2z9MknUzJFDp5+Gi347eV3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C891F8055B;
	Thu, 14 Jul 2022 06:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645D9F8061B; Thu, 14 Jul 2022 06:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB1CF80557;
 Thu, 14 Jul 2022 06:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB1CF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LWr9CY/h"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A78E61EB6;
 Thu, 14 Jul 2022 04:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904C9C34114;
 Thu, 14 Jul 2022 04:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772692;
 bh=lcLO34MoPCLKVA/bKtAqWCoHH3fr4L1nHGwf+6hf4KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LWr9CY/hb5a2ARvYmaW9c6irvMCiR2ELu6mWO2Qkgar8sCBzrLxR11k0CsL7Tj6Lp
 yV/iZ354OGXVWJOxvpLT8aGa6AuP1XmMVuKmh6xwmqWSEKm1Wvbr5gy+YCDVZ+C23l
 MNqayeYj3EEDrS5YLCwPzkLinpAlXjdJu5EUWAJytg2CbGjz6Vn8SWfv3avhEyDZp9
 jYeyDwFI7/aWn81kVuQsmcLgX+z10MToiqVerVvHJzNLXPV1ICB9KQYQ7dmJzMG7Nb
 2qYNL/lIDACnr3zktKzWiAaHNfJOxNBkfHh5AVmabCB26k7Jb1e5B9ywSOVFHSjw0H
 Tti18vf9xQAJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/28] ASoC: SOF: Intel: hda-loader: Clarify the
 cl_dsp_init() flow
Date: Thu, 14 Jul 2022 00:24:10 -0400
Message-Id: <20220714042429.281816-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 daniel.baluta@nxp.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit bbfef046c6613404c01aeb9e9928bebb78dd327a ]

Update the comment for the cl_dsp_init() to clarify what is done by the
function and use the chip->init_core_mask instead of BIT(0) when
unstalling/running the init core.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20220609085949.29062-4-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 14469e087b00..ee09393d42cb 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -80,9 +80,9 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 }
 
 /*
- * first boot sequence has some extra steps. core 0 waits for power
- * status on core 1, so power up core 1 also momentarily, keep it in
- * reset/stall and then turn it off
+ * first boot sequence has some extra steps.
+ * power on all host managed cores and only unstall/run the boot core to boot the
+ * DSP then turn off all non boot cores (if any) is powered on.
  */
 static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 {
@@ -117,7 +117,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 			  ((stream_tag - 1) << 9)));
 
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
-	ret = hda_dsp_core_run(sdev, BIT(0));
+	ret = hda_dsp_core_run(sdev, chip->init_core_mask);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
-- 
2.35.1

