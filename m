Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AD2C4626
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63571183B;
	Wed, 25 Nov 2020 17:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63571183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606323583;
	bh=DS1nymrUd49e3536q4ErunpnmZeajDywtvhVRNThnTM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdHXE5vRkzDjPSroGjznHHeI8kauQ82YFodkGMTmXgkdJWvqmF1s6CD65XScrulQd
	 2LPAq4bm0vKQk6NdhTdvOeeE038aIMz5siIqCLBM1l6El572n7SmwlE031qexhVnHG
	 /5nVTxDXxjsC1iVSFRAZzR1pXyNgl/NBzPXGZ04s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DD5F804B4;
	Wed, 25 Nov 2020 17:47:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AE76F805E4; Wed, 25 Nov 2020 17:47:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 137F4F805E5
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 137F4F805E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y06x7KpL"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FC112173E;
 Wed, 25 Nov 2020 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322855;
 bh=DS1nymrUd49e3536q4ErunpnmZeajDywtvhVRNThnTM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y06x7KpL/Ul+BwyDJid2u2gBwjWStNYe6D5S+RpY+EsRHq7+h5pMLz+JkdqgEFFz5
 moR2TRDFqC+z4c6r1UBlnI2fWV99V0JGAAlNOq+7OU+vSmfgWhfn32wvwvQWMkRLGc
 /DgDd9wtfgtDoa4UVP7Xqb8+xuHodhMqgatV4QIg=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 33/39] ASoC: es7134: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:46 +0100
Message-Id: <20201125164452.89239-34-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/es7134.c:264:33: warning: ‘es7154_chip’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/es7134.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index 00518406eb2b..e2b79879354b 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -183,7 +183,7 @@ static const struct snd_soc_dapm_route es7134_extra_routes[] = {
 	{ "Playback", NULL, "VDD", }
 };
 
-static const struct es7134_chip es7134_chip = {
+static const struct es7134_chip es7134_chip __maybe_unused = {
 	.dai_drv = &es7134_dai,
 	.modes = es7134_modes,
 	.mode_num = ARRAY_SIZE(es7134_modes),
@@ -261,7 +261,7 @@ static const struct snd_soc_dapm_route es7154_extra_routes[] = {
 	{ "Playback", NULL, "PVDD", }
 };
 
-static const struct es7134_chip es7154_chip = {
+static const struct es7134_chip es7154_chip __maybe_unused = {
 	.dai_drv = &es7154_dai,
 	.modes = es7154_modes,
 	.mode_num = ARRAY_SIZE(es7154_modes),
-- 
2.25.1

