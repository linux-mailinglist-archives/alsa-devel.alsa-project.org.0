Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E3213239
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 05:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C83916D1;
	Fri,  3 Jul 2020 05:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C83916D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593747122;
	bh=r87HZ2kp1j+Ttfjp8IFuaiDWNmMwgjjqXMVUNSZLr3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DCHtAJlz5VkLMk55vnheXkwkiKJahxWRcNBlCVm+HQUmFBJkVSortJ+3LV+XbSykO
	 hh1eMh5i0BQw9yDsQ/oO7C+1e7EFLeCPtaleEmPdTXodrZWVQnxxeMLdk3K81EaJLG
	 Spo+zNjdtZiIz5to7kt4p1HXGmsu2foPEWeWe378=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B0A5F800E2;
	Fri,  3 Jul 2020 05:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23B89F80217; Fri,  3 Jul 2020 05:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB604F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 05:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB604F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iaD8iCHT"
Received: by mail-pg1-x541.google.com with SMTP id g67so13563456pgc.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhHWKWz4+7rswG/cVf5u/2XBys3C/A1wtkJS52atwvM=;
 b=iaD8iCHT2tH5aaetOxDpmb+hp2NNKCSgqWir0PneWlfh4jPSqWmG3Fq/6hs0On7hGp
 gI0BLO0U6dRmbAGhJjcsNID08E0c6sOnvn+Y0TDwzf4kOTQ8/QUp/wdQzgZVNfTKxMpZ
 pED1PF+Nfrmmp0Zu8JYR/O0h5j4QoT8142OiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhHWKWz4+7rswG/cVf5u/2XBys3C/A1wtkJS52atwvM=;
 b=iE17BjoRtknB+pnijVNqHOqqSIk9UNvkuwAjavKcqMJ/PouWjlXQF4h5t8WmCeStBj
 yIxxeeXFKxRWm6fSJ5X4IIgmwfRqSWgVi1rVP52LO0lYPnw97U9JJ8G8Q6cbjZcEGh3T
 IANarhK4Rvi8Lixh6ZY76UvKikEjjSB4NmtTIjV9mOBDFL8trGgHW1CcORnVH8dN4KWO
 f0MiaJZrblMqsHTJ21/02c31BaAmAB+bHdNsa+mlPR/8CyhmkuYbw3yqWZe4/o++qUtt
 n1RrywObo5EdqagOYRRsSq4UMJ5oY5xgzD/KOCswCOvlPn/0zOpf7FmSvgzNPe+Vy+uc
 NcQg==
X-Gm-Message-State: AOAM533FfRVfulyqsGjLug6me7abt3QiVBLSOT8RMvSI5HN5XE6yd9T1
 Ozv8JNoUMZyLQfhyDMslHSPUIQ==
X-Google-Smtp-Source: ABdhPJwOdorMAP4NfsHg8xE4MqSzD2/7knFWxWKzUNwHu1GYKFX+989l2/Yd0xXOGX/+GHWBW8hGOA==
X-Received: by 2002:a65:448c:: with SMTP id l12mr26586535pgq.234.1593747006589; 
 Thu, 02 Jul 2020 20:30:06 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id 204sm10372466pfc.18.2020.07.02.20.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 20:30:05 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: Log results when EC commands fail
Date: Fri,  3 Jul 2020 11:29:48 +0800
Message-Id: <20200703032948.2185290-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Log results of failed EC commands to identify a problem more easily.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8d45c628e988e..a4ab62f59efa6 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 	if (outsize)
 		memcpy(msg->data, out, outsize);
 
-	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
 	if (ret < 0)
 		goto error;
 
+	if (msg->result != EC_RES_SUCCESS) {
+		dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
+			msg->result);
+		ret = -EPROTO;
+		goto error;
+	}
+
 	if (insize)
 		memcpy(in, msg->data, insize);
 
-- 
2.27.0.212.ge8ba1cc988-goog

