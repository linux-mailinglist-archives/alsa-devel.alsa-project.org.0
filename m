Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BB5A0941
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 08:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55E93E7;
	Thu, 25 Aug 2022 08:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55E93E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661410607;
	bh=I3MTsOB6bv8lcMAj5QCq2yZIhcAEv6WHoola8TDSlVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAYL4uKh/GPAPPmqd+c8DwCXXMuiG4wNbKrHN22x5kUoKvxKVbfWKNjIrqKcPzveY
	 086U1Ntk0We79DJlbk3kEMAeJVsrt1mFPNZKF2E5sVj5AiNJBpes178OndqCenUvZv
	 G0XUjPsxE5iAD8Q+RxJRSPgMvSPc3ejYMLo5W0DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C07F6F80525;
	Thu, 25 Aug 2022 08:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E0BDF80271; Thu, 25 Aug 2022 08:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RDNS_NONE, SPF_HELO_PASS, T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY, 
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15211F8025A;
 Thu, 25 Aug 2022 08:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15211F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="DOfPntG3"
X-UUID: 94eeb80e530d4753a8da8a9133527c77-20220825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=17T7Qxb+RxI3NX/mJZ1MvpMS+8t400/CHd2ZJKiJiNs=; 
 b=DOfPntG30eAA/8FYJ391YI58whtiGmS3FosNecGtBuajj/aUSiylaMFQWzCpPTnc1BJ3uLCxK0HLIGTuFC0UX3mwPrxWnfxj0mNEPUhl8NtzCEZkYaoHYyxWpXROWknViP6XoHRO/7m4JF6YyfNkBe7YjJ3RuU0P2DwmK9NFPH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:5bc69799-8664-4ff8-b394-7ec1ce668acd, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:95ac90cf-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 94eeb80e530d4753a8da8a9133527c77-20220825
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1936474604; Thu, 25 Aug 2022 14:54:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 25 Aug 2022 14:54:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 25 Aug 2022 14:54:16 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 2/3] ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for
 pcm and mail box
Date: Thu, 25 Aug 2022 14:54:10 +0800
Message-ID: <20220825065411.31279-3-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825065411.31279-1-chunxu.li@mediatek.com>
References: <20220825065411.31279-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

Use generic IPC stream and mailbox ops for mt8186

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index b47bb7a6ba70..5fc206bb0da0 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -512,6 +512,10 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* Register IO */
 	.write		= sof_io_write,
 	.read		= sof_io_read,
@@ -528,6 +532,10 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* misc */
 	.get_bar_index	= mt8186_get_bar_index,
 
+	/* stream callbacks */
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
+
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
-- 
2.25.1

