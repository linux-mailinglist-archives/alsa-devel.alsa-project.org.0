Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98316C5642
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E54EE4;
	Wed, 22 Mar 2023 21:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E54EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515457;
	bh=isPfQ00TWsE+ydaPSPBDYVuwzRAb/0XbSXfRd2aGqa0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GqP08ojsHw5fNRcx5NYY03ndV4rTKtlC+XSI7SNGKI4A7loUfm5AA6ZC3yq1qc8Di
	 dcusK857qmzFRcn8tpbclGjk0NYR8rdVc4rR1OC+X8vbpX2mkrDIK0D2um5btuN6dV
	 BxIjrCWP8UXYB+vmHXpv1wHUo/8w2ecKMw/EBViY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B38F805CA;
	Wed, 22 Mar 2023 21:00:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8DA6F805A0; Wed, 22 Mar 2023 21:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54A2EF8057C;
	Wed, 22 Mar 2023 21:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A2EF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OJUSVKHq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4752622B3;
	Wed, 22 Mar 2023 20:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D622DC4339E;
	Wed, 22 Mar 2023 20:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515229;
	bh=isPfQ00TWsE+ydaPSPBDYVuwzRAb/0XbSXfRd2aGqa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OJUSVKHqZZ9Ur0CH3vOv4+d0O2qbM+q6KJdwyfbnsNrJH+N/fEwXI4kdgIjcaGQWe
	 w4ZPG1joNOI5g7hlRM6+KAifpC3q/AQNaJQEOS28P/n/1BenojaJqWTauXK/bSxCOF
	 wdP+huZGxi9q5OwooNo/ik2Gib/pN3rhoZIMaP8CPuUuWBS17EYFlss0/6aC4SxoF1
	 a/Tu1Y0D/jPPUYiMZZL1ACtKXKx9utaeqaLrKYUGjjyBvO9Th2R3HwWw5dQmlDdFGk
	 7x67lJLjax0s2COKhrIIpc6f9DsTfVzzP8913LWU/cSrokOQsWox7kxlUoSkVIK3BG
	 UsP+PE56psZbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/34] ASoC: SOF: ipc4-topology: Fix incorrect
 sample rate print unit
Date: Wed, 22 Mar 2023 15:59:03 -0400
Message-Id: <20230322195926.1996699-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZLOKD3O4FWDO5O3DS3YWWOC4AHEP5HM
X-Message-ID-Hash: CZLOKD3O4FWDO5O3DS3YWWOC4AHEP5HM
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 tiwai@suse.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZLOKD3O4FWDO5O3DS3YWWOC4AHEP5HM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

[ Upstream commit 9e269e3aa9006440de639597079ee7140ef5b5f3 ]

This patch fixes the sample rate print unit from KHz to Hz.
E.g. 48000KHz becomes 48000Hz.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230307110751.2053-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a81af5f73a4b4..41617569f50fb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -154,7 +154,7 @@ static void sof_ipc4_dbg_audio_format(struct device *dev,
 	for (i = 0; i < num_format; i++, ptr = (u8 *)ptr + object_size) {
 		fmt = ptr;
 		dev_dbg(dev,
-			" #%d: %uKHz, %ubit (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x)\n",
+			" #%d: %uHz, %ubit (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x)\n",
 			i, fmt->sampling_frequency, fmt->bit_depth, fmt->ch_map,
 			fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg);
 	}
-- 
2.39.2

