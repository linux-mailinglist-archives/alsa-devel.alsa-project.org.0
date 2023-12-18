Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AD3816E44
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:46:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3665CE8B;
	Mon, 18 Dec 2023 13:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3665CE8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903576;
	bh=dDN46ecZEAy2OD4iXawXY7EQooHgbdoIMOokrSC7xxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tG3X+O+AUZxQizK7izaIs1cyMQDqaVCafouuw7VcrmQhfOJ71DuPTOnOsRLJadHEv
	 hhJHVfdyGi4aVXHCbLvBq8uaLz+tECEEtZq8zZdYiMd9vue2p1EahWNBYTU288oiZw
	 tTG6LPnYB0kWkCaOPREiFKKO6mSoeacxE+T1FIBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B0AEF805A1; Mon, 18 Dec 2023 13:44:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA38F805BD;
	Mon, 18 Dec 2023 13:44:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33516F80578; Mon, 18 Dec 2023 13:44:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3412F80557
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3412F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ij+JTDF2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA26ECE10BD;
	Mon, 18 Dec 2023 12:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAC0C433C8;
	Mon, 18 Dec 2023 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702903462;
	bh=dDN46ecZEAy2OD4iXawXY7EQooHgbdoIMOokrSC7xxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ij+JTDF2dMEDldN9ayZn01MeHm1+1nmSibQz3/FcofQaH2lxvT9YLXPnqVdOQDcTw
	 gt/4QoMi0tv/ZyPcx1c6UFAEKzPep2kCCkzNs0kvEJBOCSMAsf6vIyK+Tb9cNDfq0Q
	 Mgut4LgLv8+h3rvEWO7GTO/42j2IIjB0ZVn4DudCkHiHZlok1nptxApdX/1wueJ7YG
	 OUPSdR7/DNklDiVyK3/1ejM92ORwF0Dc8gL2BUyVtg+B+LU1BeIkpbMsPF7qR+gNxa
	 o2ZQBDDGgWNISjRy37T+P/E2Lm5fDkCruzVGkoaUKzlJiGKk2SIq8/Lj5vGMAeERYU
	 2BBGIT9FH1buw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.6 03/18] soundwire: intel_ace2x: fix AC timing
 setting for ACE2.x
Date: Mon, 18 Dec 2023 07:43:37 -0500
Message-ID: <20231218124415.1379060-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218124415.1379060-1-sashal@kernel.org>
References: <20231218124415.1379060-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EEU7LLF2EE3K34YS77XJWUPDBOLVPMSG
X-Message-ID-Hash: EEU7LLF2EE3K34YS77XJWUPDBOLVPMSG
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

[ Upstream commit 393cae5f32d640b9798903702018a48c7a45e59f ]

Start from ACE1.x, DOAISE is added to AC timing control
register bit 5, it combines with DOAIS to get effective
timing, and has the default value 1.

The current code fills DOAIS, DACTQE and DODS bits to a
variable initialized to zero, and updates the variable
to AC timing control register. With this operation, We
change DOAISE to 0, and force a much more aggressive
timing. The timing is even unable to form a working
waveform on SDA pin.

This patch uses read-modify-write operation for the AC
timing control register access, thus makes sure those
bits not supposed and intended to change are not touched.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20231127124735.2080562-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/intel_ace2x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index a9d25ae0b73fe..e320c91289135 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -23,8 +23,9 @@
 static void intel_shim_vs_init(struct sdw_intel *sdw)
 {
 	void __iomem *shim_vs = sdw->link_res->shim_vs;
-	u16 act = 0;
+	u16 act;
 
+	act = intel_readw(shim_vs, SDW_SHIM2_INTEL_VS_ACTMCTL);
 	u16p_replace_bits(&act, 0x1, SDW_SHIM2_INTEL_VS_ACTMCTL_DOAIS);
 	act |= SDW_SHIM2_INTEL_VS_ACTMCTL_DACTQE;
 	act |=  SDW_SHIM2_INTEL_VS_ACTMCTL_DODS;
-- 
2.43.0

