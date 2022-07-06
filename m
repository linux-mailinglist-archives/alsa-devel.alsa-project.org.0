Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5D5686E8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E428169E;
	Wed,  6 Jul 2022 13:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E428169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657107804;
	bh=4VzaPQj6pooKCphYfxkfMaE+UOteiJr8+G2DqwZdCRA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nDpM1qACAs63vpjYWzgwLZjKOyeuNVbuCKJVNmFzS3TbuXMfMNGDSBopSh0t7DFbL
	 CYCqPlVQoqJLB58d8MCX4lqHB7I70MVQmxIFdK/KlzKXjD8P8mXSwi7wv8nMJ7BbQA
	 CR9PEmDoaiRnokCvx6xNh8xB6lAg97pQus/Cm/lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D041F80551;
	Wed,  6 Jul 2022 13:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFEEDF80104; Wed,  6 Jul 2022 09:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by alsa1.perex.cz (Postfix) with ESMTP id 303CDF80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 09:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303CDF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="BLtB0PQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MTmpm
 kq8lDlzmI1AGwwyXBmrZuDcMrfzXvE6vkHoGjo=; b=BLtB0PQH9RP0W4rOvHpmJ
 qB7yPIrDgbWgFdm6YYTwpA+iiJYsIroXUQrUtWMQYfIxx7CyuUiKQTypbAOKSlSz
 yQvUGMbX4c+50BPUmtkg8SbSlEpjOLcpq6mJKT0lmCFc/8QBw+VMH+5SVpTCn9id
 M0f9/0Q2d8q54MgAzivB10=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
 by smtp13 (Coremail) with SMTP id EcCowABHYHJ6NMViehn3Lw--.12184S2;
 Wed, 06 Jul 2022 15:06:35 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Fix unsigned expression compared with zero
Date: Wed,  6 Jul 2022 15:06:27 +0800
Message-Id: <20220706070627.16764-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowABHYHJ6NMViehn3Lw--.12184S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyxKryxGFykArykZFWxCrg_yoW3Cwb_G3
 yIvrWkKa45tF9agryUG3y7JFyjya47tr4UWa1rtrW5J3yqyrW5urn5Zrn7GFWxWF4rurn3
 XwnIqrySqFyjgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnsNVPUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBdBs2xlgi3MmagwAAsp
X-Mailman-Approved-At: Wed, 06 Jul 2022 13:40:50 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zhongjun Tan <tanzhongjun@coolpad.com>
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

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Fix unsigned expression compared with zero

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 sound/usb/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e692ae04436a..e461715a43bd 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -766,8 +766,8 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	unsigned int rmin, rmax, r;
-	int i;
+	unsigned int rmin, rmax;
+	int i, r;
 
 	hwc_debug("hw_rule_rate: (%d,%d)\n", it->min, it->max);
 	rmin = UINT_MAX;
-- 
2.29.0

