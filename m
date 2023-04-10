Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4706DCD91
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67DCD1025;
	Tue, 11 Apr 2023 00:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67DCD1025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681166405;
	bh=KIgh1siLbZ3vu8YMmtppjF+DjB3dEMFagLBhquqcfp8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JB9ZT8dd9UfQyLq8gOMlXrV454y7nBlcYCpy2LGBM3D631nq3rA8DHLFdmm71DmAM
	 5RSACuaVV7w7ml1m9Dq1VfPVaOcdFH30uhj7LUacJ/pDLfbA98+DrxzQfnJrhVUcZN
	 S7jwrzR4jopaCb1wTF/Uwu3pqLFoQ0K0FKISpWv8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C95F80448;
	Tue, 11 Apr 2023 00:39:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D733F8049C; Tue, 11 Apr 2023 00:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE6ADF8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6ADF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cJe5Pn9w
Received: by mail-wr1-x42d.google.com with SMTP id v6so5687829wrv.8
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681166345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jQtQIg81hhKy0u5QqnR6EQxCUiuIoJOyPsQHQCmMj8=;
        b=cJe5Pn9w6R7GRNmQYB/y5Khb3421RiECmYHpLU3DkYSHrPUtokDoOc/o2nUKqBMMXb
         8Y4U5Ju5pQ8Er7qtYsAjkF2I/OqiDBR4+PeENRIUjVxTjHJxk2DgwKKtcBDrqB7+A1p4
         b1ks3PWPnCPjxQVpSnmHF4k3ekIUcqcBl73+zQAgdEMlF1eetL39YnIaaysppH9VkwkY
         RVLCD27T53F/KjGqAS2aU3Rp0k6CN3idh2i/WLXDuiYRHorKlVr0PNlbkKu/9XNZwkfk
         BG8YMmNotv4MzTQd/1N572qacnAP5ScBrVng7Q1Kpt0NaLJ1vK38Jl9wFtZ2Yx37vdC9
         X5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681166345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jQtQIg81hhKy0u5QqnR6EQxCUiuIoJOyPsQHQCmMj8=;
        b=Qf5t80l7DL9axNYtTExxdZZL2UZxCXI14/qlcVXlf7m9PzOn5Lj3zl+EaJb3YmAzgf
         m4MV4yZmenOVhXe4/NFfZJg1illPh7+A9t/69CAKehUBKRTOcjfHgnLoec9T0zrGoDxz
         qRvmt8bX3CULU20FYCcN2IVpCHQKS7eXx3VdnoYRgqsLiPtVJa6DVhpBxWaF3EiZwLDC
         IesjOuLA3fzAKZ8fHTddrBZW/xwDyq5Ewbr38js9DmG9xLyWibQ9Tgeir9IzYtBIQz90
         IQ0E5T4IVdY39aqT9qq4n+hsU/2tcsvoKMUVKkRRYtFE2IRH8L0xUemGTyuwO+cTo3uH
         F0bA==
X-Gm-Message-State: AAQBX9ds5tDpRGGe29dwDgocH2lLpYR4tAwnGiBkVTUc8PNImS0fEyJe
	w061KMiFWaywMqgGRAjCK8INSZZl1+qmuw==
X-Google-Smtp-Source: 
 AKy350bNQFzw2ewXKA4xP/NvzT+o7phQookx45WDlyf/ustqMgKLnz3cjNBmbRRMckkflrs8HSDEeQ==
X-Received: by 2002:adf:f28c:0:b0:2ef:bb8b:3bf5 with SMTP id
 k12-20020adff28c000000b002efbb8b3bf5mr4983303wro.38.1681166344746;
        Mon, 10 Apr 2023 15:39:04 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm12779178wrq.110.2023.04.10.15.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:39:04 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: ep93xx: Prepare for DT transition
Date: Tue, 11 Apr 2023 00:38:59 +0200
Message-Id: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TVSTLEMWZSRXPN6ODCXEF4MM6LQOB2GD
X-Message-ID-Hash: TVSTLEMWZSRXPN6ODCXEF4MM6LQOB2GD
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVSTLEMWZSRXPN6ODCXEF4MM6LQOB2GD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a preparatory series for EP93xx transition to DT. This patchset is
a pre-requisite and has been tested with the full DT patchset [1].

[1]. git://git.maquefel.me/linux.git branch ep93xx/6.2-rc4-v0

Alexander Sverdlin (3):
  ASoC: ep93xx: i2s: move enable call to startup callback
  ASoC: cs4271: flat regcache, trivial simplifications
  ASoC: ep93xx: i2s: Make it individually selectable

 sound/soc/cirrus/Kconfig      |  6 +++++-
 sound/soc/cirrus/ep93xx-i2s.c | 12 +++++++++++-
 sound/soc/codecs/cs4271-i2c.c |  1 -
 sound/soc/codecs/cs4271-spi.c |  1 -
 sound/soc/codecs/cs4271.c     |  4 ++--
 5 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.40.0

