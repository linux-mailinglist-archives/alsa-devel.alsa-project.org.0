Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F094F878787
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C666DDEC;
	Mon, 11 Mar 2024 19:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C666DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182295;
	bh=9ccDM9c454YdhVODsmOP14BtRqS2+UqRY7429uin5Oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IszMGhEwp/1JO6b89i36ump6S4Fku8rW8VkG3Dk0J6yxGT5HHAL5JCvSY11nB85OU
	 XV0b3rpD1Fs1190E5eISvNL/r5OBrJ9l8roN6DOuro0Ui1ZBM7II1yc9P5gsfLM4v+
	 mVx5MOHJ126w6cz2bQPh6wiTc60KgwRmuYJyL5RQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62F6CF804B2; Mon, 11 Mar 2024 19:37:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2960F805A0;
	Mon, 11 Mar 2024 19:37:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FD4BF8028D; Mon, 11 Mar 2024 19:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69119F8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69119F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IVZbpevs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BCED60F77;
	Mon, 11 Mar 2024 18:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4A9C43390;
	Mon, 11 Mar 2024 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182189;
	bh=9ccDM9c454YdhVODsmOP14BtRqS2+UqRY7429uin5Oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVZbpevsqMwQNvcfB/koRNPxNnL5ImuEHHZ+CXl5w11XAQ4vHGeSm7Iffr9colPe/
	 CDe721D7fjYNnVeuM8T/+MrF1xvfzqRsTQfwe9CVlnkJ9j7n2WqDGGixzH3GgKf0xL
	 reKR5nT20RYxGoYtaGo9oRsHsLyUsr21KmOKzGGQDlQ7KpEJmLYvwkLWwsaq/iMudo
	 urIrDTQCQiF6IwpwTpyumH2tXJOgLE93KrlN/QvjO2b15v6WwhmfY9SMO0yUqgJAJw
	 UBUvNKHK9DIYnr/Dv4HpUsJrzsty+kqyGIKHCOB0GZmFeDPiil3cO5yUtAVQnCxp6s
	 xbphnqBM90Ajw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Alban=20Boy=C3=A9?= <alban.boye@protonmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	liam.r.girdwood@linux.intel.com,
	yang.jie@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	hdegoede@redhat.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.7 02/14] ASoC: Intel: bytcr_rt5640: Add an extra
 entry for the Chuwi Vi8 tablet
Date: Mon, 11 Mar 2024 14:36:05 -0400
Message-ID: <20240311183618.327694-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311183618.327694-1-sashal@kernel.org>
References: <20240311183618.327694-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GM7IVTODB53WDTLBV726C7TIT4K57NHZ
X-Message-ID-Hash: GM7IVTODB53WDTLBV726C7TIT4K57NHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GM7IVTODB53WDTLBV726C7TIT4K57NHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alban Boyé <alban.boye@protonmail.com>

[ Upstream commit f8b0127aca8c60826e7354e504a12d4a46b1c3bb ]

The bios version can differ depending if it is a dual-boot variant of the tablet.
Therefore another DMI match is required.

Signed-off-by: Alban Boyé <alban.boye@protonmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://msgid.link/r/20240228192807.15130-1-alban.boye@protonmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 42466b4b1ca45..a290f498ba823 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -685,6 +685,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Chuwi Vi8 dual-boot (CWI506) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "i86"),
+			/* The above are too generic, also match BIOS info */
+			DMI_MATCH(DMI_BIOS_VERSION, "CHUWI2.D86JHBNR02"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_MONO_SPEAKER |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		/* Chuwi Vi10 (CWI505) */
 		.matches = {
-- 
2.43.0

