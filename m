Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7BD2F5B00
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 07:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EEB21689;
	Thu, 14 Jan 2021 07:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EEB21689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610607373;
	bh=RJJgsIGZLViFYIMPXfwdha2uMBpwYY/q05Aul1IJyrY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iK7hdjcPDBU2KZqa26G3RB7czK5HSPdEsjQi0HjFyfFx5y1eWUL9xuJ8WEZ7bFOCp
	 tmUsqd60Xtta1VktHT4cLyv0K88EN0/W18KBIsrydj6Ro3N6VLxND6ZoH44iHiLqfy
	 h8LMk/pwupKorgNrdg8/2RuENu9xHh/8J5oLnh5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096AFF804AA;
	Thu, 14 Jan 2021 07:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E33F80475; Thu, 14 Jan 2021 07:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38062F80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 07:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38062F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ELrACYWW"
Received: by mail-pl1-x62e.google.com with SMTP id s15so2426952plr.9
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 22:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CK5a6fUoK9laud59EzgY0vTTWUjabBhgf/iGUHSlr84=;
 b=ELrACYWWcAWsFy2a70XpkDWOptj8AcVg7qorcWvajv2AMwMhu3dLgvWlNWA9yAtUwO
 qlx/baQm1U69k//c82xgSZFc52lIJwL4VlkEYyTtng8kq2+dumA3ewtFUmIeLMKnCeTE
 0W46BiH6SQR8uOEeCX9cvgShgGmpS4fX6LwoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CK5a6fUoK9laud59EzgY0vTTWUjabBhgf/iGUHSlr84=;
 b=BYzr4QGmBnxrEcDa+5WztakdhBlsLJBZYYvOeGDAGUzpBVEc3k3iKk2n8sW0HtCRgS
 YBKTt89NoOEh6dVselL/F1rxbZ2Dn0UPs6BfD2Fwc+fk2nQo3YYJwd3zBkFFkGxBA8+o
 2Ss49Hto6Rae9fo6rU4Vuuv4HgJu7E6QgInHtE5yCleTq0rJgHuu5dy1V3juU8iefQOt
 Wzt6rjm5eibO2hN85KqD6ds2ScAJPbeQn+8xL7czT6gunIkKBFdizbbwcKp858bWBvhM
 LsGfDu0TCrxCvn799PHKZGV7wjgm2C8QPdPZ8cBgn5L8XPBaj1JEvWBliRUuvgjEVvPf
 cFrw==
X-Gm-Message-State: AOAM533PuiayYNtYFh8V+iWtRcRaAWlD9Tf996/CKNpUYhmkQ2NpDYbD
 5ISaFf7xK7Cn8eh9+6RBVk0WLA==
X-Google-Smtp-Source: ABdhPJwGek4x/wN2BRK4FinpqyikVPDyQ39T9E6PbUP4yc13Tx1iATTT1z6JizyDQy/mmyJuFruMbw==
X-Received: by 2002:a17:903:22c2:b029:de:45c0:69f2 with SMTP id
 y2-20020a17090322c2b02900de45c069f2mr3473606plg.26.1610607264230; 
 Wed, 13 Jan 2021 22:54:24 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id w9sm4182032pfj.128.2021.01.13.22.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 22:54:23 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Thu, 14 Jan 2021 14:54:01 +0800
Message-Id: <20210114065401.3498725-2-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114065401.3498725-1-yuhsuan@chromium.org>
References: <20210114065401.3498725-1-yuhsuan@chromium.org>
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
Returns the error code when it fails to reset.

 sound/soc/codecs/cros_ec_codec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f33a2a9654e7..40e437aa1d55 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1011,6 +1011,18 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec i2s rx. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret == -ENOPROTOOPT) {
+		dev_info(dev,
+			 "Command not found. Please update the EC firmware.\n");
+	} else if (ret) {
+		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+		return ret;
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.30.0.284.gd98b1dd5eaa7-goog

