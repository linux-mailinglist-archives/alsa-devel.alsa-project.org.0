Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B066C0D0
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:04:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A2ED56DE;
	Mon, 16 Jan 2023 15:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A2ED56DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877893;
	bh=jBxXofiDuMYrEyqP2oAXhBy9CTP5zsteBxobWUWQSW0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JX9Jy1YHbwoIcKzAOfLQnWZnyotWMZ2FyinoTbkVX4YgbfF36uDssvuyf/UE97jsL
	 alJgjFCZy01O8bX5qaLY7wrlARtKebFYX++2Oqpuh9y798ystyWU26KsV5njIktCPN
	 G94UhFgzHpVLeM/DxNGFwlMttTLqqLBK80KC+yNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CDB7F80578;
	Mon, 16 Jan 2023 15:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82BF3F80578; Mon, 16 Jan 2023 15:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE709F80570
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE709F80570
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DbtbqWIm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EB01B80F96;
 Mon, 16 Jan 2023 14:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85982C433EF;
 Mon, 16 Jan 2023 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877753;
 bh=jBxXofiDuMYrEyqP2oAXhBy9CTP5zsteBxobWUWQSW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DbtbqWImrBtoGgjSwtziE2ghkeP32f9gaZaEmbgsgBy7yUWLrYxJIT3hFMOt9RQU5
 54/HiYUyGUBTuQx0OtyXBzFeZJGSizR7UierPOqsrzB1kJlcp8/EqqINsEUJCXgf8C
 hF9L0PeXmhEBaiUvT8Rua7ThT25IHH/gTaeafhc/1tiDECh1LhGezS6DfSaaYHiDky
 sEIXEKTGtzhAjnFYkHSwUMTd09Z2Uwcxr3AQimokDVQdAIZ0y0bNAf+naahhtjBQnv
 VhGqBozQQWtlQF3bf/1TSe+pdkIBymMRZsF7pQpOmN80m/6PKppOuUvDNwJsF//SeG
 VKsaRvYXfEvwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/53] ASoC: amd: yc: Add ASUS M5402RA into DMI
 table
Date: Mon, 16 Jan 2023 09:01:11 -0500
Message-Id: <20230116140154.114951-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Aniol=20Mart=C3=AD?= <aniol@aniolmarti.cat>, lxy.lixiaoyan@gmail.com,
 tiwai@suse.com, wimvanboven@gmail.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, mario.limonciello@amd.com,
 leohearts@leohearts.com, xazrael@hotmail.com, Syed.SabaKareem@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Aniol Martí <aniol@aniolmarti.cat>

[ Upstream commit a0dd7fcab5cd221fa960f594c586e1f9f16c02c0 ]

ASUS VivoBook 13 OLED (M5402RA) needs this quirk to get the built-in microphone working properly.

Signed-off-by: Aniol Martí <aniol@aniolmarti.cat>
Link: https://lore.kernel.org/r/20221227224932.9771-1-aniol@aniolmarti.cat
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 469c5e79e0ea..0d283e41f66d 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -206,6 +206,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.35.1

