Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4C5B5560
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E36216BA;
	Mon, 12 Sep 2022 09:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E36216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662967822;
	bh=SCHerPr7WbUtcHgyOj4gjMraHsfW/q880vNVu83uw0Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xy8LlbV0LDpziFEUO5XtuZnnpMu+DnGl5GhiPMxovB8E17QBZfa0RK6D/EYJFWu7Q
	 unY4iUFP0EpzJiWptAXYcFP25MxUrdvixrYAnPB+RDX29rIsB1BTo8yT2OQBHJoNWW
	 3B/ChMgUUMmtJ9ZdcMDuosc+Klwfa2tLvPuP6a0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE63F8030F;
	Mon, 12 Sep 2022 09:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D73DAF8027B; Mon, 12 Sep 2022 09:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583D9F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583D9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="F8NP15gZ"
Received: by mail-pj1-x1035.google.com with SMTP id fs14so7136162pjb.5
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=76Fc8CveDr2A+XmsMO5aUYZ5rkOnd7dGevIsjexozj4=;
 b=F8NP15gZkfBbXBlUfEXn49/A0QpQqs7gTdFVxwsMcYAnddJIIfYigbCy9aOXR/ntIR
 OianP6O0MfCRuxmweOqPokqOViD0/VkCL1x8gaRrlt+3u8VK9vInt1MNLzUSY/xphNC1
 nG3MWclY3ko3xJjNzsOLmwYsvvDzNK7BXm/dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=76Fc8CveDr2A+XmsMO5aUYZ5rkOnd7dGevIsjexozj4=;
 b=k4ESKF956mMWhrl+Y3djlqW38bD2naYCBn3U2gcZUGjXR4YnlFUkIuK8HNZs2JvJ81
 MqCwSITo6M9bpbw3WG7C0BspYHUa90C2swdduAYO0aBk1DQAREeNoSHAXl3vNOzyQmZo
 3IdNYjgszi2GkIAINK+rQfmcNqY0nzG/8BxFJHLPGREvQ4fmSNkHAiY/tNcN8M8/STsK
 vd73hzztRvdRCQkmjjt7muDOnVyYJb0nM9NFeTa/i0Ym37McLD+tcUN/YcEMvjfFx3VL
 GtDzSadlK2VNNbRAYi3g9tsaXmGxCisjT5ZuEGml5AirygdPptAKlsG+rQ10VRDPb/6c
 uh7w==
X-Gm-Message-State: ACgBeo0GNYv+b+vvRGZJcHn/yV43jjyHj9qzro7eA59tPio1siWnPBXu
 LiTYSK4P11vH5XD2R6kZ0s3L5Q==
X-Google-Smtp-Source: AA6agR7lk1dIw7GQ9Uh3Fk6DXfrdPnmE2WjPA0REhe9qtzk8cXnzGMAKEZkDpBH/CYAawp6iFWxvUA==
X-Received: by 2002:a17:90b:1d8c:b0:202:abf5:4b21 with SMTP id
 pf12-20020a17090b1d8c00b00202abf54b21mr10438059pjb.162.1662967751568; 
 Mon, 12 Sep 2022 00:29:11 -0700 (PDT)
Received: from yjscloudtop.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a622747000000b0053e599d7032sm4612214pfn.54.2022.09.12.00.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 00:29:10 -0700 (PDT)
From: YJ Lee <yunjunlee@chromium.org>
To: 
Subject: [PATCH v1] ALSA: dummy: Fix trailing whitespaces.
Date: Mon, 12 Sep 2022 15:28:54 +0800
Message-Id: <20220912072854.760824-1-yunjunlee@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, YJ Lee <yunjunlee@chromium.org>,
 whalechang@chromium.org, yuhsuan@chromium.org
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

Fix checkpatch.pl ERROR: trailing whitespaces.

Signed-off-by: YJ Lee <yunjunlee@chromium.org>
---
 sound/drivers/dummy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 2a7fc49c1a7c5..fcf1ee00bd214 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -296,7 +296,7 @@ static void dummy_systimer_callback(struct timer_list *t)
 	struct dummy_systimer_pcm *dpcm = from_timer(dpcm, t, timer);
 	unsigned long flags;
 	int elapsed = 0;
-	
+
 	spin_lock_irqsave(&dpcm->lock, flags);
 	dummy_systimer_update(dpcm);
 	dummy_systimer_rearm(dpcm);
@@ -717,7 +717,7 @@ static int snd_dummy_volume_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.integer.max = 100;
 	return 0;
 }
- 
+
 static int snd_dummy_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -766,7 +766,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_dummy, -4500, 30, 0);
   .private_value = addr }
 
 #define snd_dummy_capsrc_info	snd_ctl_boolean_stereo_info
- 
+
 static int snd_dummy_capsrc_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -1100,7 +1100,7 @@ static int snd_dummy_suspend(struct device *pdev)
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	return 0;
 }
-	
+
 static int snd_dummy_resume(struct device *pdev)
 {
 	struct snd_card *card = dev_get_drvdata(pdev);
-- 
2.37.2.789.g6183377224-goog
