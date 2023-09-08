Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B8798F78
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF169F6;
	Fri,  8 Sep 2023 21:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF169F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201566;
	bh=Jlk0GtXjMn0JWZqiUBHVEE3S8R+JBNph3LiosAUF/60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AuqX7VF6886hbHNZI7ZTBQyp0kOLtNcmqSw0GlbalN8qpE9RVAtEagom5tG2X2UT5
	 Ayf3bi+EYfgxnYpyxc3HisgG0yqM3QdQ6tmpm2JNsb5spa4C2ChmIixyY9XVnEzYnR
	 Zwqu5HCar/wDW0Lkoh/mkWhKWOzStRwE8lrnypQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE21EF80551; Fri,  8 Sep 2023 21:31:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1F2F800F5;
	Fri,  8 Sep 2023 21:31:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40307F80527; Fri,  8 Sep 2023 21:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0810F8047D;
	Fri,  8 Sep 2023 21:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0810F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bAnSnHY8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41C8EB821DE;
	Fri,  8 Sep 2023 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06141C433B7;
	Fri,  8 Sep 2023 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201506;
	bh=Jlk0GtXjMn0JWZqiUBHVEE3S8R+JBNph3LiosAUF/60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAnSnHY8K7grwbSE3BRXyzxEgqZJTrcYRJklXYhyd7eNIXBOCDe1sg9HV47rVDx47
	 2F1P0Bb2++4z4jPfh8ERK5ys3hnKSnnNMkCP3oohj0Ax5de0eM3ji5CI9qz+wGuH3g
	 mTB+4sWINQJTwlaaHzXvcmJP2BdG+x/5P1XlgfD03XN1ViKHq+EVUaPgK7tyLx3W7b
	 L7aQX89ywOR8ZzTsNU9/7y4pUdV76VenWEByQJdZ4ACa+f54jPrOALj8uwWuEnwcmN
	 u90iRXEy9hEPfeESLUlyVMKbxDyWRD8wHage3KOgOAyP888H6Jr2uDTKgk3Qb2t7JR
	 +v0uyg+2USLWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	perex@perex.cz,
	tiwai@suse.com,
	Vsujithkumar.Reddy@amd.com,
	AjitKumar.Pandey@amd.com,
	venkataprasad.potturu@amd.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 35/36] ASoC: SOF: amd: clear panic mask status
 when panic occurs
Date: Fri,  8 Sep 2023 15:28:46 -0400
Message-Id: <20230908192848.3462476-35-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QL2VTOJDHGZJT7XRM3E76TORYMKNUUX3
X-Message-ID-Hash: QL2VTOJDHGZJT7XRM3E76TORYMKNUUX3
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL2VTOJDHGZJT7XRM3E76TORYMKNUUX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[ Upstream commit 3d02e1c439b4140215b624d423aa3c7554b17a5a ]

Due to scratch memory persistence, Once the DSP panic is reported, need to
clear the panic mask after handling DSP panic. Otherwise, It results in DSP
panic on next reboot.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20230823073340.2829821-6-Vijendar.Mukunda@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/amd/acp-ipc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 8a0fc635a997c..d07dc78074cc3 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -168,6 +168,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
 					  true);
+			status = 0;
+			acp_mailbox_write(sdev, sdev->dsp_box.offset, &status, sizeof(status));
 			return IRQ_HANDLED;
 		}
 		snd_sof_ipc_msgs_rx(sdev);
@@ -197,6 +199,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 	acp_mailbox_read(sdev, sdev->debug_box.offset, &status, sizeof(u32));
 	if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 		snd_sof_dsp_panic(sdev, sdev->dsp_oops_offset, true);
+		status = 0;
+		acp_mailbox_write(sdev, sdev->debug_box.offset, &status, sizeof(status));
 		return IRQ_HANDLED;
 	}
 
-- 
2.40.1

