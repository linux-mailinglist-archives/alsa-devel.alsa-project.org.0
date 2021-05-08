Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5B377098
	for <lists+alsa-devel@lfdr.de>; Sat,  8 May 2021 10:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B1C42;
	Sat,  8 May 2021 10:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B1C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620461300;
	bh=CDK816gb+ascPVi9hHY9IuOu9wDolopS0LS4CH3VdZg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Og5C42pGgTnpVHq6om59kX9yhRX+JV0EpIKpXKuQXIzy9S/9p8JTfFCud69K0J1WE
	 rTcFFOWDSHI4l2QTFjlhhJrcaIxesjg7Zm8wzMR6Qsuu8mjpVnjaZpivMyiycKFuye
	 7LoNoC3FNwfgqKBMU77vz2F4Rfo3IYBErktGTBN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 733D8F80234;
	Sat,  8 May 2021 09:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA92F80234; Sat,  8 May 2021 09:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 454CEF800E8
 for <alsa-devel@alsa-project.org>; Sat,  8 May 2021 09:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 454CEF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="A+qUdMSv"
Received: by mail-pl1-x635.google.com with SMTP id a11so6397358plh.3
 for <alsa-devel@alsa-project.org>; Sat, 08 May 2021 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pxp734UlOkRRxunoHCpwvTPDDo/epCxir06qlJaIU9c=;
 b=A+qUdMSv0ZBpGuTwDxnlbJCY5Q35JWOwTnBzzuyRxwceC6c7WBDKIpmWtjrKyikp+1
 Ea/HwhjKjM8Tdlm5XEoQn8i38S6Ow7jM+PmnNK2XvTV81bybiUeXl8HnqIHcghgi6gmk
 wNPkPDMJFEGkmekhT8+aoQP4ylGIdkZ2ieC0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pxp734UlOkRRxunoHCpwvTPDDo/epCxir06qlJaIU9c=;
 b=g1GkcLag3SgUJVzvmpFC/TYt20w24psa4lqQ0aR7TEYR1nMMHG5jgulcGpFuouzTaV
 rySwZn7zSkw/df+JhPTN9YBlaX5j5+MBXTL79fSIh1SMxYDh0ig/yO6GRZNxYUkWuJ8B
 SQve6ZQnudjMno/gTTp4Iz2E7JTyBwnaIHtbT6ONInXtc2+BKC+RatJh9P7bz09B9YlN
 w1FGo5yMBfNWqmhx42Ng6kJF9Nh/KMWLjaa+69MHbVSJ6OTy0oCKHANRwpofSS7N7a8c
 b+xoqedkSrLca+nfJzT/LFU+g0vy/+I4mMb96tfWsixb54rGz09mdJYcLqZQ+0LnEFlr
 mNKA==
X-Gm-Message-State: AOAM533z+eitYYsgsX7iIPsIpLRgDmvhW5/CtjDcnbAfyfKWsLU5KIJs
 x+f10qVtA4i1Ym4nkRBEkWsYOA==
X-Google-Smtp-Source: ABdhPJxaBMAzmyl39VfTVwVMp2YZpbT/F0pm0xyG8G2PQRr5Psju/7ZCbR7aahhd7NmJJu1e4pdzQA==
X-Received: by 2002:a17:90a:f694:: with SMTP id
 cl20mr14962788pjb.67.1620460313121; 
 Sat, 08 May 2021 00:51:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id b65sm6345091pga.83.2021.05.08.00.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 00:51:52 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: rt5682: Disable irq on shutdown
Date: Sat,  8 May 2021 00:51:50 -0700
Message-Id: <20210508075151.1626903-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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

We cancel the work queues, and reset the device on shutdown, but the irq
isn't disabled so the work queues could be queued again. Let's disable
the irq during shutdown so that we don't have to worry about this device
trying to do anything anymore. This fixes a problem seen where the i2c
bus is shutdown at reboot but this device irq still comes in and tries
to make another i2c transaction when the bus doesn't work.

Cc: Jairaj Arava <jairaj.arava@intel.com>
Cc: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Cc: Shuming Fan <shumingf@realtek.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Fixes: 45a2702ce109 ("ASoC: rt5682: Fix panic in rt5682_jack_detect_handler happening during system shutdown")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/rt5682-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 93c1603b42f1..8265b537ff4f 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -273,6 +273,7 @@ static void rt5682_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
+	disable_irq(client->irq);
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682->jd_check_work);
 

base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
-- 
https://chromeos.dev

