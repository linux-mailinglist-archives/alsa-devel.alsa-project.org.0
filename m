Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E737EBC18
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 04:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA9901DC;
	Wed, 15 Nov 2023 04:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA9901DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700019410;
	bh=uz3VoRhQYG9uvIywcf7/L4nQE3Yr0jMTQYKIxzAPbQA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aSrM3m7oCSqHSMKi2ds6ulSmgj7YqXC7M0wUnbzWObyNR/APRPbfJT1KxWL70q6jf
	 jQwRshIe4Q3R2N1XP0maXe3lCgRaTi7/rxVXxiQh8NMyyxLFUHK+d6ohoR8xECiBEw
	 GDqmlxWc1QMPNjFsKRWf/2sQ5GTE3Zfw4v92s/Mw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6F2F80568; Wed, 15 Nov 2023 04:35:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78445F80557;
	Wed, 15 Nov 2023 04:35:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1E35F8055A; Wed, 15 Nov 2023 04:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92D49F80249
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 04:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D49F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mpMfZMWX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20A7A613DC;
	Wed, 15 Nov 2023 03:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6813BC433C7;
	Wed, 15 Nov 2023 03:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700019315;
	bh=uz3VoRhQYG9uvIywcf7/L4nQE3Yr0jMTQYKIxzAPbQA=;
	h=From:To:Cc:Subject:Date:From;
	b=mpMfZMWXk2/CRO8Y6Wfi/9PEXmhk144p5Wis+zT2daLm/Jo2BHpPHuuHZXuL7nY/Q
	 xnABS49P1LQA5I3tD/Ovn4XmKnBG0hc2+JgTpghfv7r2f1VYJab7b/OIsW538L5oKs
	 K6aZtnTkXjz7x5qcK85E4NinShOSyDCOc0RtgUHXUHo3igPwF1lc2lEzq/IuRrCA1s
	 BzSZQxuC5Tt3HbhOmg6UIgLZdZTAjZZdJsdy6dluU9visvhxcLtzna5WYb9hbo5Wt+
	 /emYVlW3cZ+5KvcDAe/YZCx5DyK0adBWyhopR8rTQbi3W9b2ARWtTbpQSEjHY/ik95
	 twEpzs3zgSlzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	peter.ujfalusi@gmail.com,
	jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 1/6] ASoC: ti: omap-mcbsp: Fix runtime PM
 underflow warnings
Date: Tue, 14 Nov 2023 22:34:45 -0500
Message-ID: <20231115033459.1228900-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q7R3CHO3SUSOIWRE2AVA63YTQXNWZU7R
X-Message-ID-Hash: Q7R3CHO3SUSOIWRE2AVA63YTQXNWZU7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7R3CHO3SUSOIWRE2AVA63YTQXNWZU7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit fbb74e56378d8306f214658e3d525a8b3f000c5a ]

We need to check for an active device as otherwise we get warnings
for some mcbsp instances for "Runtime PM usage count underflow!".

Reported-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Link: https://lore.kernel.org/r/20231030052340.13415-1-tony@atomide.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/omap-mcbsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 21fa7b9787997..94c514e57eef9 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -74,14 +74,16 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 		return -EINVAL;
 	}
 
-	pm_runtime_put_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_put_sync(mcbsp->dev);
 
 	r = clk_set_parent(mcbsp->fclk, fck_src);
 	if (r)
 		dev_err(mcbsp->dev, "CLKS: could not clk_set_parent() to %s\n",
 			src);
 
-	pm_runtime_get_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_get_sync(mcbsp->dev);
 
 	clk_put(fck_src);
 
-- 
2.42.0

