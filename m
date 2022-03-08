Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4E4D0DC8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 03:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8E31774;
	Tue,  8 Mar 2022 03:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8E31774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646704989;
	bh=qLavn0mAozPLMFQGxm3aE+Q2bbx6PNXSYdslMjXNY5M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m5r2gjqaIRxYaT/7qPuKqST2+jUKNevFuRLeWmMOL8RSmW3Lnk77cEO+voWQ89ByF
	 fKUWtueXRK3Dt7rFcRPS5t6gfrvMJK/OyxyxYFVRr7fdFytTm3gAYsao8YwrlrGsgl
	 mNdzFxWodOnqOJ6MXMKnBCXN74ZoXI5iMWEu2tOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0772F80159;
	Tue,  8 Mar 2022 03:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB4B7F8013F; Tue,  8 Mar 2022 03:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF34F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 03:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF34F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WPJQz9gU"
Received: by mail-pg1-x529.google.com with SMTP id 27so15102542pgk.10
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 18:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=/vVnL9eYRSzGukw8SFc4KUz6RxUiiMNRCtt3A6IgWHI=;
 b=WPJQz9gUASBXedyL88smBZOyRA9JuY+a6vfbE+eUe337T1Tdam2Tf3OdpOD35A7R70
 n4AZomhDj5LMij9G0rEak9DF6iZxzULyMTsFYg491ifyShip8mRnyv9lhVKxiuoAE3+w
 B1ahPQ2lO+Jb7T7wpPIbsWkHqTnRpEIcpnkTegl7jdwBLN/EhPOqAajySUM41nn4Eoq5
 3kOr3qn7HUpednBBnSY+H672xEHFyQK4x7Kk205sEjbyxfxQZO4EhM7QlIIFBXE6gVmK
 T1rRrXRKxl9glJm7PIf4pkFV+AK/lQ7JP+fTPNh87KLBSdJmKwu7tQ+tn5Sh4mnUfwlF
 LkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=/vVnL9eYRSzGukw8SFc4KUz6RxUiiMNRCtt3A6IgWHI=;
 b=JwLhg/LXW1C5WJFhhJhepMrNNi+F7ODUX7x5wV+SXbgKE17jPzLVgTDzPAoZ2jWcPl
 Q3UuFCdZKnIbuRZ+ygKtIXOGo8eQPoK1SGTJyJNzk5yvvMcnt2M04vM9VLM81xp9fbSx
 qJM1O7Sb98JLUEfLTpEi1yRL60OUt+Raw9CHmzweNdtgPjFmPDwV7nBG8irpS1Uf5HTu
 N4cmYOb1KxNuDIIABgi0IvpGcpoHULMcQ4G8QWhOVTdKpz4Xkd8AnlyvoUMbwmedre28
 lTpM1KhgG6aN/q5kMRoXWm5Rvq6lHIBfF50FnlOY67RUqwNMjVFt10BJEXrQc0OMR85Q
 uM4g==
X-Gm-Message-State: AOAM533j7jLKggMFyE1uvLsNova19HCkbJ6oEaGKwfqx36QoWO2PMnNN
 3kgtU31XwDlbmtdfJB9KZx0=
X-Google-Smtp-Source: ABdhPJxCExbpTHk8a9vWWJJ96DNwpeeHzcqKYTbVm6C0ubr8FBGHGZ33z0smAzSg2JP/ol4UAJAeEQ==
X-Received: by 2002:a63:84c1:0:b0:380:64fd:a2d4 with SMTP id
 k184-20020a6384c1000000b0038064fda2d4mr4690598pgd.51.1646704912369; 
 Mon, 07 Mar 2022 18:01:52 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 pc17-20020a17090b3b9100b001bf88fe5edcsm393672pjb.9.2022.03.07.18.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 18:01:52 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
Date: Tue,  8 Mar 2022 02:01:44 +0000
Message-Id: <20220308020146.26496-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
For example, when codec_np is NULL, saif_np[0] and saif_np[1]
are not NULL, it will cause leaks.

of_node_put() will check if the node pointer is NULL, so we can
call it directly to release the refcount of regular pointers.

Fixes: e968194b45c4 ("ASoC: mxs: add device tree support for mxs-sgtl5000")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 2412dc7e65d4..746f40938675 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -118,6 +118,9 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 	codec_np = of_parse_phandle(np, "audio-codec", 0);
 	if (!saif_np[0] || !saif_np[1] || !codec_np) {
 		dev_err(&pdev->dev, "phandle missing or invalid\n");
+		of_node_put(codec_np);
+		of_node_put(saif_np[0]);
+		of_node_put(saif_np[1]);
 		return -EINVAL;
 	}
 
-- 
2.17.1

