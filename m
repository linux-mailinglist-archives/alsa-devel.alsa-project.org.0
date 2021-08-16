Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77DC3ECE15
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 07:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 737B61713;
	Mon, 16 Aug 2021 07:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 737B61713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629092136;
	bh=yKaKh9JJ8w7dnpnlUvzXocT9gZRpuQcFfnZAaoBGCGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dot1aCk4JfxRK0g2H2xv+WnvHsZkoNVcgi4UshhwkTqDW54qxVftkU+Auh8vrRX0A
	 Mz9TvNU5aSSxXleGUHM1tImCBGKGEcLMGlMeXf/2ZDXNmsOw+vDmPnQfecNHs4cDzi
	 VpmJxi6FY/S7D1Qvvcg50RjTT5KeNY/Jeyt6gpLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C61F80259;
	Mon, 16 Aug 2021 07:25:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B61ADF802C8; Mon, 16 Aug 2021 07:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
 [80.12.242.133])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4145F8028D
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 07:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4145F8028D
Received: from pop-os.home ([90.126.253.178]) by mwinf5d03 with ME
 id i5RC250043riaq2035RCX0; Mon, 16 Aug 2021 07:25:12 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Aug 2021 07:25:12 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 vkoul@kernel.org
Subject: [PATCH 1/3] ASoC: wcd9335: Fix a double irq free in the remove
 function
Date: Mon, 16 Aug 2021 07:25:10 +0200
Message-Id: <0614d63bc00edd7e81dd367504128f3d84f72efa.1629091028.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

There is no point in calling 'free_irq()' explicitly for
'WCD9335_IRQ_SLIMBUS' in the remove function.

The irqs are requested in 'wcd9335_setup_irqs()' using a resource managed
function (i.e. 'devm_request_threaded_irq()').
'wcd9335_setup_irqs()' requests all what is defined in the 'wcd9335_irqs'
structure.
This structure has only one entry for 'WCD9335_IRQ_SLIMBUS'.

So 'devm_request...irq()' + explicit 'free_irq()' would lead to a double
free.

Remove the unneeded 'free_irq()' from the remove function.

Fixes: 20aedafdf492 ("ASoC: wcd9335: add support to wcd9335 codec")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/wcd9335.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 86c92e03ea5d..933f59e4e56f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4869,7 +4869,6 @@ static void wcd9335_codec_remove(struct snd_soc_component *comp)
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 
 	wcd_clsh_ctrl_free(wcd->clsh_ctrl);
-	free_irq(regmap_irq_get_virq(wcd->irq_data, WCD9335_IRQ_SLIMBUS), wcd);
 }
 
 static int wcd9335_codec_set_sysclk(struct snd_soc_component *comp,
-- 
2.30.2

