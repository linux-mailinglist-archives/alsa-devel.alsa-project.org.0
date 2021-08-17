Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC663EE142
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 02:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49607839;
	Tue, 17 Aug 2021 02:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49607839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629160679;
	bh=Aqqg/+LAdGFrSRrekR1o1Bc4hvcDvgmePZggkIIT3UQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXs2aglgxUEKZ80JTCA6Nuj6NC12trxd+V89DeqEBCW0PIIrlPm4/ajocgvFB2LpR
	 qdwQuYtG7EzEF2b+9yzb8Xj4vp7Y5ioHvr/AnLcaBIk+h9gAQFWWS/BsvRHv26WIOs
	 tADcMkcWcp+2tcJY6zqhreXsZIm+ZBTtrjaaOIrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B1CF804E2;
	Tue, 17 Aug 2021 02:36:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D55CDF804DA; Tue, 17 Aug 2021 02:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46D3EF80246
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 02:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D3EF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b9Y2J/A4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73C9B60FC3;
 Tue, 17 Aug 2021 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160541;
 bh=Aqqg/+LAdGFrSRrekR1o1Bc4hvcDvgmePZggkIIT3UQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b9Y2J/A4lHWN/fY7RA9YiZrosX7Hc/solfTM4YpPtzv556s5LzwWHd++nlH0FoQ8C
 6W656iv7ivppiK+4vEX9JKvrWn38K1nX/1uvXpdXnAkkhHyr+7xhz/oiK6EesDJlYl
 i1MS+XN7ozcuIjdk2fB/HSCMxTeiiCLXgvdq0ekRveseCllqDxI+9ktTG9gm6FRe42
 REkjrVEimnUnHw0mpnwbCuhQRnQWyfXlC8UgCTSAIsRgcKzVMMNOSd0pwDYoF/v155
 EJ6IQRcWUMDpsA3m/57I89zyO9Rd2v3wk2jOup9G5L6fcW2g7JCjFYoD+dR5EwPT/x
 aa9B6YRJU/rlg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 03/12] ASoC: wm_adsp: Let
 soc_cleanup_component_debugfs remove debugfs
Date: Mon, 16 Aug 2021 20:35:27 -0400
Message-Id: <20210817003536.83063-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817003536.83063-1-sashal@kernel.org>
References: <20210817003536.83063-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit acbf58e530416e167c3b323111f4013d9f2b0a7d ]

soc_cleanup_component_debugfs will debugfs_remove_recursive
the component->debugfs_root, so adsp doesn't need to also
remove the same entry.
By doing that adsp also creates a race with core component,
which causes a NULL pointer dereference

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210728104416.636591-1-tanureal@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index cef05d81c39b..6698b5343974 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -746,7 +746,6 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
 static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
 {
 	wm_adsp_debugfs_clear(dsp);
-	debugfs_remove_recursive(dsp->debugfs_root);
 }
 #else
 static inline void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
-- 
2.30.2

