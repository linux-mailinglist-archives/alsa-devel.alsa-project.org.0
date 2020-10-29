Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB529E532
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:55:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 772E41690;
	Thu, 29 Oct 2020 08:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 772E41690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958101;
	bh=OwiIhAML4zA3HbWp93vzpABDWcLSvS5lfwUHPew2Xss=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4SAGCSBgVnfpzKnVHmKnUFvk6n0jUcOaFwyKPk0+DxSwpn9h9WFX4YnzpE+8sYth
	 p2qHdmfwkOodMpr6sPAf1pmG7lnMAiKDaRkSZKeJ5Ur3SQbse3EjGdmHjiEgMXeYIu
	 VxOlIZPQ/ogczE9P8KXK2pkq2twpdOp7N9YfyXEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB46F8050F;
	Thu, 29 Oct 2020 08:50:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3E81F80217; Thu, 29 Oct 2020 08:44:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15BDFF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BDFF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bdYT7RCK"
Received: by mail-pf1-x442.google.com with SMTP id e15so1646178pfh.6
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYt9DPsIOPNIqy5dqkJ5lCLLGf00bKzjgHV7/FKrm30=;
 b=bdYT7RCKiIF5bBkrbTYntlKdOqtia2YZXQxKoyrwimF4rI/i2LTRqUQwxtRz0JGJOK
 pJRd47FrtAMSOfTJ2MDoZXbTvtK/dw/1a/SMrHOhliTQlsu7NLGPDe6FLeTDqqVW7Zwd
 /u5vQxnES6QQW3KTbWdE8TQmp5yzB9TOuVCV3+wQNH26bIe0mim3pCggXrQDZPepbrDj
 239M/hFcPQOtqluGwkNXrQv286qOU6i4dX4LxERLdXOOYNY6SiEjhAywks7briuClUVH
 t2adBUU0kc1uK5VE5F5nq3FcryezcqR2epcnnBlciA/4MSZsn0D9Xrcl4vkglSHi7Slh
 KLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYt9DPsIOPNIqy5dqkJ5lCLLGf00bKzjgHV7/FKrm30=;
 b=Mx90f7xbFZXqjiD1y3oBGUPVa9jCKcYW62+sxyZxpDm7eeqNde+CxenTVl3IFi4MnL
 OB/bAwbHA0SvMZNCJTT7hHfh8Q8HCFmotQL8nuCCM8Wfu2hX40DJnh6zOEkHIQdhxat4
 88U+SasXC99XD6f5HjZH8U1+bF6cIn0nQ07ggjWBzrhw+SW3FEI5UzwwBjR70Qz8kXeE
 gLmbgqn8/h+7+FneIKOH7ChTTsGq3sJ7yTkkebAkKpuAgV2UTCs+MXzrOsw59SVvQJ9s
 7+WerIlsnj+3gTkIa/+hTiRUGw5wZUqz3sp0ROCPC6JoeuWaFvNEnxZMpCjXvbUh7/tE
 U1uw==
X-Gm-Message-State: AOAM5301I3e61KIGqn5aWL6UIb1dSfAGOOkam9Vyk1OhIDtpw7pi75OU
 cKDMChehsoSx3c9ARcmDjWo=
X-Google-Smtp-Source: ABdhPJzgm6erpGiPMEQPgP+rXdOPNC3MCgogID7xTCjo1ei4Pu9gFwMcSe9ios3QobaPjrqK6DtEcw==
X-Received: by 2002:aa7:815a:0:b029:164:cc2e:2c56 with SMTP id
 d26-20020aa7815a0000b0290164cc2e2c56mr447859pfn.21.1603957460017; 
 Thu, 29 Oct 2020 00:44:20 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id f8sm1541140pga.78.2020.10.29.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:19 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 11/25] ASoC: hdac: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:47 +0800
Message-Id: <20201029074301.226644-11-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "moderated list:INTEL ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/intel/skylake/skl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 8b993722f74e..da32d68080be 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -322,7 +322,6 @@ static int _skl_resume(struct hdac_bus *bus)
 }
 #endif
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -400,7 +399,6 @@ static int skl_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_PM
 static int skl_runtime_suspend(struct device *dev)
-- 
2.28.0

