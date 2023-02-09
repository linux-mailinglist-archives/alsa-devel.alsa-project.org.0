Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FD690659
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:16:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275E2851;
	Thu,  9 Feb 2023 12:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275E2851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941379;
	bh=KlVsMxAVvKvxUT+qHdljU0jf9knMEDwhqc7W5rc9BhA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vgMgCyJuijYsPUWMVyKIXfhWheufEUHFSaLLcu+H2UAQDXkWAPIQ3uJI7pJGbUQof
	 pUAdiJtbuLB52YGl4Fhxvr/q81CyUE+ae6tCokZKcq3S81nO0theRw5ROcWlYlVAYQ
	 0OCEyylqif79jEFd8d7cUDCXMqsjwHvYULjPxdBY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A98EEF8021D;
	Thu,  9 Feb 2023 12:15:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0274BF80269; Thu,  9 Feb 2023 12:15:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 312A1F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312A1F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NykB9+Ft
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 93E52B81FFE;
	Thu,  9 Feb 2023 11:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC649C433D2;
	Thu,  9 Feb 2023 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941303;
	bh=KlVsMxAVvKvxUT+qHdljU0jf9knMEDwhqc7W5rc9BhA=;
	h=From:To:Cc:Subject:Date:From;
	b=NykB9+Ftot3PFH5BMcLuaTFPgyps4UR4OHZJ3ZPGMnNVxzcQLT9HfX4cH3NDWgaXc
	 yhwO0Kbhba9JpLPi+SxU/doIjqcFfXI/a2UZLyo6QBmfckf9913FNdiIvaovaSRtVt
	 ib2JMNnOtU7GXEJNfO9DM+R5jdzkJCIA1OVzWdYkpcJS4GBPKdlhDAhNbMvj1s0WVE
	 I42H4G4AnA1pXJ+j16LCqlbLZqMaYB878xlDKfpcXOG02xLWv9VjAGILKPx4bMgWM5
	 1iIGft56OgqYqVRfdRINZTe5Vs0KTHFwgiWjw53w1EnMh7w4FLFrNhhBUqwfZ2wIvt
	 RY3GLaRO2ctlA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/38] ASoC: amd: yc: Add DMI support for new
 acer/emdoor platforms
Date: Thu,  9 Feb 2023 06:14:20 -0500
Message-Id: <20230209111459.1891941-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VPEJCPXDAMS4SO3UZ37XRMVCSUSVIODB
X-Message-ID-Hash: VPEJCPXDAMS4SO3UZ37XRMVCSUSVIODB
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 shanshengwang <shansheng.wang@amd.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, dukzcry@ya.ru, leohearts@leohearts.com,
 fengwk94@gmail.com, xazrael@hotmail.com, lxy.lixiaoyan@gmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPEJCPXDAMS4SO3UZ37XRMVCSUSVIODB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

[ Upstream commit 7fd26a27680aa9032920f798a5a8b38a2c61075f ]

Adding DMI entries to support new acer/emdoor platforms.

Suggested-by: shanshengwang <shansheng.wang@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Link: https://lore.kernel.org/r/20230111102130.2276391-1-Syed.SabaKareem@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0d283e41f66dc..00fb976e0b81e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -234,6 +234,20 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Blade 14 (2022) - RZ09-0427"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFA16-41"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "IRBIS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "15NBC1011"),
+		}
+	},
 	{}
 };
 
-- 
2.39.0

