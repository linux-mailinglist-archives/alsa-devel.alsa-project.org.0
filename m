Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A56F5737
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF03135A;
	Wed,  3 May 2023 13:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF03135A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113726;
	bh=rT/nsxvOor/BBZeSGfaG63upIXX5Cpp2xIf+ZzMPC9o=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=sAnHFoJn6B/TQb09G7p5490hZZOOYDZubTaHJ9oBfTmO1iELMlsSFLI6e6m6kJryq
	 c704NAfhQXlhCUcCQkMn+kFyMue1Qe0Vnl+8EwlvNaO1pNO/y6/PU2HGRWQ4NpqWsT
	 HNoi38LQcT3bmCTZzzIwLlYM/poKQNek/J4UjhAg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E274BF804FE;
	Wed,  3 May 2023 13:34:35 +0200 (CEST)
To: lgirdwood@gmail.com
Subject: [PATCH 0/5] ASoC: MediaTek MT8195/86 Cleanups
Date: Wed,  3 May 2023 13:34:08 +0200
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQNZGLVNHVPBJ5VNPVOWNYIO5JQG2CUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168311367500.26.5035588666989030191@mailman-core.alsa-project.org>
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
	id 41CD8F80520; Wed,  3 May 2023 13:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93947F800EC;
	Wed,  3 May 2023 13:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93947F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=FO9btotf
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2135C660309E;
	Wed,  3 May 2023 12:34:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113660;
	bh=D4GxHwRdyAouEXBmGeD9y+SB4oSmGvmMfyzdYBUTGVw=;
	h=From:To:Cc:Subject:Date:From;
	b=FO9btotfEblnP/1DE5WqXhomqoU+yNbZ7N8+Nsy8eenwAs4MZzxIWUrXh0Y3w2RPu
	 Vm0llArH4IEy3kOoR5TnPuBeZ2tbWl0qgeN8V2lNfK+Wl4DfkGmR17HAsTYGcrOfzQ
	 8ALiaC5v8FzihTBzNFFK4YvsMoOf78DVujTY/nVRnxwprAUzlRA4nm+uuq2DMPttFu
	 KPsHdcA0fWQkHdMWRFoxlI7eOdz5a0Vcv6cSBRO7oki1cZSscyoo2hDR78s8Pr2BPZ
	 NKs72uI/0J2qEDl22rB4o39wM1rGZxWbj5Xq/fBRCVDOLLw74yO647543yvwaaEpNv
	 KPPMyudnJeUMg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Subject: [PATCH 0/5] ASoC: MediaTek MT8195/86 Cleanups
Date: Wed,  3 May 2023 13:34:08 +0200
Message-Id: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SQNZGLVNHVPBJ5VNPVOWNYIO5JQG2CUC
X-Message-ID-Hash: SQNZGLVNHVPBJ5VNPVOWNYIO5JQG2CUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQNZGLVNHVPBJ5VNPVOWNYIO5JQG2CUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series performs some cleanups for mainly MT8195 and switches
both MT8195 and MT8186's SOF driver to the snd_sof_ipc_process_reply()
helper.

AngeloGioacchino Del Regno (5):
  ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
  ASoC: SOF: mediatek: mt8186: Use snd_sof_ipc_process_reply() helper
  ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
  ASoC: mediatek: mt8195-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 99 ++++++++--------------
 sound/soc/sof/mediatek/mt8186/mt8186.c     | 36 +-------
 sound/soc/sof/mediatek/mt8195/mt8195.c     | 36 +-------
 3 files changed, 36 insertions(+), 135 deletions(-)

-- 
2.40.1

