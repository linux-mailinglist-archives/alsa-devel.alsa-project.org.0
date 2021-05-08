Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CD377082
	for <lists+alsa-devel@lfdr.de>; Sat,  8 May 2021 09:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976361694;
	Sat,  8 May 2021 09:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976361694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620460534;
	bh=L5ouNKImbRubViMUFjNN3cbungapXsd0pRdZBO03o1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S74SSxm5HYM/8H4hyCEqp0t1nkvx3k87R7sA5joWf7iOUng8fSlb9LbwBaaYGhtGh
	 +ieUtYBz71iIvO6bXYuOfl6bFizD89H0qDXwHSrLl4iUNpVCa62P7IhHVKqZzjg0Rn
	 ttwyJeTvc6mhaPg/VGlHcRaQywf6fh+tF1cw9/p4=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A1FF8023C;
	Sat,  8 May 2021 09:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20501F8021C; Sat,  8 May 2021 09:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9320DF8010B
 for <alsa-devel@alsa-project.org>; Sat,  8 May 2021 09:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9320DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XzbrTyXs"
Received: by mail-pj1-x102c.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so6707778pjz.0
 for <alsa-devel@alsa-project.org>; Sat, 08 May 2021 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+LUtwfRs66K7/usQVNOuvgUZ6bVUtHjhJJe+YZ0tm4=;
 b=XzbrTyXsIlZx9V9LAzHOxJrO+jh9aLJKwppP2Nt9laYQ+LNhzh6wrB57Cj+dGr7deP
 XHxqWIA8tICdBbMisUzEyQiWjL1X5ClxrOJk49vSLdo3Bbsh10Ly36w56q+cWMdXMWa0
 wM5WTHq1uoDYuKILe1IFvWycmLPNy314FE8QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+LUtwfRs66K7/usQVNOuvgUZ6bVUtHjhJJe+YZ0tm4=;
 b=sIRLrOrVK2wyV9Sg3jD/mhrRaxQtFfkeZwntYU5032sP0l177xBMO9+L009hIMbpFU
 9fIB465UXHpRC1S1L4+hLhbw6UhuNUBLwLImfVvu92b/W1m2fK/R24wIgz913YvSi7Nr
 5tvBJ4voK9TmMdlbYGzeKmAGAXyzuml+WR/VNOWrIxUy51HifMIIV9RFc3y3JfqD1Aad
 F18ASNFo1lk3Htt+PRYVKPr8pQRYEBl9kjmv6Ae36XVLAM3RGz410EjISm7v5Rlvt8QM
 mdmN5FzlYSIuQNPmix9WJ2rvXqOBX/cMJvrdvXfqL3byf3/+I3bSwVuJ750rbhpsateF
 +Bew==
X-Gm-Message-State: AOAM5310HoJ/gKUF1Eby39oioWiI/yYJ9o7dOUS1k5lDGLe01H24/VOO
 GexztNLG5rYTKBChF41KkVrq2w==
X-Google-Smtp-Source: ABdhPJw1M68FCMCBHQWrUE9x47jK+e4cOkD+yJZlFNG2fSj5vu+SjSzR2lLT81gpnUIqLeunnKxQUw==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr29138284pjr.47.1620460314132; 
 Sat, 08 May 2021 00:51:54 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id b65sm6345091pga.83.2021.05.08.00.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 00:51:53 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC/PATCH 2/2] ASoC: rt5682: Implement remove callback
Date: Sat,  8 May 2021 00:51:51 -0700
Message-Id: <20210508075151.1626903-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210508075151.1626903-1-swboyd@chromium.org>
References: <20210508075151.1626903-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Shuming Fan <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

Let's implement a remove callback for this driver that's similar to the
shutdown hook, but also disables the regulators before they're put by
devm code.

Cc: Jairaj Arava <jairaj.arava@intel.com>
Cc: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Cc: Shuming Fan <shumingf@realtek.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This is totally untested, but sending it in case anyone is interested.

 sound/soc/codecs/rt5682-i2c.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 8265b537ff4f..52a6fc56a232 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -280,6 +280,16 @@ static void rt5682_i2c_shutdown(struct i2c_client *client)
 	rt5682_reset(rt5682);
 }
 
+static int rt5682_i2c_remove(struct i2c_client *client)
+{
+	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
+
+	rt5682_i2c_shutdown(client);
+	regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
+
+	return 0;
+}
+
 static const struct of_device_id rt5682_of_match[] = {
 	{.compatible = "realtek,rt5682i"},
 	{},
@@ -306,6 +316,7 @@ static struct i2c_driver rt5682_i2c_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = rt5682_i2c_probe,
+	.remove = rt5682_i2c_remove,
 	.shutdown = rt5682_i2c_shutdown,
 	.id_table = rt5682_i2c_id,
 };
-- 
https://chromeos.dev

