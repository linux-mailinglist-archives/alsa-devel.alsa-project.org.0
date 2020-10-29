Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1E29E51A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:52:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB71A165D;
	Thu, 29 Oct 2020 08:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB71A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957935;
	bh=Sl4LEjyqv2ejlShcI1UnhB70Y5TNAbUomAeLOuIR48s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6507gNZFTHnsvs15c5GQG1iWHeob24L4SHKI7cQ30LIdxXaWAXAcJRllNztDECaE
	 g28dGIz7QdnzdkJ7SWoNVnV93FV5PmBqgzXNCQ48gjVb2roDxwuRkRJ9CatbRuaq/G
	 sVMR0UPXyb9qvcJCZgPNaRVU/hBT+1gS/ae9HgQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D592AF804C3;
	Thu, 29 Oct 2020 08:50:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E227F8020D; Thu, 29 Oct 2020 08:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 361FCF80217
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361FCF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ImwowdAX"
Received: by mail-pg1-x541.google.com with SMTP id s22so1639548pga.9
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8u+cDEJ8AUe2fZreqSM2kctIiSNg1XEO6m83AlYJL7M=;
 b=ImwowdAXgeuskRRBCZOSYoc+noyNDsE7KVpUYFOdB/iwsNWyxeSa3KG4jvkGkcrbqS
 W+5ku5C1hxDug2UmHCXShNUvqJ/yinRCbh5r65F52i/HjK5RvAreAYThIwDpqH+neJu6
 qpLFLZfK3jNXX1A1NMJVy/f0XZcdks4BvDt7R9vRukBulBng8L6ExJT3saGcHY6Uh3oI
 HsSCwfEifi9SFo2N69TZoYyk31UBMqzsA9PiDn7sKI9BluMdq8TdPurU6JyCVqJkM88+
 g8HT//uvrMOYWqSv9fuIwhlvIJnwGhv3zTAjrOu7hCBPbCDtn4SK9gK0vU41eeL5OsFN
 m8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8u+cDEJ8AUe2fZreqSM2kctIiSNg1XEO6m83AlYJL7M=;
 b=Ncr92cz/WfcqKzt2EzF6gBazcAjE75X6bhWi3lEmRO0WbLt9jNlNpSNn6zh9iFyaPO
 xu53S+sG9P2e7nC9bayVQVJrE6GDEU950hMp2XlW6YvAwpjXskwPDLsc0oxixr6ZgxZL
 6fEUl4FUzhFpl4LFB3RRcl6cf/tjULdWnk6Dq2/wSgHHtV1Zi1Yd6CkcNujhAfm0jpsz
 2aCzlHHmniEJtLWWdxpa5lSZpko+6kwqxfTguI+v10BPF9DqYiAb8hrYtGo5TNzwrQqS
 K8mEWcbd1A8pw5/gqGDpfI2zYjnnPqyhK8JOzQPaqF1B5eQ9WAd8bMpaDjDE2Z5qr6wd
 ETWg==
X-Gm-Message-State: AOAM532tZ7R50dCEWJss/Cxz0pNP0zYCkV8Il6gOzxHGmwySz+pYMrr3
 iYjBffk/8gXn3miIfluteC0=
X-Google-Smtp-Source: ABdhPJw26LSjGJv0gkcHfnY3aVLwVaP63zCatI+cHlBpP4L5G2DQaRcfDxL/I3kfzEgHZfcdG92f0A==
X-Received: by 2002:a62:1c8f:0:b029:156:6ebd:3361 with SMTP id
 c137-20020a621c8f0000b02901566ebd3361mr3272158pfc.42.1603957417705; 
 Thu, 29 Oct 2020 00:43:37 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id b142sm1872361pfb.186.2020.10.29.00.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:37 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 03/25] ASoC: fsl: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:39 +0800
Message-Id: <20201029074301.226644-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: "moderated list:FREESCALE SOC SOUND DRIVERS" <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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
 sound/soc/fsl/imx-audmux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 25c18b9e348f..6d77188a4eab 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -349,7 +349,6 @@ static int imx_audmux_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_audmux_suspend(struct device *dev)
 {
 	int i;
@@ -377,7 +376,6 @@ static int imx_audmux_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops imx_audmux_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
-- 
2.28.0

