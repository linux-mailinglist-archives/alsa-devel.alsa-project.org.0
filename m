Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 861296C5639
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9707EF2;
	Wed, 22 Mar 2023 21:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9707EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515437;
	bh=k+hmGhSaD1+QaJ7ZakF1ukiTvaTebvpE8t6aMcJUf28=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IGvKQx73SR54bwR59eLDBkgSUI1prBPDKOdkTsz+kZU/lhK3/J/5MxltYA3+BtCli
	 mzIj6/G4wHLjtVgi9dyZycXAT2dnis+LWYOXwpWbRXyhKfZjy/lSPGy/g0ZGqxRZye
	 lxq75XFgisgyd5c/BwD4CKUwpfA1cCO/I7MlYtGY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A59FFF8057C;
	Wed, 22 Mar 2023 21:00:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82C7F805A0; Wed, 22 Mar 2023 21:00:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A0B5F80578;
	Wed, 22 Mar 2023 21:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0B5F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bigz0qnT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A74D6B81DE8;
	Wed, 22 Mar 2023 20:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BF5C433A0;
	Wed, 22 Mar 2023 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515227;
	bh=k+hmGhSaD1+QaJ7ZakF1ukiTvaTebvpE8t6aMcJUf28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bigz0qnTTorcAD6Yg4qL5KvBO9GtSD9mAPWi9caoxRJHuJ2t9rdKCqqucvOnpb2k2
	 0btBuESJx2pkt+fZO6RhTVwcNfAQYfqWcBkcIxHd4vD2j+eFVlNOOpVVGXg//lhkQd
	 KBWJpy8pQ5Tr+fMVWEZEzA/R2AFfdHLKKRAp2L/r2CMHHyjwbPIQBkyfMUaQ9VJ0P0
	 ql9xA9nimX0d/VVs80RN7Dt1Xvdb0Dl44wv2ipYFQZuggUgKufef84Qn32fQ+w+3hT
	 QeLZZc+N8HvqjWqahmp4sLbjswtU5dHX/qVtawiwzEIt3OyveZXb0pcKcA/+5l+DuS
	 L7r0flaHf/h3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/34] ASoC: SOF: ipc3: Check for upper size limit
 for the received message
Date: Wed, 22 Mar 2023 15:59:02 -0400
Message-Id: <20230322195926.1996699-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X2TAAQXHH24BW6NTFQXBC7FQTTDJZRGC
X-Message-ID-Hash: X2TAAQXHH24BW6NTFQXBC7FQTTDJZRGC
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, tiwai@suse.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2TAAQXHH24BW6NTFQXBC7FQTTDJZRGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit 989a3e4479177d0f4afab8be1960731bc0ffbbd0 ]

The sof_ipc3_rx_msg() checks for minimum size of a new rx message but it is
missing the check for upper limit.
Corrupted or compromised firmware might be able to take advantage of this
to cause out of bounds reads outside of the message area.

Reported-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230307114917.5124-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index b28af3a48b707..60b96b0c2412f 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -970,8 +970,9 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	if (hdr.size < sizeof(hdr)) {
-		dev_err(sdev->dev, "The received message size is invalid\n");
+	if (hdr.size < sizeof(hdr) || hdr.size > SOF_IPC_MSG_MAX_SIZE) {
+		dev_err(sdev->dev, "The received message size is invalid: %u\n",
+			hdr.size);
 		return;
 	}
 
-- 
2.39.2

