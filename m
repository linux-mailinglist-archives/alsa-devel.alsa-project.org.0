Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB434A22B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D39A1683;
	Fri, 26 Mar 2021 07:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D39A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616741212;
	bh=iCYqzB/l1XSuf0YfN20bJvOYLEthnpRvKmuf7fkQRhw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o9HrnyVe0eUrdPok4oN7WtO3rzVEFDkTkRML/0T8R/P0nJaRE4zuuQhQk5ES+tQjI
	 MrIPxqiTzfaEPnG5mg12C+FIo5K6pevpd+EPeooSOYF5SM5Rt+K5lV/cBJAok9Mi7/
	 Yucev6sfyqqvVjNMguhHuFl7suaj0Hfs2pMluETc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E78F801EB;
	Fri, 26 Mar 2021 07:45:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30242F801EB; Fri, 26 Mar 2021 07:45:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8693FF801D5
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8693FF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FFkb7IcZ"
Received: by mail-qv1-xf2f.google.com with SMTP id t16so2423815qvr.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bLoqfBiZVQk0YIeIKhgPKBtJ507LhBAmlJ/A5xeilw=;
 b=FFkb7IcZ05aM6s5rziT8HAuHISXf5fGUGlz5QF5iHFqcrZ2riRz6i1o9Om5SofPLt+
 5/sM1WNetUR3dozt7vsUwv0cFmAaTGeosZmnESSMMw8ncfwpVh6eOiGIxm0I+x1R+moN
 6PA3YyOUl5ttzJvKrS8dAjwEogBUgO1hcs+giQZkpIw7UiWVl+VDV+pIzW1l/Zmj1ZpQ
 SOorvKNLa2zICFJ6N1XANaZgxi/lzU3cZfs0rxpmUMpLCJgQdup15tC3k2BnxSNJRfkD
 Paz1//jmolGZxVgXfkK9nPcO8RwBnzAVvJwjCTxA2qodD5pdMu5GPy4XCa3qwDLBUES5
 EWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bLoqfBiZVQk0YIeIKhgPKBtJ507LhBAmlJ/A5xeilw=;
 b=txfsx0fP/OVQlrqd1DwrYYsADWNM/qCkaf1qr/boP7ci43uxk89h9J27zUkgJJxzgk
 rV4UZHOHk4hjJD1S3cL7TW0OkRyz29H+3iPNP4iq9s4H+ZGS3XZkkGETJMVZ3P/arOJq
 yffuyAEaHO1nowDosORNzhLc1Nw2xDBw98PoJBb0KN2KK7xsNn/AzRQ/j0eMbaYPCnMq
 7FSbSGNF6trtPfb6dexHwHltYhX6ssLVTE/4mHZDG8obW7TTk/j2N/pSeHSns0eSUH/Z
 6X6h3iJN6858JVX+i3ULbQSGxcsj9U/2cKfaPUbXvpXGf9MA9IKlg6eAy4TyvTRHErf7
 uK0g==
X-Gm-Message-State: AOAM533VYlq2wkuLjdAM5s1XQJnERAe12ppuSpcueZj/ZLeZfPEguKfh
 iZ40Xzm2PzrrjVR6t3cqIGU=
X-Google-Smtp-Source: ABdhPJyEOv5nlQlCy87iUnxGvRQ2JRfM21w3HIYPDsa93cn6J9KXQrXRp5KsUhdMsnByc3LR8XTOFA==
X-Received: by 2002:ad4:4ab0:: with SMTP id i16mr11854813qvx.1.1616741107529; 
 Thu, 25 Mar 2021 23:45:07 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.107])
 by smtp.gmail.com with ESMTPSA id b12sm5316693qti.43.2021.03.25.23.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:45:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: perex@perex.cz, tiwai@suse.com, unixbhaskar@gmail.com,
 mirq-linux@rere.qmqm.pl, broonie@kernel.org, gustavoars@kernel.org,
 viro@zeniv.linux.org.uk, joe@perches.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V4] ALSA: pcm:  Fix couple of typos
Date: Fri, 26 Mar 2021 12:12:11 +0530
Message-Id: <20210326064211.6509-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
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


s/unconditonally/unconditionally/
s/succesful/successful/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V3:
  Yet another try to make it work

 sound/core/pcm_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..8dbe86cf2e4f 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1425,7 +1425,7 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
-	return 0; /* unconditonally stop all substreams */
+	return 0; /* unconditionally stop all substreams */
 }

 static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
@@ -1469,7 +1469,7 @@ EXPORT_SYMBOL(snd_pcm_stop);
  * After stopping, the state is changed to SETUP.
  * Unlike snd_pcm_stop(), this affects only the given stream.
  *
- * Return: Zero if succesful, or a negative error code.
+ * Return: Zero if successful, or a negative error code.
  */
 int snd_pcm_drain_done(struct snd_pcm_substream *substream)
 {
--
2.26.2

