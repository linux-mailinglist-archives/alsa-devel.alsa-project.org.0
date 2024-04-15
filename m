Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3A8A9F31
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B046B1060;
	Thu, 18 Apr 2024 17:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B046B1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455700;
	bh=r+M9Bk+4YRd+zQ8ivjTlZYC6qhnETV86VeSJFPKxcBI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=biekTwffem0ic8yOkigQmPNFH+ZM5mMotDGtLklguV/Lq8GIsehi9b+7wMDmIkxT6
	 z8AzehtY9OPJS3ricFaRt8CR107hQQZSXmbq0BjyKh1z/hycv9HVUjb4bhcdCKGkU8
	 K2fsp7eBB2Pg+jfID290whIDZM1h19Fq0dtWQ/R0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 387E3F897BA; Thu, 18 Apr 2024 17:48:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94716F897A2;
	Thu, 18 Apr 2024 17:48:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 365CEF8025A; Mon, 15 Apr 2024 12:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9A5BF80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 12:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A5BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q6zuWsBC
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e78970853so6280928a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Apr 2024 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713177280; x=1713782080;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=q6zuWsBC1s0exen5TGlWjjPzFY0b/ad7vCjl/nSRujLQE7U7X5mMp9ygH99Kt+ZA0u
         HaY+lIl2b/9Sfd6WMmIfdA/Gh9nOHWkcmFry1A89qYs5i9gijptj+9HoJp/oBMBs1B7E
         B7oQAN41s9pC5R/IM8bqDfvnGZn3y7gKAVlfHj1rP6+1Jeh1fNlfKsAZJcb8Eety2u9l
         /vzWCPNnF1sg+hM/P5GKa1q+r09hFP3nCPU5BzAnOJWUcYsvwB2fCkUBowjfI/E/kSzv
         GVps1TbXc2AvfaUAYk4i2QB70H+eAZL7QYYH/tjiwDgUf1o8Un8xZzzZkwdXpY5vXoAH
         iVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713177280; x=1713782080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixcHPOvFOOXtJqtF3vNA0iGHZzONIeZBn6zmJrMcgH0=;
        b=h3Qak/FQd4HSDEMiR31079zFVjg+6OUd4C+ZjsxgwCIb9Pdii9pV0/tSBXDraygeQb
         j5FSbU/X4y/un4X2KO4wGnGzB6qYa6s7fSTiQ35GEeCsx4GWZlR8TW6TfzIIn3lPujNx
         NDO4XD7b/zrSoyoCVNfXbbDzDAbw3I9Gq8gImtFgMkiUxPY6A0mJUT7mKOQi1s27l7v0
         UhLQQHlqIiIfmV9c1i17kuG6moh0XYpKUkw5I37N6mmroOtNnZoVFSWlu3rFp/D90033
         RP1U/rKT0nr+bdvlyoDaaR6hEw9dp1y+cNZf4RIawt9rlxwiVi+lmVmrwcVbJGE+w5Gj
         30lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY+4H1nfc/OnOQ4bKfS6QtMMPgOQJGqLeDP4u1mXxx79/jt0RyMqG6Kgpy11894blXcCPMGp4p069vIl1zoQhMQj09xx/1IXXrPY8=
X-Gm-Message-State: AOJu0Yz2bYd4n4GXoQE9SWFSrnlRZLFrg/9IGt3yrnUWEkchx3twxhhl
	9r/A4wcXM5ugw2OmeADOFnECmsmZBU81XZll6L/FjZwZ91XXOijP8SwjiYxggO0=
X-Google-Smtp-Source: 
 AGHT+IE8taSRi7cZZenb22Hrhoo4IcK5IkZ6zpDWyZ3iR0Lu0U9yZ+r/3VZ74qZxKOLyEcvqXb+uAA==
X-Received: by 2002:a17:907:bb82:b0:a52:2a65:cf2 with SMTP id
 xo2-20020a170907bb8200b00a522a650cf2mr7787401ejc.13.1713177279707;
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 v13-20020a17090606cd00b00a526562de1fsm1589133ejb.73.2024.04.15.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:34:39 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:34:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l41: Fix error code in cs35l41_dsp_init()
Message-ID: <a50d27fd-716e-4fb0-8519-8798e3c79543@moroto.mountain>
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
Message-ID-Hash: YRIEIFCVF4C4P43KK7N3MZB7ZZPZ6OZF
X-Message-ID-Hash: YRIEIFCVF4C4P43KK7N3MZB7ZZPZ6OZF
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRIEIFCVF4C4P43KK7N3MZB7ZZPZ6OZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set the error code on this error path.  Don't return success.

Fixes: eefb831d2e4d ("ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/cs35l41.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index f8e57a2fc3e3..2799ccd6b5c7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1126,6 +1126,7 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	default:
 		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
 			cs35l41->hw_cfg.bst_type);
+		ret = -EINVAL;
 		goto err_dsp;
 	}
 
-- 
2.43.0

