Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D930CA8
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 12:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2C0215E5;
	Fri, 31 May 2019 12:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2C0215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559298824;
	bh=80U/ENf3bHucgmT0Pmojj593a/Ad27WxWb8WOt+Pjm0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ozqqv2PUSz1G9zH2HRdbKhCPHMC40Uxi4JvQgZLWZb0bM8IQqYt8CQNvvOEthQgNn
	 L6mrRBbxpYUuf8ACp6nAL5RlAsRgumn+bD+IHyg5ZHrslJwgAtxp/5zdFmB+9mty6M
	 kATVLG4TJ63sQXzyJRMqQyzFndj0mM/XWd2oPwMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E39F896E8;
	Fri, 31 May 2019 12:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C58FF896E5; Fri, 31 May 2019 12:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E366F80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 12:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E366F80C1B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FUKoQH19"
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D2462677A;
 Fri, 31 May 2019 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559298713;
 bh=gnWsYJXafTr4/ebtpkTMaILA8zE+1xeKW9QH7rg3lzY=;
 h=From:To:Cc:Subject:Date:From;
 b=FUKoQH19LTF+SesZyFy8J0+ENSM97Nxg76R6Kf08tGhYALgjODVxh6x+YN9bPNYPA
 nNfJFxNYWyuuN1wwVuwdJ/QQV84N7XJY6hpPSTHQc/+cqbljN6Yg8MX0W/C+69ynn3
 B6MSOq2F2zwSDcdvmPCizxHT79hAF1mbLRK2oR7k=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Date: Fri, 31 May 2019 12:31:47 +0200
Message-Id: <1559298707-14903-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Cc: Tzung-Bi Shih <tzungbi@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [alsa-devel] [PATCH] Revert "ASoC: core: use component driver name
	as component name"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Using component driver as a name is not unique and it breaks audio in
certain configurations, e.g. Hardkernel Odroid XU3 board where following
components are registered:
 - 3830000.i2s with driver snd_dmaengine_pcm
 - 3830000.i2s-sec with driver snd_dmaengine_pcm
 - 3830000.i2s with driver 3830000.i2s-sec

This reverts commit b19671d6caf1ac393681864d5d85dda9fa99a448.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/soc-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2d3520fca613..7abb017a83f3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3113,10 +3113,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 {
 	struct snd_soc_dapm_context *dapm;
 
-	if (driver->name)
-		component->name = kstrdup(driver->name, GFP_KERNEL);
-	else
-		component->name = fmt_single_name(dev, &component->id);
+	component->name = fmt_single_name(dev, &component->id);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
