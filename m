Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68614900BF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 05:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D32168A;
	Mon, 17 Jan 2022 05:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D32168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642393012;
	bh=k0il38n9/Blgckt+9H64q8sBkFn61Mk6hc8zR0bQwC4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z8UvwSLJV6VvxszRwYl8I3IBt4cLID07v1H4Pqr4lwrNuxbmsrvHOzlPix73+ESet
	 9fRAUC/ImRZiUPx1ElvM4PQYpy8yubByUpkt9lDB66lfdWjsnxjdCLF1z1cnFhahET
	 pVA1g0HLoXi85qrt140lcz6tHGg4GqRwyKHe1NC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 912A9F800EB;
	Mon, 17 Jan 2022 05:15:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF5B0F80249; Mon, 17 Jan 2022 05:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 196CFF800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 05:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 196CFF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d9ldkTPN"
Received: by mail-ua1-x936.google.com with SMTP id l15so28140697uai.11
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 20:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jrz0bdG4iCzX8XfyvV8meTCqb9+YcvxN13g6lpUSlzE=;
 b=d9ldkTPNkSTz+T7svFprrBD1WZjllUGXGOADq/pmke0uEIsS9A1I66kyYKB2PGT5AJ
 uehCo2noX7bRZiaDd2j3mj5hnmGGbvVNom1pX5EFrIIR59PuDeHFoVKiMn8bG5rzpWJv
 s/xfOS8Xobhmh5qj/ra8DWsDlD5e1w8onpISUoE5z+mbHpiOOZwkee8JPXnpXzJCGq/D
 bs7KgYM+YPltmwI+2G2QY9o7SO6Alf1ZB/YYkOFh6wZowlB75q+dt5ZH8qI8iJ6xJSd3
 9QY5gZ6biIgqWjamqsC8AapsfmV5cWqshxpmJMEOGV0PBkCOlzphuLf65T8psyVN4Zlo
 WbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Jrz0bdG4iCzX8XfyvV8meTCqb9+YcvxN13g6lpUSlzE=;
 b=VtXRT7Gap/sAGL2ArW2KFSb36yOoi70n33BUMu5YtOUQf1VTOr9ZT9H0F33luscKAm
 MgzUvwe8fm2ujMkbMcGgA9mTfaxPCba3GeB8105y/Q1wgzw03WkjrhUqghxQWBZufVrW
 cA1Y0gm9Tt0K+/LCpbwE0NuLC/c30o/xu+BbvQtdiBD2eYxq+nO1wkcKN2P/RtEXtLwI
 6hhMNRFNkjoq9aNJbJ7+L+/kj8JHoD3oy1c5UErrsOt40AtxRFCIGJFQpQrejlu5+u1F
 S8fhqocAGm0f3GtobwZ4EX7q7B8O+V1e157nWPQx4DFW7U+Xc2CFmuBvXG5UgxC/wb+/
 XqGw==
X-Gm-Message-State: AOAM533BIcjkrdKTZvjzUWTbm7+ZJjVNCprrbaUUSQxirpjO0Ig3rqxK
 WNv+Xz5nTgP5YrJIot/ifpk=
X-Google-Smtp-Source: ABdhPJz4KANYV21BxWjGA0rg4pA9/Ui5A7Fywh8jZw1U7X/Id8un1fH3f2ZOuxMr8eC/L8It5ekOrA==
X-Received: by 2002:ab0:5a46:: with SMTP id m6mr6835835uad.104.1642392930274; 
 Sun, 16 Jan 2022 20:15:30 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id x75sm3708463vkc.36.2022.01.16.20.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 20:15:29 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Vijendar.Mukunda@amd.com, AjitKumar.Pandey@amd.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH] ASoC: amd: fix unmet dependency on GPIOLIB for SND_SOC_DMIC
Date: Sun, 16 Jan 2022 23:15:28 -0500
Message-Id: <20220117041528.59958-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
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

When SND_SOC_AMD_YC_MACH is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_AMD_YC_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP6x [=y]

This is because SND_SOC_AMD_YC_MACH selects SND_SOC_DMIC,
without selecting or depending on GPIOLIB, despite
SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 7a9e45094f37..4aa067c5f054 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -88,7 +88,7 @@ config SND_SOC_AMD_ACP6x
 config SND_SOC_AMD_YC_MACH
 	tristate "AMD YC support for DMIC"
 	select SND_SOC_DMIC
-	depends on SND_SOC_AMD_ACP6x
+	depends on SND_SOC_AMD_ACP6x && GPIOLIB
 	help
 	  This option enables machine driver for Yellow Carp platform
 	  using dmic. ACP IP has PDM Decoder block with DMA controller.
-- 
2.32.0

