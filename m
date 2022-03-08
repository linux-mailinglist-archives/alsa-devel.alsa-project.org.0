Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE804D0E0F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 03:34:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D407717BF;
	Tue,  8 Mar 2022 03:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D407717BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646706890;
	bh=+KvJAL4OcbkNzOoqiQL9STYHCsHUydNNQ4YMjGQZzWU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=niSFmafpSmwq0k0ZUoqWPpFMSHParMjIN5u4IarZs2VrQw/0IVvvAURH7w+lBJz/o
	 wz4ecVOtBx28VHBsWBQYCH5/65aZUKfo/hEXQ/DyoTjbIN2njSwuH0sSiLgxUnmJ5B
	 EdIM1LR5xSV728CYjHQg0+KNtSVuzW5Lvmv8AD8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 407C8F80159;
	Tue,  8 Mar 2022 03:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A69AF800E9; Tue,  8 Mar 2022 03:33:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68356F800E9;
 Tue,  8 Mar 2022 03:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68356F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WEkcwRIg"
Received: by mail-pg1-x52c.google.com with SMTP id 6so10642087pgg.0;
 Mon, 07 Mar 2022 18:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=JHlL483tOPXXwrShSRIjSrIFbu7utMjXnFg9i5hed/o=;
 b=WEkcwRIgKqaeYDHUvRzHgwypMhdMJA7j9eG+yN5S8IeEe3Lw9dLXp7vuoF4rdLjZYH
 iHOeyF1zmrCYUPpJj8L44HMC/wzABiTl/xT3IfsBJpXbdL9CuNxN5mPNj4pxgcoarq4J
 jFUecfa7EpJ2s+MG6QjLSa/Gv3sg7ZBTEXEUaXitC9oUAoki/eooiwrlAbfHJcQZs71U
 RDBlDmCnyURAPGkT1xAs6St1K/JQyrnubKxoqNMIynU52soHzR/64MOd0zCiKAsZGWh0
 D8ma+B2LDuYNojD+uRIpApmn9HX/BxoZ3X/iW4Rwb3QsX7zSV7fCTiiZkj2AmbZIdK09
 KZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JHlL483tOPXXwrShSRIjSrIFbu7utMjXnFg9i5hed/o=;
 b=mMRICZeVhxlw8qNpHkVMDbbJc7Pk1Cl/Ymdiy7V0jNN5W/GbNRN7/jQBkZ76VRfcpb
 KC7TyRfK+nKJslGUHHX05383LqRB+TkF8+jZuTEORqzMUi6rf6ADxDqVsmTSXd7FMGBe
 Dm3NwbacGE36HnIVxMk9K/L/xamsTqALE/i+1pCkGhQkldRaEo+L8lHpDQM/+RvhhWTj
 3ZvEaNgS+pEanDgYKIo98por4So/MUPxsDVwJd48FU/LfEmcYJ5O2tg0JtBcZp22CRNf
 WMCAAqfJVbO8VhBLmsT7uDpgEe2WlqiL9hlCCE7owVT4hNCW6pWb4oZmEH+MrJe3Hfhu
 3LuQ==
X-Gm-Message-State: AOAM532mz3SHXUatvj98HoWblgljOWDsVNtQyB9qzcpqCd5fDNeBR8zp
 R3jW4TpjkCEL1gZRnVE4/S0=
X-Google-Smtp-Source: ABdhPJxwTjC/2YyrJTs09m/FPQR/5h0YkmUvTnHXVS+nNfwwgujRr2t9vFbiZBCRxEjAV81GX2UXbw==
X-Received: by 2002:a65:4c06:0:b0:373:a7d1:75d5 with SMTP id
 u6-20020a654c06000000b00373a7d175d5mr12060573pgq.502.1646706812977; 
 Mon, 07 Mar 2022 18:33:32 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 p186-20020a62d0c3000000b004f6fa49c4b9sm5895103pfg.218.2022.03.07.18.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 18:33:32 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Viorel Suman <viorel.suman@nxp.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Add missing of_node_put() in imx8m_probe
Date: Tue,  8 Mar 2022 02:33:23 +0000
Message-Id: <20220308023325.31702-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

Fixes: afb93d716533 ("ASoC: SOF: imx: Add i.MX8M HW support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/sof/imx/imx8m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 788e77bcb603..60251486b24b 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -224,6 +224,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	}
 
 	ret = of_address_to_resource(res_node, 0, &res);
+	of_node_put(res_node);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get reserved region address\n");
 		goto exit_pdev_unregister;
-- 
2.17.1

