Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B54E86DE
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739A91652;
	Sun, 27 Mar 2022 10:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739A91652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648368871;
	bh=Rc2QgSNVpvj9IgKP0mAefuKju6nBAAHcJQjXhnDPJ2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QqnXtFblW3EqPbz6mfeUtdHz0gVbApr+zO79HHEw2sm5KyZP80XiBJCKAYuuUCusX
	 XqvS16wz5IbIc8/3zqYRftMue9nJw9qazG2cxLH2NhgAsEspAkuGu2be3h3FPYrrOZ
	 UMOlFLe+w08w3w2PSpbazhdXHJEstwqq2IzPxCFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 075C0F80121;
	Sun, 27 Mar 2022 10:13:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621C7F80121; Sun, 27 Mar 2022 10:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFAF5F80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFAF5F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OZsDNWW6"
Received: by mail-pl1-x633.google.com with SMTP id x2so12246942plm.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=59JhUNktdVz2W5QJS5bzmJcf9POr7QzcmSfTOiXjcAE=;
 b=OZsDNWW6DNUFlcVYdlNaJI92YyM8e/1vdhm693Motn3WyZ7ewgAsXDxbdBNDuI8hff
 ajoCrHaYyEZxqHcVTVdfqmCiAlgd0sXnfwfy3HsjWeyb24TnljM/iNf1SvULyd3sonld
 udFONOi7HhP3xVedtAuHx8XnHifA5u4dM9VEFCjcFn/kOUfkAOqXQkJIAGRriZLaV8DV
 C8xCK72j0QcEf1Ns1y5NnE0u3qGfo2oNQvxJqmdJFiRrUyn+xamdElZdMcv9PZEVqfqB
 VYcWoqB6UFyBQXda/CLno4HvjFHNnAuiS6oH8SytVgsKNkS/xJtzOIQttmqvlM7Kz/jR
 Z2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=59JhUNktdVz2W5QJS5bzmJcf9POr7QzcmSfTOiXjcAE=;
 b=d4bzlfx2z5O51O5Dt1EwpZ12Lg4xGmydF0YiBSV1VKsNEq86TJBUFTrHcpaMok5TU2
 3bywN6J3eIbvDHIUlTNh+rmbt57vWQ3Oq4krk8Lj32WRbvPrZdTIzZtNKxb1vbeLxoGJ
 3yvzr6IXn2a0xLeDAiEpXBRvDuyFF80qWHaYnp3W7MQ9VwB/qqPM/bOIgymIRdXhKYZ2
 t7fLCH7Nwfak20WYvfNOtPpLTBJBxy4VqM6QucEU5KuooPlyCVeQzyG3T1KKom4vrYhW
 i4CnadtvJAV0QmSiOMMfiuc9HjBHl4wUU9RtqT5B/F5n7rj7rwBgGW5xspEPv27Hqef3
 ipeQ==
X-Gm-Message-State: AOAM530cgvy7J9qLpzSDnExDJylpiwzDwk6RQuczMcRnrxorpx/XhH1Q
 IjqJXN7fFfW3MgGzKAxTpyU=
X-Google-Smtp-Source: ABdhPJy/iTobgY0S2D+gB7aR16mC8LS3RFCSb2hnklRarrOtZksF+A58mZftxtdAe10MwlHGlfn4kQ==
X-Received: by 2002:a17:903:124a:b0:154:c860:6d52 with SMTP id
 u10-20020a170903124a00b00154c8606d52mr18220698plh.159.1648368799693; 
 Sun, 27 Mar 2022 01:13:19 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056a00230a00b004faa0f67c3esm12594343pfh.23.2022.03.27.01.13.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:13:19 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] codecs: rt5682s: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 16:13:00 +0800
Message-Id: <20220327081300.12962-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>, alsa-devel@alsa-project.org,
 derek.fang@realtek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

The bug is here:
            if (!dai) {

The list iterator value 'dai' will *always* be set and non-NULL
by for_each_component_dais(), so it is incorrect to assume that
the iterator value will be NULL if the list is empty or no element
is found (In fact, it will be a bogus pointer to an invalid struct
object containing the HEAD). Otherwise it will bypass the check
'if (!dai) {' (never call dev_err() and never return -ENODEV;)
and lead to invalid memory access lately when calling
'rt5682s_set_bclk1_ratio(dai, factor);'.

To fix the bug, just return rt5682s_set_bclk1_ratio(dai, factor);
when found the 'dai', otherwise dev_err() and return -ENODEV;

Cc: stable@vger.kernel.org
Fixes: bdd229ab26be9 ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/codecs/rt5682s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 1e662d1be2b3..c890e51ff953 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2686,14 +2686,11 @@ static int rt5682s_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	for_each_component_dais(component, dai)
 		if (dai->id == RT5682S_AIF1)
-			break;
-	if (!dai) {
-		dev_err(component->dev, "dai %d not found in component\n",
-			RT5682S_AIF1);
-		return -ENODEV;
-	}
+			return rt5682s_set_bclk1_ratio(dai, factor);
 
-	return rt5682s_set_bclk1_ratio(dai, factor);
+	dev_err(component->dev, "dai %d not found in component\n",
+		RT5682S_AIF1);
+	return -ENODEV;
 }
 
 static const struct clk_ops rt5682s_dai_clk_ops[RT5682S_DAI_NUM_CLKS] = {
-- 
2.17.1

