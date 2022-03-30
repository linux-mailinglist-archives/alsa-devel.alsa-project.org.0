Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B34EC0BA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46E717E9;
	Wed, 30 Mar 2022 13:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46E717E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641090;
	bh=s0wj/LBQJuAxdPrtimr7Muy8fa/7WRNCVbi4aDUt0iY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SkPvnxmPI0T2hLzzMeH3TuIfKzKZr3CLHwqPkvD2uFaoZjkZoA4aPYFuUgsshFLRq
	 U1vWE9x1RuPTcnYaphVclVfXlMLWthyG5rlQVoFMaN4nu/QEbOA7UM6NnnN9WI1d+J
	 jo4QXJpiP6MnI12Lk3QrM3YjMyXsLx6bNtyzePXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34539F8055B;
	Wed, 30 Mar 2022 13:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F5BBF8055B; Wed, 30 Mar 2022 13:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A95EF8054A
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A95EF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h2gBcVKP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2588B81C3C;
 Wed, 30 Mar 2022 11:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E91CC340F3;
 Wed, 30 Mar 2022 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640885;
 bh=s0wj/LBQJuAxdPrtimr7Muy8fa/7WRNCVbi4aDUt0iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h2gBcVKPD9aKNvGKz3adIqJeIvjPxCOHYeVNk6oL4x0bxefRpO4vWKzBzod2UJedj
 yDEyWekTcaDOWbatgHSGxu0Q54X29qnrelyGw8CJajS4JYdZnpM97fEgigk/H7qlxA
 TDtr7T/ZE0LRhhepXjG6R1/kKB2kvFemJEeFd8InNEFDD9IpD9Yq4OYtwd7AAZqVVG
 NgR8R9utEOyZhwfsBSr/I5d38YFyyo08XOKYkoUoMwQTOa/P1l3XnetU6BT5ZUPfAJ
 gjVXKBA3DNm/o4zjSSTNIhztRgDlPOL5az+N9FFySldwmyCfhkNlt5q+G4CLZUkNL4
 kNG0XAN4/AZCw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 51/66] ASoC: SOF: debug: clarify operator
 precedence
Date: Wed, 30 Mar 2022 07:46:30 -0400
Message-Id: <20220330114646.1669334-51-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>, tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 9188812539d1d9a13dac690c95ec657259859ba4 ]

cppcheck warning:

for '&' and '?'. [clarifyCalculation]
 char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
                                             ^

sound/soc/sof/debug.c:398:46: style: Clarify calculation precedence
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220304205733.62233-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 6d6757075f7c..e755c0c5f86c 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -960,7 +960,7 @@ static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev, const char *lev
 
 void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, const char *msg, u32 flags)
 {
-	char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
+	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	bool print_all = sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS);
 
 	if (flags & SOF_DBG_DUMP_OPTIONAL && !print_all)
-- 
2.34.1

