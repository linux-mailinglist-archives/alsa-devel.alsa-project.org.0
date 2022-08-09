Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C25C58DE6F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 20:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1A141;
	Tue,  9 Aug 2022 20:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1A141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660069011;
	bh=sTSeOJBym8Md56zGEFGs0d4C0Z4ljas+ZneB+11WxrI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XFSUUs+unezapq2lPWAH3uiVzl4JgWTKvVOfr6wq+++CQkU0lvTI6vEZ8zTSYJyrL
	 bfqgQw9WSHXzPkf7QEw41PEOTghx2qg6fb5z7IlI39oCJZIHpJeSb9Vl/J4/nJRCX7
	 n2VCzTNttLAOvxYDwfHYg4BhHyAgZUZ5qR6OnqbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1390AF801F7;
	Tue,  9 Aug 2022 20:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA6C8F8016C; Tue,  9 Aug 2022 20:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A81F8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 20:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A81F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RwC/xY4O"
Received: by mail-wm1-x333.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9305637wma.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qeKkefaI8rAn6PdLcG/BjASCBCjakKAMrlqG8PzJfoA=;
 b=RwC/xY4OulFkweCDNYiIDHC75IPHlmscyLW0IFNZlASwaL1YDJssP6ge2AAidgxRkZ
 n2ipv+eiO4y4YB9hMs9YkZTAO7Uv4qHxO+GHHQZb+uWnRcvBBiLf9PzTjr/cPaX6OdeI
 9LEAKdypsqmb1z7l0YfE9L9HTn4YJ76MRWkrD4eBTteqn3Yii+6wK+DWFDmqsjvyR04O
 1ySxFpK/0mHEjHd3o6gpf4IKAa9NSlFbCLKIRz0G+2RrsyI89SmbmP9TE5nmvekfCZ1f
 a2bX2X4NIwEgNJT9erGmmlaxEw7Ysr2rHuZcfLMcxmth+9cAfSJ/8vlmFCw0O0pAqtwZ
 jWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qeKkefaI8rAn6PdLcG/BjASCBCjakKAMrlqG8PzJfoA=;
 b=DrK5q/wbKbjwquVHfhJs8KH4huVaSE/eGugGClqOk3PwWA58yZl4XFSRWLUwKbC65V
 lFrV0HY3OZFEyxUL47HguIIW2Ud/F3rqfpI5gg6zAkCZEvqsgb2LK5IBdMtnmrBbuCRa
 OYVlJJw5b6PiyCFF1ZqKzkgS7/jSbrWxYsLc1xTzYKiECN0xIxt0cT11V6lPquP8n0zd
 NGDvHnQAlLUCNuUfNFOyPyFB3UhbtM2t/WVdpiLHFachdlcauVRXhWhZ7Q+67hW0i8Ya
 HluQW+6x8hsCWEVcyG1xQKlnseKHBYcIvCMF+9jynhvopqVG38jOJVmNvEZF6kl4gwK+
 U8DQ==
X-Gm-Message-State: ACgBeo25mRJNyn5OVvheC3H+x9RB3PIhpzk8wozgKCUeZa9aXl7Ya/K6
 dQJ9W8YUSluyBjkQ//coqjhWq0pcXYAmNQ==
X-Google-Smtp-Source: AA6agR6tWoLJjD3AvKZPvfi984GJjILsxOkx4GUwcfw9X+CWLNACfY6ZAkRPNXFxZEZYAxxvJp/WGg==
X-Received: by 2002:a05:600c:1e83:b0:3a3:3ecb:52a0 with SMTP id
 be3-20020a05600c1e8300b003a33ecb52a0mr21965836wmb.44.1660068946370; 
 Tue, 09 Aug 2022 11:15:46 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6805000000b0021ea1bcc300sm14272737wru.56.2022.08.09.11.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 11:15:45 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: make read-only array marker static const
Date: Tue,  9 Aug 2022 19:15:44 +0100
Message-Id: <20220809181544.3046429-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only array marker on the stack but instead make
it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e692ae04436a..d45d1d7e6664 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1269,7 +1269,7 @@ static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 	unsigned int wrap = subs->buffer_bytes;
 	u8 *dst = urb->transfer_buffer;
 	u8 *src = runtime->dma_area;
-	u8 marker[] = { 0x05, 0xfa };
+	static const u8 marker[] = { 0x05, 0xfa };
 	unsigned int queued = 0;
 
 	/*
-- 
2.35.3

