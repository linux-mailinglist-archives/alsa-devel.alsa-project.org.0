Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18AC5AE442
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565D6851;
	Tue,  6 Sep 2022 11:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565D6851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456614;
	bh=yV6nCsjeOdwaKJwa/v3ztHbWo4/fPObpHuPkgeFvzgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlwB8nprxMUUd7ZTBU5jQCznTQpplazuTAIYtCVHJlDN2M5P231ka2YH2wO9pecv/
	 xvQh1HfS8ytZGoSqn6QMX6yTOsyBTyTTb5pn5ioHVojHAKdH5VeG8m58hFEcmILzES
	 aWzZMgfGru2pgitdRbLuU9NL6/KwjMG/qJi+K5d8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37B35F80571;
	Tue,  6 Sep 2022 11:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 300C8F8055A; Tue,  6 Sep 2022 11:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C801F8024C;
 Tue,  6 Sep 2022 11:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C801F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="kCCCdAdP"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 821FE660038D;
 Tue,  6 Sep 2022 10:27:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662456460;
 bh=yV6nCsjeOdwaKJwa/v3ztHbWo4/fPObpHuPkgeFvzgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kCCCdAdPwuWWeMFa2+5PwAQeF3I4MKfZVzXHZNN8nHmFiSVVBsmDlgUxsLjsyP9xR
 IG7ng+Ts5OLLA0ENa5tu0bVSpEDNDDO+9dYz6DJGGuQvT3ETw3fg5Ex9W+VROmO1wC
 Jvgq8XmCrR4QLTvQLvGbaGoG4f3hZiBpJB0fAJoM/sNqiN+0ygNgmwexBb0oy+SUWj
 7idoqXQjmJ1znaMpkR+dak5n9t2yN2r1o/7PTgUmR1UwvD4yzSSGWEgoEPjIqLPgiB
 gVKCwTylk+bgKHgvg0MabafFdICAlHcMgT9VXmoGU7SHBVrcyoymzJBiVG1ksEeaRv
 ij7DtFUjRljcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH 3/5] ASoC: SOF: mediatek: mt8195: Add mailbox generic
 callbacks for IPC
Date: Tue,  6 Sep 2022 11:27:25 +0200
Message-Id: <20220906092727.37324-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 Allen-KH.Cheng@mediatek.com, lgirdwood@gmail.com, kernel@collabora.com,
 yung-chuan.liao@linux.intel.com, sound-open-firmware@alsa-project.org,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, tzungbi@google.com, geert@linux-m68k.org,
 ranjani.sridharan@linux.intel.com, wenst@chromium.org, trevor.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com
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

Add the .mailbox_{read,write} generic callbacks for SOF IPC and, while
at it, also change the ipc_msg_data callback to use the SOF API
sof_ipc_msg_data() instead of the custom function mt8195_ipc_msg_data().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index ff575de7e46a..68747ee21c6f 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -496,14 +496,6 @@ static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
-static int mt8195_ipc_msg_data(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
-			       void *p, size_t sz)
-{
-	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
-	return 0;
-}
-
 static void mt8195_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	u32 dbg_pc, dbg_data, dbg_bus0, dbg_bus1, dbg_inst;
@@ -574,6 +566,10 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* Register IO */
 	.write		= sof_io_write,
 	.read		= sof_io_read,
@@ -584,7 +580,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.send_msg		= mt8195_send_msg,
 	.get_mailbox_offset	= mt8195_get_mailbox_offset,
 	.get_window_offset	= mt8195_get_window_offset,
-	.ipc_msg_data		= mt8195_ipc_msg_data,
+	.ipc_msg_data		= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* misc */
-- 
2.37.2

