Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC61103420
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC5016A0;
	Wed, 20 Nov 2019 07:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC5016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574230051;
	bh=+D2uIbeqX3gLq2l98r1OlLOomSYgnxt/nyrZapJaeY4=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4HZ8r+07GKRbw3qtHILTPGgTtuVrDzx8vjLMjbTdKP42i7zIpU7zxbXbNP74BK/p
	 C8Bj3xQKNAUM7Zav/4YHnm/fISNgITzFdNdlApNlDFjXbXpIs1EAUj0G/CwZFqqtro
	 5/9j9VOwu975uGAQnRDyyDG2kNOdwEjkkPnokp+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E66FF8015E;
	Wed, 20 Nov 2019 07:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22BF5F8014A; Wed, 20 Nov 2019 07:03:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C90F800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C90F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IV6S7D2S"
Received: by mail-yw1-xc4a.google.com with SMTP id o3so13656267ywl.23
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6lgEc4aHXrMDzrrTwjbYqif4GDvgvoecAPUZTUK0d9Y=;
 b=IV6S7D2SQ/6DG9WZRXKipSdDHjafWpONiCuSilso8kh/yxWeCBocfsfLJgJlxafWe0
 kSHOECP+1oQqpBZiv6SiFAi3sMYDp0fV5AUP/qdyaSonZu5PFzPC1tSQmXGYMW5hVX6/
 077pxIp1OpWyuBenmSbyPcyVpcLtjkLMbIHTFkuOQf+6/MrqyEB7+oaJA2bvDqr+qSgG
 ewDZlMR5qNBQkMV277l1dDvyDJ+U7AAHbNkJ6+PMs1k0z7BXKunH674GWQ8MdneWd3K7
 0QlO1QSI0BwF0xLWeOzbDRfIXF0K1FVoKwBAT7x32r89pcw+kITg25eDlv8b1zAYlRLG
 0Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6lgEc4aHXrMDzrrTwjbYqif4GDvgvoecAPUZTUK0d9Y=;
 b=j3q6a4ix39wQwtmtBsxEJudVdtXODfkfwDTNSyPhZbl7yHMYtAFzg78QaT6ZsB7wsm
 IOULarIOm9f4ZHW4KJyj+sqVg9fJw/IyrOVAaXLoiYKc7Gx7xqeBC+txnzlbYs+Aj6YU
 +ob2c5M2Ragcf/rxA33K6TFQP629sG8GUbTLXK/Gq5Ry+3ghDdypOrjU+S8iipaS1aWE
 1rzw4hSSHAAS5FsnR+nxAC5InfWEuzBu4q2k5NVMW3MwYtbclU14fqsWGS/zWOVJUz84
 Gw32aAxUHLFXQsCOtCrcjRzU3Pj9UEP6baIWfa7GS8sUy0PJ2pPeG6FDo2XScA2MKjMM
 zaOQ==
X-Gm-Message-State: APjAAAUtyIdTvPOezohaZtPy2acQjQ+zy8aQKZwuwUeEDaSu4vH32e5+
 bou3uuCFryo55xlKEGWJ1RHIBTdTDlTI
X-Google-Smtp-Source: APXvYqy2AjjGIryOYswWJEUFXn4t0C3qqSFp+URKKXP/kvOO9jcK37UeXkfz7evJC+Pe0j75UJxuf/UTy2iP
X-Received: by 2002:a81:498e:: with SMTP id w136mr531108ywa.494.1574229799381; 
 Tue, 19 Nov 2019 22:03:19 -0800 (PST)
Date: Wed, 20 Nov 2019 14:02:55 +0800
In-Reply-To: <20191120060256.212818-1-tzungbi@google.com>
Message-Id: <20191120060256.212818-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 2/3] ASoC: max98090: exit workaround earlier if
	PLL is locked
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

According to the datasheet, PLL lock time typically takes 2 msec and
at most takes 7 msec.

Check the lock status every 1 msec and exit the workaround if PLL is
locked.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 8382a77586ee..2ccdfb2383b7 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2108,6 +2108,8 @@ static void max98090_pll_work(struct work_struct *work)
 	struct max98090_priv *max98090 =
 		container_of(work, struct max98090_priv, pll_work);
 	struct snd_soc_component *component = max98090->component;
+	unsigned int pll;
+	int i;
 
 	if (!snd_soc_component_is_active(component))
 		return;
@@ -2120,8 +2122,16 @@ static void max98090_pll_work(struct work_struct *work)
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
 
-	/* Give PLL time to lock */
-	msleep(10);
+	for (i = 0; i < 10; ++i) {
+		/* Check lock status */
+		pll = snd_soc_component_read32(
+				component, M98090_REG_DEVICE_STATUS);
+		if (!(pll & M98090_ULK_MASK))
+			break;
+
+		/* Give PLL time to lock */
+		usleep_range(1000, 1200);
+	}
 }
 
 static void max98090_jack_work(struct work_struct *work)
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
