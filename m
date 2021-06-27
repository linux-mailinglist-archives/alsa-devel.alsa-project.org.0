Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E13B52F6
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 13:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFDE169C;
	Sun, 27 Jun 2021 13:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFDE169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624791701;
	bh=q6GReQfuAmYa3kfEaO4pvQXBlKKEl4KJ/C6Kjm+Eow4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZuuhuaZkFQOxnT5Mum+KYRdnS7uQ5tBGvXsMmk3B/BemV7vCu1piEDUI6aPt6fh9T
	 lgWbR7NQ/Frvr1vN49XCzRnBX30tMkHrUtHBHQi42QzutEITebwjMBkD+3j2f+yILG
	 YubZqQOWIYyeE0eZa9aAKxvlMy+ndGepnX+3WMv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA09F8025D;
	Sun, 27 Jun 2021 13:00:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90BB1F80259; Sun, 27 Jun 2021 13:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B0D7F80117
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 12:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B0D7F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VZ9D4gJF"
Received: by mail-wm1-x32c.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so8976895wma.2
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ela96/tv88T609Qf83/+Mfwf8Iy2w40F3zdEVahU6WI=;
 b=VZ9D4gJFgM9euZmvnHgnFNb+/zGwwfCaO2Kdltpdxw9P570zMTRcXKqhBBsuXf149b
 TkdKvOMi+lfnDsoKmP6BfYLPPNEp0MPHPMCmoLdtQNkEjgwaBQnH9gGkaMBddK9fTL2d
 Q2Yo0+vuNUvnBtET7m2jPIpn1CKgwYwrYzgXE4dbhVV3BPtSU2BiQC/0WKWb1nF6KZnP
 MrvBgoa+QFWh14qKcbjiAC4jnjJimHNBidE6JAY8VwYAXtiMhtIz1MDD1nQHrfzqFhMD
 ybay4TrMHdBP778ejG9ah19vXOBBJSrQJcsxBNG1wwDN2xbVCUdc7KvIuUC77HRdswnx
 vFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ela96/tv88T609Qf83/+Mfwf8Iy2w40F3zdEVahU6WI=;
 b=g7AKJ106wI99PypLYG6HeLz6eNPxrVoM4yMpM4MLttWY69xXU8/yRHjn+USDTAqqGH
 HtKVKfL20Qoz/8Kk6aD9St4FtMzYbWBlz6V40EB3LBXp3b33sRQTnkke4NT24zKE67MM
 JkVNf5i6mh5d5iqGB2iIfY6QMvMr29JIn1UDhgL3zJkNTtTetANH8HeEB/F2D3tVwZid
 XjpKhMfmkK+5bWXFVODkgUh+dYDaU4mVvUPh0MELUEJzBSq5mDBkOH0dmkjM1PygXRQT
 GO79WfyFEm71y+vjHW4zLt1EOflnoq+TorhSn+RUckU+Gs5nk9zm0OXKyjV9qkdrWAuJ
 neGg==
X-Gm-Message-State: AOAM531a3HeEY0/RUt4MwhYfeOTzm5Y1sFuOe6RFZVPda3Ix/kTDOS4n
 bnbQwW7DENcyfKtDvBVphew=
X-Google-Smtp-Source: ABdhPJwt7KiGKxnTD6jDZ7hvAGgYY9NnB4Fcw/x9sGAPiE55WzPCDCev0i6KlC8wGw03WLGVBhaqsA==
X-Received: by 2002:a1c:a795:: with SMTP id q143mr4624663wme.149.1624791599154; 
 Sun, 27 Jun 2021 03:59:59 -0700 (PDT)
Received: from morpheus.roving-it.com.com
 (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
 by smtp.googlemail.com with ESMTPSA id h46sm12075585wrh.44.2021.06.27.03.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 03:59:58 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: remove zte zx dangling kconfig
Date: Sun, 27 Jun 2021 11:59:55 +0100
Message-Id: <20210627105955.3410015-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>
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

In commit dc98f1d we removed the zte zx sound drivers but there
was a dangling Kconfig left around for the codec so fix this.

Fixes: dc98f1d655ca ("ASoC: remove zte zx drivers")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
---

v2 - fix the Fixes line

 sound/soc/codecs/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1c87b42606c9..e04fa8b5f178 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1739,11 +1739,6 @@ config SND_SOC_ZL38060
 	  which consists of a Digital Signal Processor (DSP), several Digital
 	  Audio Interfaces (DAIs), analog outputs, and a block of 14 GPIOs.
 
-config SND_SOC_ZX_AUD96P22
-	tristate "ZTE ZX AUD96P22 CODEC"
-	depends on I2C
-	select REGMAP_I2C
-
 # Amp
 config SND_SOC_LM4857
 	tristate
-- 
2.31.1

