Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E32637EBC61
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 04:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845BDAE9;
	Wed, 15 Nov 2023 04:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845BDAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700019802;
	bh=Ode+0TAMlI4i52OixLmxUPLos4XbEqp0mr+Ivux6rBE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=chfADlG3HRPVRRnjL9GLaf4i9Od3tUDe9qneSnr/Eh9JYJPWELf+67zw9wmY5sIwv
	 Od+c5TMf8n2IjyjM/Vcg+MfV2h5ghe7MXb7981qfTIxYuX07ub1lc85CDeXDIcojNj
	 A5zxdVr/gl3knrzCedu9Cax27qq9wF8i1kW4kghw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B6EDF80558; Wed, 15 Nov 2023 04:42:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F4EF802E8;
	Wed, 15 Nov 2023 04:42:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BC31F80549; Wed, 15 Nov 2023 04:42:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE427F800ED
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 04:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE427F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u7nHKGY+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7506BB8188C;
	Wed, 15 Nov 2023 03:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8610CC433C8;
	Wed, 15 Nov 2023 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700019743;
	bh=Ode+0TAMlI4i52OixLmxUPLos4XbEqp0mr+Ivux6rBE=;
	h=From:To:Cc:Subject:Date:From;
	b=u7nHKGY+do2eIaxDG2hQJPkCYL1jej2d+pUV4cb7YZCbieAd+En7JTPVH3zGl96Co
	 Uy+6hLxffdrzXY1TTCgKOQ0Frphzf8zcOd9iFe7VzeEmJbESFcAQVbLMDcM5aGyU1+
	 j5g+uY6KsGXjrFc6bvDld+tCYskELCgvi8eBNf9euIi85leqvNZzQgAszIpBQiVLex
	 Zap5qYUWizNXsiGz9dm/bt7KNybuJpLXv9Syh+oijc3+G/WuiThaYxoaEu1H8fkJdv
	 gywdXOMLNsU5Bvn4e1K6uHDqCez6QLWvUS0+vW8N7LZBXLwR2wYnXsYPHfhIWCx/e6
	 XqTkGpXv72mKg==
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
Subject: [PATCH AUTOSEL 5.4 1/2] ASoC: ti: omap-mcbsp: Fix runtime PM
 underflow warnings
Date: Tue, 14 Nov 2023 22:41:53 -0500
Message-ID: <20231115034155.1241251-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.260
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RKT6WDRE5AXHGTAR3D46Z3OZJ5XNLOPY
X-Message-ID-Hash: RKT6WDRE5AXHGTAR3D46Z3OZJ5XNLOPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKT6WDRE5AXHGTAR3D46Z3OZJ5XNLOPY/>
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
index 3273b317fa3b9..3e8ed05f3ebd8 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -74,7 +74,8 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 		return -EINVAL;
 	}
 
-	pm_runtime_put_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_put_sync(mcbsp->dev);
 
 	r = clk_set_parent(mcbsp->fclk, fck_src);
 	if (r) {
@@ -84,7 +85,8 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 		return r;
 	}
 
-	pm_runtime_get_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_get_sync(mcbsp->dev);
 
 	clk_put(fck_src);
 
-- 
2.42.0

