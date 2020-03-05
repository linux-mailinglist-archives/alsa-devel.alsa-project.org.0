Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22100179FBA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 07:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AAB1668;
	Thu,  5 Mar 2020 07:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AAB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583388182;
	bh=yVlWyjwAo9HKaum+EAqNlnChsC2Wxwlso2zSpZJ+K0M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BThb1hJuJWwGwP5R4Layzth4WfySICLTkYDEbVxMa9Df0bYbVi+tqB28esLsJiR9M
	 3WxL0PugbTwnhX5gha+i0JlLlJaaG+FfbiGhJuXVaHoUreXcP8VxixTcJBCRNbXnMA
	 JI3PrwISBr6cjEh38hb0vgh4JRwXlO/uZS9n5uts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F40F800D8;
	Thu,  5 Mar 2020 07:01:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ECC6F8025F; Thu,  5 Mar 2020 07:01:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AACEAF8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 07:01:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AACEAF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CflcryAT"
Received: by mail-pf1-x444.google.com with SMTP id i13so2233222pfe.3
 for <alsa-devel@alsa-project.org>; Wed, 04 Mar 2020 22:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+crT0pBWSfuXBvsoxmaazzTBpnM/2/pQconS/hbBjSE=;
 b=CflcryATJ3b/FURJquNJlND9mLY4WDEwsbNpyJgV7+X7a16X7mWxQ8LoU8cDZI9rdr
 GI2Kc/NheE0BNdceo46E5+J4dTEt6FhdPCD/9gO0tfuLykTDFRmArPpN/mbTc0FhWSOR
 K8cqaftg39gR0DiOX9YBEbpGPVpk8mhT1zq28D/aLfmBT+j6NYsIMjZHCujV5WZTajcF
 xNVleNiKbjEqFlFSm8M11pl4tV6EO2KDNJTTL6oSA5iJ35RQj93hWJbcdOgjX6CPN/uo
 LdTzU/2Exnfr3fgbVMm+Ak1/kiP1vPIUvS+8szG7hJ9coag1Ne9P699SykPE4m8ZGmkx
 Q8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+crT0pBWSfuXBvsoxmaazzTBpnM/2/pQconS/hbBjSE=;
 b=MAfOzW7aBLDMbkTUtATUsP0NkN6Yj0Pti27hmHwctfzyni5/bWDL4+NPxABDqxc6jU
 SkTlIHdancvEgn7vLTH+j+2NzEDtu99IKiS3fyfmqKMxtn0hLZDZi9ZTrpCNScPIU3Le
 Tx5ynY6YQRiYkbKPe/hXumRb+EIo2gMicSLLRklLPMm2GehC1LkodruR0KWME8sT41Nf
 Yfs1qB4Kp5m7NgY+DW0j063nqH7jTKyCn+LWvW0OlsE9/63x46mNSWqz/LaGS/2JWWO2
 Xq+08F4qa9J8aQhrVxTbvFCR3OYHC3gSQDLdINUnW6Wd5oyICMF0nSVfbcC5NWiaDRnW
 KsIQ==
X-Gm-Message-State: ANhLgQ3ntV2NbzV6jLbexF5QllAVj2Kp4HJ5PZJanv2tOsp8zhtdeYT3
 hbUrX3pjZam32ktPolrvvwc=
X-Google-Smtp-Source: ADFU+vvHjIS0y6Haki+xnAkKnWAaibQMrBK4UejzhrMNkhA0XNRzbYHbqwwN9JidnZp/UGRI/O9pUw==
X-Received: by 2002:a62:1dc6:: with SMTP id d189mr6807646pfd.153.1583388064938; 
 Wed, 04 Mar 2020 22:01:04 -0800 (PST)
Received: from sh03840pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t19sm29508372pgg.23.2020.03.04.22.01.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 04 Mar 2020 22:01:04 -0800 (PST)
From: Baolin Wang <baolin.wang7@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: sprd: Allow the MCDT driver to build into modules
Date: Thu,  5 Mar 2020 14:00:53 +0800
Message-Id: <9306f2b99641136653ae4fe6cf9e859b7f698f77.1583387748.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: baolin.wang7@gmail.com, orsonzhai@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
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

Change the config to 'tristate' for MCDT driver to allow it to build into
modules, as well as changing to use IS_ENABLED() to validate if need supply
dummy functions when building the MCDT driver as a module.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 sound/soc/sprd/Kconfig     | 2 +-
 sound/soc/sprd/sprd-mcdt.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sprd/Kconfig b/sound/soc/sprd/Kconfig
index 5474fd3..5e0ac82 100644
--- a/sound/soc/sprd/Kconfig
+++ b/sound/soc/sprd/Kconfig
@@ -8,7 +8,7 @@ config SND_SOC_SPRD
 	  the Spreadtrum SoCs' Audio interfaces.
 
 config SND_SOC_SPRD_MCDT
-	bool "Spreadtrum multi-channel data transfer support"
+	tristate "Spreadtrum multi-channel data transfer support"
 	depends on SND_SOC_SPRD
 	help
 	  Say y here to enable multi-channel data transfer support. It
diff --git a/sound/soc/sprd/sprd-mcdt.h b/sound/soc/sprd/sprd-mcdt.h
index 9cc7e207..679e3af 100644
--- a/sound/soc/sprd/sprd-mcdt.h
+++ b/sound/soc/sprd/sprd-mcdt.h
@@ -48,7 +48,7 @@ struct sprd_mcdt_chan {
 	struct list_head list;
 };
 
-#ifdef CONFIG_SND_SOC_SPRD_MCDT
+#if IS_ENABLED(CONFIG_SND_SOC_SPRD_MCDT)
 struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
 					      enum sprd_mcdt_channel_type type);
 void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan);
-- 
1.9.1

