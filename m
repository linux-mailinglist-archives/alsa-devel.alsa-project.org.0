Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539ECFCE81
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 20:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBCFD1658;
	Thu, 14 Nov 2019 20:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBCFD1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573758676;
	bh=xq4faPfZVCJWRfPqlT2Vh7kBpGIjWmXZtCZxWs+gkYs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EevkKIr5juZzdLdB/VKK7ctIq3u63jCBpVdGfCyCu/zdz2q/GiNoefLOuROSURHUE
	 iXwVuMbg4pkOkepHYCkfIuqSi4/c0DSKBO7wrhu/tLI6JVG47MKL7khsnFlB3DxKO1
	 vMi+HSus04fCYqVsXENRkJzMhdyoUc1mTl9ur85Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E108AF800CD;
	Thu, 14 Nov 2019 20:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A8E7F800CF; Thu, 14 Nov 2019 20:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B00DFF80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 20:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B00DFF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nMwsgi9L"
Received: by mail-il1-x143.google.com with SMTP id s75so6363986ilc.3
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aJlTqX3MqyfjXLCncAwsXq4lCz1EaZQPrfo2kGeMxys=;
 b=nMwsgi9Ldl5oVcuBJVDG6vjkLlyAm7KANIbKWmxzWr2ow1HeKmK48ST99X0n+DiSlY
 2OtKaB7zkDvQPL+1a6cEDXYbZhuks0scvxmpVWCOqxl9kE3cZ9SL4vfrU5DMXshAeuTi
 Tb9Xnbuv6AgYw3Mf01HsxRdO3Swt4PnFus7q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aJlTqX3MqyfjXLCncAwsXq4lCz1EaZQPrfo2kGeMxys=;
 b=ZznbLK2yhc3XXdWUzLBx/BRUcmL9mznzffDfoWfo3e3HXrKiA4+8viREsjUGcagZ6m
 UZIOC6lWZeunT32uDA0qAoHHQH4LNVuAJ/O7GeHT/x8RIpjcAqxs4egp5I/Kir9DWtng
 rXDKzKCc1vGZov5d8Z5wOVRAFpbA2SPMRWReyz5MmPdzoSMGJ+AtSMWOhmrJIUCOflze
 ZMQdi5uB4cOnKjzkF/sm7MuL7rK/kKueRgvH8LEEvjzaLHnpKHeZZqcrl1LIgFd8XAOV
 zV7h7sapwju6x0W4RM2NXWN6EIOHgKvWPjvT4ReDoAOS9sUd8lZMcrT+wnkqzyxJaAH/
 K4pA==
X-Gm-Message-State: APjAAAW4jfU9l7HrS5/5o91+eC7wmxK9feDjY6F5v19tRN5ngDcRYZin
 sdz7yTwMRkKrCobC8PtBUwei6Q==
X-Google-Smtp-Source: APXvYqwe1HDVydnGRLk9ezbGgJTiowfbINKqTqtC5f1FRIEOCuGuQwJ6B0firqVAFlDUi5Vow51/qQ==
X-Received: by 2002:a05:6e02:c8e:: with SMTP id
 b14mr11794924ile.44.1573758561685; 
 Thu, 14 Nov 2019 11:09:21 -0800 (PST)
Received: from localhost ([2620:15c:183:200:2bde:b0e1:a0d8:ffc6])
 by smtp.gmail.com with ESMTPSA id k199sm881586ilk.20.2019.11.14.11.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 11:09:21 -0800 (PST)
From: Jacob Rasmussen <jacobraz@chromium.org>
X-Google-Original-From: Jacob Rasmussen <jacobraz@google.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2019 12:08:44 -0700
Message-Id: <20191114190844.42484-1-jacobraz@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.com>,
 zwisler@google.com, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] [PATCH] ASoC: rt5645: Fixed typo for buddy jack
	support.
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

Had a typo in e7cfd867fd98 that resulted in buddy jack support not being
fixed.

Fixes: e7cfd867fd98 ("ASoC: rt5645: Fixed buddy jack support.")
Cc: <zwisler@google.com>
Cc: <jacobraz@google.com>
CC: stable@vger.kernel.org
---
 sound/soc/codecs/rt5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 902ac98a3fbe..19662ee330d6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3271,7 +3271,7 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 				    report, SND_JACK_MICROPHONE);
 		return;
 	case 4:
-		val = snd_soc_component_read32(rt5645->component, RT5645_A_JD_CTRL1) & 0x002;
+		val = snd_soc_component_read32(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
 		break;
 	default: /* read rt5645 jd1_1 status */
 		val = snd_soc_component_read32(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
