Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D86D7517
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2847F204;
	Wed,  5 Apr 2023 09:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2847F204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679028;
	bh=Oq9s84jD2Laj3VuxTHu+m2JU5SEkzkZ7QLA+AD230Zg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X4LStOFN3K++AIhJswSrw+VPzXliv+7pwIuFLNmgMfSbG73JbIw1TNhPvxDZ6yq2b
	 H6vwwMRtMq364y1SIOz/ku8svAg5LsHg2A+J+jOJV0yAv130aGWsOPchvFVwnF5G/r
	 ZxwiHmkabfr3Z6+ioHAR4voCovcoHdTFmy+Qs8o0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D804CF80249;
	Wed,  5 Apr 2023 09:16:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6508F8024C; Tue,  4 Apr 2023 10:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDE62F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 10:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE62F80054
Received: from localhost.localdomain ([10.12.176.39])
	(user=u202012060@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3348kqDV032411-3348kqDW032411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Apr 2023 16:46:57 +0800
From: Zihao Wang <u202012060@hust.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: tegra20_ac97: Add missing unwind goto in
 tegra20_ac97_platform_probe()
Date: Tue,  4 Apr 2023 16:46:22 +0800
Message-Id: <20230404084622.1202-1-u202012060@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: u202012060@hust.edu.cn
X-MailFrom: u202012060@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CDEE4MX3VH5KY2GNBVFGNUZA2NQKQ7V5
X-Message-ID-Hash: CDEE4MX3VH5KY2GNBVFGNUZA2NQKQ7V5
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:13:24 +0000
CC: hust-os-kernel-patches@googlegroups.com,
 Zihao Wang <u202012060@hust.edu.cn>, Dan Carpenter <error27@gmail.com>,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDEE4MX3VH5KY2GNBVFGNUZA2NQKQ7V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Smatch Warns:
	sound/soc/tegra/tegra20_ac97.c:321 tegra20_ac97_platform_probe()
	warn: missing unwind goto?

The goto will set the "soc_ac97_ops" and "soc_ac97_bus" operations to
NULL.  But they are already NULL at this point so it is a no-op.
However, just for consistency, change the direct return to a goto.  No
functional change.

Signed-off-by: Zihao Wang <u202012060@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/tegra/tegra20_ac97.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d23d88a10899..d00449441e5e 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -318,7 +318,8 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->reset = devm_reset_control_get_exclusive(&pdev->dev, "ac97");
 	if (IS_ERR(ac97->reset)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 reset\n");
-		return PTR_ERR(ac97->reset);
+		ret = PTR_ERR(ac97->reset);
+		goto err;
 	}
 
 	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
-- 
2.34.1

