Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81D3C2D91
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C9416A0;
	Sat, 10 Jul 2021 04:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C9416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625883785;
	bh=aJBw8jjhhKbGjyfQ6T+7BADt3YEy5QEkCX5zyzSSdmI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYVkPbbv4+wcJ7/5j6nadMGGI3LvIvvKlrnH0nsx2s6bz3Xs1vH4dL43jjN0bUvvN
	 RkOM/Nayd3MlPjb14Z+MjiIP7Q4Q9SFYeRyBri1RiR9VuTGlBTmzDlbTNtlCJYPhfJ
	 WkNyiu1axjghyTfhp6hVsAyEWzedpIZBHQOKu9MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61619F80526;
	Sat, 10 Jul 2021 04:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DEE6F80508; Sat, 10 Jul 2021 04:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD275F804F3;
 Sat, 10 Jul 2021 04:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD275F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VbeSHMbF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A140613D9;
 Sat, 10 Jul 2021 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883504;
 bh=aJBw8jjhhKbGjyfQ6T+7BADt3YEy5QEkCX5zyzSSdmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VbeSHMbFKwG9vTmpoeMYWRwnqILqLhs6JJWbV2cyOLZsj5z5c+rv2W/R2YoQVwFpw
 Y0xshWvAS+Yx9UUE8XCnV2qAuz5GRsz56N/GLbzgv/MFFTxEJEQlRXGSnTHzAeNY+6
 Mxf/r3/Da9bX3RmwJQqLpwDQt0MW6rX2Hap2A0wfJr0L/CdKl4Kn9UqEEA/L0UUPgO
 xsNmOxvvQRXUhFTR31igKbA0VvFljGkZBs4tWlTqC9xQNraAIFLIcJDQaj3mE4QQBv
 R7OoG8ALjMVqv7mI2cxucfgAOX+seGCdKBwAXlXqqsznCL6NAkMQetEGtM27H7haOR
 MNERr++s/xFXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 025/114] ASoC: SOF: topology: fix assignment to
 use le32_to_cpu
Date: Fri,  9 Jul 2021 22:16:19 -0400
Message-Id: <20210710021748.3167666-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710021748.3167666-1-sashal@kernel.org>
References: <20210710021748.3167666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

[ Upstream commit ccaea61a8d1b8180cc3c470e383381884e4bc1f2 ]

Fix sparse warning by using le32_to_cpu.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20210521092804.3721324-6-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 59abcfc9bd55..cb16b2bd8c21 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3335,7 +3335,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	/* Copy common data to all config ipc structs */
 	for (i = 0; i < num_conf; i++) {
 		config[i].hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-		config[i].format = hw_config[i].fmt;
+		config[i].format = le32_to_cpu(hw_config[i].fmt);
 		config[i].type = common_config.type;
 		config[i].dai_index = common_config.dai_index;
 	}
-- 
2.30.2

