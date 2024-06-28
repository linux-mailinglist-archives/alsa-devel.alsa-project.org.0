Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17491BE83
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:27:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974482344;
	Fri, 28 Jun 2024 14:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974482344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719577667;
	bh=lYImmeZb1rcQUO1ZbkOLTy2hjwx981+WJWr3K5IPScU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YDyQzOLYcsayH0JtwNHdTMUh2+uyac1Ig45TLujxenb+yX2d+9UFZgkl712bXrYlB
	 P+daX/6aOt6eEvPzUCwsI4GmFi+ebEYsMDFP5dFicd2Trg5baG4hGurmVudQfC4df3
	 fpv7m3skiqv1oktnanFVIidE+gp+wEkCnn9YDglg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9B7F805B2; Fri, 28 Jun 2024 14:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE9A3F805AE;
	Fri, 28 Jun 2024 14:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87751F804D6; Fri, 28 Jun 2024 14:24:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5AC6F80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5AC6F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mq4JntHX
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36703b0f914so392752f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577476;
 x=1720182276; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8JMwrmhC7WvRqFi7mHLBI9deRpipHPY8SwRD9QR+2yc=;
        b=mq4JntHXKeGDB9Lt3j2/HwsWviFHhliOrwIhyh0hCPS8i4itx2BbCTS9r2GjU9wpJO
         FvSjKqveVmBAJOrQvPTNJnrT21GfQ2bPhOujDjyAbzZXXCRHYi5Tg4TGm8/bQ93j3XoZ
         XnGSqCIYh+uhnCCoqNo7bwvCovdsNQvX991C+9ltsb1iolphwpoqgjDAXtSX0zcC/pYJ
         Fdujec+qIMFr9J05eRAzNt6bWvlLCKC+Y1LpDrHKlisQSMHB8r2evNBl33wCf6c96xIR
         DPjmTcGFT2AEtKclAi6kurhcUHaOUNY7RrjdtJORmpk1Q0vQqPIpDNc+/tJYrhViAQC3
         GHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577476; x=1720182276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JMwrmhC7WvRqFi7mHLBI9deRpipHPY8SwRD9QR+2yc=;
        b=PQtk/VFogmPYbLCXEsCar8mf49AxPJ0EXwsOQht1oPrlCDhORgjbQYO8dfzkOc7PUN
         qBVubYFUwrghMCWN/Qw8L7uMp+K+f6ymhsg4QhUdKHGf+IdK5boegLykNI3yhaqInSO8
         Hfpb6THwKY4PGG4MgLHk8IFF+stOpJR2RwEUjQxpHhE2wo8mtE0CEh+3vJRjkHXCCkNh
         MYcggkSVK5DMofCTxnhG0NXQdjepaLyIdN1SPCjCP8ZjT84uo4n4MkGLUqL4XFlyEV+3
         cck+ibhxImtLm6eJ5k7XPN2ZFLDVGs3R5dsQBA705JRO11TVGvx9eMu7Cdjd23ZFKUrU
         6D4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd70lsY/V9iAy21kefwPyB+XQAwdcT5PV0j8SMcq4TFgz7BK51DZy+Up0sUAF6M1hLBM4IruBh462ovotk5v4j0eY1ORCx/JBj/W8=
X-Gm-Message-State: AOJu0YwCkHqnVX+cP/wEupyCIjmizkzo8eBVV/iqYGn6pLV1vYa9pPWb
	Y+Jt7xRlh2onGBasvuOPFmA8J0fc8CZeizdA8HLRQSMx45WqW4cVFKGvXKrvOYI=
X-Google-Smtp-Source: 
 AGHT+IHxosN5Wqh7y8HoRZFs8ijDOVPu1NWR2Fb/8vhFJ8uvlCBsd36dHnQ4ypdnb0tz3P0qRr3DrQ==
X-Received: by 2002:adf:e58c:0:b0:362:5f91:901a with SMTP id
 ffacd0b85a97d-36760ab62a5mr1383724f8f.31.1719577476325;
        Fri, 28 Jun 2024 05:24:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ALSA: update sample rate definition for eARC
Date: Fri, 28 Jun 2024 14:23:05 +0200
Message-ID: <20240628122429.2018059-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HAAWTY5SLWYPZUYIFOF7QIQE5Z3UCQ7H
X-Message-ID-Hash: HAAWTY5SLWYPZUYIFOF7QIQE5Z3UCQ7H
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAAWTY5SLWYPZUYIFOF7QIQE5Z3UCQ7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset updates some sample rate definition for eARC support.
Notably it:
 * adds the definition for 128kHz
 * update the ASoC spdif codecs to include all supported rates, up to 768kHz
 * adds missing IEC958 definition for 128k, 352.4k, 384k and 705.6kHz

On that last point, as noted in the related commit description, I'd like to
stress that I have found the definitions using a testing equipement. I
do not have access to the IEC958 specification. It would be best if someone
with access to this specification could review/ack patch #2, before
applying it.

Jerome Brunet (3):
  ALSA: pcm: add support for 128kHz sample rate
  ALSA: IEC958 definition for consumer status channel update
  ASoC: spdif: extend supported rates to 768kHz

 include/sound/asoundef.h             |  6 +++++-
 include/sound/pcm.h                  | 13 +++++++------
 sound/core/pcm_native.c              |  6 +++---
 sound/soc/codecs/spdif_receiver.c    |  3 ++-
 sound/soc/codecs/spdif_transmitter.c |  3 ++-
 5 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.43.0

