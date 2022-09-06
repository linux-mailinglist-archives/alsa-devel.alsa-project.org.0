Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D425AE427
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908C315C3;
	Tue,  6 Sep 2022 11:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908C315C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456522;
	bh=JpEcgC6jYLZbY4tQDi6ZRqCoL5pekVUoZKTqmNe+EIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RaNeExmOyRLYotsKxUoODnOaKYBqgCagviuT0BQgmaE7LQZxcRc1qnZHCYNbLdnAv
	 EdXMFoRbeqljWVW4wXsxnt8AMA5U2DNlqk0uCOAfAUJ4c/wMZ2hpX7wzt7eK9AkOZE
	 suRwJoQXbkTu5WyQt8Q4AmsVU7TqLNpUBPm81gig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08593F804AB;
	Tue,  6 Sep 2022 11:27:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D022AF8011C; Tue,  6 Sep 2022 11:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46EDFF8011C;
 Tue,  6 Sep 2022 11:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46EDFF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="eSkU6oLC"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C837F6600375;
 Tue,  6 Sep 2022 10:27:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662456456;
 bh=JpEcgC6jYLZbY4tQDi6ZRqCoL5pekVUoZKTqmNe+EIo=;
 h=From:To:Cc:Subject:Date:From;
 b=eSkU6oLC56uV4TWJxoKjhECXppBMxt0BdBBkgQ5zPLRbdSSZo3vtrLPa0E+5f4Hed
 h8UMA/dJWZKbG8i1AwbGlDjDaTJc4wXYzjUBr5QCQjWDYkXi5gZZ3kSLlIeTq0TauB
 B+B4jNe1q4H8DCM4nK56nWCmrK2t7g+qNA3hfwzBR756VMBk8dNZKT/xOPX6CMWMmB
 nDf2vPe8G0rJxqEnYdn5zAtY8asnCPFW2ylM/IVp2pf8WveyBYswJ7kstc33M0UY4R
 2+gYIQMZat6aTSqdWCRRz+uppT8w6LRZ+oj82ui2SvXa740I1d0Kod6PSmE9bt6Iri
 pfJlsrGoOASZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH 0/5] ASoC: Fixes for MT8195 SOF support
Date: Tue,  6 Sep 2022 11:27:22 +0200
Message-Id: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
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

This series fixes Sound Open Firmware support for MT8195 by making
sure that the sound card driver is actually able to probe and IPC
can finally happen.
It is now possible to get DSP support for audio.

Tested on MT8195 Tomato - Acer Chromebook Spin 513 CP513-2H (Pipewire).

AngeloGioacchino Del Regno (5):
  ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
  ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
  ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
  ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
  ASoC: SOF: mediatek: mt8195: Add devicetree support to select
    topologies

 sound/soc/mediatek/mt8195/mt8195-mt6359.c |  6 +++++
 sound/soc/sof/mediatek/mt8195/mt8195.c    | 32 ++++++++++++++++-------
 2 files changed, 29 insertions(+), 9 deletions(-)

-- 
2.37.2

