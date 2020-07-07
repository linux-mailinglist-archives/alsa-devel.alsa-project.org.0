Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE0216F3E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65591614;
	Tue,  7 Jul 2020 16:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65591614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133301;
	bh=0cXBTC4gpvSAswibk1QjXWR066hmA1WvUQJnf+4TcdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucjqYpnYFjetZ/QJgEcecHhDMAYZwTia09DeiKed4DaJCrH06Pl3ul2QzMUgTUyWW
	 W+mnZ+5Y95veo1rvNSNvElV+1UY63YQm0/Btz57a8EmbTQVPRutO3QqozWpS7LStYn
	 oxtx4msi6UqKtDp469OP1zVbjZLIF8QSVMt8fBjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED48F802F8;
	Tue,  7 Jul 2020 16:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95589F8033F; Tue,  7 Jul 2020 16:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F18CFF802F8
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18CFF802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MHGUg59+"
Received: by mail-wr1-x443.google.com with SMTP id z2so23134400wrp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qKCC8gwbOOqZ6yEPkGSkmGeka7mYOZ7iXEWMftP650=;
 b=MHGUg59+CIiFn+a4HTqUDEaC2OOzC3fBDNG+gmNZc5Lq9ga6wt3BgEtSO4rzK1gKON
 NN5LiJlHqnLYB1HB4rYnJh6GKCBxpjgG8h89hEH6g8xuCSdXT/X+luQoiJOLszEJ/io/
 oouYXSL7QPMn2mAU/9wE9JCbevJrGhq8fii5XwWGCb/lQfNDoEMkT4FRjq7IvkPcQ2GU
 Uz+cWLLyEM0fJHsdE2DuVaMkxw/M/1OSs1Rzm8rO5hmjJIZw9+SadAEK9JxOkYnBYF2z
 +/SldD0QP9BmkNSVD4HpW10ulLY9YmbObsFRymw2yL1n3cACA26WRz+yfbdB4KgVW6Jm
 cC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qKCC8gwbOOqZ6yEPkGSkmGeka7mYOZ7iXEWMftP650=;
 b=MPgVW7/pKQ1ebwqsiN01b0a9uUPSEzd990nukElecy/YZnMQjTIbgoM1xzAYR3wQ7n
 +QMMzqY+Q8DVSTPe43KwJeKCieUUzIat+ySmj4cgerDtstpr02tghDzWc9zul6lK19vS
 7uSZiirVBLdA4QShVUJowjJShD+n3+TlAsA0+eLOm+x19FT8lxip5Rafwwbf0DiOr5Td
 aRk+MvrdYBX42NDF78i9lXxLe9n6ofAb9uJnPThj/gSAGHIEG9+qbLFNHo8VGpit9wAV
 oiYUZH/nryA4drJYAox4AvXbbXbilgO+AH6/M+hj3CT0DsEiwIrVDdl+qN0UQP5x2cDe
 YcIg==
X-Gm-Message-State: AOAM531TccWygYfTEODibasY08kouHcpg86kHujjxXYe9UzqN8aU8yGN
 /DG6Lb0BUb2jstb6dTw3tiL83g==
X-Google-Smtp-Source: ABdhPJzaV/3UQ016kv4Ag7+B7phfs4pD1pKuxhbyntXYNoHYbkT+tFXMCA/jg3bjpvj9sjSTi1yKtQ==
X-Received: by 2002:adf:f784:: with SMTP id q4mr53880655wrp.397.1594132685030; 
 Tue, 07 Jul 2020 07:38:05 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 12/28] ASoC: codecs: ak4458: Remove set but never checked
 variable 'ret'
Date: Tue,  7 Jul 2020 15:37:26 +0100
Message-Id: <20200707143742.2959960-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org,
 Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>,
 Mihai Serban <mihai.serban@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Looks as though the result of snd_soc_update_bits() has never been checked.

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/ak4458.c: In function ‘ak4458_set_dai_mute’:
 sound/soc/codecs/ak4458.c:408:16: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>
Cc: Mihai Serban <mihai.serban@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/ak4458.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index f180cb5dfe4f1..39ae089dcd1d8 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -405,7 +405,7 @@ static int ak4458_set_dai_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct snd_soc_component *component = dai->component;
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
-	int nfs, ndt, ret, reg;
+	int nfs, ndt, reg;
 	int ats;
 
 	nfs = ak4458->fs;
@@ -416,14 +416,14 @@ static int ak4458_set_dai_mute(struct snd_soc_dai *dai, int mute)
 	ndt = att_speed[ats] / (nfs / 1000);
 
 	if (mute) {
-		ret = snd_soc_component_update_bits(component, AK4458_01_CONTROL2,  0x01, 1);
+		snd_soc_component_update_bits(component, AK4458_01_CONTROL2,  0x01, 1);
 		mdelay(ndt);
 		if (ak4458->mute_gpiod)
 			gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 	} else {
 		if (ak4458->mute_gpiod)
 			gpiod_set_value_cansleep(ak4458->mute_gpiod, 0);
-		ret = snd_soc_component_update_bits(component, AK4458_01_CONTROL2, 0x01, 0);
+		snd_soc_component_update_bits(component, AK4458_01_CONTROL2, 0x01, 0);
 		mdelay(ndt);
 	}
 
-- 
2.25.1

