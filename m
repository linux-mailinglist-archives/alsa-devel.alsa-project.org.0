Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DEC50D534
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Apr 2022 23:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFEE16B8;
	Sun, 24 Apr 2022 23:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFEE16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650834053;
	bh=F2v8k0IC13HkoZiLTt3goLYDoh4DdCUmxwUjpxsVm7w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L0Q6z4REgjW1QPpsws145mKMw/H62ivZQ/BtABJAKkCy5tYtDF2cgVKtfI2mv12TW
	 E3oh2uZrOuwJ8KB62Gb+m1TTBIyVio4GC/OtdOe82z62wvzlb7rGhdALz/Z9MF4JIB
	 uqUM2UPLE917mmpRrFirnu8U1FRYk3fztdop6SVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A41F80141;
	Sun, 24 Apr 2022 22:59:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69926F80163; Sun, 24 Apr 2022 22:59:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D53EF80141
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 22:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D53EF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P+8os97R"
Received: by mail-wr1-x429.google.com with SMTP id bv16so18217719wrb.9
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 13:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iC9g0FH3bzlHy7hoAv9K0hivd/arMZ+Ly8xR4y4PBWk=;
 b=P+8os97Rm5U4fIyuksZFXvRkInCU65BbYq2K9UoiK/mVjmr82Ylpl5MFYaRprjB+tn
 15C4QL7f4g8WZHtYI+7gd1R04rtCBQZzEjfUkCGHvHxTVpPklYNWEOAHIJp+I3mmeY4l
 0zA+UEhSK946KfO7C9AzBJ5f4PeevFiabTfmAeNheaYbkuc40D5DgaYLTdOpvVL5+YY8
 clUsiu+UUHoIN4abTLuAqIBMtsa2fNmfmJ98WdAdba7pmFCufkXCkEaMPiiSKXfH8v1P
 4oQJCDm9pEBO63zeHJc8j99PWXxiPpkqML4vWfKRAjA5QeDwGNixWskYgsCu6j2Y/fr9
 tAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iC9g0FH3bzlHy7hoAv9K0hivd/arMZ+Ly8xR4y4PBWk=;
 b=Fcx1mbIOd4/eFNS4e7ssby1FTARPa0ongMScDQjagRcf4ZjbbQyYgP1JSAYEj7ndWF
 rTAOfNhQ5G3yzgSZVe6sQtbJfkltsIE9+BuATm9NsW8PRH3iXxJdOpF1PGjimqLeBTn8
 4VU1T1B2WUgzVGnWS1j+zn9TIQcZj1apgOqz8SG+zZUzYNNtLGfVFa64xHU3iFJLsh2u
 WU7UMoXFLhvq5vjRqbPjyZtcFUy57WgLJpMAnvI7u1jRG/tUdRKhHmI6lZkIUQVqNLkE
 GnsJbnxXPfTKzuodXNJh9V/u42wbS+fIH9q949Ax22QGpi3ZfLUxbU5poTQ84YbvMrHr
 0rCw==
X-Gm-Message-State: AOAM532popdNwnNBS7ya7GvJZvz3aSAdqRHUMKZUHIGw/RNbIWULms/4
 J8zllMPm4646TFtYvg4adws=
X-Google-Smtp-Source: ABdhPJyOmQXw6y5ZKF2bDQTx9dMffPCO4ImkFLqarqZm9PGwJVZtU39NB9Mq+ZuTOO9z5oke2RehRg==
X-Received: by 2002:a05:6000:1a44:b0:20a:ccde:c139 with SMTP id
 t4-20020a0560001a4400b0020accdec139mr9326075wry.320.1650833987138; 
 Sun, 24 Apr 2022 13:59:47 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m41-20020a05600c3b2900b00393e6f6c130sm3653656wms.42.2022.04.24.13.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:59:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Check for null pointer of pointer substream before
 dereferencing it
Date: Sun, 24 Apr 2022 21:59:45 +0100
Message-Id: <20220424205945.1372247-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
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

Pointer substream is being dereferenced on the assignment of pointer card
before substream is being null checked with the macro PCM_RUNTIME_CHECK.
Although PCM_RUNTIME_CHECK calls BUG_ON, it still is useful to perform the
the pointer check before card is assigned.

Fixes: commit d4cfb30fce03 ("ALSA: pcm: Set per-card upper limit of PCM buffer allocations")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/core/pcm_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 8848d2f3160d..b8296b6eb2c1 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -453,7 +453,6 @@ EXPORT_SYMBOL(snd_pcm_lib_malloc_pages);
  */
 int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 {
-	struct snd_card *card = substream->pcm->card;
 	struct snd_pcm_runtime *runtime;
 
 	if (PCM_RUNTIME_CHECK(substream))
@@ -462,6 +461,8 @@ int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 	if (runtime->dma_area == NULL)
 		return 0;
 	if (runtime->dma_buffer_p != &substream->dma_buffer) {
+		struct snd_card *card = substream->pcm->card;
+
 		/* it's a newly allocated buffer.  release it now. */
 		do_free_pages(card, runtime->dma_buffer_p);
 		kfree(runtime->dma_buffer_p);
-- 
2.35.1

