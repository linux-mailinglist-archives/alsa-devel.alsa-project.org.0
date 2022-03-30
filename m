Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE54EC179
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC6618EE;
	Wed, 30 Mar 2022 13:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC6618EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641433;
	bh=BIereeSl8OOvQHyMUSmTZlEVrUWpAJuLOWV5juCjHcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=up034hMK6mhVcA+o4aed6AqRzM2VROJ59mIcY+UR9tf7pVl3oliP/LGeR9G66lu7K
	 sqELkq3I7o2OkObtShJlMDxYGjfIx5Yj4akpwyqw2bXHgrvLVNUsxxpFf+aO37ntpP
	 RH6L4IjKVQkuPxIPH2x+FULikQ5Al1jpbs34b9bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B52F805ED;
	Wed, 30 Mar 2022 13:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F0FF805EC; Wed, 30 Mar 2022 13:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE45DF8052F
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE45DF8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MyYCKV4t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0C42616B1;
 Wed, 30 Mar 2022 11:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D64C340F3;
 Wed, 30 Mar 2022 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640968;
 bh=BIereeSl8OOvQHyMUSmTZlEVrUWpAJuLOWV5juCjHcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MyYCKV4tJuuvnrEfwf+StS8ubhVcry2Sh9TCHJBGx8defkQS4ceC4egRLsuFUV3pY
 EIVexgaW6naemHwGinhDy+9HcPs11pmDfiqpW/mpvoB46PwWy10KQDXqxt6m0pAc6g
 HbG6RdNjzpAFXrbyN5oGjdvQ1jUgF8NH5aERWxOIKIZyL5fGdvB7Tcc3NjPabykVYI
 LgdIkXzzj9Z8KMNyznjuc+3k8Q5uzQDjyPUO9opre90m/yud2ElMQPFp1RFFQAhwAG
 L7+ntx0Ehffi5rALNwarlZvnc9o4Cri89luVy69UIniCxgTMZJWLe2XO645bz0G3O/
 RvTlULHjHy8nQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 36/59] ASoC: Intel: sof_es8336: add quirk for
 Huawei D15 2021
Date: Wed, 30 Mar 2022 07:48:08 -0400
Message-Id: <20220330114831.1670235-36-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71 ]

Huawei D15 uses SSP_CODEC(0).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lore.kernel.org/r/d560a1c76edb633c37acf04a9a82518b6233a719.1640351150.git.mchehab@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 20d577eaab6d..e6d599f0cd26 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -247,6 +247,14 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 					SOF_ES8336_TGL_GPIO_QUIRK |
 					SOF_ES8336_ENABLE_DMIC)
 	},
+	{
+		.callback = sof_es8336_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_BOARD_NAME, "BOHB-WAX9-PCB-B2"),
+		},
+		.driver_data = (void *)SOF_ES8336_SSP_CODEC(0)
+	},
 	{}
 };
 
-- 
2.34.1

