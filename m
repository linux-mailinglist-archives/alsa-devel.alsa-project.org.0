Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056986BD5BB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:33:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBCB010AD;
	Thu, 16 Mar 2023 17:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBCB010AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984410;
	bh=ioD3xUhnDD/kN66mIEPreBlmwTQml2JuCHXZJ35GMJ4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jt7Cne/BWs0RhbyysnvZ8B0AXd8Y4bPxNLpXSSSK1h6MxxJQjzUM0nHEavvlTWD+4
	 /WQHB7wxhJUqiFt62m+pG5jj5KM2PWHWD7gTWEyawXRGeFOoXKjXfCXYTqm82vOLd+
	 sIWKUnz2SDBrKfqKkk+OL8TdyKR4RGUfZJ0ErFjI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 790C3F80423;
	Thu, 16 Mar 2023 17:32:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 941EFF80425; Thu, 16 Mar 2023 17:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75491F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75491F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uiJO9nM0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DCC9620A3;
	Thu, 16 Mar 2023 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4B0C433EF;
	Thu, 16 Mar 2023 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984350;
	bh=ioD3xUhnDD/kN66mIEPreBlmwTQml2JuCHXZJ35GMJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=uiJO9nM0AdieMf1tEkyY4z+SLUqgJ+ErYOHKzHyGKovuwgKuJVg9IXa3Sa6NTQTeN
	 Uq0Q6lgshcP/6ufXr6/zO2jbv5eYcRqiCZT2XYZVwH7gBeppmGd3o7ZWNN+gx9zKpN
	 M/q1mKC7I9PZmt1BI7kOjNc8HAEVCHFPiPdYfWTE3mDn64eTbuyOzq1OKo2I1J25DK
	 aQRkw/DoIrxiXYM2uRz2+jtseN4Q+cZSpG52slDiElvQGtfeZpQC/AFDc4ShbbSih/
	 9YhJdna0tbNn3+jhDqLUIgP49j7pZRkqZCkPOHQ1INvcss+X1QNPlFJ0oicbFAXO6N
	 NHaR4M8LqSnRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 1/7] ASoC: amd: yp: Add OMEN by HP Gaming Laptop
 16z-n000 to quirks
Date: Thu, 16 Mar 2023 12:32:18 -0400
Message-Id: <20230316163227.708614-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MTSZE5RKNQDYTE63HJQHI6ZSMJHGRMYM
X-Message-ID-Hash: MTSZE5RKNQDYTE63HJQHI6ZSMJHGRMYM
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Joseph Hunkeler <jhunkeler@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, xazrael@hotmail.com,
 aniol@aniolmarti.cat, leohearts@leohearts.com, dukzcry@ya.ru,
 fengwk94@gmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTSZE5RKNQDYTE63HJQHI6ZSMJHGRMYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Joseph Hunkeler <jhunkeler@gmail.com>

[ Upstream commit 22ce6843abec19270bf69b176d7ee0a4ef781da5 ]

Enables display microphone on the HP OMEN 16z-n000 (8A42) laptop

Signed-off-by: Joseph Hunkeler <jhunkeler@gmail.com>
Link: https://lore.kernel.org/r/20230216155007.26143-1-jhunkeler@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 36314753923b8..4e681e9c08fe5 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -255,6 +255,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "15NBC1011"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
+		}
+	},
 	{}
 };
 
-- 
2.39.2

