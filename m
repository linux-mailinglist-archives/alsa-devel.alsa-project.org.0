Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A34947466A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 16:26:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2EBF1F74;
	Tue, 14 Dec 2021 16:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2EBF1F74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639495618;
	bh=foecpuw7diB29IKFjNJPm22yJCq6EUooJb9nl5daOCc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VvWR6TvHklqLVt+UyEtA1PgjQZNi71y0IQy/EUGXZXG4Hp+2LRwseOChHvDbYesAo
	 PEO2JWiP4bt8VpHujV8sgjdXqj28mZXI/XmSc07EkuA8F3GqUvOq8RirDSMXF63gOm
	 izs0AD8alTVbHgxXpRfuWbNthAbmZuqiEXta5IyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E71BF80249;
	Tue, 14 Dec 2021 16:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80107F80246; Tue, 14 Dec 2021 16:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB954F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 16:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB954F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ofJ4teTi"
Received: by mail-pj1-x102d.google.com with SMTP id h24so14578592pjq.2
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Vm1Fqs6tdlQlqFRvByXD9ZZ5ex3zALshKcVnK+T6aeE=;
 b=ofJ4teTiF+PAhd90t9KU1GXvhu3kCeT87aeJAZV+EgB5ABSkMMVeikE32eklERyxXJ
 plpbdFGxS98zl88Fv+fOD6GaqzxN2upiKJBSOmY73fsBPCp7r0hkMBld+zzkJx6gSAyh
 +sAsranIVKeSbl3ZfSu2RfTO90Pw6NgC0qhoXvc+qkl3MQSMAKYRvnsG7hqksSZ8bgIm
 QeN15HSpxht6QtDc3yace2C3nzSq5yy4WLgK5SViEPOKCQAf3dBJE0yBynhx0WeZxNKP
 DVO256ES3/2nmf9vzPtcL2PWGfyHUWLVfTUtYpr4/czUEj/xMDEUfVSjxuVxtdBOEEh/
 JBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Vm1Fqs6tdlQlqFRvByXD9ZZ5ex3zALshKcVnK+T6aeE=;
 b=qJVYrFc4YtA893yDyf7Ojls1b9OhjsBVEKaxU/DDHU4qH6lK4H0RuXw9p7sWr0qGkC
 q0rfh+6dBWNWrlQ+MHCXXRUGrul95TT+w/JAufSmZ3mZicDptPzC2I6mfxRrRfMGKXTv
 HWoyLJ3oDhAE9ebR5wWClzhmMgwqKQZSm7C+pCGfz4S+0uJPeN2pfYI+JbzsB78GBeyu
 PtcSnE3H4btwP0JpWQ5WZN+H8wPNNvvTaK5dxN1CC7jLNwtDQVjYcy3mYyacXQmp7m5Q
 nhhCruiUI2PwqRp9wHl9nV8ZhbLP2uQVGuBI4DVqwxx+0jPpQNsvmSvum2aUN/b8rnjS
 NU7Q==
X-Gm-Message-State: AOAM533++PPJQoBJJH3SSdJYwsdPgfpiZUd5yXtVDWMITN2pTejEYQKO
 sV1xlz43iMkZ7g0L2qAA838=
X-Google-Smtp-Source: ABdhPJzu4M87hrW+1Y/9HZnnji6CqtIbx+N0tmAsFOXR2FraebwN2EVZQUi00br1VjVj7nJY62vxgA==
X-Received: by 2002:a17:90b:4b0d:: with SMTP id
 lx13mr6342088pjb.146.1639495536527; 
 Tue, 14 Dec 2021 07:25:36 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id f5sm67707pju.15.2021.12.14.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 07:25:36 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] ASoC: wcd934x: Fix a incorrect use of kstrndup
Date: Tue, 14 Dec 2021 15:25:30 +0000
Message-Id: <20211214152530.23767-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

In wcd934x_codec_enable_dec(), widget_name is allocated by kstrndup().
However, according to doc: "Note: Use kmemdup_nul() instead if the size
is known exactly." So we should use kmemdup_nul() here instead of
kstrndup(). It's similar to CVE-2019-12454.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index e63c6b723d76..c6677cfbce59 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5005,7 +5005,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
+	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
 	if (!widget_name)
 		return -ENOMEM;
 
-- 
2.17.1

