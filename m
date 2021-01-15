Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4B2F73E2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 08:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E1C17B4;
	Fri, 15 Jan 2021 08:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E1C17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610697303;
	bh=HQQXAjY0KkmMSUtsKyOlTbkxGud67JSesr3fAQJW0CA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kog4hVCKgISgKjMgi+7StP8QCkd1vgd+L5snpqyv2K47v3Z14PdIDeOAobOlEfV0j
	 +GggyEC0y0YcCvwOC4GIqlBgpB42LMFmEEXLEm6sP8y2NCKrbi43gc5NDLA3MuIyAN
	 JBcgp6PAdvZxuYvORVEGfeIbmU/+sI8DwnLQtyJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DA2F801ED;
	Fri, 15 Jan 2021 08:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 980E3F80132; Fri, 15 Jan 2021 08:53:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAB09F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAB09F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QY5+gDN5"
Received: by mail-pj1-x1029.google.com with SMTP id v1so4610007pjr.2
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 23:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5rUWYQ53xu61NYNf2N+FFBOArG/WXlQJYbUH9t64RY=;
 b=QY5+gDN5VQmgj0lztLbKDumIK/YeAPPVjlWdL/rFU1w9qbzynU4Vphn6xB1iU6o8wW
 d5IoDMDjioobQNWqXJWuFc0WOog6d4CPrd4GdV2y738jlOKlp9d9/pGHaR3ZFLYx3KR2
 3y/AL+XvPl8lMkWBbmTwBNeNuPnSHeoVHt+Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5rUWYQ53xu61NYNf2N+FFBOArG/WXlQJYbUH9t64RY=;
 b=ue53GkZaZESIKnKz0qVH2XmG5H88FultkA6Cb8RR/fyKQ/TE02xcSqXllINqH1hGve
 VIyK/jYmTdcSiABr2AOOvjHK4RclgHxZJ5/JVRNeIMOLmuPrjSonCQzsggEXH+tGlBiy
 RfvCSjl+lxxSXRehhzUWCI1qpTbbE2cnVdfJ27IxvAeyi1yiYl7EHgw5WFKZ7700gU1J
 55JYag/6nbCIKrnQzsJr1eAMTHuOOGs2/YXvad6IXYe/ZBIh9ZdXr/+4RGso10fuouuo
 R2I8ul0+1/kWtqrSOljyn21xoHJAslMoMXmocCeGlMsy6rFlHP7W/N/N3Tl/M/b3ZESM
 PM5w==
X-Gm-Message-State: AOAM533ux3pxeynJpGrBgw3iEoEVxVLTZUJBXSudt/nJvs2S+2yfoVB0
 T+0reSwFHCP3JMUEihq42l9v4g==
X-Google-Smtp-Source: ABdhPJzhirIDFWw+9irQUOwF9CKpaqpYnbavJoyZQgwKjRnVwoHcOgNCZOjMIBDbKCCCuYIQTE4C8w==
X-Received: by 2002:a17:902:c155:b029:da:9460:99a0 with SMTP id
 21-20020a170902c155b02900da946099a0mr11443829plj.20.1610697189811; 
 Thu, 14 Jan 2021 23:53:09 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id p3sm7113402pjg.53.2021.01.14.23.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 23:53:09 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Date: Fri, 15 Jan 2021 15:53:00 +0800
Message-Id: <20210115075301.47995-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
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
2.30.0.296.g2bfb1c46d8-goog

