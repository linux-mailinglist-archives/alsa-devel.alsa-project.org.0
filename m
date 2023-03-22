Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58836C559F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 20:59:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141F1EBF;
	Wed, 22 Mar 2023 20:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141F1EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515189;
	bh=QHiqBaDd7TKi3Fgb4EqKzNbkcwRu76OmI/eB7btnxU4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PI5OOlDfKld3zIb0FqJBI7GriieVDLGx1NlCfoZdVOU3DPiRq2qSA8+JtF3T2slLh
	 2OMg2MCzRlo1Pf8WXfDmyTKVuRFbp7skryiwlLhk/4WBtpEvrlQTA62eJoyV5DmMHm
	 mZ6F/d5JqvMWkl8X2HYQeZvAT1IBwul3tk31gTL8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3C83F80552;
	Wed, 22 Mar 2023 20:58:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15BB2F80557; Wed, 22 Mar 2023 20:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F12CF80549;
	Wed, 22 Mar 2023 20:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F12CF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stl1Dk4j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 314BC622B2;
	Wed, 22 Mar 2023 19:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A9CC4339E;
	Wed, 22 Mar 2023 19:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515084;
	bh=QHiqBaDd7TKi3Fgb4EqKzNbkcwRu76OmI/eB7btnxU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=stl1Dk4j4cHTIZS18wpnhtdl4ZA5BQeWyYOS5OWLcDPF5vjzo5kEzmoDsL66xyCZW
	 Vm48bfnkc4xkJNd1B4AUoLdXBrUtGIyyDNL75027egR+mMGixuZqyoslfajPKu1TmT
	 MbDknoImBln26ObRFhndFKQ1QIcOYOWzfvkTNTkqN3GZphOLzgt0hoQ9v99NWUVd0/
	 kXlug8aHRfA4NwUWID3wobo11dwRcF9PnzXaZRpjhczBNSYiBifIYVmjyUdJjiT0MO
	 UT9DUQoRHe99z/GwgZUeC4+1VPULuotrfKPkezDAO1v+Jy0jlrJnX7PF7Zr6MEk58i
	 vOAC8i21KSD3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 14/45] ASoC: SOF: ipc3: Check for upper size limit
 for the received message
Date: Wed, 22 Mar 2023 15:56:08 -0400
Message-Id: <20230322195639.1995821-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VG4MJPAAJC6TKLKDM5IANPJEVQ74E3WX
X-Message-ID-Hash: VG4MJPAAJC6TKLKDM5IANPJEVQ74E3WX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VG4MJPAAJC6TKLKDM5IANPJEVQ74E3WX/>
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
index 1fef4dcc09368..fde8af5a1f485 100644
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

