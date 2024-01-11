Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09282AC95
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 11:55:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C808EEC7;
	Thu, 11 Jan 2024 11:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C808EEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704970523;
	bh=fshr/55h3wT+fevwdGwbnLEUOYH9vCJUJk2ISAPoJYk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I95rrq/5l+0EfMX3MH38w6WuPGSnIdcz3W9HOdEFQVGUrMUgge61WyI9dHqXI8DmZ
	 XmV4fSPKvVeAdDXI5mrgME3IW++xIEeU1adBygLC/ZDC3YsAtG7CoH01CWDEWyj7pM
	 RG5HGBamKjCdojgtqDBe6IG8E18IQvYHI+5gR/h4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5438DF802DB; Thu, 11 Jan 2024 11:54:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B33F80568;
	Thu, 11 Jan 2024 11:54:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B08F804E7; Thu, 11 Jan 2024 11:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB22AF80086
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 11:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB22AF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Xhe1Vp8n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970370;
	bh=fshr/55h3wT+fevwdGwbnLEUOYH9vCJUJk2ISAPoJYk=;
	h=From:To:Cc:Subject:Date:From;
	b=Xhe1Vp8nV66TBCawvwAjnPaTLzQaQRdebTDUFoyaDaEdR+w7Q6enrQzLbXkJOxWa7
	 1VIqSTYMwjMLwjDtvnYwVkcUwI1l6LTGmCn5Iuy+3shh+mnUV05U1fiImxbTAoJ7px
	 GuuQKFn9e37GJeFxCTusXKaQ8Cw1uOqaDBBBFKtPcKvUqwRqF144BMDZToKUGwTGX3
	 dX9k4KqF+nAWHyqDnDqvpcMYpPBL5SH/3Osznm5XiaC8H929IbbCrlO5UzgpySdOST
	 F57IRWOqWplN9TmWYzEBEHQ5X/y1XBjepO72lrlQwqdPBrjvu8C/JEKP3YK6TGicUS
	 I3XClm5Z+cASA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CDD2237811D1;
	Thu, 11 Jan 2024 10:52:49 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Date: Thu, 11 Jan 2024 11:52:40 +0100
Message-ID: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75O2LZAOZ6YI6DWNWSBNVUAOBJZTYMMD
X-Message-ID-Hash: 75O2LZAOZ6YI6DWNWSBNVUAOBJZTYMMD
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75O2LZAOZ6YI6DWNWSBNVUAOBJZTYMMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series converts MediaTek AFE drivers' probe functions to use
dev_err_probe() and devm functions where possible and, in some
cases, dropping the .remove_new() callback, reducing the size.

Cheers!

AngeloGioacchino Del Regno (7):
  ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
  ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
  ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback

 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  78 +++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 108 +++++++--------------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c |  95 ++++++------------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  12 +--
 4 files changed, 81 insertions(+), 212 deletions(-)

-- 
2.43.0

