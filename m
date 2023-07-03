Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214B74576A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4475C83B;
	Mon,  3 Jul 2023 10:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4475C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688373348;
	bh=7Ymw+a4w8dVdNVQ/QT0rRwEssEaRILWS6JZlGehxGR0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dkWnDkB+YzP9VLptGsDmnbcLV05H0nU8OtW/PBv/gbRMzWw0qlp0xhyAfuY/y65si
	 Kkt8XLeuddKmMCKZmCH2zpzEtDUdIWVPa3S0FWsZSkr/FODGdmwNJSHcJbJUR7HgVI
	 G1shBZXDqs0zv/Ji0su8osPW7hIgmRsO8LB1q00Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14C18F805D2; Mon,  3 Jul 2023 10:32:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5612FF805D2;
	Mon,  3 Jul 2023 10:32:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B2DBF80125; Mon,  3 Jul 2023 05:11:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 553EEF80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 05:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 553EEF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rOU6Gqec
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6682909acadso1948853b3a.3
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Jul 2023 20:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688353858; x=1690945858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIyh0ew5U0seEYIcxjwMCqM1A8TvNowG5EtVwwrRxDw=;
        b=rOU6Gqec5plFmlctl5RSdw6jzpxvGI3dRVoCEUiV0YnvIJAjbIiDStVodQsYl+f+rR
         EXo4GF12Q8HwM3qfgC1UnexVEHeMa0uMR3UwFkSeh/7QodopOg1YiubZ+GIgjW8yVfwJ
         uOZqeDeLqIKj7i4n+WyuVhgGRR8LlLMRuT5eUR9VAKoC9v9S05DZQlCSHvstih52BCh8
         4hiY2w0fVWlxe4FKU/W0bPrx+d5VJntCje79HQ2a/Uz9l3CAugfb9MvjGdodCvuEeF68
         Y7XS5E137rvd8C0Q6MzrC4zIyf1QdqOGW6nhuO3EZTZ2QUJ5yOCLDwhKf1O5FVY896SI
         kApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688353858; x=1690945858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIyh0ew5U0seEYIcxjwMCqM1A8TvNowG5EtVwwrRxDw=;
        b=jEleFgI6YyVt53d6LKoj9MJV2eVdIxvZqBEmWOedsCTq/GcAPsrzE1ybfghOn+4opA
         OoxGutbCNe1r5w+8vk7E91Z5swwzrJPlfaE+DC+/bYQCARAP8WEGMHs/hDVPpW3CYJiv
         VBY+tjBSfz04CVZ/ZsGWzQckeut3xfxA2ij4X2nYBqHlMt/wOeOA6e8KwUZ7nTqbpbeG
         NQsveW2HhHrpxApWH0n2zcnfnrJOo/v+EbF0bTBgr3RKGxIpbFGmfQgIObRRqAc7DVYK
         atAjXTmWZkg036YHczwVS0Eq9QPJ2Kdw8Avdl3VdsVAUXtm+jni4sW70KjUk1YY0dHj7
         tE2A==
X-Gm-Message-State: ABy/qLYqGQSnyDK6N0oVC/4tUawKCB44BQiBCbv9vkQMKKrFNHI0Y3sV
	eRPllGAG7PoUqBXQmfcb8iI=
X-Google-Smtp-Source: 
 APBJJlESa2fM5VtRr4lKEDEClzMC6buf632yepbQFvaKwg1Nd/krtdlQ0CpGPI3/n4AOksRIoqrblA==
X-Received: by 2002:a05:6a00:1a55:b0:67f:2ba2:f741 with SMTP id
 h21-20020a056a001a5500b0067f2ba2f741mr9513321pfv.24.1688353857829;
        Sun, 02 Jul 2023 20:10:57 -0700 (PDT)
Received: from oslab-pc.tsinghua.edu.cn ([166.111.139.122])
        by smtp.gmail.com with ESMTPSA id
 f4-20020aa78b04000000b0064fd4a6b306sm13041496pfd.76.2023.07.02.20.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:10:57 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@outlook.com,
	Tuo Li <islituo@gmail.com>,
	BassCheck <bass@buaa.edu.cn>
Subject: [PATCH] ALSA: hda: fix a possible null-pointer dereference due to
 data race in snd_hdac_regmap_sync()
Date: Mon,  3 Jul 2023 11:10:16 +0800
Message-Id: <20230703031016.1184711-1-islituo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X47NKWMJO2LTVJIQATYS62S5YSAF64DY
X-Message-ID-Hash: X47NKWMJO2LTVJIQATYS62S5YSAF64DY
X-Mailman-Approved-At: Mon, 03 Jul 2023 08:32:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X47NKWMJO2LTVJIQATYS62S5YSAF64DY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The variable codec->regmap is often protected by the lock 
codec->regmap_lock when is accessed. However, it is accessed without 
holding the lock when is accessed in snd_hdac_regmap_sync():

  if (codec->regmap)

In my opinion, this may be a harmful race, because if codec->regmap is 
set to NULL right after the condition is checked, a null-pointer 
dereference can occur in the called function regcache_sync():

  map->lock(map->lock_arg); --> Line 360 in drivers/base/regmap/regcache.c

To fix this possible null-pointer dereference caused by data race, the 
mutex_lock coverage is extended to protect the if statement as well as the 
function call to regcache_sync().

Reported-by: BassCheck <bass@buaa.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 sound/hda/hdac_regmap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index fe3587547cfe..39610a15bcc9 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -597,10 +597,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw_once);
  */
 void snd_hdac_regmap_sync(struct hdac_device *codec)
 {
-	if (codec->regmap) {
-		mutex_lock(&codec->regmap_lock);
+	mutex_lock(&codec->regmap_lock);
+	if (codec->regmap)
 		regcache_sync(codec->regmap);
-		mutex_unlock(&codec->regmap_lock);
-	}
+	mutex_unlock(&codec->regmap_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_regmap_sync);
-- 
2.34.1

