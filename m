Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D047EEF0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 14:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D92417DE;
	Fri, 24 Dec 2021 14:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D92417DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640351556;
	bh=MOI2F7NA2AxaR+yfJWOfRlslVPAUrSbCsIU0LjQRwYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRzXpBJa/RJy0tdOje26fyX0yssU8Z77/wteydxh2UEPG/SWV1zywLa18LPw7Q4Rz
	 RNUiLZkMm7pTXkXYYM3HULYEVvAuuBlhCPMt8XHpYvBSdohoTzuEmxTybxmQQEsfUS
	 9sJs9tP+v1HDO1SNGaP8h9oq5gTFZCL1gTpst4UI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 641D6F80162;
	Fri, 24 Dec 2021 14:11:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B253F800FF; Fri, 24 Dec 2021 14:11:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47E76F800FF
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 14:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E76F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hq9Rc/3Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 308FF6206C;
 Fri, 24 Dec 2021 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EE3C36AE5;
 Fri, 24 Dec 2021 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640351467;
 bh=MOI2F7NA2AxaR+yfJWOfRlslVPAUrSbCsIU0LjQRwYc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hq9Rc/3Yl+iTJEUYkVVGDA8806KO6rmLWJjMg568u2dTpnfew6yA4X/FxC2SSLNdS
 HbcKqlWuxNdaZ3whJqOaV3L8fAwEesbvg2TemWXjVWeqY0vFps+7O/jYVNVk4w/SR9
 FYVg+LxDU295gUrfXQcP4ccsr2fuJC1DUgdvDPyUaljJr85ToTxQUA0GyZJoOKWQ5G
 jJmcly53yAov9DJ5sTaqir/8vHnh8ZsPmw7Vj3cxSbwxqpH+SyvFccI+G2uD6Nxj7X
 gFrwr5LmK0Kk/+dvr1QxdHnNqyxBpsRO7n5pHsdweafBW18ZVji2L1OQUpoQEmgxLx
 KWLWCkc+ruV7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1n0kLh-000UqY-8N; Fri, 24 Dec 2021 14:11:05 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/1] ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021
Date: Fri, 24 Dec 2021 14:09:50 +0100
Message-Id: <d560a1c76edb633c37acf04a9a82518b6233a719.1640351150.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640351150.git.mchehab@kernel.org>
References: <cover.1640351150.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Huajun Li <huajun.li@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, tiwai@suse.de,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Huawei D15 uses SSP_CODEC(0).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/1] at: https://lore.kernel.org/all/cover.1640351150.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e38eafd19251..5427285f78d0 100644
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
2.33.1

