Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A139429AC
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3220A2CB5;
	Wed, 31 Jul 2024 10:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3220A2CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416014;
	bh=dUb6XFAWURF5fTzbw/+1MFJZCob3+hK/YpTTVucusdc=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iu0OSlE9LUuFqS8OoDcx3I6vjrUGRDm+SPc37CpBxl+6PvdnN4x7jAKQA2O4qbcyO
	 DR9jDktXUBzSOBnKNHEROGhB9/y+moz7wRjS+rh6l6MgZdPyjuROckFdksAPw4Uynm
	 9LJR1GWIUz6opQFb0HViekiVzOaGDR4xF9G10yXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B647F8080B; Wed, 31 Jul 2024 10:50:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F233F808C4;
	Wed, 31 Jul 2024 10:50:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E3CBF802DB; Mon, 29 Jul 2024 11:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67DF5F800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 11:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DF5F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gwqcdr5t
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso5214887a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722245868; x=1722850668;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
        b=Gwqcdr5tzW8hKlAUswuM4l5A3zun9SY8e0DyS3nrjeOLblpx0YBwwCLcCYsMT4+bmd
         0IQQnvSmXwo2rWVsGU4w7f0Xz9COsY3WbAK4bzxYcGZlP/1rloOKUbEivzLcL2ik0HWK
         wLMLYhyU+aYM+C6i+Y98c++vrAHZtHDLkvqMeiE2aMzP5Mdkg3zWD9tcmQKSCLuwnFd+
         dFJCW63r/B7/0Znv+7v5WMtFFdxz6AXKde0pPXdPmEVchClNpIOvBsNVaeZz4TLLoPKY
         ilHkjAO+Suxq9m7XozwBLk+rmheGki8s82vjlDMkZCspReuEqvFRMWWmChborJNWo9bb
         /75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245868; x=1722850668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR8EYDbZcj20ngdxq0iIEW20+Ft9Qj88x8IgpUrOrXQ=;
        b=QGYI+XF68fBVHYNa3MdT/UMMcbhTzLwC7k5snATdYb26IqEC85+yLwPXSW6drnFYI9
         ioAzEs1gutSgkv8WACrf8Ly+3MDcQ5wG7ETOoIOoZ5yImkZd091cUstnPgg4NLe+PwpW
         QUCq7GV0B/2OJASiQNCbV3ogD4Ip0hr++J2nHx/Bg4OFCVBjulsUjMDn8z5ZXP6O7xBU
         g13tsVMzhjGRncOMic3u0CrTtTwIAviJeI+PNk5j89occg2CJjHwheJImHoMC2/dXo7r
         LyzO5eUYwbm1kDCoSX7rD87ycUYiPIm7Iwhqx1987q5+Q8ZLnwx+lLxwgkW3qwYJbXQ8
         vPoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJzZy9NzEJkn1CIaRoPqL46fb1oFgE3OX66aAO13wtoHwWc/wMUgNWOgBdhH3FEdhiCwqPRfQR47wHxu+5gAxeP2OpNWi0VVSu6Y=
X-Gm-Message-State: AOJu0Yw6KaM4VES8VJcWLGEoMylixXHz9BQ/p2yhH6T5j7iS++yuwPtZ
	IB27+HcM+8hSRhVJ0Qg2onJXAgTeeJ6ZqUzqlYzD0v5NR3Rdtucn
X-Google-Smtp-Source: 
 AGHT+IGB+vRrdX/B/2dg/ESisrGwMj2AyPaJblfTpT4noAFpKg4KyVyg7wAt53T8pHgMroSEYzYs/Q==
X-Received: by 2002:a17:907:96a0:b0:a7a:a0c9:124e with SMTP id
 a640c23a62f3a-a7d3ffadf1amr581593566b.4.1722245867939;
        Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:37:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/2] {ASoC,media}: constify snd_soc_component_driver
 when used as read-only
Date: Mon, 29 Jul 2024 11:37:36 +0200
Message-Id: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBip2YC/42NQQ6CMBBFr0JmbU2pINSV9zCkgXaESaQlHdJoC
 He3cgKX7+fnvQ0YIyHDrdggYiKm4DOoUwF26v2IglxmUFJVslG1sMHzatg7w8EaG+YlePSrcZE
 SRjHoq9K9rgddtZAlS8QnvY/Ao8s8Ea8hfo5eKn/r3+pUCikurkGULZZKD/dx7ul1zkfo9n3/A
 ucOmcHMAAAA
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=2529;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dUb6XFAWURF5fTzbw/+1MFJZCob3+hK/YpTTVucusdc=;
 b=RPp7DAhUclessfFNFbcWgORq5LFwt1sEuXGSZwmnwQyt6PJKpGQSAD09Ku+TP7WOneIIyaxWv
 s/TEiuxzbZNCW6/irPcZOG1uLKlqLQvxJpgMvBhbXL3qIH7lZwJQGEF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7R657DEJS4TJVVOGIZ2ZQSZZPVJEAFNH
X-Message-ID-Hash: 7R657DEJS4TJVVOGIZ2ZQSZZPVJEAFNH
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7R657DEJS4TJVVOGIZ2ZQSZZPVJEAFNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Declare `snd_soc_component_driver` as const to move their declarations
to read-only sections for the drivers that do not modify the struct
after its declaration.

Apart from a single case under media/, the affected drivers are members
of the ASoC subsystem.

To: Tim Harvey <tharvey@gateworks.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- drop cs43130 and sti-sas, as they modifiy the struct in the probe
  function.
- Link to v1: https://lore.kernel.org/r/20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com

---
Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      ASoC: constify snd_soc_component_driver struct

 drivers/media/i2c/tda1997x.c         | 2 +-
 sound/soc/au1x/dbdma2.c              | 2 +-
 sound/soc/au1x/dma.c                 | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 sound/soc/codecs/cpcap.c             | 2 +-
 sound/soc/codecs/pcm186x.c           | 4 ++--
 sound/soc/codecs/pcm5102a.c          | 2 +-
 sound/soc/codecs/spdif_receiver.c    | 2 +-
 sound/soc/codecs/spdif_transmitter.c | 2 +-
 sound/soc/codecs/tas6424.c           | 2 +-
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/uniphier/evea.c            | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240725-const_snd_soc_component_driver-b9629a95b948

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

