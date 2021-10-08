Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450B426738
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 11:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86424166F;
	Fri,  8 Oct 2021 11:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86424166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633686957;
	bh=o2cj5ufJhZE4EVVAppYfMxMbnnIwR4NTkT8/aAhTXcQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KmuRTeHWvEXUiIgwbKI+cBS5CuiZEj1hjOYvLj6UQxuy2kXHlXYQv6msIaXDStz5P
	 YJ8Ro6qSlwYkshDfo0fhNFjSAg7768/yaJHgF+U7ESY5ubDhq7f7eOCe0HkcizVbyR
	 AgxzT5s62HJLbYajndcA1uzm2SdXaCEzqBjLPQls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0891F80229;
	Fri,  8 Oct 2021 11:54:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6A81F80249; Fri,  8 Oct 2021 11:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D2D1F80124
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 11:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2D1F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="kgsLUxAq"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id DC8C940007; 
 Fri,  8 Oct 2021 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633686870;
 bh=tqDPxyLPKVPs4yYbJQLMZF/t1CIh6U8zbhA/lGXkiCY=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=kgsLUxAqCevBQM563UQkgq9iuUw3Cw40WCLce7KhIz3s2zgWPuTXia2G0HKjchrWM
 42Mjy9/1QZPAzQWzzqs+Qgv/UGEbyDxhD1IaqWZbg+SKsE3WLWQU2CxE1mOxbiqu90
 SRUC3vFiOR8uY+bQAJbKoIyqJOLy5m8bn/hTXBOHYTITfVVqiBt430xWFvQHuDZCGG
 o9pqGu/X4cVHU1XqHNb9WouSEeAXLntit7xd2vIWlIjA8Dgr6E62KPf1757EmdEW8Z
 5dFpVpSPxVpOlvXvoC65mRjAj00MgHQ4cQY53ZiQ+Waf7QxiWIkzQAsa8r+su63cPC
 hoWf58UOE1IOQ==
From: Colin King <colin.king@canonical.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2][next] ASoC: rockchip: i2s-tdm: Remove call to
 rockchip_i2s_ch_to_io
Date: Fri,  8 Oct 2021 10:54:29 +0100
Message-Id: <20211008095430.62680-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The call to rockchip_i2s_ch_to_io is only useful for its return
value which is not being used. The function call also has no
side effects, the call is effectively useless and can be removed.

Addresses-Coverity: ("Useless call")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index b08b15071993..cc5a2f9d3948 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -848,8 +848,6 @@ static int rockchip_i2s_io_multiplex(struct snd_pcm_substream *substream,
 				to_ch_num(val), usable_chs);
 			return -EINVAL;
 		}
-
-		rockchip_i2s_ch_to_io(val, false);
 	}
 
 	val <<= i2s_tdm->soc_data->grf_shift;
-- 
2.32.0

