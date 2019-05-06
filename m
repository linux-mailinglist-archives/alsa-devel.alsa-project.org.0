Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA69154EC
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 22:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A7618EF;
	Mon,  6 May 2019 22:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A7618EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557174753;
	bh=+OWYS/6XPNQRoLC30wdJ5LSimZ2FY+tWht8zdPeAk9Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vgcI3/M/KNvCYjTPkbIoFB/bhl8vyXVBKTroTY1AYqS4H+fZ+JL4yGUPhDd4EIdIM
	 Nlo7S1bjVBizdMEFAlXUS8+FwdiI8H/t9fvX4YowN6G16RADEnp4w26F4/f9RUSSSp
	 PSx4GG+FckFxa+oV+14s5Xs0SIdj3ncUtxmFA4Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0ADBF896F0;
	Mon,  6 May 2019 22:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E987F896F0; Mon,  6 May 2019 22:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4B8FF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 22:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B8FF80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="b4D7egJl"
Received: by mail-pl1-x643.google.com with SMTP id n8so6929426plp.10
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCCGBgY8OAMupXXew8IzoqONgWAIon9ttkHZd9yTQZY=;
 b=b4D7egJlPUqct4lKLm15EHD0RHM1FTyrAKDr8jgb1vioWZPwHGZLKhxvPMNo0R73tg
 YCsN/VkXMLge6NMt9shSqOK00iZSB0p2oxF9LQnSwyiyrA9qvBMeyEwWTayegfgYXBY7
 Cg/BxSnBXiyuzFvT9CHuIgdPW0FsuLL+LMCIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCCGBgY8OAMupXXew8IzoqONgWAIon9ttkHZd9yTQZY=;
 b=Fc8DzxBL31NwgwyXqeckRy7E4S6DvG8NQhRt2kJSZU3gcXAs0lac6KsnqylYp2oe59
 +kSVeWZ9X4efPKohREL2GqKF7MYfNuUK3MZuiACfWSKMepyPbH8rF/VKKAotKa5dzInN
 iMQOCgwWhLmNG18RFvfpce/n5hdT4LlkB6SURM1O4UFlx83TBnrxZ6GQ3DNZL7vt3J7F
 gVJj4YkcppQz64sUb78PKvYcrKgfuHsxx9RWTjLv/g02N9K/zs7U4zb8hKsx022r7+76
 mXxukEnLcaYH3/ueNzV1yn8fdpeNXXem4DSVMXuzHgdaL1Ye+iiVx2hlYGPWU2pZG+SA
 IPwg==
X-Gm-Message-State: APjAAAXSmvGExdCTs13RO9pMNrUDlzRCGqk71+H2/AWXlGmvfW7TY5/P
 1lmfdRpQFVji/HevDTIaOM40LzeBcA==
X-Google-Smtp-Source: APXvYqwpdSgnpgNhdc8V7MO6+g/pOaxm51VldZDMjenwnOgZKrsWuCGNoGjB7SZ+qANVSlHTAUV8uA==
X-Received: by 2002:a17:902:28a9:: with SMTP id
 f38mr34666433plb.295.1557174641325; 
 Mon, 06 May 2019 13:30:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id q5sm17619477pfb.51.2019.05.06.13.30.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 13:30:40 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Mon,  6 May 2019 13:30:06 -0700
Message-Id: <20190506203006.161158-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ross Zwisler <zwisler@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hsinyu Chao <hychao@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Dylan Reid <dgreid@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: use more of the volume range
	from DACs
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

From: Dylan Reid <dgreid@chromium.org>

The DACs volume can go over 0, both according to the data sheet and
real world testing.  The control can go up to +30dB.

This was tested by playing audio at full volume on a samus chromebook.

Signed-off-by: Dylan Reid <dgreid@chromium.org>
Reviewed-by: Hsinyu Chao <hychao@chromium.org>
Signed-off-by: Ross Zwisler <zwisler@google.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6fc70e441458..907c957b614d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -832,13 +832,13 @@ static const struct snd_kcontrol_new rt5677_snd_controls[] = {
 
 	/* DAC Digital Volume */
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5677_DAC1_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC2 Playback Volume", RT5677_DAC2_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC3 Playback Volume", RT5677_DAC3_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC4 Playback Volume", RT5677_DAC4_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 
 	/* IN1/IN2 Control */
 	SOC_SINGLE_TLV("IN1 Boost", RT5677_IN1, RT5677_BST_SFT1, 8, 0, bst_tlv),
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
