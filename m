Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A0E1F5A81
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 19:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329B0166C;
	Wed, 10 Jun 2020 19:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329B0166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591810257;
	bh=qAzvgCCSPW3pQ+w0WVQuUGZm2dX8NGWjJbNoGV/+hSM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B5OGtPM8g/6PO4mB20begMRPgYzDDAx0w8CoXiQOsO+53KBITRaUbsuhKGeiESQd9
	 ko7XWBqcmeWmw4oVCK4XplOl+f+B0xlFkSK6eCwom/+yZcg89kN5xVNlMQGpZ/s5If
	 R8Wloh1IiVehGmHuUji9y+Ul45J0r5iENRrnwKUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 376E7F8021E;
	Wed, 10 Jun 2020 19:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D886F8021C; Wed, 10 Jun 2020 19:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CAEFF800E0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 19:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAEFF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NTEeLvTs"
Received: by mail-pg1-x543.google.com with SMTP id d10so1272863pgn.4
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHuDWwcD46GsqYCnpIwOKdwPxiPdPtfeZ6O9l504PHI=;
 b=NTEeLvTsB773KwO3u1uhA/EelDoidUC0VKkIcpcQrmyOC1w2cR+PIIEC4cgymCPIkB
 D7ur/mAjSTtCMZ3UB0AE2tienoebk9nml/E03FpD6lYsBQKZTzlGQ9g+BdiwoRMuIonu
 QFwa59Nm9PBiqllyRfTrHkzVP/8XP4NNrFCHO5ITW06ZQkdN/NkbZLlmgIFVxpEZNqQY
 r4JLz+eY0WDzRRYsDY5I8QeKDlCnE/MpxuJaxVySqLG14lzlfNJFSO5LSHNThAjDTiCn
 RAA1LV/LDeOP4b3VFxsMcItY2ijjdh9uCOMQazHSIc9XQRmCswJLZ62R1Bj8LwnJsY8d
 tEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHuDWwcD46GsqYCnpIwOKdwPxiPdPtfeZ6O9l504PHI=;
 b=dxJS9KGgbV8qPUeNfi8RsR2gNvfTRPGAnH7vapzZcFIR9+0lPT7j2pFWKgKEmkOCX7
 Y02IbGVpH4Ti4JxfCcoo5T86VZZik2l+f6Dq1UB1l2RjCkqm1MLKgRO9M68xURn2D6Pv
 ivRrmTBMepruEP5U/38Sux3TcUQiMMBD9PJMaujxYsVr9qwTxjliG26hr4YV7nDPysuL
 YqJkiNjA7xNOmeGXJ1mNzT7daWkAyV8NNiQflb/RTNE/OA3rnR+DtM1hBiffeLVT0idR
 AwPKR+PO4meDih/oYJ5JIN5Rf1+g+jKzvPgeEo8qGLszcbbMRJO3NoG5SWflIEfYs5iG
 MXFA==
X-Gm-Message-State: AOAM532woL5SwuNNajcwyumRxAB9R2ovZTDEeZ3i3RMYsgf8/bonn4Q5
 BSLRcCY/USd1dwIW5XJXLPo=
X-Google-Smtp-Source: ABdhPJxFC3aE1JPqfxE9yyHQOhKXlvby4i0EuVHpuVNTvbzQGF1PAL+ca8iz/SWsLtCNhFD4L8Xpww==
X-Received: by 2002:a65:6550:: with SMTP id a16mr3411032pgw.183.1591810145159; 
 Wed, 10 Jun 2020 10:29:05 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id l83sm490470pfd.150.2020.06.10.10.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:29:04 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 0/6] Enable Greybus Audio codec driver
Date: Wed, 10 Jun 2020 22:58:24 +0530
Message-Id: <cover.1591802243.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
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

The existing GB Audio codec driver is dependent on MSM8994 Audio driver.
During the development stage, this dependency was configured due to
various changes involved in MSM Audio driver to enable addtional codec
card and some of the changes proposed in mainline ASoC framework.
However, these are not the real dependencies and some of them can be
easily removed.

The folowing patch series includes the changes to resolve unnecessary
depedencies and make the codec driver functional with the latest kernel.

Patch 1,2: Incudes jack framework related changes.
Patch 3,4,5: Resolves compilation error observed with the latest kernel and
also provides helper APIs required to allow dynamic addition/removal of
modules.
Patch 6: Finally provides config options and related Makefile changes to
enable GB Codec driver.

Thanks to Alexandre for raising the headsup [1] and motivating me to provide
the necessary changes.

[1] https://lore.kernel.org/lkml/20200507212912.599433-1-alexandre.belloni@bootlin.com/

Changes from v1
- Include the changes for the review comments suggested by Dan
- Rebase to latest staging-next

Vaibhav Agarwal (6):
  staging: greybus: audio: Update snd_jack FW usage as per new APIs
  staging: greybus: audio: Maintain jack list within GB Audio module
  staging: greybus: audio: Resolve compilation errors for GB codec
    module
  staging: greybus: audio: Resolve compilation error in topology parser
  staging: greybus: audio: Add helper APIs for dynamic audio modules
  staging: greybus: audio: Enable GB codec, audio module compilation.

 drivers/staging/greybus/Kconfig          |  14 +-
 drivers/staging/greybus/Makefile         |   6 +-
 drivers/staging/greybus/audio_codec.c    | 178 +++++++++++---------
 drivers/staging/greybus/audio_codec.h    |  12 +-
 drivers/staging/greybus/audio_helper.c   | 197 +++++++++++++++++++++++
 drivers/staging/greybus/audio_helper.h   |  17 ++
 drivers/staging/greybus/audio_module.c   |  15 +-
 drivers/staging/greybus/audio_topology.c | 128 +++++++--------
 8 files changed, 412 insertions(+), 155 deletions(-)
 create mode 100644 drivers/staging/greybus/audio_helper.c
 create mode 100644 drivers/staging/greybus/audio_helper.h


base-commit: af7b4801030c07637840191c69eb666917e4135d
-- 
2.26.2

