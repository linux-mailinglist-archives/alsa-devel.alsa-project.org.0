Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3040639987
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Nov 2022 08:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BB516F7;
	Sun, 27 Nov 2022 08:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BB516F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669534240;
	bh=zOw/SAsOe50brgKzhx5SOBKKAdL94DgcV0DtnfvPKgE=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bvx84slxZcKYHBiX503eCh3trZvNtBWdaglzGIed8ezH1hApkJ3mki+DeeyrIX02j
	 ERSYjOPCeuNFO+xYdkmCfoCmS8pepQGELe0hcxGk+2WczHWw6PA8dJWgW4hWMNOhXN
	 q3S+WJRexkhYEY7DC4KSkcENECo9Qz/281hyEqsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D98AFF8051D;
	Sun, 27 Nov 2022 08:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C410FF802BE; Sun, 27 Nov 2022 08:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_96_XX, DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED036F8021D
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 08:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED036F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="R+W/2Kk0"
Received: by mail-pl1-x634.google.com with SMTP id p12so7460117plq.4
 for <alsa-devel@alsa-project.org>; Sat, 26 Nov 2022 23:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+15f3T3+S3cU3nRipNryZJ4svWYzk/FzguyIiKQo5Y=;
 b=R+W/2Kk0/vwErqgTCVnwyJdA+49fCvdEw5R4Q3NlZCWvbQpbNIZWfbGScngPYJ6Eub
 Qkku9e2Vc6FV7h1ctudVvvNrEYrC6amRep79WGs311zLkdsynZP0QPGHEf4ND0mmzpFj
 C25yztKS7BnZWheWndZBqvYVDNmuC5NalsYophyEaY3KTnIbBKIwtWKRLFqtHFpP0Xk8
 yjBlszs/AQ60Wiv86BNIFnwm02bc0/U9U1IIww4LXexFiJw5HVb2ZsZyx5nghOWcO0DA
 Vq1T5ZZ5Hey9UlsTVw+K70nak6h95uM1Z2pxqLcp4J/zU4oBwhFj8ykn6kIUTUOQPdxJ
 bADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+15f3T3+S3cU3nRipNryZJ4svWYzk/FzguyIiKQo5Y=;
 b=OOVnLXp6qxBiQHbMWafopTXYqrF/hRqRJSYJLJDa//jrHe5iqeu5hEfigl4kOvQQz5
 XDWCVtzwmpjo5K2DlHv6qx+0/ZwYEvU2KE50p62fQ7nKhgMScLE38uxYxHN9QoCiSDSv
 75VWnJp+13JhvvbSeVk731mcJQKOKMZvl14zUzoVFPUl0JKXcIoybD5DQdg2ZgBqYPDX
 DYi1XfbO6hwzJeQIQrvGeCSKvrYuQolwS5BpLim5m4YB5kx4qMwu91bqJMIvZ7dLOj0R
 +FOJX0C6RvgUEai2iPWwwShQGnonlOzMfEUjwyj6LB+Pxv1eiGvo474FhiH1w3dwAunI
 joWw==
X-Gm-Message-State: ANoB5plDNMADYEVN8FUOx4baWq5LogySM9DWa02Su2+mtTY2ZUJxKu68
 h29jdrL7/MTwfMk7puFFgv0FGelfoPYAAg==
X-Google-Smtp-Source: AA0mqf6InhROC4XL8bT1IanMdMMMCSjQhLQ2R8kuioKvNmGLuRhHLl78r8THfEvxaQYvDKhb1R4iyg==
X-Received: by 2002:a17:902:a718:b0:189:7722:99d7 with SMTP id
 w24-20020a170902a71800b00189772299d7mr5479382plq.96.1669534151792; 
 Sat, 26 Nov 2022 23:29:11 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 b23-20020aa79517000000b00574d7111c99sm2794396pfp.195.2022.11.26.23.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 23:29:11 -0800 (PST)
Message-ID: <638311c7.a70a0220.4e021.3abe@mx.google.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 27 Oct 2022 21:38:38 +1300
Subject: [PATCH 2/2] ASoC: tas5805m: add missing page switch.
To: alsa-devel@alsa-project.org
Cc: Andy Liu <andy-liu@ti.com>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>,
 Mark Brown <broonie@kernel.org>, Daniel Beer <daniel.beer@igorinstitute.com>,
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

In tas5805m_refresh, we switch pages to update the DSP volume control,
but we need to switch back to page 0 before trying to alter the
soft-mute control. This latter page-switch was missing.

Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifier")
Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 sound/soc/codecs/tas5805m.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index d720c67b9675..5cf7726904c2 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -203,6 +203,9 @@ static void tas5805m_refresh(struct tas5805m_priv *tas5805m)
 	set_dsp_scale(rm, 0x24, tas5805m->vol[0]);
 	set_dsp_scale(rm, 0x28, tas5805m->vol[1]);
 
+	regmap_write(rm, REG_PAGE, 0x00);
+	regmap_write(rm, REG_BOOK, 0x00);
+
 	/* Set/clear digital soft-mute */
 	regmap_write(rm, REG_DEVICE_CTRL_2,
 		(tas5805m->is_muted ? DCTRL2_MUTE : 0) |
-- 
2.38.1

