Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5356AD2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 15:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071811680;
	Wed, 26 Jun 2019 15:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071811680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561556347;
	bh=4oO2L/d0ZytTiCKoI/T8SLoDQ/8v8MqmJERVlXnwBao=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JN5tWN1Hg0wDXs0+pD+zaITF4t8Yco8/ml3eQvv2OXlGk64kPrfEs7ayG4KvyHPe+
	 2V/86CffaGIVL7P4GV+ZSZ4zOEIgJ25Gqga9+8cWc62x5IYLX0FNxd9QjMHK5kbm71
	 LnY/tIBelncRrch7yHI990X++66eMWRnrzNZNSCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 936BCF896CC;
	Wed, 26 Jun 2019 15:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 158E2F896CC; Wed, 26 Jun 2019 15:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68F6AF8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 15:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F6AF8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="blN2Wv4W"
Received: by mail-wr1-x443.google.com with SMTP id k11so2813462wrl.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnbXfzzoDtydJ87Q5fD6teACNHZuePi08QBtGx5OaUc=;
 b=blN2Wv4WVam0hiUqSylbBjtVDmRMsW53HOX2psNbZKAxgOV2/z/PkOMtPkvN/ugaMZ
 Sg4t47aCwoKzFiHw5nHazKAzbtIIT1w5Cg3nv+jk5gdLshoApig4CdNMpdMnYHjq9tnk
 CedAXDygrR2Ry2XQZjRO9kNtKX+IT1NbJk0z0dwj9Lpr0DgIjdw6g0Z9+faU+mkx7mrF
 CTbKNYE6FmB6gqFUzdzYfA74pNkEU/94kdqZgl9dh8fj7D+Yhwb2d2/+4XhXJeLiYfEa
 RHU/dazcHlX1nB+mtKcX232onWixjioT9LUKx+Rkgfh1Q3bg1P6IAwWw0fNvYbujtGBk
 gw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnbXfzzoDtydJ87Q5fD6teACNHZuePi08QBtGx5OaUc=;
 b=jp9ufOadVO21uoRuvmzaRObywRTCBgzxG64aSYLwiAxDVt2zEgxjl4CiOnkftSLRmf
 p1f5EtYhATWWC/pwvhwSQExbWp1g4Y6Z78/WV8RAgm1zzdqw2G9D4wlJVLrujIaWYOOy
 W197FNb68C2CmHoiQ2KMgJJxivN99QtjbXkb9Va0FQ71o6KmIhvxXwZ8GJLvwWIdKlHR
 BhVUF/y4KupHBi66LIxObI5TCRRTyiFqPR41rqjZvXM4WLKAlJhoQDH2KTCnn0VEaKsm
 Imb+VKhdeLe/wV4VFOn5oMKRMnrzCvaSnsSjz4LCTw09Yq0LU1PoslHIx6GZlfoUxAyY
 WN5A==
X-Gm-Message-State: APjAAAVrRyMTt8unBTaQop3/ER4eaJGFVhYtp0MLObcFQpxONTKgZYAF
 FzsPlQOzyIsfE6b29QndjXzlhg==
X-Google-Smtp-Source: APXvYqw4hWzpgN2aSWbX3Ju7Pa2dKjxwWsjZwurpIK/EUEgT1P05NHGu8zYfqRbAxNX4dVIeZVs39A==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr2478127wrw.138.1561556195567; 
 Wed, 26 Jun 2019 06:36:35 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w185sm2877880wma.39.2019.06.26.06.36.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 06:36:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 26 Jun 2019 15:36:16 +0200
Message-Id: <20190626133617.25959-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626133617.25959-1-jbrunet@baylibre.com>
References: <20190626133617.25959-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: soc-core: defer card registration if
	codec component is missing
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

Like cpus and platforms, defer sound card initialization if the codec
component is missing when initializing the dai_link

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 358f1fbf9a30..002ddbf4e5a3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1064,12 +1064,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 				link->name);
 			return -EINVAL;
 		}
+
 		/* Codec DAI name must be specified */
 		if (!codec->dai_name) {
 			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
+
+		/*
+		 * Defer card registartion if codec component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(codec))
+			return -EPROBE_DEFER;
 	}
 
 	/*
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
