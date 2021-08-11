Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230173E9470
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 17:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A24E175B;
	Wed, 11 Aug 2021 17:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A24E175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628695201;
	bh=WHWMSxhLAxLNIH7J9p8IWUKVeDJ5ODPmoV6qic2rOzI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uAueMElgNOnc4Y2Qnkp76trqM3zmi/NCtPztz5D3PliqnREL1Nlb/UPYBrbUb/BTf
	 Csxp7D7G1zRAVJcnRWlPXMEqGhXYZ3U7YQyKBNFo9DjqQOZO220liXK830o5LpUl88
	 wv+da/F85P9T5+Q80Ft/oqmz0+DJaL7rKIOtB0b4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077EAF802D2;
	Wed, 11 Aug 2021 17:18:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3868F8020D; Wed, 11 Aug 2021 17:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6766BF80148
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 17:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6766BF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CpiIzIOh"
Received: by mail-pj1-x102c.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so5246162pje.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ygxUpyRX9wOtF8ZOqKu/KuzaLXR5hL1hZ6xZFoZuCD4=;
 b=CpiIzIOhMYLbVZHyvo6F+/4fLJHxng97OOxY6LZyn8+rJFWiHXYtRIt1jYgPz3yXcy
 5u3a7v/iHytl5YWjA+3VnvTejeZEGumLYoT5g250NMttmMUFe+dVQ9NQowYJlR8q3O/+
 U3TYeQsC+9f8eOPweI4vaw0LoPWeCNXIZlpq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ygxUpyRX9wOtF8ZOqKu/KuzaLXR5hL1hZ6xZFoZuCD4=;
 b=fpEIT7vFI5mKcLnz9hZyyS0yDCrQ+ROh+Gv/AVAVuu/4YS4lAw53pTjXpy0i3vkTRd
 0mFdzr0cIckde8fqedk/c3L+3Ly+U0xz3jRFXtbp6TO627qE77E5jtJDhYCBbunheeUT
 XZzXC/drCc0LNDni60nTie7ZePaHApBm7P+zwPJssVwATg8xIEfqArQjfcGqpHWNsM13
 9XLyuT01lZizitzgZP9PbiKajkKvWJ9PXT2I3vK0ShfevWOGfUTou4XO4R32wS8sI2UD
 BJmPsLRBt0Bvb3D01AdZwrQFjsmnUWMQDi7jFjahOUXlxI/vx0zG3ojUcgVqYiGh4ccr
 nH8Q==
X-Gm-Message-State: AOAM530jdr328qsfjXwYoHsGxxf+Fu0IlWV/jNYgWyU0mC1pV+8YwcI5
 h0uJ5Bsf8nDPLVD4iH61J6MDuQ==
X-Google-Smtp-Source: ABdhPJxuQ9F1OGZdSAD5Ml4b3eKOeX4HHmdbExxTwfq7eiGklUYibxeF6HOax62CXeDESYQJwvVEkQ==
X-Received: by 2002:a17:902:8c83:b029:11b:3f49:f88c with SMTP id
 t3-20020a1709028c83b029011b3f49f88cmr4563235plo.63.1628695099936; 
 Wed, 11 Aug 2021 08:18:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:2800:b98b:b4d4:10f9])
 by smtp.gmail.com with ESMTPSA id 22sm30083544pgn.88.2021.08.11.08.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 08:18:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: rt5682: Properly turn off regulators if wrong device
 ID
Date: Wed, 11 Aug 2021 08:17:56 -0700
Message-Id: <20210811081751.v2.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Douglas Anderson <dianders@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bardliao@realtek.com>,
 Stephen Boyd <swboyd@chromium.org>
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

When I booted up on a board that had a slightly different codec
stuffed on it, I got this message at bootup:

  rt5682 9-001a: Device with ID register 6749 is not rt5682

That's normal/expected, but what wasn't normal was the splat that I
got after:

  WARNING: CPU: 7 PID: 176 at drivers/regulator/core.c:2151 _regulator_put+0x150/0x158
  pc : _regulator_put+0x150/0x158
  ...
  Call trace:
   _regulator_put+0x150/0x158
   regulator_bulk_free+0x48/0x70
   devm_regulator_bulk_release+0x20/0x2c
   release_nodes+0x1cc/0x244
   devres_release_all+0x44/0x60
   really_probe+0x17c/0x378
   ...

This is because the error paths don't turn off the regulator. Let's
fix that.

Fixes: 0ddce71c21f0 ("ASoC: rt5682: add rt5682 codec driver")
Fixes: 87b42abae99d ("ASoC: rt5682: Implement remove callback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2:
- Add a blank line.

 sound/soc/codecs/rt5682-i2c.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 4a56a52adab5..e559b965a0a6 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -117,6 +117,13 @@ static struct snd_soc_dai_driver rt5682_dai[] = {
 	},
 };
 
+static void rt5682_i2c_disable_regulators(void *data)
+{
+	struct rt5682_priv *rt5682 = data;
+
+	regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
+}
+
 static int rt5682_i2c_probe(struct i2c_client *i2c,
 		const struct i2c_device_id *id)
 {
@@ -157,6 +164,11 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&i2c->dev, rt5682_i2c_disable_regulators,
+				       rt5682);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
 				    rt5682->supplies);
 	if (ret) {
@@ -285,7 +297,6 @@ static int rt5682_i2c_remove(struct i2c_client *client)
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
 	rt5682_i2c_shutdown(client);
-	regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
 
 	return 0;
 }
-- 
2.32.0.605.g8dce9f2422-goog

