Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F439ECC1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 05:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E4F784D;
	Tue,  8 Jun 2021 05:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E4F784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623121732;
	bh=bVzv8Q3x92lvx1UgS0X6Pojx1Iq84GNHXfL4OJ8JCgQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bfuL0MV29Nn6VOWBEf2bMdCZ50p3M31aYL3oSBph7DXT7OB/ECfhL7ChPv6O+NgOu
	 h5kAcPJfAt2UWb4KkYPQOpT2zNre0pGJReAtkjq8EMWBaNWBzle2A36Oz8ExCjUByM
	 B300DaftZKp70o6ZC7R2myGulF3VD5liXz98+dJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD386F800FD;
	Tue,  8 Jun 2021 05:07:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ADC3F80218; Tue,  8 Jun 2021 05:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C157F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 05:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C157F800FD
Received: from Wanjb.localdomain (unknown [36.152.145.182])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id EA1F4AC0247;
 Tue,  8 Jun 2021 11:07:05 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: remove unneeded semicolons in wcd934x.c
Date: Tue,  8 Jun 2021 11:06:55 +0800
Message-Id: <20210608030656.24052-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGhoaQ1ZJTUIdGRpPHk1NSxpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nyo6Hyo5Qz8VPw5MTjM3DTMO
 FU4KCRlVSlVKTUlISklKTUlNT0xKVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJT01ONwY+
X-HM-Tid: 0a79e996840cb039kuuuea1f4ac0247
Cc: Wan Jiabing <wanjiabing@vivo.com>
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

Fix following coccicheck warning:
./sound/soc/codecs/wcd934x.c:5136:2-3: Unneeded semicolon
./sound/soc/codecs/wcd934x.c:2466:2-3: Unneeded semicolon
./sound/soc/codecs/wcd934x.c:2527:2-3: Unneeded semicolon

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 16fd1ab62609..c496b359f2f4 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2463,7 +2463,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
 			__func__, micb_num);
 		return -EINVAL;
-	};
+	}
 	mutex_lock(&wcd934x->micb_lock);
 
 	switch (req) {
@@ -2524,7 +2524,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			wcd_mbhc_event_notify(wcd934x->mbhc,
 					      WCD_EVENT_POST_DAPM_MICBIAS_2_OFF);
 		break;
-	};
+	}
 
 	mutex_unlock(&wcd934x->micb_lock);
 
@@ -5133,7 +5133,7 @@ static int wcd934x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		wcd934x_micbias_control(component, micb_num, MICB_DISABLE, true);
 		break;
-	};
+	}
 
 	return 0;
 }
-- 
2.20.1

