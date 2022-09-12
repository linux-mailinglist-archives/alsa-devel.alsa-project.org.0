Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3DC5B7354
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 17:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C3E17DB;
	Tue, 13 Sep 2022 17:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C3E17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663081870;
	bh=retp2n2G43ddxpwcdXTopsNB9mMKQXf1H/VqAnVjrXQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wa7RwNlL3tBnF0fgGdVlKxXOz6TYoaCgYa6ciBueqSin3mtHZsfFVGWFV10nKhFa+
	 BB8sTJ95WmZV+xvPStlc08zg9kTbl+7yEUUvaoPCrNBmqdms2YQUyy1apDss0W1DiZ
	 oIPZvbixi6/ly448zdSacnl+p2Or5Ze34ul8eTJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6344EF8025D;
	Tue, 13 Sep 2022 17:10:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFA6F8027B; Mon, 12 Sep 2022 10:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E7AF80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 10:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E7AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ipbOD5/l"
Received: by mail-pf1-x42b.google.com with SMTP id e5so7898578pfl.2
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CYZKTwkJqt/xmQ1S/2yshb1pzDHPMWMO6tW+glk5icQ=;
 b=ipbOD5/lU3TdsNEcVIu8wbFII35K/rkwPXlb8o2fSZZZR42I9Gs+FjgIbob/7Wvqoh
 jsGQXhcSwT+wxjU/JGmbuYQGIV/z+g6J26/kfzG/loBDj8+w14xO8fxweSzTIthByq8k
 KBviaq0tA5dLiLxkkCcNjWijEYB+T1KS3ueWCjHgnHlqZkMykjMOGG57mAHOGcFzGImy
 L0vEsvcneRgHUgcT7L9INa88bvCqir8XnWPTJJ+qYpiwBuAYBA32WbkJQU63BsHHrL5P
 Yad7QPxT3OP3FwBOTAwE/ypzjCFlpKFSy6PJdTiBW2nk8nU9k2U7ZJZGO7lMhb3hOvR1
 sm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CYZKTwkJqt/xmQ1S/2yshb1pzDHPMWMO6tW+glk5icQ=;
 b=ifJBcD5xYD0I6iS9h8CU9MdWgIu6/sYr5APos3g7N+kK23OHokXdfWLFzk/oyMk1Av
 eW3DSjNkQlB5PoPb7In14kcMofyIahJtPLoWahzPjBKkQ8H+frcls754H1n3CWnFeLpl
 SrNRVEsEyCwL9/1tWOqGwQpYtz4JExjMPevoJAuVPnb0JtJOuJvVK+ixsI3pAGrUT6M/
 fq76plv7tBl3n798tljTDaqD0b4CHI1HgIcwJYjntsPnxeKU/KBAAoeMW3T87hIqt+x7
 J+Ur6qXUWsG5nRr3Wk1FnrhZvPdxK7CNavNJkMA1uQsdOevYlf6M7QXv6xo+UJu1worb
 rn8Q==
X-Gm-Message-State: ACgBeo0Vg2bq6v2V82PGaLz9zax07r+01xSa4YDr137BBDzWH1HBbwa+
 nQeZ2/skrEjVnFmp2XAjU0o=
X-Google-Smtp-Source: AA6agR5OKr7BYPEOnP35Wf2mdImB1iOLNb9iAB/QmCYRYJYOrB/ObagXLm06vH0ykCOvlcz3L/1EaA==
X-Received: by 2002:a63:475d:0:b0:430:120:18d0 with SMTP id
 w29-20020a63475d000000b00430012018d0mr22003947pgk.563.1662970989046; 
 Mon, 12 Sep 2022 01:23:09 -0700 (PDT)
Received: from localhost ([106.118.72.87]) by smtp.gmail.com with ESMTPSA id
 r1-20020aa79ec1000000b0053e42167a33sm4741079pfq.53.2022.09.12.01.23.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Sep 2022 01:23:08 -0700 (PDT)
From: Mengchen Li <mengchenli64@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: wm8978: Support the recording function of codec
Date: Mon, 12 Sep 2022 16:23:05 +0800
Message-Id: <1662970985-2909-1-git-send-email-mengchenli64@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 13 Sep 2022 17:10:09 +0200
Cc: alsa-devel@alsa-project.org, steve@sk2.org, patches@opensource.cirrus.com,
 tiwai@suse.com, broonie@kernel.org, Mengchen Li <mengchenli64@gmail.com>,
 ckeepax@opensource.cirrus.com, linux-kernel@vger.kernel.org
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

If we want to use the microphone function of the wm8978 codec,
we must enable the microphone bias circuit and power up the bias
circuit,otherwise the microphone can not vibrate for sound source
sampling.The bit that controls the output voltage of the bias circuit
is the fourth bit of the WM8978_POWER_MANAGEMENT_1 register,so this
bit must be set to 1.This patch can support the recording function of
the wm8978 codec.

Signed-off-by: Mengchen Li <mengchenli64@gmail.com>
---
 sound/soc/codecs/wm8978.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index a682f80..fdd5429 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -822,7 +822,9 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
-
+	/* Enable MICBEN */
+	snd_soc_component_write(component, WM8978_POWER_MANAGEMENT_1,
+		snd_soc_component_read(component, WM8978_POWER_MANAGEMENT_1) | 0x10);
 	if (wm8978->sysclk != current_clk_id) {
 		if (wm8978->sysclk == WM8978_PLL)
 			/* Run CODEC from PLL instead of MCLK */
-- 
2.7.4

