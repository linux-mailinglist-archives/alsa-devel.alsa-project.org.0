Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DD51080D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFDE187A;
	Tue, 26 Apr 2022 21:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFDE187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999877;
	bh=TM6ssMyvZvcASYsT6Apxm/GZUaH1RFTdyW2HscOYdQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwdFrclxg1oARVZETMZXeoUFLxPCPIlI2wrw7erw/+MSrvuBEK1/GFUHrfuBxKPiH
	 mGe1+U70MaM1xuHwye0/sNFft9BCEXn1BO59ih4N67sWeSJ97QTY75KlER7mMu8xp5
	 Up5W1lyjg6SBoHHjKNm0zcQJb1RNnPS0W8LKrtLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1D5F80539;
	Tue, 26 Apr 2022 21:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2011F80533; Tue, 26 Apr 2022 21:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E458EF80533
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E458EF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mXHeulJN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D7F0619CF;
 Tue, 26 Apr 2022 19:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35745C385B0;
 Tue, 26 Apr 2022 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999732;
 bh=TM6ssMyvZvcASYsT6Apxm/GZUaH1RFTdyW2HscOYdQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mXHeulJNpeGGkbtWWrghXM9cDW3Ynr6s+TT1w1pvTJsLwunhlihTeJMT2WqcMntsu
 xsCYN9tgQUTAIpqBfARJdeSPuQ6kFLg0xkk8uaVkCcngI9TQCcK8Mc3quJl3j+x/H2
 IepitMmeyTNk9aQf7XuJG3jrMsesQPCkHfH76olV9pwiy9HwkMEYDODNo8uYZJJOxz
 eoWiK+rXf2CFSMDm6AQiYm63xaczvAwSrN0HkjgIfvFqMAdmBhWQBL6KXd0OZBi7C3
 OEQSTmu/ZeWSc4Zv7XAuVfbv2iAfJuXWgVVAm9T/CzE0T5QibIIJDMCS3WURtABr3x
 R5dPXGsW3p56A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 19/22] ALSA: hda: intel-dsp-config: Add
 RaptorLake PCI IDs
Date: Tue, 26 Apr 2022 15:01:42 -0400
Message-Id: <20220426190145.2351135-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190145.2351135-1-sashal@kernel.org>
References: <20220426190145.2351135-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 Gongjun Song <gongjun.song@intel.com>, brent.lu@intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

[ Upstream commit b07908ab26ceab51165c13714277c19252e62594 ]

Add RaptorLake-P PCI IDs

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220421163546.319604-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 70fd8b13938e..55deb7447183 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -410,6 +410,15 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x54c8,
 	},
+	/* RaptorLake-P */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51ca,
+	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51cb,
+	},
 #endif
 
 };
-- 
2.35.1

