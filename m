Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC26F5739
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EBA9136D;
	Wed,  3 May 2023 13:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EBA9136D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113777;
	bh=mpRZdqOvXIl5vS9j+X/rU8HMgH7/EmMZbnUr1Lx++Kw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=mHWZFAPnmvgdsh1032JJ7zgfQx9BLjir7iMk8vRBmrkia9q775LNK7dkUjKOfeREa
	 DUrUcPL9EvvIRQYDS15scCJV8MWwGAMKU4achzAXDKTzmTPjzlqGsiJTJkbs5HKtJP
	 1XVXEe+79g8SE76KhBIkX3Nbc6wyvNAIKsCHYqlU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CF9CF80533;
	Wed,  3 May 2023 13:34:40 +0200 (CEST)
To: lgirdwood@gmail.com
Subject: [PATCH 2/5] ASoC: SOF: mediatek: mt8186: Use
 snd_sof_ipc_process_reply() helper
Date: Wed,  3 May 2023 13:34:10 +0200
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOIHR2GIQ6KAC3QQLQBSUK2OBW5PSIIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168311367708.26.16358823200772921389@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 733DFF80520; Wed,  3 May 2023 13:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C67E3F80137;
	Wed,  3 May 2023 13:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C67E3F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=LJB0T/0i
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 797F266056CE;
	Wed,  3 May 2023 12:34:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113663;
	bh=L39f0aIGeOnQPRMtTubkebioIWUYydMxDfJeYgCV4k0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJB0T/0iHKJUrGdMcxKrOMKcwBeIRmFsrMfUR+fGgA+VlJT4FAhaa8QDVQSsfZzH1
	 HmD6uIVi4pUAE9Crl0yTwgVPK7eFAqnf4f4RZcZ9tGQp6Ol3CprXYGZxOjSydK1amL
	 unew7PpOHyq082BVucjyF89Ukx5JEiCDyQelNqF9GHhrLO/CXbbNOm28rWQvC924JM
	 VvBBK2VAXHlek50LaoirqagFS+McddJfCHVgZH1/NBGiF979ZdIQv3rxRNfsjWAcl1
	 46/w1s0Kx7odsvmZr8dlWqdCrBQHNnhOL8k0DhoWryOIRoH4kQHk4Ct4GZAZrH4iip
	 pKOjoz3LpptjA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Subject: [PATCH 2/5] ASoC: SOF: mediatek: mt8186: Use
 snd_sof_ipc_process_reply() helper
Date: Wed,  3 May 2023 13:34:10 +0200
Message-Id: <20230503113413.149235-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOIHR2GIQ6KAC3QQLQBSUK2OBW5PSIIF
X-Message-ID-Hash: MOIHR2GIQ6KAC3QQLQBSUK2OBW5PSIIF
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOIHR2GIQ6KAC3QQLQBSUK2OBW5PSIIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Function mt8186_get_reply() performs practically the same operation
as the common snd_sof_ipc_get_reply() helper: removing the custom
function allows us to simply perform a call to the sof-priv helper
snd_sof_ipc_process_reply(), simplifying and shortening this driver
and getting all the benefits of using a common API.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 36 +-------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 597cb4476acb..419913c8474d 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -48,47 +48,13 @@ static int mt8186_send_msg(struct snd_sof_dev *sdev,
 	return mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_REQ, MTK_ADSP_IPC_OP_REQ);
 }
 
-static void mt8186_get_reply(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply reply;
-	int ret = 0;
-
-	if (!msg) {
-		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
-		return;
-	}
-
-	/* get reply */
-	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
-	} else {
-		/* reply has correct size? */
-		if (reply.hdr.size != msg->reply_size) {
-			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
-				msg->reply_size, reply.hdr.size);
-			ret = -EINVAL;
-		}
-
-		/* read the message */
-		if (msg->reply_size > 0)
-			sof_mailbox_read(sdev, sdev->host_box.offset,
-					 msg->reply_data, msg->reply_size);
-	}
-
-	msg->reply_error = ret;
-}
-
 static void mt8186_dsp_handle_reply(struct mtk_adsp_ipc *ipc)
 {
 	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-	mt8186_get_reply(priv->sdev);
-	snd_sof_ipc_reply(priv->sdev, 0);
+	snd_sof_ipc_process_reply(priv->sdev, 0);
 	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
 }
 
-- 
2.40.1

