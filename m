Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7693E5FAC14
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79763695;
	Tue, 11 Oct 2022 08:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79763695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468244;
	bh=bD3EDEsb+PlFPgNpnvW+dAhJjXHG3mMMh0or8hAT4CU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sreSqqyDKk5X+WaqDt5gDDgcMsiasQ2XYW48oBZU4ydQwJ6tH6J+L/5Uqt0VvgySw
	 wZHOz7hhK1Ic/V02tDIt5QYPzaaERatgtfeHHe4kmsgJ1Cz4EW5mKOg/aeErowv5PP
	 sF5so5mYXJrxjV5O+6/GEaASSNvzoh/RGjjPOtOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4C5F804AE;
	Tue, 11 Oct 2022 08:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC42F800EC; Sun,  9 Oct 2022 09:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
 FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by alsa1.perex.cz (Postfix) with ESMTP id C1CB9F800EC
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 09:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1CB9F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="EUZdAIYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lzHsQ
 7uRE+Ob5IFFnxNujLW+JYw21myg9+tk4e/ZuAE=; b=EUZdAIYq5yYcAo9B3YYso
 +9E9cdA6IGsSaFM/58vOakxP5F4Dv2FVHhLX6KgnH0QWNlq7D2ED2nTQRTTKMWpc
 7ilHNxxHUJqunTt0V8+qTSUFPrsZCGYKlK/m8/F/vMHZD8KSJ9VAhzV4eM9Ep5FR
 OatTLHv2pwxcuOKQvfxNGY=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by smtp3 (Coremail) with SMTP id G9xpCgBX2mvHfEJj6n2Gjw--.45155S2;
 Sun, 09 Oct 2022 15:48:24 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: cx2072x: fix spelling typo in comment
Date: Sun,  9 Oct 2022 15:48:16 +0800
Message-Id: <20221009074816.2641162-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgBX2mvHfEJj6n2Gjw--.45155S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5Jw48urykKrg_yoW3ZrX_Ww
 18W3y5Z3yqqFWSkr1jyrWjyF4Fv3Z5Cry8Crn5tr4UA3y5uayYyayvyF13C3W5Gr4vgasx
 XanxKr1aq34kKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1Tmh3UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbiyAiV+1p7H8T2DwAAst
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:20 +0200
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, k2ci <kernel-bot@kylinos.cn>,
 Jiangshan Yi <yijiangshan@kylinos.cn>
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

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 sound/soc/codecs/cx2072x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.h b/sound/soc/codecs/cx2072x.h
index ebdd567fa225..09e3a92b184f 100644
--- a/sound/soc/codecs/cx2072x.h
+++ b/sound/soc/codecs/cx2072x.h
@@ -177,7 +177,7 @@
 #define CX2072X_PLBK_DRC_PARM_LEN	9
 #define CX2072X_CLASSD_AMP_LEN		6
 
-/* DAI interfae type */
+/* DAI interface type */
 #define CX2072X_DAI_HIFI	1
 #define CX2072X_DAI_DSP		2
 #define CX2072X_DAI_DSP_PWM	3 /* 4 ch, including mic and AEC */
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

