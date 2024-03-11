Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329548787B9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 19:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C072E64;
	Mon, 11 Mar 2024 19:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C072E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710182500;
	bh=h13E3I/67aiIVBnOSCOdgSWe9t1VwoTldhgwrMtJGUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cou57mCVaz53w6DSVJZwncS1jbCM1qJcmKOhm/F4M+EA5RMy+fbFSOGmU1exhHKHs
	 2MhGukDiPfHMsrHCEs1rRktvJkSQ/Wv9WzR0kzXZiitX1p0/177lehATvHi495Wijl
	 A2FAUAYd0yUeFmwEQfVsZL9Gkq7HqYgU28DvOXj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E158F805F8; Mon, 11 Mar 2024 19:39:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6570F805FF;
	Mon, 11 Mar 2024 19:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BA9BF805C6; Mon, 11 Mar 2024 19:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FB01F805C5
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 19:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB01F805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u3bzwXK4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 405EBCE10EF;
	Mon, 11 Mar 2024 18:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC50C433F1;
	Mon, 11 Mar 2024 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710182320;
	bh=h13E3I/67aiIVBnOSCOdgSWe9t1VwoTldhgwrMtJGUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u3bzwXK4QarKOu8rppNI2RwoH9b0RXe/BwYw8l+6+CM2B3oAf9Wedsnl32I0TVmkc
	 j/fQzO5rOlJ6D7cWbplfxSdhpfsMpo82Z5CY0FNggMra3QhH39dNG7fn+RlqkFFUGE
	 VLL+SMRhwAPp/5pGOXKRNaTY6RuQQa+whGc4Flxq2PskBkk8Ii+fFQPOISkSKN0XXO
	 YOez0yTFRIIXvULtjDrkKmLP++6kbdEwv68EJssMALtaXvGFWK7T0qo9cnBj/LFRyt
	 shrb702j+iN7yVY55jZiFE0Unzl99IDt57IiYOIK5L0hxHjNYxstdVy4TY/gD1B6rW
	 hU+19+8AasBNw==
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
Subject: [PATCH AUTOSEL 6.1 2/7] ASoC: Intel: bytcr_rt5640: Add an extra entry
 for the Chuwi Vi8 tablet
Date: Mon, 11 Mar 2024 14:38:20 -0400
Message-ID: <20240311183826.328535-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311183826.328535-1-sashal@kernel.org>
References: <20240311183826.328535-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.81
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AYCOCCKVUUGLVW777X3HIXHX2Y4V4K2X
X-Message-ID-Hash: AYCOCCKVUUGLVW777X3HIXHX2Y4V4K2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYCOCCKVUUGLVW777X3HIXHX2Y4V4K2X/>
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
index 797d0a48d6066..094445036c20f 100644
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

