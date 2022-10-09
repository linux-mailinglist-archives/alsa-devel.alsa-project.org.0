Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2005F946C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9280716C8;
	Mon, 10 Oct 2022 01:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9280716C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359777;
	bh=J135anatUTW3EbLfshYvQtJh1Vx3yzaqMkJvXQNgapA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTa1+iYtqrHyCF32/hpSdLcckbYpzBPPqSV334cjzLcxVkJyAIfQH3nk3Doq2fe5R
	 7sfAuLoMjI+NDP3yOHupWtHRT7nA0ZfT8w3SEeRyFysa5E8dCc9iClh/72eMAEVmz0
	 qGTB8xZamHfPY9dbUBMreMr9dxzj9VP4zhIf91Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DAAF8054A;
	Mon, 10 Oct 2022 01:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 288A2F8053B; Mon, 10 Oct 2022 01:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78964F804FA;
 Mon, 10 Oct 2022 01:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78964F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dk6KfsCE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFA54B80DDF;
 Sun,  9 Oct 2022 23:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA57C43141;
 Sun,  9 Oct 2022 23:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359708;
 bh=J135anatUTW3EbLfshYvQtJh1Vx3yzaqMkJvXQNgapA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dk6KfsCElnxTnQefItEa3pM5bGrMRv5WSueOtq/gu+cVkyxdKTrZsrtYP2OLOZOsI
 aWYfDQdXAJGEXIXSlBkvhsYmMbNssz71STB73KXnIXFdARnCmXbX+go5g6ugyE/LTj
 rBWX0/R+ieqBzR/bWgb2AxbIPWFmSyF/DN/ArqndeQ1UrKFTLE38u3kjcvntpSf/ey
 +/WcKxB0pvGJJS1h07qkMzMQwTIVIoUZG9B2tnUaZQcKH07bINHPZ+bokyPYkwhCLM
 xo2xkrwU9OdO3JXvyR7gqqXA6FGj5SNTvJH3FlfffFEUW7dSCvocegdI84xheZgUH7
 La854GYbNmpNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/25] ASoC: SOF: pci: Change DMI match info to
 support all Chrome platforms
Date: Sun,  9 Oct 2022 19:54:17 -0400
Message-Id: <20221009235426.1231313-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Jairaj Arava <jairaj.arava@intel.com>, lgirdwood@gmail.com,
 Curtis Malainey <curtis@malainey.com>, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 daniel.baluta@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Chao Song <chao.song@intel.com>, Curtis Malainey <cujomalainey@chromium.org>,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org
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

From: Jairaj Arava <jairaj.arava@intel.com>

[ Upstream commit c1c1fc8103f794a10c5c15e3c17879caf4f42c8f ]

In some Chrome platforms if OEM's use their own string as SYS_VENDOR than
"Google", it leads to firmware load failure from intel/sof/community path.

Hence, changing SYS_VENDOR to PRODUCT_FAMILY in which "Google" is used
as common prefix and is supported in all Chrome platforms.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220919114429.42700-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b773289c928d..3b4c011e0283 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -80,7 +80,7 @@ static const struct dmi_system_id community_key_platforms[] = {
 	{
 		.ident = "Google Chromebooks",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),
 		}
 	},
 	{},
-- 
2.35.1

