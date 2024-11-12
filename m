Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C359C5448
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5D820C1;
	Tue, 12 Nov 2024 11:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5D820C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731407992;
	bh=LiQ12F5R1GqYjuk7X375S1/5n3F8xOsLGwoE1RiT1V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fdJb/bC3HRXG4psWs/VHR0eaIncVazSykdnlUfoOuR7C6ltIlR70GupjGhBKnaUSS
	 Z/9/Rgw39xizOGM5XsGKArCDIoqVsgZdY2UWHcPe+IcH06FIgktW5MaWIrJps9Q6k0
	 6KKyvTiXlN5FtazBx2U33uS0suQLARPfqoLLfkkA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A26A5F80698; Tue, 12 Nov 2024 11:38:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78906F8069E;
	Tue, 12 Nov 2024 11:38:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CAA9F805F4; Tue, 12 Nov 2024 11:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB8FF800D2
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB8FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NjTxI1HN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94900A41956;
	Tue, 12 Nov 2024 10:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEADDC4CED7;
	Tue, 12 Nov 2024 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407879;
	bh=LiQ12F5R1GqYjuk7X375S1/5n3F8xOsLGwoE1RiT1V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjTxI1HNoQRi9hBYKP8OQf1Ev7+PJRHsMrDoLv2fWLivlX2KhEAr1KzEt2P9Y94r2
	 YhbELZIFsqivPoAPOM7vdApDyzKxGhekJK0uMMnlff4YZWWPMu3EfDdOWDElySBlJ2
	 6B21uR9cGXhOPoGdy3DmMQt8T9mi6Eg2BZQjR8CGRxatDwvrp03+FcvCjAu4BDRDTe
	 zCts9HmuShwKlEvCksNsROPzrHFiINOYU3Feyhz+ml+1r1KbkORDSTCntEvntqTmTz
	 b9IAF7SEo1AJFVjm94LyttceZsbPfrqdqSQxXj9GE9ZK5nDEHfH00UmrLNOvUUJsuu
	 zosUfDABllMCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 7/8] ASoC: stm: Prevent potential division by
 zero in stm32_sai_get_clk_div()
Date: Tue, 12 Nov 2024 05:37:41 -0500
Message-ID: <20241112103745.1653994-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103745.1653994-1-sashal@kernel.org>
References: <20241112103745.1653994-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.171
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SDX657BDRL5NM52JL6SHEFVKTIL3COAZ
X-Message-ID-Hash: SDX657BDRL5NM52JL6SHEFVKTIL3COAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDX657BDRL5NM52JL6SHEFVKTIL3COAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 23569c8b314925bdb70dd1a7b63cfe6100868315 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://patch.msgid.link/20241107015936.211902-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index aa9cdd93b5778..d71b4aecd269f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -319,7 +319,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 	int div;
 
 	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
-	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
+	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
 		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
 		return -EINVAL;
 	}
-- 
2.43.0

