Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561ED798FD2
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C694BDFA;
	Fri,  8 Sep 2023 21:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C694BDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201699;
	bh=4nvCPsfTTnSecXToPDOjR/OjH5NkC7hqBOdeR93jG80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qMTIMX9VAbCdWxoNSyPdBefjUNXdkm97Yh+DaLNIG3SNK3UuVbygSJLINJz3ajiyU
	 SMied46qahwd3vIg7FQbghFWMinQZTUoXKORYtmJaMoR2z0XtOk8ms/vFKSh8nJuxL
	 EWMZK2ZBTtI2SI9nJO8b/X9kpQDFn7TSoOdy0vHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AA0DF80552; Fri,  8 Sep 2023 21:34:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F207BF80549;
	Fri,  8 Sep 2023 21:34:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F4E3F80552; Fri,  8 Sep 2023 21:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0E8EF8047D;
	Fri,  8 Sep 2023 21:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E8EF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QavqVBxW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 485D2B821E3;
	Fri,  8 Sep 2023 19:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32632C433BC;
	Fri,  8 Sep 2023 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201634;
	bh=4nvCPsfTTnSecXToPDOjR/OjH5NkC7hqBOdeR93jG80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QavqVBxWPaBTHBRkT+iNi2EE+S0/9ii0FGPLAo9qnJCQkW9DuoXKcDBxwxc1oI5st
	 0Fao6rU+zNMJsJKe8IHixVxJt7YHL1u52v5mhkCQmHf3eBY9UZQ8XWSClYx4FCrSeN
	 Xm5CL4WXwAGTCsNuIwMPPGNQr7X2V02cKkZXvyu9RoE2WSgcdepQBZCDCIuquTSqrM
	 aAF5ybuqBL/afq82iPn/PsO7uoUsVGyTkw1ctkdJjKa14NrXssAiAIy6u8rQu9WZTy
	 JYvlqBXw7qAdge/CC2LjqBOdrx3Hvp0YuCGF3kP7ZJEKi8lo5sHDzKnmotiojZi7Bf
	 jakWwy2fqnhrg==
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
	paul.olaru@nxp.com,
	AjitKumar.Pandey@amd.com,
	venkataprasad.potturu@amd.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 30/31] ASoC: SOF: amd: clear panic mask status
 when panic occurs
Date: Fri,  8 Sep 2023 15:31:59 -0400
Message-Id: <20230908193201.3462957-30-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NPZMUR6DEUFTSWUVH2MGNKCGUZF3NKF6
X-Message-ID-Hash: NPZMUR6DEUFTSWUVH2MGNKCGUZF3NKF6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPZMUR6DEUFTSWUVH2MGNKCGUZF3NKF6/>
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
index 749e856dc6011..6951c67bc599f 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -161,6 +161,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
 					  true);
+			status = 0;
+			acp_mailbox_write(sdev, sdev->dsp_box.offset, &status, sizeof(status));
 			return IRQ_HANDLED;
 		}
 		snd_sof_ipc_msgs_rx(sdev);
@@ -190,6 +192,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 	acp_mailbox_read(sdev, sdev->debug_box.offset, &status, sizeof(u32));
 	if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 		snd_sof_dsp_panic(sdev, sdev->dsp_oops_offset, true);
+		status = 0;
+		acp_mailbox_write(sdev, sdev->debug_box.offset, &status, sizeof(status));
 		return IRQ_HANDLED;
 	}
 
-- 
2.40.1

