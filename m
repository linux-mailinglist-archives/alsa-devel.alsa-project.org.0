Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1A161C7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 12:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D773C18D6;
	Tue,  7 May 2019 12:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D773C18D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557224116;
	bh=QvvDzMxeWJA7SGj0diSpZbFBLnuKpApJDYyEqKm6eXs=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=befXLWkGTQuyPUiwJ31oQjl19eb5yqJcQJzA9+IZ2LUoKlCwSTSKFrFKpiKpqF3pq
	 dksCkXY3Ya7pwqxo+Az29NCyjVlC/uhwRgaIEAaynOzlDYG4GaS13nuaM1Tbw36P0z
	 mxjtM/AuP5vVYe2JOrUEVGQ48yZ4O8Awgo6taTLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1347F896DF;
	Tue,  7 May 2019 12:13:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CB58F896EC; Tue,  7 May 2019 12:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB67F89682
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 12:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB67F89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c4BkH8PB"
Received: by mail-yw1-xc49.google.com with SMTP id b189so18017483ywa.19
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 03:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pEs0YAvpVnOXt4JVkdCiFZqbRy+rm3fq+3JWY10YEQU=;
 b=c4BkH8PBLGS+qBp4V6RPqreYoE57I8tSGB6i/7uwu3d9bUvWfPK1/Go0bNPO1+tqPb
 c88JPinlV84R0YG0zEW+TiCwYpp/ytQnWzvLgN7nH0DGgMhgEP5zXaeQ6iCmJm8kNWMY
 uG1xivpq4OIxoDhGiVtQ703eRRS9B1Eig4brGJCydv22CoAy/NIygwMhbex9K78eCiVo
 ZtebXkJrxlHI5PvHZLmX46Sie5Q2cLo6L9ubUtWqIUXLJYKlN3owNiiKtjuB43tgZlVZ
 iAKtEeLWpW5WiGp1fYJWF8P8ozOJTq3RcpASKJz1jQo4ZBUq9Gn2BK73S4jG1BkLmyto
 TpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pEs0YAvpVnOXt4JVkdCiFZqbRy+rm3fq+3JWY10YEQU=;
 b=amQ4eZTc3ooELd3w0IUFYO+8PO4Sc4veg2Or1JETeCqar7G+tNk+ExDJN/8r2MQy8G
 EtVAUJdTGEnaqvmnVHe6mmrm+uMAdZVHSWsWSv2exLBIr1DGrBM15dljvwZH8bcWwMO2
 UKyvF0c3CVKEhENa95hUe7gtOVD8v7UZRR2ujnzYWXpOf/bTMH/3YoHClxAzf5vAPh59
 gkbpX/GTgISPmJe3BLOYTfS626NJ6/KXgz8e7Sy1iEVjF0DcuWJ8HKFDN3a5XXxEB3xg
 SmT7XcCdWXNxRc4J21x7ludHB4W9nBgYTP1VUmDsmzX0kXCmbhO4xboVkQIY2Woo1QfO
 nK/A==
X-Gm-Message-State: APjAAAUhZ6Ek2Y8GWWhkyb9xJrnqqWKOyF2uxWjL+4Y8ApRu0XwrhCMR
 W/G/YUZJx1LGamu6B0OYXbnwv5otiBtj
X-Google-Smtp-Source: APXvYqx3q+rVt6nHw7Q3W+MKT568yVbp4Fx30fN5sz2RETBeaJP64CAtnFQOy+MaIZNJrJFmNUvN6vlNm+im
X-Received: by 2002:a0d:c481:: with SMTP id
 g123mr11460226ywd.230.1557223975376; 
 Tue, 07 May 2019 03:12:55 -0700 (PDT)
Date: Tue,  7 May 2019 18:12:18 +0800
In-Reply-To: <20190507101220.182466-1-tzungbi@google.com>
Message-Id: <20190507101220.182466-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20190507101220.182466-1-tzungbi@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: mediatek: mt6358: initialize setting
	when ramping volume
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

Mt6358 ramps up from the smallest volume (i.e. -10dB) to target dB when
opening and ramps down from target dB to mute (i.e. -40dB) when closing.
If target is equal to -10dB when opening, headset_volume_ramp() simply
leaves current setting (which may not be -10dB) unchanged.

Execute the loop at least once to initialize the setting to the
starting point (i.e. from).

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/mt6358.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index d4c4fee6d3d9..96547ae50a5d 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -405,10 +405,9 @@ static bool is_valid_hp_pga_idx(int reg_idx)
 	       reg_idx == DL_GAIN_N_40DB;
 }
 
-static void headset_volume_ramp(struct mt6358_priv *priv,
-				int from, int to)
+static void headset_volume_ramp(struct mt6358_priv *priv, int from, int to)
 {
-	int offset = 0, count = 1, reg_idx;
+	int offset = 0, count = 0, reg_idx;
 
 	if (!is_valid_hp_pga_idx(from) || !is_valid_hp_pga_idx(to))
 		dev_warn(priv->dev, "%s(), volume index is not valid, from %d, to %d\n",
@@ -422,7 +421,7 @@ static void headset_volume_ramp(struct mt6358_priv *priv,
 	else
 		offset = from - to;
 
-	while (offset > 0) {
+	while (offset >= 0) {
 		if (to > from)
 			reg_idx = from + count;
 		else
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
