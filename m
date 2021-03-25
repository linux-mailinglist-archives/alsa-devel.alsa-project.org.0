Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EF348677
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 02:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 374E91612;
	Thu, 25 Mar 2021 02:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 374E91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616636407;
	bh=yNRP8JFgiZaCVZtUfPNABpthcf2wSAxFNM/Q7RUZra8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AoVARnrz1u0E2obboyoJwkZdOZrvA8ehY0MohIJA7P6QSq0dzufNXKVLfLHnA1gxg
	 SeQ5pkHSxlwYoIreLO15681xgjNq6t60XU7iSDIOoFkWm8Q9by16fl1d0abvMANXMt
	 P6AefI1kONEXx8GlE/7hDZrbNS/p0UCh5hvDLcX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 881E3F801D5;
	Thu, 25 Mar 2021 02:38:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA9CF8016B; Thu, 25 Mar 2021 02:38:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E65F8012B
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 02:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E65F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tkSJEzz4"
Received: by mail-qv1-xf2a.google.com with SMTP id t16so388389qvr.12
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBfD39CaynpQgCKTDXt+Ey2bhdeDPIw8xNayuX1gvNI=;
 b=tkSJEzz4MdthtO/noCz+GYoWMideoK2fIU7YBK3anLLtJ/rpbOLJPjJEweevsQxCMb
 LwIbVceEzsAoc1Wc5MfZ4vaGx81nvmTopixzcE3n4IcrAjS0aCJd31mlka04iFdHiKHs
 bxc7JSxlVxe0W0bKwvfQEqwV4sI6hmALLa/giFWRAnM2VPcI9/+ukByqwiQexQcivAmP
 Hb2hRHzZ4QqhBetmS65B2AmAERiE2PmcnsclTFOm9SJbB0qZKAgiqEDEnJf4+8Kg9qxs
 ShLyapNXngIRKV91014YJb+W2tiozU7Jwzf2M6xjvRraxsYYCG4eNoR52mOaQN4hA8fz
 wGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBfD39CaynpQgCKTDXt+Ey2bhdeDPIw8xNayuX1gvNI=;
 b=o/G4LFIac+52paQFcSqoaoT4Yc4WNqOFrq4z8wQMNdRF2DfuOlhB+ahjTbEvF7ARRP
 dKXaofyWahDvY79YTl3GmUhki4M99Zpf1EuD+64fOMmhuIcL92/5O2HNmJxjLcdy/QFW
 7MQEer4rBGHvEgfwWFpTEt+qT7Ck8fXoDBl/c/mpSZ5p4GVEG2wzk3vGRS+0zdZXTAZp
 SBkD2gZ+a+oT1KexX03SCRMmrJVfbePLA8yWPHijuumdzVrfk8TrTtaIQOa8wQSU03rn
 Tf2x+Eo0SV67Nwto99i69QkmWiNnX++RmtI7iYDdua229WWrmz9PW7CG1tSgHNlIp+2j
 WlgA==
X-Gm-Message-State: AOAM532IDM1G4oaronxvVcX0k2DtR/aZ5TtqwjUYcXdpfAACbgtYJPN/
 hoJPyEMDW3NKgp4d8Jf8eqU=
X-Google-Smtp-Source: ABdhPJw2N5ddoYsi+u9n9JbiYQFBrWepnSG67mIipZoIz9Zt6KWWa1TPEBml4tthPj4GgRuP8Dj3fA==
X-Received: by 2002:a0c:fa0d:: with SMTP id q13mr6007931qvn.15.1616636237025; 
 Wed, 24 Mar 2021 18:37:17 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.55.193])
 by smtp.gmail.com with ESMTPSA id q24sm3005165qki.120.2021.03.24.18.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:37:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
 mirq-linux@rere.qmqm.pl, huawei@kernel.org, joe@perches.com,
 viro@zeniv.linux.org.uk, gustavoars@kernel.org, unixbhaskar@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] ALSA: pcm: Fix couple of typos
Date: Thu, 25 Mar 2021 07:06:31 +0530
Message-Id: <20210325013631.3935-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
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
 Changes from V1:
  Randy's finding incorporated ,plus the subject line adjusted.

 sound/core/pcm_native.c | 82 ++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..afb670d7fd53 100644
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
--
2.30.1

