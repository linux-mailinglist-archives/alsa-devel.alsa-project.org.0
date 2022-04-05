Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B14F292E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 10:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B001A17A7;
	Tue,  5 Apr 2022 10:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B001A17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649148365;
	bh=nRMo+z2lBnIeY2gWA47akGjKJTExBImxtqaJZH6LZRY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGmKxByHR1ikdXem5+tGCjmDZRtqiIauD/kmTFd/oSWNN0/jJfVEITgyuHeTv6ki6
	 JlqgolBeh+dn/rqundCk+P639wTC+jrgzHZKRLo1Ue9g0b5F7eUxbe2UsnAOOXgCIc
	 nz++oK8l3S6ug2LAStYGcof3BmdLIPR1I/3iWkoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC1BF80519;
	Tue,  5 Apr 2022 10:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B184F8049C; Tue,  5 Apr 2022 10:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B56F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 10:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B56F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ovHq+AmO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4C1614E4;
 Tue,  5 Apr 2022 08:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D46C385A7;
 Tue,  5 Apr 2022 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649148258;
 bh=nRMo+z2lBnIeY2gWA47akGjKJTExBImxtqaJZH6LZRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovHq+AmOb8oZDAWUl+4rgcc4gCndwuQhRTKEqQVdjzw5XyCv0rAVlwZ53MA5rtR6K
 QBD754frewQOGxu4lI7foMOe0xE19P7cJmEtaxetu2jZ56bYJxRe0SHOvpO7cVxsP3
 8XdcpSOIuEEgQMTXfQu9oMzAsCnwfKeRNCVckSntstTibsr1/O0WzK4SYvdEo04tvo
 k1DMtCn9f+Ia67PGwyBXbs38aGaX9aNg6LYqANyK9JCLkdBIRen3qPrpjFA1gJIrM0
 4dEvT2xbyZbhplrWROhEVpJ5bgyhzbROfjxDffvo3QowqRMwRSvq1RXMWh/OuJpijP
 qpoGZh/q2dA0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbenP-001IBq-EM; Tue, 05 Apr 2022 10:44:15 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 2/2] ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a
 headphone gpio
Date: Tue,  5 Apr 2022 10:44:13 +0200
Message-Id: <01ca33a28b8f7ef084bfa1317ada0cca1b0589f6.1649147890.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649147890.git.mchehab@kernel.org>
References: <cover.1649147890.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Based on experimental tests, Huawei Matebook D15 actually uses
both gpio0 and gpio1: the first one controls the speaker, while
the other one controls the headphone.

Add a quirk for that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1649147890.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index bcd80870d252..79cf9777c4fc 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -292,6 +292,14 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_ES8336_TGL_GPIO_QUIRK)
 	},
+	{
+		.callback = sof_es8336_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_BOARD_NAME, "BOHB-WAX9-PCB-B2"),
+		},
+		.driver_data = (void *)(SOF_ES8336_HEADPHONE_GPIO)
+	},
 	{}
 };
 
-- 
2.35.1

