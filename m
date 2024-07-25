Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04FD942977
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B30AEC1;
	Wed, 31 Jul 2024 10:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B30AEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415573;
	bh=htIX0gNZEQ2pwJvqGxD+l3IATOPpwVwt2PCD5KSSKn4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JD1u2QC1wkUAUk3m6xCFmaMCDA6bjZbAlMkFVjAmDCekXvIYTmgjg5NtqRjNPt7sF
	 zOWPg51leZwWrkg7CqeYhMy/arMa3HculYv9l3oFH1JUD+wcCb+nFd7JNMYq3FA08I
	 dXI/7DCc9vcnAbFwryJLwPzUS9vLaVLdTusjJE9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FE23F805F3; Wed, 31 Jul 2024 10:45:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 326B7F805E1;
	Wed, 31 Jul 2024 10:45:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB531F80579; Thu, 25 Jul 2024 12:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A17C0F8007E
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 12:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17C0F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=afbY4/GX
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7bcd0so971987a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721903502; x=1722508302;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
        b=afbY4/GXeOdRpy9Sr3o2PbXwmo52wEMC1E4mV9cjMOJN+GJt94eubKyw/8/qirw2by
         TNKMUzyVRtNCJJckMucjVK7QgddWQ2yxqBCILlWQ1hYo6tLw0gLKOxnp3IDA90nt6gT0
         f9fh106DsK6OELHs8C2RZW+/EA8yWvjrjdbQUmmZkt/oGj2s9tw8epLIsc0LH+ucksFL
         Au1tYPyjz6lhl0H7gPuVejfWvTA9cuMZY0ONkS85ShJWChF/7m2HAuv1QB3EF97tsvZJ
         I6WLZ/6i0gUrGUH+7ltX8HCUnNbVEd7P3WSKasRif68UAlZsaN9yYiv5adgU5bNcOdbg
         lleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903502; x=1722508302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+agGw5RSx4JruLXCZ7PbUeM/c19vYS06rQLvWj4eOM=;
        b=iqneVXFcuQ3rQIN8vA7Jch8jAoDQO7LTTHQxI+bqoLsfvhJUgneSs7m03VaFF1ZR7k
         rtxyaRWGV0W22l3W9ZvqJlQQeSUpyF0v/NRew5klglVNCyJ5se/cepmY8VzC1gTIs1GE
         Oyz0mTa+KJ5v3GaKYjzthN+ogUrAunmXxHnZCk2EgHTEDsNarvaucmXYib+spBqT2j15
         Va0dMVIWaAaaTkkNXcoiPwcMz0Ytfm+Ncs+Wen/mE+RPw4KRes5y5QPdXte43QQ0qNq0
         I5MRVyaHEQQ5SIpB2uHNT+28imeLAWh2FLx7y1J2l09mdLzQx+GnGQ3vn8BJI9POsDMM
         yf5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoNvg8PnEi7i4dnjVb/FlkNqS3cQxsdRUW1bIu+uMOifMwpPmLIC202X38Yyw6jQko5e7E5eT3R1kCTQRBQQ+gA9W4GvrweBlcov4=
X-Gm-Message-State: AOJu0Ywq2GmQH1Fd3hIOZe/B/F10wlMofuCpxbCHiiZglxDkG3SGxtPf
	2UiIBqPCGL/QfTLmzcJEH++JTRjh+6kH9/0HCnJdsqo92hNfkcefjNrI7KL3
X-Google-Smtp-Source: 
 AGHT+IGAu3zvUQHfsTC/UTH4WJiceuCvU2xMUjNKMn2kBRL9RuFZai32Qp0okX0mkrFdHSC/S11Q/A==
X-Received: by 2002:a17:907:97d0:b0:a7a:ab1a:2d64 with SMTP id
 a640c23a62f3a-a7ac506f3a4mr176339666b.58.1721903501593;
        Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:31:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] {ASoC,media}: constify snd_soc_component_driver struct
Date: Thu, 25 Jul 2024 12:31:38 +0200
Message-Id: 
 <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIopomYC/x3NwQqDMAyA4VeRnC24os7uVUSKttmWg4kkIgPx3
 Vc8fpf/P8FQCQ1e1QmKBxkJFzzqCtJ35g86ysXgG982T9+5JGx7NM7RJMUk6yaMvMesdKC6JfQ
 +zKFbQjtAiWyKb/rdg3G6rj8V+brQcAAAAA==
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=1490;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=htIX0gNZEQ2pwJvqGxD+l3IATOPpwVwt2PCD5KSSKn4=;
 b=vBDKmvKNwCIRMMTYycPXUCa0VMk1znrRDaTVxp1ewj0Yo659ha2gfmiErmmqJzC2lEeS99wV6
 S0Y8WTWXCEJB+QZG9JPwzy0tFzzO75Pecq8vABwhbjWvw6sKrkIMHfw
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RPGC4BKBH2OMNAJL7XIZGJTVGKZKEAO5
X-Message-ID-Hash: RPGC4BKBH2OMNAJL7XIZGJTVGKZKEAO5
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:42:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPGC4BKBH2OMNAJL7XIZGJTVGKZKEAO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The `snd_soc_component_driver` struct is never modified after its
declaration, and its only direct user
`devm_snd_soc_register_component()` expects a constant value anyway.

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/cs43130.c           | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/sti-sas.c           | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

