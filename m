Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C66BD5CA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E150F109F;
	Thu, 16 Mar 2023 17:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E150F109F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984461;
	bh=ioD3xUhnDD/kN66mIEPreBlmwTQml2JuCHXZJ35GMJ4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IVorpn7X+sVOvSwTyVLyO5XnuTfo3V06t+3K+4YI3jcW2mvARCyhxnDvfnQD0VUCB
	 APHNygYSR8LM2Lyb5mY64L/M7n6HV9G7CNKC1juCFlaHkoLvP/s3029GohdUVNBCDC
	 zLlcef0xIsU2SNbMlZuIMb2TT8I8SMo7N+oPQBhc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE19F80529;
	Thu, 16 Mar 2023 17:33:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 106F6F8052D; Thu, 16 Mar 2023 17:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34270F80527
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34270F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ir6jkhir
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB2B2B8227B;
	Thu, 16 Mar 2023 16:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DA8C433A0;
	Thu, 16 Mar 2023 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984392;
	bh=ioD3xUhnDD/kN66mIEPreBlmwTQml2JuCHXZJ35GMJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=Ir6jkhirjcqj8gUeJ92Hq5ePtkml4N9NJsAc2w/p8ktLMMGfo2uD9nKAARy+go+vf
	 pGaVQ9IzZkanZdKH3Dg5OGVj52fpQR4EAxah9uojm1qEykdhDPHDuf4rcAoYoGDT0Y
	 UTA3ABs9KverooIwbyM2evWYyzWvs4Oh8rHpIK1wu2daSC55DmkvKXzD/sxqgsz33G
	 9wSA0iT80NYT6EPFE1ExsHr5Ibbi98HrrgjtSdcZILDeijy96DnZLwdYPUSKad5xfN
	 GgimGpjOYuObPtBn2c5SnOTgVl/rNXHkEYQ5FhDOa18mrORxDTGsnPl63N4XlncndK
	 q4peihw2MOhBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/6] ASoC: amd: yp: Add OMEN by HP Gaming Laptop
 16z-n000 to quirks
Date: Thu, 16 Mar 2023 12:33:02 -0400
Message-Id: <20230316163309.708796-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EUG5BHRVLKMM2VCUN64TERAA6CMYKOT2
X-Message-ID-Hash: EUG5BHRVLKMM2VCUN64TERAA6CMYKOT2
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Joseph Hunkeler <jhunkeler@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, mendiebm@gmail.com,
 dukzcry@ya.ru, leohearts@leohearts.com, xazrael@hotmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUG5BHRVLKMM2VCUN64TERAA6CMYKOT2/>
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

