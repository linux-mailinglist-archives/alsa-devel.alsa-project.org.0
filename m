Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E426D4C18
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658537F4;
	Mon,  3 Apr 2023 17:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658537F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536370;
	bh=EgJ0lJLYYg38rEZlojze62aOyU1WkYNhgyR7p/kPTfs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ijHYSuW2vvy2LnIJ3iRUpky87hebd/dKq4Vxe1Ojk7LnhqXxOmI2/4IlvDso1XMlf
	 gF/JumJOuJyoLYwiq4p7AxE85HCYPJHzrmzy/7DNxkxCCMDdVOC+H3Ehr5I75O6Ill
	 2899y437Z8mvwoURVAlW0SYHhHFdR3g9Bu++Mfas=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D4ECF80548;
	Mon,  3 Apr 2023 17:37:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6251FF8024C; Mon,  3 Apr 2023 17:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CC77F8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC77F8015B
Received: from LAPTOP-6NFQSDTK.localdomain ([10.12.182.145])
	(user=yll@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 333FS2bR027146-333FS2bS027146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Apr 2023 23:28:08 +0800
From: Liliang Ye <yll@hust.edu.cn>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: fsl_mqs: call pm_runtime_disable() on error path
Date: Mon,  3 Apr 2023 23:27:37 +0800
Message-Id: <20230403152737.17671-1-yll@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: yll@hust.edu.cn
X-MailFrom: yll@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T4P4PUWLDPNLXOLW6BVEOPROWQNTHMQ2
X-Message-ID-Hash: T4P4PUWLDPNLXOLW6BVEOPROWQNTHMQ2
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:51 +0000
CC: hust-os-kernel-patches@googlegroups.com, Liliang Ye <yll@hust.edu.cn>,
 Dan Carpenter <error27@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4P4PUWLDPNLXOLW6BVEOPROWQNTHMQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

pm_runtime_disable was missed in cleanup operation, which corresponds to
the earlier call to pm_runtime_enable.

To fix this, add pm_runtime_disable() on error path.

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Liliang Ye <yll@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/fsl/fsl_mqs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 32d20d351bbf..129d426c60c4 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -251,9 +251,13 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
 			&fsl_mqs_dai, 1);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int fsl_mqs_remove(struct platform_device *pdev)
-- 
2.34.1

