Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08792BEBC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F3484A;
	Tue,  9 Jul 2024 17:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F3484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540137;
	bh=eXonUE1RrE/ne2nKS7mqWbpxoQqbkkm2/6w7XMI0Vkg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=USM6OrqFvkbdIZ1q3zzc0396Z6PQAv+yUqWZlHgD6VYfAlcu7tkCUMHSnYu55nx5y
	 2BwyTWjlku3KNiPtUz+1h1Jxpz1vKeDLTTCphjX8mSeiWb1HtiPWfdlibu6rl+Wi2f
	 ezsocJVW23YNAirQTzOFrQ/eRZNBqaTU2kReST3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25590F8061D; Tue,  9 Jul 2024 17:47:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3258F80612;
	Tue,  9 Jul 2024 17:47:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EA4EF8028B; Mon,  1 Jul 2024 22:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89349F8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 22:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89349F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z6RqkexF
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so34991361fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719867331; x=1720472131;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5tw+LPpfQNSWF+mfgTJ8lz4ywv5saeFlFnwyBL+2Yc=;
        b=Z6RqkexFaQr5iIk6oTtOE85Y/7iyQsadF7y0PvlHkzU5N0j01BFNfh/nlxxexw7bTc
         o8rhz12HHAmKEQyb3WLmt64FeyEtO+7O+RXixhGqBRI1kqXfOBX/HIxAsv29rsf1eR8Z
         SutSmJ3IIP2dfa2DSnFDhQHoVzLWaXhBvPcqGl5QCTafCA5mdXZ6s0aE84uDKDfk9ykc
         DRwyoiv1dhSZVoMkjOs9/oFDjWEzFFXi2kB74m7QolBP53heT8DvomNg3+c0sNCh2f0Q
         cw3otFo0lSwtslNkvkcQtGBcWUGLbtksfJr8yXW1zgx7ZU7jc5b0R2q1MaFabVgX7uZ+
         B2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719867331; x=1720472131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5tw+LPpfQNSWF+mfgTJ8lz4ywv5saeFlFnwyBL+2Yc=;
        b=unrP0H/t6/MR0yyK0IivSSTujW+ZIxPW0u+KpoBhn1oYG3KnQwxFogGLpUuYZwSuz9
         B41jEa0F8+d6r4P50Ocy3tfl3R4kKfzTh42A1HJ7buBHahETQpq+4ibT0rTT/vJRMTsu
         m7MDdFmgIrtYHQV8mXbc8gJ2V4zVMVoReWbJaDCUlb24/QXCYA4AxgoIeUu2HmrqV1uC
         mfaftIUICZqz1gr5/X4uNEbnc3E3frOdGx0OzlNJGdnZqN0CXRcYxx16RHZtbc3KcSK+
         C3rg0ZOdApKephjfkcWT0yYie6ECk4o0XxJp7QXjvueCzGqHJXiY5+Y6ZOcpnBwY72eX
         m9Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTy/pzmNljYJqiheBgArMFoiCAJVxjYuAmlUjKcomJSNLQnRp9JUEg3Vqe6rjLUrcevrb5tb6CeaOsw34hO12THCnnF+j1KkPJisI=
X-Gm-Message-State: AOJu0Yx49hadFyWENL11C1RRfubq5C6pKh0GC83oQ5lpMlY7V/2pcbWd
	P7Pne+Nja6/nbgqMJ+SW4dgcRj0CKBE3OHD0mh+bk7FomYy/n4xK
X-Google-Smtp-Source: 
 AGHT+IFD/ydAAz6irAM3P6vWUoXOHr5tFUaraSDAt3FesCGvz/qlUZ9C+sXeR43Q6R++irkCayMj6Q==
X-Received: by 2002:a05:6512:a8b:b0:52c:7fc3:601 with SMTP id
 2adb3069b0e04-52e8272ab76mr3918669e87.61.1719867330903;
        Mon, 01 Jul 2024 13:55:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:c010:c300:105d:dc14:8157:17])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b626sm166345865e9.15.2024.07.01.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:55:30 -0700 (PDT)
From: MadEnvel <envelsavinds@gmail.com>
To: tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: david.rhodes@cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	MadEnvel <envelsavinds@gmail.com>
Subject: [PATCH 0/1] Swapped l/r channels on ThinkBook 13x Gen4
Date: Mon,  1 Jul 2024 21:55:15 +0100
Message-ID: <20240701205516.22662-1-envelsavinds@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: envelsavinds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DBCGF6YYWT3H3PO7NUF5A6EC4EJ35224
X-Message-ID-Hash: DBCGF6YYWT3H3PO7NUF5A6EC4EJ35224
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:46:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBCGF6YYWT3H3PO7NUF5A6EC4EJ35224/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Earlier commits introduced audio support for Lenovo ThinBook 13x Gen 4
that needed a patch due to missing _DSD config.
Unfortunately, it looks like the left and right channels in the config are swapped.
This patch fixes channel assignment. Tested on Lenovo ThinkBook 13x
Gen4.

MadEnvel (1):
  Fix swapped left and right channels for Lenovo ThinBook 13x Gen4 sound

 sound/pci/hda/cs35l41_hda_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.45.2

