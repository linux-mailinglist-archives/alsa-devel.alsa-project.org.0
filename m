Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D8F8CA2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AB51677;
	Tue, 12 Nov 2019 11:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AB51677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573553925;
	bh=RxFxcpKENioP+GlsCNIfkKm1xNGi/jj2xp+y1YK7uRw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9rfEQEp/lX/6vO29xdmWnzzS8HYl6uL/KJEosE+zc8b04wnFK3H4XsGlOskDWHvL
	 SiyToJTi5ET8dZdrKRP4bPtQNAw2fBPI865wZwI5YxJ1KVohjfO1xsu1558ls2Niqr
	 hxi5xHmPTQxsQCxF3sdwY1HaKdf+11nBoWgHVvTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC8BEF80637;
	Tue, 12 Nov 2019 11:14:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA33DF804FF; Mon, 11 Nov 2019 20:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DAD6F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 20:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DAD6F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="R/yJgmMr"
Received: by mail-io1-xd43.google.com with SMTP id k1so15768683ioj.6
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QhEAgVLm+P8rhHN9pusEhxB3Gpt3621f2Po3YU/UUwo=;
 b=R/yJgmMr/2S7qSD+K9pcSjScnfyRn6UWrOGejP5RiTxt/sNQOdTM9B7OWOhMcaVt3t
 ibSB3lJvNB9oH7L1lQXQXctQaCpH8w2ezad/xezedla+04zMgzjaqnnoLjqQ5H4LZOAd
 1ZLJTdcQDIGD2vMlaigxFc7VKzsuHhhYBLkts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QhEAgVLm+P8rhHN9pusEhxB3Gpt3621f2Po3YU/UUwo=;
 b=D6QU1KnjAaSIvfOFTZ+pyt9FEpymvnpAnF4BVsuUuXweWxunkpQ3NlucAP9JUoN5CH
 kTwKPecx7XVXMS5L+miUUnNtfi7jB7rf6Im+M0hy/EbN4kGzGUbXWg7bJliZzIXQHeqi
 GHKqs9GrMwd2jckum1vtUigz7Ha94NfHwaQjW/0aThkckA4Y5mmADyaj3/y0lr046APj
 JqDnmz8532YfaVByxjB3ZDcQbI20J6Jcd+nfuu1ypu4Vph7B5PP5GVj/RALxM7WGZEZ3
 PNOEXHbTE5o2VvHLB7bim9PYmRrQ36tXxzCvVgsngYyeIYRDclUbODgQaG+GsuP82IcR
 +whQ==
X-Gm-Message-State: APjAAAVZh0djWrkzMc0eWFx+HXx6klYLq+cvez53I8+LqDBj08B9GqmM
 znR1tHmuQh9hJcS6JO9F2+Y0qg==
X-Google-Smtp-Source: APXvYqyo7Q8K6RUwlo+CnztZm/Qp3lpGAcUrFfmId6PKdeVpoM18mw46U6gGH8wpeQSUmLq+L20G1A==
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr25977293ioe.52.1573498802092;
 Mon, 11 Nov 2019 11:00:02 -0800 (PST)
Received: from localhost ([2620:15c:183:200:2bde:b0e1:a0d8:ffc6])
 by smtp.gmail.com with ESMTPSA id f9sm1394497ioq.80.2019.11.11.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 11:00:01 -0800 (PST)
From: Jacob Rasmussen <jacobraz@chromium.org>
X-Google-Original-From: Jacob Rasmussen <jacobraz@google.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 11 Nov 2019 11:59:57 -0700
Message-Id: <20191111185957.217244-1-jacobraz@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.com>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] [PATCH] ASoC: rt5645: Fixed buddy jack support.
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

The headphone jack on buddy was broken with the following commit:
commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd
detection").
This changes the jd_mode for buddy to 4 so buddy can read from the same
register that was used in the working version of this driver without
affecting any other devices that might use this, since no other device uses
jd_mode = 4. To test this I plugged and uplugged the headphone jack, verifying
audio works.

Signed-off-by: Jacob Rasmussen <jacobraz@google.com>
---
 sound/soc/codecs/rt5645.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index a15e4ecd2a24..046f339a9f00 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3270,6 +3270,9 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 		snd_soc_jack_report(rt5645->mic_jack,
 				    report, SND_JACK_MICROPHONE);
 		return;
+	case 4:
+		val = snd_soc_component_read32(rt5645->component, RT5645_A_JD_CTRL1) & 0x002;
+		break;
 	default: /* read rt5645 jd1_1 status */
 		val = snd_soc_component_read32(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
 		break;
@@ -3603,7 +3606,7 @@ static const struct rt5645_platform_data intel_braswell_platform_data = {
 static const struct rt5645_platform_data buddy_platform_data = {
 	.dmic1_data_pin = RT5645_DMIC_DATA_GPIO5,
 	.dmic2_data_pin = RT5645_DMIC_DATA_IN2P,
-	.jd_mode = 3,
+	.jd_mode = 4,
 	.level_trigger_irq = true,
 };
 
@@ -4012,6 +4015,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 					   RT5645_JD1_MODE_1);
 			break;
 		case 3:
+		case 4:
 			regmap_update_bits(rt5645->regmap, RT5645_A_JD_CTRL1,
 					   RT5645_JD1_MODE_MASK,
 					   RT5645_JD1_MODE_2);
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
