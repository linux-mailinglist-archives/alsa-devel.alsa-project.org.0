Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB7527F2C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3CB1697;
	Mon, 16 May 2022 10:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3CB1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688386;
	bh=UhS6i4NR8iJUf0+Q/IfAA/Fc1TFQYqze4E7ErogU0Nk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJHdUKNK5bgxZ0tQZ0qETOYfZubU9nN7en/J/1bSlc70o0NpQxGFXESWSVIB7cMW9
	 N2K75p07UUFGrhbsIKJJPWnQ6eqgVBHMl+lt6PVM4RPxdzL37asy+PktAkmZccAzGi
	 DbEXKOTY9rN7M2da5chgEOXt/5zdI7pVBR7dzu9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11DD2F80528;
	Mon, 16 May 2022 10:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C990F80154; Thu, 12 May 2022 10:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E46F80249;
 Thu, 12 May 2022 10:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E46F80249
X-UUID: 05a6f9a177bb4b37b259a80c9e005340-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:64a0a43e-8611-4b57-a651-1cfae418596d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:4f200aa7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 05a6f9a177bb4b37b259a80c9e005340-20220512
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 121512871; Thu, 12 May 2022 16:22:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 16:22:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 12 May 2022 16:22:27 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Javier Martinez Canillas <javierm@redhat.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Michal Suchanek <msuchanek@suse.de>, Shuai Xue
 <xueshuai@linux.alibaba.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Marussi <cristian.marussi@arm.com>, TingHan Shen
 <tinghan.shen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz
 <john.stultz@linaro.org>, Curtis Malainey <cujomalainey@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH v9 3/3] ASoC: SOF: mediatek: Add mt8186 ipc support
Date: Thu, 12 May 2022 16:22:15 +0800
Message-ID: <20220512082215.3018-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512082215.3018-1-tinghan.shen@mediatek.com>
References: <20220512082215.3018-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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

mt8186 DSP uses two hardware mailbox IP to communicate with AP.
One mailbox is used for requests coming from AP, and the other
one is for requests from DSP.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/Kconfig                |   1 +
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |   5 +
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 141 ++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/sound/soc/sof/mediatek/Kconfig b/sound/soc/sof/mediatek/Kconfig
index f1fa15c41891..a149dd1b3f44 100644
--- a/sound/soc/sof/mediatek/Kconfig
+++ b/sound/soc/sof/mediatek/Kconfig
@@ -24,6 +24,7 @@ config SND_SOC_SOF_MTK_COMMON
 config SND_SOC_SOF_MT8186
 	tristate "SOF support for MT8186 audio DSP"
 	select SND_SOC_SOF_MTK_COMMON
+	depends on MTK_ADSP_IPC
 	help
 	  This adds support for Sound Open Firmware for Mediatek platforms
 	  using the mt8186 processors.
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
index 548b12c33d8a..946e6c43204f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -17,6 +17,11 @@ void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
 				RUNSTALL, RUNSTALL);
 
+	/* enable mbox 0 & 1 IRQ */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_MBOX_IRQ_EN,
+				DSP_MBOX0_IRQ_EN | DSP_MBOX1_IRQ_EN,
+				DSP_MBOX0_IRQ_EN | DSP_MBOX1_IRQ_EN);
+
 	/* set core boot address */
 	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVEC_C0, boot_addr);
 	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVECSEL, ADSP_ALTVECSEL_C0);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 6d574fd4492e..3333a0634e29 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -27,6 +27,99 @@
 #include "mt8186.h"
 #include "mt8186-clk.h"
 
+static int mt8186_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int mt8186_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
+static int mt8186_send_msg(struct snd_sof_dev *sdev,
+			   struct snd_sof_ipc_msg *msg)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+
+	return mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_REQ, MTK_ADSP_IPC_OP_REQ);
+}
+
+static void mt8186_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
+		return;
+	}
+
+	/* get reply */
+	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply has correct size? */
+		if (reply.hdr.size != msg->reply_size) {
+			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
+				msg->reply_size, reply.hdr.size);
+			ret = -EINVAL;
+		}
+
+		/* read the message */
+		if (msg->reply_size > 0)
+			sof_mailbox_read(sdev, sdev->host_box.offset,
+					 msg->reply_data, msg->reply_size);
+	}
+
+	msg->reply_error = ret;
+}
+
+static void mt8186_dsp_handle_reply(struct mtk_adsp_ipc *ipc)
+{
+	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
+	mt8186_get_reply(priv->sdev);
+	snd_sof_ipc_reply(priv->sdev, 0);
+	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
+}
+
+static void mt8186_dsp_handle_request(struct mtk_adsp_ipc *ipc)
+{
+	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
+	u32 p; /* panic code */
+	int ret;
+
+	/* Read the message from the debug box. */
+	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4,
+			 &p, sizeof(p));
+
+	/* Check to see if the message is a panic code 0x0dead*** */
+	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+		snd_sof_dsp_panic(priv->sdev, p, true);
+	} else {
+		snd_sof_ipc_msgs_rx(priv->sdev);
+
+		/* tell DSP cmd is done */
+		ret = mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_RSP, MTK_ADSP_IPC_OP_RSP);
+		if (ret)
+			dev_err(priv->dev, "request send ipc failed");
+	}
+}
+
+static struct mtk_adsp_ipc_ops dsp_ops = {
+	.handle_reply		= mt8186_dsp_handle_reply,
+	.handle_request		= mt8186_dsp_handle_request,
+};
+
 static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
 	struct resource *mmio;
@@ -271,6 +364,9 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
 
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = mt8186_get_mailbox_offset(sdev);
+
 	ret = adsp_memory_remap_init(sdev, priv->adsp);
 	if (ret) {
 		dev_err(sdev->dev, "adsp_memory_remap_init fail!\n");
@@ -292,11 +388,41 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 	adsp_sram_power_on(sdev);
 
+	priv->ipc_dev = platform_device_register_data(&pdev->dev, "mtk-adsp-ipc",
+						      PLATFORM_DEVID_NONE,
+						      pdev, sizeof(*pdev));
+	if (IS_ERR(priv->ipc_dev)) {
+		ret = IS_ERR(priv->ipc_dev);
+		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
+		goto err_adsp_off;
+	}
+
+	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
+	if (!priv->dsp_ipc) {
+		ret = -EPROBE_DEFER;
+		dev_err(sdev->dev, "failed to get drvdata\n");
+		goto exit_pdev_unregister;
+	}
+
+	mtk_adsp_ipc_set_data(priv->dsp_ipc, priv);
+	priv->dsp_ipc->ops = &dsp_ops;
+
 	return 0;
+
+exit_pdev_unregister:
+	platform_device_unregister(priv->ipc_dev);
+err_adsp_off:
+	adsp_sram_power_off(sdev);
+	mt8186_adsp_clock_off(sdev);
+
+	return ret;
 }
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	platform_device_unregister(priv->ipc_dev);
 	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
 	mt8186_adsp_clock_off(sdev);
@@ -334,6 +460,14 @@ static int mt8186_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
+static int mt8186_ipc_msg_data(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       void *p, size_t sz)
+{
+	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	return 0;
+}
+
 /* mt8186 ops */
 static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
@@ -353,6 +487,13 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.write64	= sof_io_write64,
 	.read64		= sof_io_read64,
 
+	/* ipc */
+	.send_msg		= mt8186_send_msg,
+	.get_mailbox_offset	= mt8186_get_mailbox_offset,
+	.get_window_offset	= mt8186_get_window_offset,
+	.ipc_msg_data		= mt8186_ipc_msg_data,
+	.set_stream_data_offset = sof_set_stream_data_offset,
+
 	/* misc */
 	.get_bar_index	= mt8186_get_bar_index,
 
-- 
2.18.0

