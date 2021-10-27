Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01D43D10E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 20:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E31516A4;
	Wed, 27 Oct 2021 20:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E31516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635360611;
	bh=FZnnKG86B/HeFJ5VRl4mCRiAeuaNdHslgiaNE1NTxHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VF47nsPM+hTaeHNZT3aXkvROvynlERBB78Yhmr+Q94usoopeZ9itCXQLjEFcQ370U
	 E80zS6s72+ihhikhs/NpaRoETg+zVkjB0NcPqdVWPqZoGKz5Tt11udBU+Fgl9Qk2fw
	 2BdxIx4fUYrVx6f1LjDwrvpwgM5lJpMJABFA5LiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E98F8025E;
	Wed, 27 Oct 2021 20:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41373F8025A; Wed, 27 Oct 2021 20:48:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E116F800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 20:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E116F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cDWn67pD"
Received: by mail-qv1-xf2f.google.com with SMTP id jk5so2412592qvb.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 11:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FJiBpCKtlOpMH0mW30VRaesYawySjY66iCeXFJ7SYM=;
 b=cDWn67pDYQ4ozbi60h6BD3NfdckXrfUip7IWC34IVy1/rYlnmBOzphnxc6Pi3yAjyA
 Pv8kQIIssiYDyvqEQSOKXlr8cs/4/lihrt+BrBvnQl2cimAK5iwaCmpMjpMzRz/56dL8
 5cq/u2Ku3/4elbpVQTji55mG0USBSrrkxeKMtRD7gUNfP7z+lcy/ij8Jz3lKfLd9k1xg
 Zmoc+W2MdRmXJo3KTMLkG74L46hszFgScQkmC6jpJieNjtABCsh2+iXdwOXDSpkB/gLb
 SikHEhpSwCaS62wHtTn+gCyLzVI4/0zQB3uPdJcvOFzHleH1XHMbKVeFqJhxa4+jLJDR
 71MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1FJiBpCKtlOpMH0mW30VRaesYawySjY66iCeXFJ7SYM=;
 b=q6cFLgpwtA+Py4DcNAuSP3QqgH7NfxRNa9VexONkZxJMGnG10BWzioBTIBspKFM+D1
 0hJb11tWWf1hlHuaWTlWyn9DbUpXtAggmzKMMi7WIdLkm4gsNk9IvajuRvkQzr6c2dpy
 D/gCx/HvQ0VqyK2055bzcK4to5mMGomcxnVZTqdUXK87GI8uzLfoce6BEM2i5yKf4KGn
 OI46vocvTGMmTkXTuPR9BAf3Z01wrK8OznaJWbUsgirJdOqmWNHaQwtDTR2tk324H9Tv
 QdeU/WoW4K8t4F4Z99HBBdzQxG0c+R4SGwubjr2SDorWbE8rYdoPu/ECFfIDZPYsc1bb
 ZTKQ==
X-Gm-Message-State: AOAM532aGoNC5TbEXBB8mDcEF50qCdLCbgfrJ9zpzaoP0RlSx+GTXgMc
 CYNec4SxgFmQD20nny8iTwc=
X-Google-Smtp-Source: ABdhPJzW4teN0Shtei3LjruOVmsoXFBmBZv8vnnzvzVAQ8/cAUbcALlfr9AxoR8Y4j8KD3WG/clZVA==
X-Received: by 2002:ad4:5423:: with SMTP id g3mr27947804qvt.45.1635360516980; 
 Wed, 27 Oct 2021 11:48:36 -0700 (PDT)
Received: from ubuntu-mate-laptop.therobinsoncafe.local
 (097-068-131-026.biz.spectrum.com. [97.68.131.26])
 by smtp.gmail.com with ESMTPSA id o6sm503131qta.2.2021.10.27.11.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:48:36 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, Vijendar.Mukunda@amd.com, perex@perex.cz,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [PATCH RESEND] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_DMIC
Date: Wed, 27 Oct 2021 14:48:35 -0400
Message-Id: <20211027184835.112916-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com,
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

When SND_SOC_AMD_RENOIR_MACH or SND_SOC_AMD_RV_RT5682_MACH
are selected, and GPIOLIB is not selected, Kbuild gives
the following warnings, respectively:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_AMD_RENOIR_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_RENOIR [=y]

and

WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]

This is because SND_SOC_DMIC and SND_SOC_MAX98357A are
selected by SND_SOC_AMD_RV_RT5682_MACH and SND_SOC_AMD_RENOIR_MACH,
respectively. However, neither of the selectors depend on or select GPIOLIB,
despite their selectees depending on GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/amd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 56e7c079deac..2c6af3f8f296 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -38,7 +38,7 @@ config SND_SOC_AMD_RV_RT5682_MACH
 	select I2C_CROS_EC_TUNNEL
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
-	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
+	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC && GPIOLIB
 	help
 	 This option enables machine driver for RT5682 and MAX9835.

@@ -51,7 +51,7 @@ config SND_SOC_AMD_RENOIR
 config SND_SOC_AMD_RENOIR_MACH
 	tristate "AMD Renoir support for DMIC"
 	select SND_SOC_DMIC
-	depends on SND_SOC_AMD_RENOIR
+	depends on SND_SOC_AMD_RENOIR && GPIOLIB
 	help
 	 This option enables machine driver for DMIC

--
2.30.2
