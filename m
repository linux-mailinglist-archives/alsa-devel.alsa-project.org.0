Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDD15D830
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:15:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE271670;
	Fri, 14 Feb 2020 14:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE271670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686145;
	bh=zNheYPyTG/l0RYd1/UjZ89dRrSUzTqEbkQ2D3u4rjTE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t40y5+OxIbuJVwP1cSimDlpE67JJuDcSdFbWTvTYGpdlyFtBcuThWJcQlBAR6xb+W
	 B+aKfWww6bdYTsi99YdoQIPu2z3UmRAKxdwDNrDwb2G4YVjFYamfw8VplAL1A2Rdgj
	 62CO+U/EtQWT7ezS1K3AhUG7n/9gwslJ68jcI7mY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37CBFF80086;
	Fri, 14 Feb 2020 14:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C727F80157; Fri, 14 Feb 2020 14:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F23F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F23F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ojr2smqt"
Received: by mail-wm1-x32a.google.com with SMTP id t14so10558445wmi.5
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PW8/MFA25Yi0C3bZ2cfWgw/DrG/iUCeikTSgqslBDz4=;
 b=Ojr2smqtOcE2tiGWdkJkVrM8jprAy8ZrA45J7yJTTR0JYIlhUNuAjNTTgU7r9js9z5
 9nQvxeKuXjOuu0/zlcK0axQHQFev8E4ELS6Mayaiqq2FvjFCQduKkHEWJoyAj4eeMlYX
 JPKjYtYrG4/eyGS7cpUFK+aimGFrpvfKRUV3Wxl24NllRAS+KlME/o2RQt18uJrA3UUf
 ODUL/Mx8HvZBi5N5fRmIYr2yom0Qkigl/NKe/X6M2NGNaTvANIls34mf7yVlcOXPnv56
 BWn5HapyDaM8VZO9E2CP1k87jYzSIOsCUBeU7+QJqTWVb/Xk9FPODgYq9X9ECGqwT9SJ
 AhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PW8/MFA25Yi0C3bZ2cfWgw/DrG/iUCeikTSgqslBDz4=;
 b=mUENLV+9K72rhgj6RrmYMM/Sn3B3JC1RzPKELjQJXv0jNFUaFeNTeBndXLQ0mxSyxx
 zNDtbrxsbUPDIkaGuY39gTz0mE5TUYMRlXuq/9T7qLwCve9k10YsLX7iOk9nyegKffDt
 ngRGnSxc4zyfu5rIugC4WSsZVc8nQMW0v1ckzkK/D7toabOMJI/IRh58cNX4uIAIZf0t
 oevePC/QFUM/O39xEgYMguruqH5Bw7kZyQlAJAO/kbIpF/89dUsB0k67syiGK2cZPseU
 qrgOFjaw3rOAquA9eSgTSLL6Kd3m+EYzbJmLAPQGJ2uBcB8BppxTE+Oju5k0WUoaokIk
 rjjQ==
X-Gm-Message-State: APjAAAVaIqMyzoiFaEuqezqSD1Mk8Wy5fNY4tJkTiq8uZfFS2fwGFzTk
 pmt1nqZ4HoAGfn1GmJD0vN6PGA==
X-Google-Smtp-Source: APXvYqwx+bxS3TpNkZTl/KLprFFaUaOiA9hlk/SssmWwqsVF/2MHHrh1D96KkZ02p9gnpylN0HxuRQ==
X-Received: by 2002:a05:600c:21da:: with SMTP id
 x26mr4684621wmj.4.1581686033984; 
 Fri, 14 Feb 2020 05:13:53 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:13:45 +0100
Message-Id: <20200214131350.337968-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/5] ASoC: meson: aiu: fixups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset fixes some mistakes which slipped through my initial
submission.

Most of these issues have been reported by coccinelle and sparse.

Jerome Brunet (5):
  ASoC: meson: aiu: remove unused encoder structure
  ASoC: meson: aiu: fix clk bulk size allocation
  ASoC: meson: aiu: fix irq registration
  ASoC: meson: aiu: fix acodec dai input name init
  ASoC: meson: codec-glue: fix pcm format cast warning

 sound/soc/meson/aiu-acodec-ctrl.c  |  1 -
 sound/soc/meson/aiu-encoder-i2s.c  |  7 -------
 sound/soc/meson/aiu.c              | 10 +++-------
 sound/soc/meson/aiu.h              |  2 +-
 sound/soc/meson/meson-codec-glue.c |  2 +-
 5 files changed, 5 insertions(+), 17 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
