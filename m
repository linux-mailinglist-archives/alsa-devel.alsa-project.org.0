Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AC5FFFA1
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B3156145;
	Sun, 16 Oct 2022 15:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B3156145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665926924;
	bh=uVZFQT5ySmrHgTrE+mhl1HngDAaqxg/YyfyJiZuLQWM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d24PCwOll0o4nosGjXiKZtY8vDtp2A5XdP5so6+R1rmO6U6GFyITKYSYgYiWVJuHy
	 wYIfV2HED9e/QGxCvbl5YOYaB8wSG/sRVDfX8HImCXWP5NXbQxGpjvGtiliL4vO6yx
	 WZLTdttkfO3LnCw116J9rk6TokWmTgihGek7TKhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A78AFF803DC;
	Sun, 16 Oct 2022 15:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B74A5F80271; Sun, 16 Oct 2022 15:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C251F80149
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C251F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NCMNDhej"
Received: by mail-ed1-x535.google.com with SMTP id m16so12671713edc.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0pRjLS8S0PBxvIWJSoyY51V6LZOLpxOkz9SWeH8SHE=;
 b=NCMNDhejEEGVm1W69lUOCI+DchetA+MgaOx5qqbVKe3kee03N9vBT8pYLlTixJD/9C
 Yq8m8iZx3A5WzJfc5ll79p9U29FVKFQYGLcqFYsr6RvOQOJmyIfTbOR0MEDRsDCsbGqj
 WUROdLUIdlHEwhng4cjnd8+XTYT486X8EjhpQaVeLQ3qQX0YiSY0uzETlA38HK6Y7ufl
 Icc/Lxgo0htF5D96lu9fzo/Of/VZDkZO1ZIWbJHy5xK4fijJ9Go0/wa7yDY3F87zKCQq
 svQ1Sf4aoTCrSnL7lMWs+oiARRhbDxddsa2Fh3UnCbad63h1M+5C9/IGNZAmKl7EXvwJ
 YxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0pRjLS8S0PBxvIWJSoyY51V6LZOLpxOkz9SWeH8SHE=;
 b=ABzJZylegat8L7ruUlRCvgdd8gxS1o6w4+7qDxYV8bU6m8YaBi6QyAx+X4aoWIVBpR
 aSmp8a7hSXsXDOIEw021a1r05TJxkPRD1ZseVWXTUWxnIHv3yTb7j3B4eeglwHbWrafr
 gBsOihPf6eJeTI5jBvH1v0VivXdKyt7Nf0gSZYEKz9+pGe24rFlQIAkl0LQk5yX+gEC3
 OTdnDs5jzDfEslsisEiCIk0zD7AXdPwF9HOyNrxhYBMgAPAxvAKLKkU7ktir1g6R0oON
 S4KzI17gXF92NTfvxfoFJeGkNdQSE64Ox0e1dFuhU3rAnTnbrn2jV45Pc2uq7nivD/dP
 CTVQ==
X-Gm-Message-State: ACrzQf3jjJgKe25YBwspj3tSK23l6bAPW/Tt1R/a0PQZ117MBLwrP0hK
 Hseld62PFtgZTfOvYrdeLAY=
X-Google-Smtp-Source: AMsMyM4fSSRavTWL7SmHWcMKtrO3qApNIGTTdSzzFZPUnCfbxlbFWcRRVR9HBztsSUqXDWRt0O+w7g==
X-Received: by 2002:a05:6402:3806:b0:450:bad8:8cd5 with SMTP id
 es6-20020a056402380600b00450bad88cd5mr6315125edb.305.1665926863106; 
 Sun, 16 Oct 2022 06:27:43 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:42 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and fixes
Date: Sun, 16 Oct 2022 16:26:41 +0300
Message-Id: <20221016132648.3011729-1-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

The patchset fixes:
 - Line In path stays powered off during capturing or
   bypass to mixer.
 - incorrectly represented dB values in alsamixer, et al.
 - incorrect represented Capture input selector in alsamixer
   in Playback tab.
 - wrong control selected as Capture Master

The patchset improves:
 - Exposes output stage (post mixer) gain control and makes it new
   Master playback gain, DAC gain was the previous master.
   However, no Master mute now.
 - Exposes all mixer inputs (both Mics, LineIn and DAC) with their
   gain controls.
 - Exposes microphones widgets: single/differential input, boost.

Known issues:
 - Bypass path enablement isn't applied immediately, for make
   things going bit clock needs to be triggered for a bit,
   e.g. by aplay dummy.wav
   It might be a hardware bug, since the bit clock isn't
   declared as required for codec operation.

Tested on:
 - Ritmix RZX-27 (jz4725b).
 - Ritmix RZX-50 (jz4755).

Diff from v2:
 - add microphone widgets

Diff from v1:
 - each change in a separate patch

Tested-by: Siarhei Volkau <lis8215@gmail.com>
Signed-off-by: Siarhei Volkau <lis8215@gmail.com>

Siarhei Volkau (7):
  ASoC: codecs: jz4725b: add missed Line In power control bit
  ASoC: codecs: jz4725b: fix reported volume for Master ctl
  ASoC: codecs: jz4725b: use right control for Capture Volume
  ASoC: codecs: jz4725b: fix capture selector naming
  ASoC: codecs: jz4725b: use right control for Master Playback
  ASoC: codecs: jz4725b: add missed Mixer inputs
  ASoC: codecs: jz4725b: add missed microphone widgets

 sound/soc/codecs/jz4725b.c | 109 +++++++++++++++++++++++++++++++------
 1 file changed, 92 insertions(+), 17 deletions(-)

-- 
2.36.1

