Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226154F87C0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 21:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB2231872;
	Thu,  7 Apr 2022 21:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB2231872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649358801;
	bh=cyWRTbWk6jPCkI4saH+6DmKmfit7uIg6sqt8KrWXR/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SM87gvsvSkB545KbzgqsR+ed7xDk32zRWn5Puuaw7RTwF2cbko2SyOcVn0C0KpSRA
	 HJBDIS6DuEsCZVlD4pOWbzUUlZ/e7L46OXdrW6ll7MjmCJ8e7zee57BSjPPbcBCItq
	 6MmhsCB5XVCgyeEemOaFIw1qZtqkFo/+bv8fHsAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C071F8026A;
	Thu,  7 Apr 2022 21:12:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13520F8024C; Thu,  7 Apr 2022 21:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 549E4F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 21:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 549E4F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A+CStoVm"
Received: by mail-wr1-x432.google.com with SMTP id b19so9239257wrh.11
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wo9oqpOrlL09wrHzLGCPMOoNjd0NRRV4WyHm6QSjcXw=;
 b=A+CStoVmBS8zw62LuBlsUrhX2I1YUxgwfb+f5/O7FRMnJd6b9nnEikrHsg7/PRxtRH
 Lck0K0k8ZG68XgeWmn2r/CFr4jpWB/lq1dzu0crZKHE00y77I33GIGOqkApwQl9c0AiK
 s1Pz8B4aaV4ZfBBX1HM0XsbxC7l55sxVPNulxJAPnzMxR+65H0wzjKc4uic7Lq2bmKpW
 U2IrSpa7vCB+5FY0uCqynAcE7IrFsYa8b59GgBNZFfH0SvGngyK+i8B86qoLiT/24hG7
 nxUvFCE01mGAcM9+vr781OG15rXJd6+AH7kne3SpiDJDHNHNcooD1T3ABX/algYOV5B+
 2BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wo9oqpOrlL09wrHzLGCPMOoNjd0NRRV4WyHm6QSjcXw=;
 b=JfKOv/sWkjUR0XEBkRnZWHToPTs7Nm4nmFl/ZyJnbWuiVjryMjJ/gGfOACNZ1Me7qd
 g7LIhv9tJEWLzCVUEm3gPW2gueiLvDusX4a5bLVy+bvJwLUOaglGFX3Dd/2OxFD2nkP6
 6xUD/d/vupruhP9krIYFtOWhBvup0HWNGy3hlndALQDyPeut55xdGryeDKrfZXhm+I7Z
 eoUNMo9rxstmlARpPl2cc9OQPhsajdTwBEne86uck232bYJ9ZYSqkRMYXiakrsSx1uT0
 6snRqiU1m5NaIlfPw/LgKlcuZ4HyrAppRQqHyAimbBOmO6EsMBmo7tqj/mXrrlwyM29m
 Vi4w==
X-Gm-Message-State: AOAM5309tPU3vobHzruy3Rntj7Bh+molgDtjK1GL5xv4T3bKHk3fRAsy
 s3BCPbaoa0YzEuVv9MX2CYs=
X-Google-Smtp-Source: ABdhPJyjlLtutGu4Av6RCcJJ6lRpbII9jThxDgGtmFzfmmqcqo512nfOMQ15hrj5GS2FA0m25zeM6Q==
X-Received: by 2002:a05:6000:118f:b0:206:81d:c030 with SMTP id
 g15-20020a056000118f00b00206081dc030mr11807807wrx.169.1649358734884; 
 Thu, 07 Apr 2022 12:12:14 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c2506000000b0038e6fe8e8d8sm11770610wml.5.2022.04.07.12.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:12:14 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: ti: osk5912: Make it CCF clk API compatible
Date: Thu,  7 Apr 2022 21:12:02 +0200
Message-Id: <20220407191202.46206-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

v2: use clk_prepare_enable/clk_disable_unprepare() (Peter)

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/osk5912.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 40e29dda7e7a..2790c8915f55 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -27,12 +27,12 @@ static struct clk *tlv320aic23_mclk;
 
 static int osk_startup(struct snd_pcm_substream *substream)
 {
-	return clk_enable(tlv320aic23_mclk);
+	return clk_prepare_enable(tlv320aic23_mclk);
 }
 
 static void osk_shutdown(struct snd_pcm_substream *substream)
 {
-	clk_disable(tlv320aic23_mclk);
+	clk_disable_unprepare(tlv320aic23_mclk);
 }
 
 static int osk_hw_params(struct snd_pcm_substream *substream,
-- 
2.35.1

