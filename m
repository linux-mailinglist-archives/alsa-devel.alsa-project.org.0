Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B5434A6B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8806F16F9;
	Wed, 20 Oct 2021 13:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8806F16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634730260;
	bh=+uqI3uKDE2ftrnNmtB1IbdgWftRp5aWx1D0aUBrAZZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBJF1n5/wphjZehzynRAqr0XC+qWwd0Fx4OzFiaeIKQRqRfVu7gtLJDcU93nQvWvl
	 MozjPItNojoOnSz+CW0XzSVwXHHEYXHCwJVLMZpK81DG36fCB/mn11pOyJzOT3/472
	 c3DPplfL8bxUZPDpGahgZky1pQ8VsA5lRbhJUOAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D48F804E7;
	Wed, 20 Oct 2021 13:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A1F7F804E6; Wed, 20 Oct 2021 13:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005D8F80224
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005D8F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="u55djidD"
Received: by mail-wm1-x32a.google.com with SMTP id v127so18293390wme.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7BaCPl7ldB1ZwnXu9KWBTtfoIsEu4irOp5YwoZvuko=;
 b=u55djidDImSvWmabo3H/RI86RvhRx5S+vRIn6uS3PLai+eMcGfgWgqjAc5X1X7nIRx
 BeCJ+ApJyLT0yLEH7PzBuqKUIJu19kA0ZD6PqO6Zvd4No59psrhLoBHOdtzpKAHeIFLn
 FrtrA5DMr8pA9X8PQJGnb128ahr3EaaLqXn2dsO2GJKUsJCMX8XeBPsvouyPkR3K1opV
 cMTmq6bUXfGXPO7QioREClt4BpjSzNRBWM1/bWUq7yzQREUOyT1fInftpWSnfzuRPqGh
 TPqfC3A2M/RxohNxeXWU/WqrkjOTXeYhEycLtOirzlWR1G4xeRInWTa+ILeKHlFcqnf+
 3s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7BaCPl7ldB1ZwnXu9KWBTtfoIsEu4irOp5YwoZvuko=;
 b=do4dBudSd9kv2Q/Sl8pbvmSfpzDVvk3WzFAIreto9scsyVh9GkD+maMqBvFzCFHBxC
 LtVRsZVsWLOuAyO0WL0UJS6nJMtF6aJntmRAezJ/0jpMisrmwKAx5tZFqKBT4yMEgFwu
 vKmBlRMXHjiICWkT9JRzBsdqVna/a+pISyYVXJe538WHZOVRpRaQmN1NwUZixDX+qfA5
 i93F2As0Mgp5fzvkYiUDAp3eLRMynFen6OZ5Abc3Hb9q3NXSBa4YU+4RF8g5fSrsUphX
 5ygwNFDARWvUarEaw6AiH3WfGnkydN9TiG1+40Px2AUCgn7BJ+OrV8e0KY65BVHoZXoT
 DpAA==
X-Gm-Message-State: AOAM531Idb+MCTjtdgQJXG2gj6H+Q4G+NJW54lBwhwAgK+7DHMg2s4RV
 2zOX8fCuyDYyBjTuPewYiHQj+ueyjoQ=
X-Google-Smtp-Source: ABdhPJwXjUAog5s0d+VefQsRYQGeWGpLjSU51iVC7OGHVSZaoxF85rQlqGR/4MByRa8qJpq8pwXZzQ==
X-Received: by 2002:adf:c70f:: with SMTP id k15mr51845987wrg.98.1634730153564; 
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: axg-card: make links nonatomic
Date: Wed, 20 Oct 2021 13:42:16 +0200
Message-Id: <20211020114217.133153-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Non atomic operations need to be performed in the trigger callback
of the TDM interfaces. Those are BEs but what matters is the nonatomic
flag of the FE in the DPCM context. Just set nonatomic for everything so,
at least, it is clear.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 2b77010c2c5c..cbbaa55d92a6 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -320,6 +320,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
+	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
 				   &dai_link->cpus->dai_name);
-- 
2.33.0

