Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED34E4735
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 21:08:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBA11772;
	Tue, 22 Mar 2022 21:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBA11772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647979713;
	bh=XLJzsnLDddVChBVfUtulQnIC/AbMdaKwQzyvzxtXeHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WfepVAH2Uf7SffSn22bCcItQnzZ2L/IWaPno07VwP+9X0L+1Y1YJt+5zEt5+eWpQN
	 BLS7GDGVaW9EfWDC9v3fxFoxBCPKwuK7qwg9mau3C7XWC97YSIBnw4mzBkyssQTCZh
	 UZ5wQh5b3g1ZFIfIKevg+wksEnyvcMe3cE2teu5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 206DEF8032D;
	Tue, 22 Mar 2022 21:07:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F2FF8016C; Tue, 22 Mar 2022 21:07:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B0BDF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 21:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0BDF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g3w/rGyM"
Received: by mail-ej1-x62b.google.com with SMTP id bi12so38649416ejb.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 13:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+iqp08GcNAQvzI7gwwg3DMfl8E0Ga+FTx8YTeieNmE=;
 b=g3w/rGyMtGz/7MERtqKnaeuL5UGuk6Puo9A5hO27i5buuchXvuLFll4JrV+yAS5i2K
 N3kGQ+vrop0QPShbmL+FYznUQ3ll5/6lf30NNBLB3KRT1AmuPEwxJw1xL/AfG9QGx8Lc
 HVNTy38D3/mHY+0XoqcLiSO7DapYd9urgJbxNe/6tK563tEOcj5ylQhUasQx1OZh2TNd
 fObEjS27Whu8m4RFgqIDNIkvQVnQTtN6zWx51Liy5gEwJovvMRZDg6nghy9KhuzyFDW7
 nUF7wAfdY7EHWJFHR6xYPv9xfRvBedYBDU07n/4uafnxV5kv0gbwOO4U4rxmbpXLuvGW
 uoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+iqp08GcNAQvzI7gwwg3DMfl8E0Ga+FTx8YTeieNmE=;
 b=eMLbjyUKXGTfaDFESdhddCs59qXBP3wSJRe2GHbr3Uxq1lL1BfmEjwJqZHZeXi4H4y
 ctU+IbK8UJErWqllq0p6NfSDX5yPql1InEzFM2FvXR2eOV2bmHZYKXCVlCtRrY7jGvNH
 uatGLFAXTFAJBSPY3bpM82hVg/57m8p/dilTh6c6jXwiP8V/aV1Q7mJDanJfuvlCinMW
 BhJ71doXmHJCu5KPJS3xUg6meBf/MwuO61PiUVwqtzlgCk7hnU+0Ylo4ewgxsplrNh8M
 28TpbaXJutdVH8Xww3MhpDjzo/KnOIAP4R1sHwQ63tn/BDPDQXDp9Cj3QceWNCrzYdWu
 LJ3A==
X-Gm-Message-State: AOAM533sh+dRJL0We92ceoEZE0V6kKaUeOQIjVhlk0ilMbayGlKRpgWf
 BFCfIgdmytaXSb61yHMk7pU=
X-Google-Smtp-Source: ABdhPJyhnLkirEXYHtYIQihs72AVKhz0E5BtigfzC57f7AL86OEtNPPBXv0/7TBtvUfz1l51ELP46A==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr27959389ejj.767.1647979635912; 
 Tue, 22 Mar 2022 13:07:15 -0700 (PDT)
Received: from kernelhackingvm.homenet.telecomitalia.it
 (host-82-62-81-30.business.telecomitalia.it. [82.62.81.30])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05640205c900b00418d79d4a61sm10668654edx.97.2022.03.22.13.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:07:15 -0700 (PDT)
From: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH BUGFIX] ALSA: pci: fix reading of swapped values from pcmreg
 in AC97 codec
Date: Tue, 22 Mar 2022 21:06:54 +0100
Message-Id: <20220322200653.15862-1-guiduzzi.giacomo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>, paolo.valente@linaro.org
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

Tests 72 and 78 for ALSA in kselftest fail due to reading
inconsistent values from some devices on a VirtualBox
Virtual Machine using the snd_intel8x0 driver for the AC'97
Audio Controller device.
Taking for example test number 72, this is what the test reports:
"Surround Playback Volume.0 expected 1 but read 0, is_volatile 0"
"Surround Playback Volume.1 expected 0 but read 1, is_volatile 0"
These errors repeat for each value from 0 to 31.

Taking a look at these error messages it is possible to notice
that the written values are read back swapped.
When the write is performed, these values are initially stored in
an array used to sanity-check them and write them in the pcmreg
array. To write them, the two one-byte values are packed together
in a two-byte variable through bitwise operations: the first
value is shifted left by one byte and the second value is stored in the
right byte through a bitwise OR. When reading the values back,
right shifts are performed to retrieve the previously stored
bytes. These shifts are executed in the wrong order, thus
reporting the values swapped as shown above.

This patch fixes this mistake by reversing the read
operations' order.

Signed-off-by: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 sound/pci/ac97/ac97_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 01f296d524ce..cb60a07d39a8 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -938,8 +938,8 @@ static int snd_ac97_ad18xx_pcm_get_volume(struct snd_kcontrol *kcontrol, struct
 	int codec = kcontrol->private_value & 3;
 	
 	mutex_lock(&ac97->page_mutex);
-	ucontrol->value.integer.value[0] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 0) & 31);
-	ucontrol->value.integer.value[1] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 8) & 31);
+	ucontrol->value.integer.value[0] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 8) & 31);
+	ucontrol->value.integer.value[1] = 31 - ((ac97->spec.ad18xx.pcmreg[codec] >> 0) & 31);
 	mutex_unlock(&ac97->page_mutex);
 	return 0;
 }
-- 
2.25.1

