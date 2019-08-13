Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF518B160
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 09:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC6501665;
	Tue, 13 Aug 2019 09:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC6501665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565682397;
	bh=gZ22rjZZsK5eTzp5xmV2ZDhODFryrEnXGEfNZ9WtnVc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I0fPgaGGo+RsVz0nFpajQS62+YDiMtrpbd3aY/F3MV1zC/Fk6ZyFJV3YnQUUfy6SZ
	 ljyUwhuzb8/RMJCmfVAsdkwj8/zG+cHwrLbqPDDPdb+Hfy6mFgLFOhiMPoJMuW1yK8
	 o6dkn6xELbMTo3K//3Xal9GPQymbXh3uIRRGyUP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA4FF80120;
	Tue, 13 Aug 2019 09:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DECF7F80273; Tue, 13 Aug 2019 09:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8167CF80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 09:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8167CF80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gr2P6VZA"
Received: by mail-pf1-x444.google.com with SMTP id i30so2402303pfk.9
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wGWISY3VrJOIlFf6UspJXH4MK7kN0CsW/Y8ULJ0Kwsg=;
 b=gr2P6VZATnnB9+lPemtkV6oz7hDqDZRqLEIsHSwg3T/hclit7LQRxjp93NpWl2MES2
 Um+PzAS1Kko5EqOad+bjxXZKqx+uymm1exp3k8E1foMXH74iYttXfc4Iy13TYyEllztv
 hUB/V1Le4fDSi6DYbcaFO7khLFTIlpHwS5Qy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wGWISY3VrJOIlFf6UspJXH4MK7kN0CsW/Y8ULJ0Kwsg=;
 b=ltvYnxnxKVpocPxGpF5vBI5TFj79wSz0gUPGb28l9NUt6ynnX7C/3/xHrETtSsm4qV
 PUr8YaH3/4GG4Cs39OO4lrWihAMGfGFfnfn3MHqIZo4JpMCRNLcIaJJVKHaTAna0tQyT
 NK24Btq3uTeA1F2i453ra1ROLYlNsvbyt5SzJ+R39yJLFiH9hzv5fyy6i/KFMyrUrLo5
 mgLmA1fxF20jWz6Mj9EiHRZQhIuLGP9ByHFTBZ2FM4MiyJP+q3ezlCToNCMbJalAasnX
 JrJ0zRuJOFLuSYe3mVZpLYptVt9K8OHibk+V90p6IprhJQN8kfc4yAkluO42YSgRT9kR
 xtNA==
X-Gm-Message-State: APjAAAWNgFVHQwTZJ+h+7qVfTUhejxXk+1aUxhZ08sebPeekUcym4JiF
 IYiBGTGmwvTEJrsXkEc95HQupg==
X-Google-Smtp-Source: APXvYqzkzDTF0AwWSIcaHQgPLZiwdVjeEy+ci5i4EwVLcCB8uW8sIMX56ixAY+7bZj0RLkfelhwRAg==
X-Received: by 2002:a63:db45:: with SMTP id x5mr16250861pgi.293.1565682283264; 
 Tue, 13 Aug 2019 00:44:43 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id p3sm682260pjo.3.2019.08.13.00.44.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 00:44:42 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 13 Aug 2019 15:44:30 +0800
Message-Id: <20190813074430.191791-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, zhengxing@rock-chips.com,
 Liam Girdwood <lgirdwood@gmail.com>, jeffy.chen@rock-chips.com,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 eddie.cai@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 enric.balletbo@collabora.com, dgreid@chromium.org, cain.cai@rock-chips.com,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rockchip: rockchip_max98090: Set period
	size to 240
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

From stress testing of arecord, we found that period size
greater than ~900 will bring pl330 to DYING state and
can not recover within 100 iterations.
The result is that arecord will stuck and get I/O error,
and issue can not be recovered until reboot.

This issue does not happen when period size is small.
Set constraint of period size to 240 to prevent such issue.
With the constraint, there will be no issue after 2000 iterations.

We can revert this patch once the root cause is found
in rockchip's pl330 implementation.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 7b0c21fa6dca..0097df1fae66 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -137,8 +137,19 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int rk_aif1_startup(struct snd_pcm_substream *substream)
+{
+	/*
+	 * Set period size to 240 because pl330 has issue
+	 * dealing with larger period in stress testing.
+	 */
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+}
+
 static const struct snd_soc_ops rk_aif1_ops = {
 	.hw_params = rk_aif1_hw_params,
+	.startup = rk_aif1_startup,
 };
 
 SND_SOC_DAILINK_DEFS(hifi,
-- 
2.23.0.rc1.153.gdeed80330f-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
