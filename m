Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597A44084D
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Oct 2021 11:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FEC16FD;
	Sat, 30 Oct 2021 11:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FEC16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635587751;
	bh=gZ/scILxCTU1kwNW9Zybype8UxV6pIPcGi49VDAckMc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RmDwpytDR3REjDda4DbbS+F4GLZnIUdA7dCgT9JJpX2oRjz9nvUaRuY355BNv2IP7
	 qHYqcWcPLjFLeXRrmmI0WxjVCiujpONYxUc3dw+e/k6bYIWVaQ3j4y+yE4L8FaAlF9
	 SGSHnMrUXzWWONcZtRAg2xWM5F6tLQ42x0/LPHUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9110BF804AF;
	Sat, 30 Oct 2021 11:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68658F8025A; Fri, 29 Oct 2021 20:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6597CF800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 20:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6597CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Oy3FNsGE"
Received: by mail-il1-x12c.google.com with SMTP id 3so11564463ilq.7
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mf2CSn+LLgrTkJdXfd7F97mVU6u+18tKJPoVJKny3bw=;
 b=Oy3FNsGEk/V2ZF314tLgSX+Enfg3GItchp/AaflZVZxMGwaZNbQ9oJOj2CTRgWaZ9a
 XzxBxKvMn1fmtbwpJ675It6y0gn6Z5EssUZlK2eOh4SuZrFxjtOcBeVqSJLy6L9/jSMd
 v6IgLajzAeygXuzIW9g3SkqcqAGUBY6IyS9vcfzEaurHyNNR5AYGCApoJx55gIJ0O8Xe
 rkZ8JV8HNJqUmTxRLXKUKNe6n3Vo12SR8tvKV54MjH/29IvMObmVf4Dnt8tgvDiyJUgX
 VLiLp+UZe6OMe+wHfJTYQfiJldV1RWq7fcgtPoEMxbEMboqtpTfLiLKbeHzxhw/cFy/J
 9fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mf2CSn+LLgrTkJdXfd7F97mVU6u+18tKJPoVJKny3bw=;
 b=QBppbevA2nSbwqrtLlk4++saMCB29vxc6B/zMSDPA6UN2EUs5cQ+BRC/pdeXETpK+c
 PMfbgRI95tuOh9XYQCG+JEksEIOsNcAG3FQ6TEgEE/AFj5M5OxZT+dvzVC0TnRZ0Nfea
 OZh10Fkx+6FAF65EneUDcBfAE5DXlZirjKtvgHtEIUNoDLCrHwGOmKWXSb46SAGXhTSj
 wib3bb9J2CbggJpk9q3INfWqr03VxSKKw1fQYCVLlKIiuZZGf+yRAbN7rzgIlc2pbTOU
 kJu2vLul8rjZ9zk/GPeh8aPTl0SFx2LQnP4mgTe8XDd/hloq2b6K4C52iBGpjMAX9rKi
 BtFg==
X-Gm-Message-State: AOAM530k05ionXLa6RPZEh87dqm/8dVOCLYqqLAvtJSjIfCo1aqz+S11
 9393iefSwo3CO075UgV7ExQ=
X-Google-Smtp-Source: ABdhPJxi8jHFHACJn5p1MMl0+YsmeJY66XOGfgAKuKC2SZblb4dATssIv3dHTVxPy3ctpHZ9vdEiOw==
X-Received: by 2002:a92:d5c5:: with SMTP id d5mr6614119ilq.307.1635532283827; 
 Fri, 29 Oct 2021 11:31:23 -0700 (PDT)
Received: from jason-mate (c-73-208-52-59.hsd1.il.comcast.net. [73.208.52.59])
 by smtp.gmail.com with ESMTPSA id
 k16sm3517333ior.50.2021.10.29.11.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 11:31:23 -0700 (PDT)
From: Jason Ormes <skryking@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HX-Stomp XL USB_ID.
Date: Fri, 29 Oct 2021 13:31:05 -0500
Message-Id: <20211029183105.28503-1-skryking@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Oct 2021 11:54:08 +0200
Cc: Jason Ormes <skryking@gmail.com>
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

Signed-off-by: Jason Ormes <skryking@gmail.com>
---
 sound/usb/format.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 50efccbffb8a..e8fc2c350a9f 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -414,6 +414,7 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0e41, 0x4242): /* Line6 Helix Rack */
 	case USB_ID(0x0e41, 0x4244): /* Line6 Helix LT */
 	case USB_ID(0x0e41, 0x4246): /* Line6 HX-Stomp */
+        case USB_ID(0x0e41, 0x4253): /* Line6 HX-Stomp XL*/
 	case USB_ID(0x0e41, 0x4247): /* Line6 Pod Go */
 	case USB_ID(0x0e41, 0x4248): /* Line6 Helix >= fw 2.82 */
 	case USB_ID(0x0e41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
-- 
2.25.1

