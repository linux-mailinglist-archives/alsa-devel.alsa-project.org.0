Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686C7113D7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCE36C0;
	Thu, 25 May 2023 20:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCE36C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039644;
	bh=TgTl3mDlQ6yoJSSu128ki5gVsp6gBpM9OvTuxcF6Iv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mAhRnC69PrGVP9H7K6z7AcbGQ2Ixyfm6UxL7YU6+yfAbiYsIhkRp+Qpx3kGrj2le7
	 Dhml19yW+J6DFXRo+/0bznb9UiFuCaZbjvP7ipbx6o0uwkfIUjZRHO8pau18A51aLi
	 I6XKyAacnfLtKlX5qY8ZomgNBuZI3JaeFht/6mgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BDECF80564; Thu, 25 May 2023 20:32:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4692AF80563;
	Thu, 25 May 2023 20:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A887F80564; Thu, 25 May 2023 20:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A595EF8024E;
	Thu, 25 May 2023 20:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A595EF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ofZys6+L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7270F6489A;
	Thu, 25 May 2023 18:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B52FC433D2;
	Thu, 25 May 2023 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039547;
	bh=TgTl3mDlQ6yoJSSu128ki5gVsp6gBpM9OvTuxcF6Iv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofZys6+L+lBn9KS9gk2zkf9TYO7ObFm3sOqQBsU5uVmRINW1HealMBoAkIaKc1Tfq
	 MtSVvmqcqP+wtp0fOyGHRgfQXOSBLr24UZR0wf9NN/1SRC9gi2yWpAUr1Fl0UOXE+/
	 MVX9lXxFQ8h7QCOqfpGIuG7cNUL4M/QNkgsyrEMhCrGvTZ+22r2jqdPqWgnUOmFBrz
	 r7wLNFY9qqmaCwZg1rWSWH2VAQr9Dnun2frAaesNcus0kF3nYRr46UUfRwUpfM9gAX
	 MDcCHNn+X8Z4ZoAks/KWXQ8RraRf1h3XXsn9Y1VPF9ML3NyQEZnMPxcEQV6Xd502KO
	 wxyFCW9ukGv0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	AjitKumar.Pandey@amd.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 08/67] ASoC: SOF: amd: Fix NULL pointer crash in
 acp_sof_ipc_msg_data function
Date: Thu, 25 May 2023 14:30:45 -0400
Message-Id: <20230525183144.1717540-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WTZ6L7X5PQR2T3HGIHFEZCFGGVLRG5RO
X-Message-ID-Hash: WTZ6L7X5PQR2T3HGIHFEZCFGGVLRG5RO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTZ6L7X5PQR2T3HGIHFEZCFGGVLRG5RO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

[ Upstream commit 051d71e073614a72ad423d6dacba37a7eeff274d ]

Check substream and runtime variables before assigning.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com
Link: https://lore.kernel.org/r/20230508070510.6100-1-Vsujithkumar.Reddy@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/amd/acp-ipc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 4e0c48a361599..749e856dc6011 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -209,7 +209,12 @@ int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sp
 		acp_mailbox_read(sdev, offset, p, sz);
 	} else {
 		struct snd_pcm_substream *substream = sps->substream;
-		struct acp_dsp_stream *stream = substream->runtime->private_data;
+		struct acp_dsp_stream *stream;
+
+		if (!substream || !substream->runtime)
+			return -ESTRPIPE;
+
+		stream = substream->runtime->private_data;
 
 		if (!stream)
 			return -ESTRPIPE;
-- 
2.39.2

