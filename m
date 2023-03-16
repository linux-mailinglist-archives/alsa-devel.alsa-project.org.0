Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D16BD5C4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:33:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC1A10BE;
	Thu, 16 Mar 2023 17:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC1A10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984438;
	bh=KASXsKcwhzOFvQl9CRD+V3oEgR7AUj1FxHxAfxlkrZg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LpaxfbL1zsYdE48/29VpArgF1ePjXh0ctejcn5E8ECTUFYl3vHuR8ZdfgVgyrMt6V
	 n/MLIRB//IE5jQ2o7BlLXzNnfT4+rvLiI17fY1MBC7wILiNudTLAF4476W+7WErk+f
	 etYLF/qQSFJFvdo+6dHV1voP8oX090RHQyVdBBUs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0D5F8051B;
	Thu, 16 Mar 2023 17:33:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB2A5F80527; Thu, 16 Mar 2023 17:32:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC0AFF804B1
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0AFF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qWuYFCfG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56485B8227B;
	Thu, 16 Mar 2023 16:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA0BC433EF;
	Thu, 16 Mar 2023 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984375;
	bh=KASXsKcwhzOFvQl9CRD+V3oEgR7AUj1FxHxAfxlkrZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWuYFCfGRMPu9KpDKCDNT5mCuM0ko1ZWOVw4T1Au/VSJnDq1K0meLakoJOkZCb5b0
	 agd3SlwXhDQJGB/VL19d+wiFOfm4CzwHN5DPeiDHeM/Oos67e1GoWpYUxVNejNxNw9
	 EzUQ0UiE/4ZOtbVur0rDetzH0gOQuOk2YA6+gbZ86lk5mUZvML7qlKohQhqivT2WIN
	 Ak6uiAV318FWVOSSZpRfI7v134fVpBA9s5aGHbrjkc0zcH0CwTV0qpSovZQ+VH0xwv
	 0Ztar2IugFDz8xJD/9dQVOV+M9rDrNlSSIGW2s2T/65RCUJgjNVA0++B7bAG+1JeYN
	 s7kbSZ7bC+Nrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 4/7] ASoC: amd: yc: Add DMI entries to support HP
 OMEN 16-n0xxx (8A43)
Date: Thu, 16 Mar 2023 12:32:21 -0400
Message-Id: <20230316163227.708614-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316163227.708614-1-sashal@kernel.org>
References: <20230316163227.708614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X3LGU5WCVEU6A6STTUEHA4KCXJUKVAPI
X-Message-ID-Hash: X3LGU5WCVEU6A6STTUEHA4KCXJUKVAPI
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Duc Anh Le <lub.the.studio@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, aniol@aniolmarti.cat,
 fengwk94@gmail.com, dukzcry@ya.ru, xazrael@hotmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3LGU5WCVEU6A6STTUEHA4KCXJUKVAPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Duc Anh Le <lub.the.studio@gmail.com>

[ Upstream commit d52279d5c9204a041e9ba02a66a353573b2f96e4 ]

This model requires an additional detection quirk to enable the internal microphone.

Signed-off-by: Duc Anh Le <lub.the.studio@gmail.com>
Link: https://lore.kernel.org/r/20230227234921.7784-1-lub.the.studio@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4e681e9c08fe5..4a69ce702360c 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -262,6 +262,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
+		}
+	},
 	{}
 };
 
-- 
2.39.2

