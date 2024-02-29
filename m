Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887D86CD76
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 16:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80996850;
	Thu, 29 Feb 2024 16:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80996850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709221801;
	bh=KMdpPcg5w+z+tVeN+JvRVV4A2DEvvetANQO9444T5ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YyGZ9NACe2xC8+LqWqxJOS/EANylaf7qeX6Y5/qEoEYSNC+VFVWj/Rp0ErgEOr07O
	 5h9jrMIpDWbE/0F82d48q2gO++mqCc2bLRksykiQ+MSzbKN9ZiobMD3bMFh3SuyLT9
	 bKwK5X87asfogghN3Pn3bMTsCGMorVA9rwKo9s/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B955CF801C0; Thu, 29 Feb 2024 16:49:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D825F805A0;
	Thu, 29 Feb 2024 16:49:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E63BF801C0; Thu, 29 Feb 2024 16:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D666F80104
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 16:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D666F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=owoyZWg4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06E4E61197;
	Thu, 29 Feb 2024 15:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB06C433A6;
	Thu, 29 Feb 2024 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709221740;
	bh=KMdpPcg5w+z+tVeN+JvRVV4A2DEvvetANQO9444T5ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=owoyZWg4qRJsKOblM7lLkon+fYe32zEEZ+3DZNcIYccb2fZx6KToAIeLvCz7FFX6E
	 OUWhqAWSUPJOrLL6x/w9oW6+SaCgLe4tWnLtAPV/XVpPoiMFkR18zsCOO4WU6o1eyQ
	 W40NzN2HiZlTB6b6v+PfXthDGVHvcJDF31xPtAaUa/+kIo1/YjqNdKOK2Hae4pSiS7
	 RjlE/q/vomxgqs3fQkQMZMKnMzc2peKbDGlYGv9RgKf1va3FC6eU3hTmOEdlTRaeVY
	 nAK7mnDjC/B88GG8780A/pYvlym7aHV+ZAXf+2MXMuK9/vwGNalJTQSLyUVPUW3hOb
	 Zh48lsCr+pmmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 05/26] ASoC: cs42l43: Handle error from
 devm_pm_runtime_enable
Date: Thu, 29 Feb 2024 10:48:24 -0500
Message-ID: <20240229154851.2849367-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229154851.2849367-1-sashal@kernel.org>
References: <20240229154851.2849367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7CFDIILPF2RD7MDHDBT55VXLKU6VM32
X-Message-ID-Hash: O7CFDIILPF2RD7MDHDBT55VXLKU6VM32
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7CFDIILPF2RD7MDHDBT55VXLKU6VM32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit d1722057477a3786b8c0d60c28fc281f6ecf1cc3 ]

As devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20240206113850.719888-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l43.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d62c9f26c6325..5009cf64124ed 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2175,7 +2175,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(priv->dev);
 	pm_runtime_set_active(priv->dev);
 	pm_runtime_get_noresume(priv->dev);
-	devm_pm_runtime_enable(priv->dev);
+
+	ret = devm_pm_runtime_enable(priv->dev);
+	if (ret)
+		goto err_pm;
 
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, dom, cs42l43_irqs[i].name,
-- 
2.43.0

