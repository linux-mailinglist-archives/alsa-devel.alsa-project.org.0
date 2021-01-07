Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B942ECC29
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC4F168F;
	Thu,  7 Jan 2021 10:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC4F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010126;
	bh=jDEfG+YLBCMi1arDmXO2srcUQsVp5mimFD60RG16w58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XW8e5FQa1rTVfjhaiW9VpcYNWdFY6Gu0Gg0aBj13xk7di4tOoNluCxLmsydX8YwOa
	 A7Y4p0ooi/+n3SsIahgYwQe1PDsvKTwcaAZzhVCE5sLNlVhqAoAkwnax44kZaUdCik
	 iLlvzl0UCBb/6MdNpblcr5uR6Drn9pof67khnWBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8CF5F80268;
	Thu,  7 Jan 2021 10:00:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 614EDF80268; Thu,  7 Jan 2021 10:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEE8F80268
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEE8F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SVJKcvr9"
Received: by mail-pj1-x1033.google.com with SMTP id v1so1086319pjr.2
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgk0TCrbfrPPwCLQFrB7xrsoIfDGu1gFurEi0wsLYw0=;
 b=SVJKcvr9Izh4sNUSpK6YEtczrCVWRg6wTpG7q41qHhdCkeMm+Efzi6nwWrDDlZrzD2
 xV6UIRfzfTgjd+dQNkU9PQ9IO0xnXPiptG/pB442Ha2BDDWDopILjcKnm0cQ2FSwRmvG
 pEuPHdSbikE850NnUNOre/c2jNp6n7QVqELH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgk0TCrbfrPPwCLQFrB7xrsoIfDGu1gFurEi0wsLYw0=;
 b=YyRKfOXFgtUbSiAtemOqn4m3wUsGfSv7bHcl7iJgGccIXB7P77uU6TeP3X42X5dWZH
 m1OaFBteZZdJxjclAi/rbBzQpyHgX9V7j0vh8CxVOu8/L3F0GRnoaluJGE0AN4ZTy2G0
 H0lxhadCk+VVAk67STk2LxjS6gn3uuK+zaOJ5xjFnorFkaBZkMToWl5wlhDcgsnztHgj
 NcPy4fvy4ZKOj4D1m0KpF+ISq/Rq+5w/tbmrOhJR7N+GgdyIDSBgKbefrx2M9ksfY8e1
 kjwTlYuIs1jcg2WRbiIdyUXV1Y6O5rgaxMsf+9F74k/po9vPAUhFa+72HaHdV8dcDwyt
 Phyw==
X-Gm-Message-State: AOAM530VG6nWjo3uTiXPOqRhyDH7ZTV9yUQoAlreEJgi7sO4zGuQQ91e
 ODirRO1ln2Mei1tZ/fkH9TrV6g==
X-Google-Smtp-Source: ABdhPJzpH4P9q/xGWMBgmLDqzAzIVGQPN/gilgSFIZSJyC2/avLxAiq63WQ/h8cZCBvxrHw4OgKCrg==
X-Received: by 2002:a17:90a:c396:: with SMTP id
 h22mr8438394pjt.84.1610010011464; 
 Thu, 07 Jan 2021 01:00:11 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id v1sm5679450pga.63.2021.01.07.01.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 01:00:10 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Thu,  7 Jan 2021 16:59:42 +0800
Message-Id: <20210107085942.2891525-2-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107085942.2891525-1-yuhsuan@chromium.org>
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

It is not guaranteed that I2S RX is disabled when the kernel booting.
For example, if the kernel crashes while it is enabled, it will keep
enabled until the next time EC reboots. Reset I2S RX when probing to
fix this issue.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/cros_ec_codec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f33a2a9654e7..28b3e2c48c86 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1011,6 +1011,13 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec i2s rx. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret)
+		dev_warn(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.29.2.729.g45daf8777d-goog

