Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB036E0493
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71CDF6E;
	Thu, 13 Apr 2023 04:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71CDF6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353609;
	bh=d0X3yg7haQvgsR2Vxh0jBkmYqiZKufzWZYdFlrBGUqM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jirtsp6ZRMtFkWSY26lcQqDngqt5t+2FOsmIZU1EqDzwCHszVc1/ljIRkmhkbcQi0
	 ss61UZzpQufBQyLCOGPCabABzPlgwYlT0s2jVYlp1QR52uVTIXu+ueO8jXxrWKBVl8
	 /WuLGmbgOIMePLavjIghHOqAuYkTrIhXESsXbyqI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 748B7F80571;
	Thu, 13 Apr 2023 04:37:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D21F6F80587; Thu, 13 Apr 2023 04:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B140BF80571
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B140BF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IvjPtMMg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7390C63AB1;
	Thu, 13 Apr 2023 02:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BB2C433EF;
	Thu, 13 Apr 2023 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353421;
	bh=d0X3yg7haQvgsR2Vxh0jBkmYqiZKufzWZYdFlrBGUqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvjPtMMgfWAe9m4ZBcRnrDzpRS4GTib8hOHrySHjBEYDtwZzxJCovmuYNG+Q68Pvy
	 8qcpARJbcyaOf2pF5LGo+x0n5LyuK+xFAGnp8Y0x4YgBT+aTty2++j1j34eppVNyLo
	 3lB8mx+BhIeo0zNtxYkV/nhY7oVTZVV019Wuzv5C+sMrDag9edyqZ/Y/hGmiX5VXyW
	 9f0hlFIV+aKEnyL3/ZpEDE2CuFdQn9hU5idV/CmFfJsgdEJYCvRtfkLlIyPqRH1Kt4
	 Dbrs34ZSXELvuBksUmGxLyqmiqJ/5OyF4kv+F7n7tqp1ZKCdqtDra7msM3lUxDg/dw
	 JOtWUzESl3kzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/17] ASoC: amd: yc: Add DMI entries to support
 Victus by HP Laptop 16-e1xxx (8A22)
Date: Wed, 12 Apr 2023 22:36:33 -0400
Message-Id: <20230413023647.74661-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023647.74661-1-sashal@kernel.org>
References: <20230413023647.74661-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KPTIG63NWVOBLHUQCAZ6E72RU2KNPK7T
X-Message-ID-Hash: KPTIG63NWVOBLHUQCAZ6E72RU2KNPK7T
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ge-org Brohammer <gbrohammer@outlook.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, tiwai@suse.com, mario.limonciello@amd.com,
 Syed.SabaKareem@amd.com, mendiebm@gmail.com, dukzcry@ya.ru,
 wimvanboven@gmail.com, lub.the.studio@gmail.com, xazrael@hotmail.com,
 leohearts@leohearts.com, jhunkeler@gmail.com, lxy.lixiaoyan@gmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPTIG63NWVOBLHUQCAZ6E72RU2KNPK7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ge-org Brohammer <gbrohammer@outlook.com>

[ Upstream commit 205efd4619b860404ebb5882e5a119eb3b3b3716 ]

This model requires an additional detection quirk to
enable the internal microphone.

Tried to use git send-email this time.

Signed-off-by: Ge-org Brohammer <gbrohammer@outlook.com>
Link: https://lore.kernel.org/r/PAVP195MB2261322C220E95D7F4B2732ADABC9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702360c..0acdf0156f075 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -269,6 +269,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
+		}
+	},
 	{}
 };
 
-- 
2.39.2

