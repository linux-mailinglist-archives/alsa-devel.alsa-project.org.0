Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB85FAC1B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4715B36AE;
	Tue, 11 Oct 2022 08:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4715B36AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468330;
	bh=leXPto/o5O5H4HaC594hQWvkkKWgAIXSNGRluEGVHHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBxmxZWXFGU+FAjbdMTPMdsLZ9Kq/SJRBcMKVsTvnN5NgjK8apn3yMDdgfgmAz9T0
	 Wpn9n7nzCnZJIzu/njDpEUmWxMSZlCalZRTtwf4SxJhKW9jEG2nhZ3G3kYaFoI5+KR
	 VYjt51iAp71ce1mvcPBfPRQD9MbA3hz+qtUq/NpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 124BCF80578;
	Tue, 11 Oct 2022 08:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D065F80256; Mon, 10 Oct 2022 20:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA0B1F80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0B1F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jfbUGf2q"
Received: by mail-wm1-x330.google.com with SMTP id
 fn10-20020a05600c688a00b003c6c44a1c8eso32858wmb.1
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVHRCzHetDvm9wFuZO6DUfd6buOnzVOKnDaUC6gkHgg=;
 b=jfbUGf2qG4IgfJsaHgHZk8iGMLIN7QzdQ/644DGpNwElmy8Ne41kJG5u6avyUwAw/e
 QkdXRLRFzTF3RA/3jIMsSU+zWhasOwQBYtt62fwn+qQiDcRaEPaNKn0zkkSy8jG/JnVD
 mQWkXSJG82oCEtGSutcz43dCXX4Pn86SrHAb/dr4tOCDe4Fborpfhu7uQcfZaoMLAn5u
 YsABV+V4e7bDt06q3JHnizc1nQtkMLiSjM3m6HlUwhUI97Gh57HrRdfkC5VoLdgzE0MA
 OILLU5nM5VKsgLd/CfaS1gGn0oFi7gBLY0GinTUjjMwW6cwib/zxvZRAViXo5Xr7Gg8s
 0xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVHRCzHetDvm9wFuZO6DUfd6buOnzVOKnDaUC6gkHgg=;
 b=IEY+gbDRX5WmGAgdLSwIHjr7SALVBTXdQ786P+6J2hGG91bi7gGUaz8ZBoJNmlZXEd
 mYcs/7tPFv+zUsS6xMeQwxbKnxAc+acXroaNhJVxLPbT31PtxM9dPybXdC4LdoZ5tYmG
 euHKbqbhd2Hts7VzclAOSQnUKyO8GG6weeTxE3mZl0tIuFw1hxOTM5CGF0UFE2xLmcjH
 BW/rORNRUNaWZhUQZyTecI+C3Ttlso6ZVFFK2EALgTvxch20xd/GYFBShnnRRqeoHHNP
 c43nmuql82wUSmo0G1fz1fW7PxDcsDAHNfMwJUnuxtGoDRjRK/qQ1rDqYiizv4J+SUEG
 27Pw==
X-Gm-Message-State: ACrzQf3eXmxifCZmna8KVAhX54ck2y/LkyNyLxh3JPOkg449YTRV2gHb
 Ah5EXyJlePkzYyhKerAllYCgkX3+uhTbkQ==
X-Google-Smtp-Source: AMsMyM4tdgFZLMNaM0VNDRNGTFwZOVm1CPhn49eMPbP9JTq/VNtHdoJKIa/pN5LXqjpWz6uZYjqq8Q==
X-Received: by 2002:a05:600c:4f01:b0:3b4:a8c8:2523 with SMTP id
 l1-20020a05600c4f0100b003b4a8c82523mr20678176wmq.199.1665428089025; 
 Mon, 10 Oct 2022 11:54:49 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:48 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 0/6] ASoC: codecs: jz4725b: Various improvements and fixes
Date: Mon, 10 Oct 2022 21:54:17 +0300
Message-Id: <20221010185423.3167208-1-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <Y0P/u4pJT8rup8Za@sirena.org.uk>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
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

Known issues:
 - Bypass path enablement isn't applied immediately, for make
   things going bit clock needs to be triggered for a bit,
   e.g. by aplay dummy.wav
   It might be a hardware bug, since the bit clock isn't
   declared as required for codec operation.

Tested on:
 - Ritmix RZX-27 (jz4725b).
 - Ritmix RZX-50 (jz4755).

Diff from v1:
 - each change in a separate patch

Tested-by: Siarhei Volkau <lis8215@gmail.com>
Signed-off-by: Siarhei Volkau <lis8215@gmail.com>

Siarhei Volkau (6):
  ASoC: codecs: jz4725b: add missed Line In power control bit
  ASoC: codecs: jz4725b: fix reported volume for Master ctl
  ASoC: codecs: jz4725b: use right control for Capture Volume
  ASoC: codecs: jz4725b: fix capture selector naming
  ASoC: codecs: jz4725b: use right control for Master Playback
  ASoC: codecs: jz4725b: add missed Mixer inputs

 sound/soc/codecs/jz4725b.c | 81 ++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 11 deletions(-)

-- 
2.36.1

