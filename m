Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F31052ECC28
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83BDF1674;
	Thu,  7 Jan 2021 10:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83BDF1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010106;
	bh=vSS48Gc1qH6W3Dt9qEwjThJMepPqbKkGMCTFOIfcaec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i27XOH/lms+nBh1CQZ3HiAZ0AHM04xmFYvNsIu6k+axymFaHz3gw6O8JoJRnQbAdt
	 rBTel1M17OkHjmxlJ6WsSC5F2/fgJhlK/2XleZ59rRlhJZ75PcQxB+xMojz5IFkuiC
	 rmauv19UUGyy/sBvtQGBbCGLG2ZsAG2gDPHN2eG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3616FF800FD;
	Thu,  7 Jan 2021 10:00:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75DC2F80258; Thu,  7 Jan 2021 10:00:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2AC2F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 09:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AC2F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="jGRRdH14"
Received: by mail-pl1-x633.google.com with SMTP id b8so3174115plx.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 00:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3NaOaWtyXj/T2ptk32bEzgFjNq4o/HFyZv3dYGEEcI=;
 b=jGRRdH14K3aDVKXx595sg3CNZEVnLXEVL1uW7eWgv1MRfv8HAV1dEwfaGK6nTYzmZ7
 hD+JvAI//dEdPwfLoZ7SYh/MX5PAACUktO8REpO4hicl77QqW4BfOWvNQX8rQxvI6A2x
 /3+RKZhj3uWUAo1Qb5C35FS77lRTIRH9O52IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3NaOaWtyXj/T2ptk32bEzgFjNq4o/HFyZv3dYGEEcI=;
 b=VqilmnON0Ethp84UFZP6mbnFB6uQotplZmO+3wZQFBiF0COGOUNDEXjIGUhJm1xcY0
 zUYE0vgzSxuowIYwHyw0I8k8FqYGQN+8TsYl/Vb46pDiv35rKgVnFmxTmoTIf6u9KA8R
 n7QRhEMxM+9cqOCLKrJe6fhgF8IfdRCnb6kg6za7ngBzxqQ5DHOUZpAMZ8u0DZAOQEZu
 TeuKgP4lrHi0T6AMnEFywnyDrHpWh1YJowBZJeqbcy+bmgc/21hsGHzSC8Oi9vdjit5o
 /bL9YbBwlXgHgPRVicqA9qH3RF+drskX/5hf7BQx/ooLDwyDWBVB9pgkcKU6qJ+lcFVy
 YBbg==
X-Gm-Message-State: AOAM531IszTY6zXuvLxfULp1i0pDjOawYaO5yuTM47BjPgVgX/WBkEij
 2Cn95L6MXZpKylXjAPSsFBZiMw==
X-Google-Smtp-Source: ABdhPJyA0M2EA1aG9AE/yZzNcyq5SDQXjyuMgt6bdQxEssG6sOZsHJQebAGRuxERBk3E6lTOdfHkaA==
X-Received: by 2002:a17:902:7d94:b029:da:f673:18b9 with SMTP id
 a20-20020a1709027d94b02900daf67318b9mr8264217plm.37.1610009992592; 
 Thu, 07 Jan 2021 00:59:52 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id w19sm5335474pgf.23.2021.01.07.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 00:59:51 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Date: Thu,  7 Jan 2021 16:59:41 +0800
Message-Id: <20210107085942.2891525-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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

Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
which is used for resetting the EC codec.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 86376779ab31..95889ada83a3 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4600,6 +4600,7 @@ enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
 	EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
 	EC_CODEC_I2S_RX_SET_BCLK = 0x4,
+	EC_CODEC_I2S_RX_RESET = 0x5,
 	EC_CODEC_I2S_RX_SUBCMD_COUNT,
 };
 
-- 
2.29.2.729.g45daf8777d-goog

