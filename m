Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696A2F5AFF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 07:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E501E1684;
	Thu, 14 Jan 2021 07:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E501E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610607363;
	bh=kKyKa2DlKb7CQrMFXJzPA3t9jQRiyLtA1AJejdEySQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X3x/GsN+SFpdt6C/TFeD+FTTlwg4EgR9zUZStgVe4yTSpAPH26tGnkhCEenPHIM0L
	 NATTWDxj1scynoB1JLnAq+MKMB5oWdBJD6Okj8rG83ZSGUi9YvBHtkLmcJ4Nd4CNYR
	 o/q+AlNd0+rNGKajq17mo89fOjXBhPKxkHd4OSOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4529F8026F;
	Thu, 14 Jan 2021 07:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8279EF8025E; Thu, 14 Jan 2021 07:54:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCF32F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 07:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF32F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GPQmUe3t"
Received: by mail-pj1-x1033.google.com with SMTP id w1so4201724pjc.0
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 22:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HYdrT8a6f0LVSrxXK4xev5Rwn6hJkcTFQFSmJHarTgc=;
 b=GPQmUe3tJSZOpSWj3nAIihyHt7k4kvtbsPU2joLTvlD2ckj0+FMJwIQQXmYl4Y0ApL
 nK5A/6/goVzYZk72RJ2l9KC1h1YLZ3G9op1AI/mHwsCm2VzGKXwkUxoSggXPNNmRP8aF
 diDUPjvT0etWQeNOwTAsQpnPeWgj6Xvt8PT+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HYdrT8a6f0LVSrxXK4xev5Rwn6hJkcTFQFSmJHarTgc=;
 b=X9SnlbCp+qWjYl/f9oeI7InbJYINm6dM7PXB/hIoVTFm1vQglt39Jdd6x0Wv2OJ136
 7Gc2RbLZtV8lwv49JI6wDdgYhMi1CdLRju6HQHYoAcePpMPze2YMR3e8HkhYzT7S57ql
 Y+OF3YxFhb3YAYTYhb1pjWqr73RklaeXL3bhSXiCr7aLWtKGUBV2AQqExLI7BSANdprh
 msyF9ouh+9AMBq9tHOtLWMWrlJoCgtreJIjmAwXysO65yZqGzIEQh/TqcgKtYIk5o9hG
 YLuQiIx/p8ceBQYtEYPuSNUMuzdtagWeWjBQgLGhL+kZbSzWi9KihuTLeokTKVABle0L
 ubRg==
X-Gm-Message-State: AOAM531D9IxEYX1baaZIwxWWznpBNuav4NSIcZOPqvNu6oaC+r6CTRAm
 7MLk5nd5Yi0z7Ns1zE4FO2o1Dg==
X-Google-Smtp-Source: ABdhPJz5JZJR4nRH4Nfg1e1npHnVc4s7TRpx/+nEC/kJ4978coxtMnAOmGwm2zmQ1iW3USJMp89o5A==
X-Received: by 2002:a17:90b:31cc:: with SMTP id
 jv12mr617846pjb.213.1610607256940; 
 Wed, 13 Jan 2021 22:54:16 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id a4sm4483186pgn.40.2021.01.13.22.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 22:54:16 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Date: Thu, 14 Jan 2021 14:54:00 +0800
Message-Id: <20210114065401.3498725-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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
2.30.0.284.gd98b1dd5eaa7-goog

