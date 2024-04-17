Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0868A9F5D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:59:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D57D2BD5;
	Thu, 18 Apr 2024 17:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D57D2BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455972;
	bh=EMzVQWGtX/eIzEA/zdNuq2XVLHcIfNLVAyy5jrhNRxQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sOMvvpb7E3z+c4w6JBWgn7K4aniwmVVvE/+EXHo4b2C9FLDneKHQcwesDjz8Ln7uj
	 GwYKGbvYrcW3j/g/hA0jI1zpvQxaiOMgEUjuUC1QEkmcogH0TYVKManoeRLvRn1QJd
	 uAmqli+2dTUVF4DBKc6nU7/6huUX6NE95an1gHhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0F5FF89715; Thu, 18 Apr 2024 17:53:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E63F89703;
	Thu, 18 Apr 2024 17:53:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1A4F8025A; Wed, 17 Apr 2024 11:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65A8EF80124
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 11:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A8EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=od2JRNLN
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57042f84cabso2386647a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Apr 2024 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713347559; x=1713952359;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aS8oohQSnWtm5/ggCUPuCf5r4nvKB3/gwwUVKLME+0Q=;
        b=od2JRNLNRmmOITJfxaszFRG5+OOkuXIg5ZNugxT4cZ1nnd80dZb0Zj28hgJWrA9/6y
         nT016aY9hGhYbSuMRnS08AQTFDmbpHqubciBhcRGJufDzyIhAcpGpYy0d8S5JO0lZ4iO
         JlvKKCE2GKuB24pbgDkijou88dAMKnRWbj8nQ4gCqwgLwPuaWoztSHj1CcZoAi4ZlLMx
         jimDTFTSWaDt8k9zcTbpt12kt5JI4LXOKSepZ1NYzK9iYyc9XWSt8bH6IoSEeU8uK8+K
         Lp/tsRUiWa5W2F3B+evAg9ZdxMmCUwW3L6uMoKsiZGuvjBS+WL0OVb0uXK1EAeOsAXGP
         Ojjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713347559; x=1713952359;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS8oohQSnWtm5/ggCUPuCf5r4nvKB3/gwwUVKLME+0Q=;
        b=YKF9WlKmHi3sg6Tcx+NDpcfpvM7DEBWslNlm5hdUEmtGb10aKl959cBJ3+RLEv6DFv
         wT5PBbp0aP9r0sqa92G+B6r4dJKyyJ/p5HCJhxpFcAL9PRlbWupwPPhHMnOPbz8kpFm2
         iRSEGGTHVSnNOxuquX2n1TgxR3A6dDppfYEW3Ky9qyvWptRbhxB7T9j8GgmWY0hoX9y0
         mPD8uknr+8gJsOvl4q60h5UstfSV1mQPNd/V2Tl0KJy5hqoIJF8wI+GGmruDlgvDvrlJ
         8yAf0Tv4VW1Df64dFqKpZBXfMZ3Z4zl2/LBjoUhPAn6q6fosJDQAQVbMqcxnyTwLyhxe
         WBLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJWj+xKLBI48VEG5Apmx26CNfhK/ZziIIODsyoMy4PDSCgPEkjtVfS8CN5n9QhKJ5ZZ0eZpaF0SphkJDMLdadWtZsoIu/t/Te/C/E=
X-Gm-Message-State: AOJu0YyIbCpW4YX1MIXAIE8IpS9FAlMRteuPHQaHznfK2RRHlniXS9OM
	DcmYsRw5rO2s2d0awbi4urF6Jnpu6DP8pGVMqVzA6EaMN93C9VVl3mFrwGRFOX4=
X-Google-Smtp-Source: 
 AGHT+IHjbEE1PXIxusfNci6KoXg1ftVPH3rWidgWbOaaR9occvuaSUnnQtaaZswO2dIcUCmYmpgEHg==
X-Received: by 2002:a50:9b1e:0:b0:568:bfcd:e895 with SMTP id
 o30-20020a509b1e000000b00568bfcde895mr10176685edi.41.1713347558535;
        Wed, 17 Apr 2024 02:52:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 j1-20020aa7de81000000b0056e62321eedsm7001133edv.17.2024.04.17.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:52:38 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l41: Delete unnecessary condition in
 cs35l41_pcm_hw_params()
Message-ID: <1ee32bfb-6f6c-4b61-887b-6f655abbfc47@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TCDCLOHHHIXZ25CWTIYJOASB7MXKFUPU
X-Message-ID-Hash: TCDCLOHHHIXZ25CWTIYJOASB7MXKFUPU
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCDCLOHHHIXZ25CWTIYJOASB7MXKFUPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This code returns -EINVAL if "i" is out of bounds a few lines earlier.
Delete this unnecessary check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/cs35l41.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 2799ccd6b5c7..d3da6a9f7f2b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -772,10 +772,9 @@ static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	asp_wl = params_width(params);
 
-	if (i < ARRAY_SIZE(cs35l41_fs_rates))
-		regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
-				   CS35L41_GLOBAL_FS_MASK,
-				   cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
+			   CS35L41_GLOBAL_FS_MASK,
+			   cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-- 
2.43.0

