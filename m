Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7882F7EF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 09:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A8B15E0;
	Thu, 30 May 2019 09:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A8B15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559201667;
	bh=s8L3lWuGJ1lufFLawYom5FbKbVe3iaWdD8K802NddWk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hO3io+r5q2OLM5VU6+aRjCyWOtvwJHFk+55Huaj7DznKaiUc2GOU4ZIwzuuR8bfGC
	 MS2Hp/J4//KirFwrBUWm8NpYV7Y2OwOpB0sX5ethIlj+uKVWnzda+xQ34/wB93jbbh
	 I1pMXoHSMthzrbVKoRN64CyvhG8c2j1r5xlPmrOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E777AF896F8;
	Thu, 30 May 2019 09:32:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAEC4F896F8; Thu, 30 May 2019 09:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE31F80C1B
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 09:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE31F80C1B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kUJ5K8gu"
Received: by mail-qk1-x749.google.com with SMTP id v4so4115667qkj.10
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=219G1yaUiFQwKLKEtOKl7xs5zD2F+rhj4otlu2je6yc=;
 b=kUJ5K8guv5j1d4QtWJlNLiDo7XEY8OQOS+JhUihN0fJOCxdmQUdrNjd3fs3SyQx3lQ
 DsOgnfDHDvkSi+YRu7fTSyjgCbhrdi1wZT2n5E1w/tUMFoZvQfr+D6Hv2ePvF6gdJeBp
 2muWdXDYnBW5ePwSz+bXyvy1v1rx+/oPPlHLr4AL0AN16zfIyOXUtEwcBSbWYyF1U26B
 RYvnQSuOXQQlncbU05KjL6O5S2O8jLG5o0b+a2I4AfmbIYIhC1jkGE5RW+WJ6ywuvGiQ
 ZtWJrrslgC6+/vARZba38UtIUZerwHzcKRh8O3O/Z4H6xflsbqfVCbhZY4if9WMyKvyP
 pWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=219G1yaUiFQwKLKEtOKl7xs5zD2F+rhj4otlu2je6yc=;
 b=aOz5l3qHSSwj4S843qCQjeT+HNXyp7d8RXaXDTiNuSCYP5Nv+EYnp0h2qs/EGVpGDE
 zT6/3mhAThxwqys+n6o7gCoYBgeQxnm1NsvZ7j+3Hk5UMhnuH6ZkRZWpUB6GD0c/6Y9K
 WHpBCVAB3r4GeRt4oR2ZP6TNBVEQf2ZgCNGOlbDwsa71qgTxXJuBmG6gSRDVNqnzSe4a
 +D/t9vHwPkxSpd6T/2B5n3IY6RiNPK7c5nb++ia7f2cUvUIfDq7Zq+tqzuNwKpV8EjSl
 cd8GCgDTbcyfQ6ckAunQcKpJNVHuXs7VMz+rfxPSxpGvl9x+EarWiKuwqKZLD0MhaESC
 lELA==
X-Gm-Message-State: APjAAAXJJye3Ea3tl3DTsGK7QVV9GVTyaGmuS3geh6x7NKNWh6rBuLv6
 mHwCpu28tb9mYDipapM8XA3NL8IzYtPK
X-Google-Smtp-Source: APXvYqyOFSxLf7qlGYHO3tVAtyGUi6ZjCBj4bjelpbLo2/wjLNYzeO18UR68ybDuwGbAlvw88lTFIfgxNlEq
X-Received: by 2002:ac8:85b:: with SMTP id x27mr2024164qth.324.1559201555032; 
 Thu, 30 May 2019 00:32:35 -0700 (PDT)
Date: Thu, 30 May 2019 15:32:29 +0800
Message-Id: <20190530073229.121032-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: core: move DAI pre-links initiation to
	snd_soc_instantiate_card
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Kernel crashes when an ASoC component rebinding.

As an example, by using the following commands:
- echo -n max98357a > /sys/bus/platform/drivers/max98357a/unbind
- echo -n max98357a > /sys/bus/platform/drivers/max98357a/bind

Got the error message:
"Unable to handle kernel NULL pointer dereference at virtual address".

The call trace:
snd_soc_is_matching_component+0x30/0x6c
soc_bind_dai_link+0x16c/0x240
snd_soc_bind_card+0x1e4/0xb10
snd_soc_add_component+0x270/0x300
snd_soc_register_component+0x54/0x6c
devm_snd_soc_register_component+0x68/0xac
max98357a_platform_probe+0x7c/0x94

The dai_link->platforms has been reset to NULL by soc_cleanup_platform()
in soc_cleanup_card_resources() when un-registering component.  However,
it has no chance to re-allocate the dai_link->platforms when registering
the component again.

Move the DAI pre-links initiation from snd_soc_register_card() to
snd_soc_instantiate_card() to make sure all DAI pre-links get initiated
when component rebinding.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/soc-core.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2d3520fca613..82ff384753c7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2072,6 +2072,15 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	mutex_lock(&client_mutex);
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
 
+	for_each_card_prelinks(card, i, dai_link) {
+		ret = soc_init_dai_link(card, dai_link);
+		if (ret) {
+			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
+				dai_link->name, ret);
+			goto probe_end;
+		}
+	}
+
 	card->dapm.bias_level = SND_SOC_BIAS_OFF;
 	card->dapm.dev = card->dev;
 	card->dapm.card = card;
@@ -2241,7 +2250,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	snd_soc_dapm_sync(&card->dapm);
 
 probe_end:
-	if (ret < 0)
+	if (ret < 0 && ret != -EPROBE_DEFER)
 		soc_cleanup_card_resources(card);
 
 	mutex_unlock(&card->mutex);
@@ -2794,26 +2803,9 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	int i, ret;
-	struct snd_soc_dai_link *link;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
-	mutex_lock(&client_mutex);
-	for_each_card_prelinks(card, i, link) {
-
-		ret = soc_init_dai_link(card, link);
-		if (ret) {
-			soc_cleanup_platform(card);
-			dev_err(card->dev, "ASoC: failed to init link %s\n",
-				link->name);
-			mutex_unlock(&client_mutex);
-			return ret;
-		}
-	}
-	mutex_unlock(&client_mutex);
-
 	dev_set_drvdata(card->dev, card);
 
 	snd_soc_initialize_card_lists(card);
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
