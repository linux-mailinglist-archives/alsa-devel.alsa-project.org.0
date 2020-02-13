Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC715B7C4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 04:30:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BFF91671;
	Thu, 13 Feb 2020 04:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BFF91671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581564641;
	bh=N7Gm1xMp+znQjnrAeQxpZROTWLx4jmn58hjLyJvp+dM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ScfimXV5wRa2O0WbaTHmsjG1kZ+T9jtQ9NVT2+FB+nglAW8HrBsJe2mtyj2VkkOTK
	 0MxBQY9j8Y2aZfzOn7nRor1BZybBr7vkczAUIAx1rm7Bp42vXy7zCQIVhn4tvUisEP
	 PboWyexIWgI2+ccQ29oMO8PyiSCxKHZLCzitYB1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A6BAF80147;
	Thu, 13 Feb 2020 04:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45AB5F80145; Thu, 13 Feb 2020 04:28:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F54F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 04:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F54F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="t6HBaCbf"
Received: by mail-pj1-x104a.google.com with SMTP id z12so2677467pju.0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 19:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lvUVFvkQ+UGL8lu4Bh6PT6bsNkXz8Lj6im7JrImop6s=;
 b=t6HBaCbf5Tsxkw0STC02NHFue7JqowBpcIDwmOPA/dduQq4QxlcTqEV/QmvB42i0kK
 c/WrmtKXFDFPlgl/hLmehnK+D/DjX2KjN7XETLkgpdlN2p4Zd0Gq7yzJOmxLJMLG693M
 qY/ijEE3aHzhw/7JEfx0wTlN41OOv7wkFT4xzR0MmTn2m1zZJ//TMbS2DUP+/6N/QLG7
 JWCv1cvff/pvitSJGXYm/Jkj+T/yp2nkM28vhzusCmkbYCfrHJSPjXCE82kGM2+xFzGd
 shj+Mc0yThiGN5LJXY/oldRZ39pDwBX6qGnASg4scOgAcdF+Q24/agWoXow/Dgrt+2qE
 H1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lvUVFvkQ+UGL8lu4Bh6PT6bsNkXz8Lj6im7JrImop6s=;
 b=DBAK1B6Lpo8fO/mEMfAkZ8N0gJVyAWzYlUMqOlnELzeipGLts2AOeRH4TUnj9r+Xvp
 roH89P2xt8eRgyBU0Zd+/ojQm4Z/HhzJGbxC5YPuF6rAr7sHxUwoBdZMYwiALHkGVLlP
 OizUzZNWTT9o4shXveNdUYVAwteJ4ACPk1TrWwLo8GaywR3PgCfaGT6DgCnjuHwfwKad
 Z/vqlQ/8blTAfuI2qmCxAMM+NUc9+SOS1wbzJHkTXBHC/4qlm4lJKX5aX/19fUU0yjId
 GvaTo1VFUzF4QZleJYuKl4CO4bzaanqcW8F8e34hXSH8GWy1DoV6xnqICDseOzWewU/s
 AD3Q==
X-Gm-Message-State: APjAAAUEWN0hXAe8+TCbn9fHgvLYn8F70BZ4BcsILJujbPRPpYd3K/YF
 afAQzE5QXlvkKt6mDZZ9504rF58IygaK
X-Google-Smtp-Source: APXvYqzCCk1G50m4i0Ktai+dWlBUiypiPCiPUKW5PaWRrlAnF01IBmtNoLgOpKjhLJ2KSOkOD5yyYghSWjmd
X-Received: by 2002:a63:5157:: with SMTP id r23mr15171897pgl.81.1581564481918; 
 Wed, 12 Feb 2020 19:28:01 -0800 (PST)
Date: Thu, 13 Feb 2020 11:27:24 +0800
Message-Id: <20200213032728.199462-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RESEND PATCH 0/4] ASoC: mediatek: mt8183-da7219: pick
	fixes from mt8183-mt6358
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

Cherry-picks fixes from mt8183-mt6358-ts3a227-max98357 machine driver.

The 1st patch from commit 1df1e5457cd1 ("ASoC: Mediatek: MT8183: change
supported formats of DL2 and UL1").

The 2nd patch from commit 6191cbde5ff0 ("ASoC: mediatek: mt8183: switch
tdm pins gpio function when playback on or off").

The 3rd patch from commit 8e58c521bcb8 ("ASoC: mediatek: mt8183: tdm hw
support tdm out and 8ch i2s out").

The 4th patch squashes the following:
- commit 63ba8e4d04ab ("ASoC: mediatek: mt8183: move card registration
  to the end of probe")
- commit 95d779b4b8e7 ("ASoC: mediatek: mt8183: move headset jack to
  card-specific storage")
- commit e5b3ae3e8c47 ("ASoC: mediatek: mt8183: fix space issues")

Changes from previous version:
(https://mailman.alsa-project.org/pipermail/alsa-devel/2020-February/162364.html)
- None, only rebase and resend.

Tzung-Bi Shih (4):
  ASoC: mediatek: mt8183-da7219: change supported formats of DL2 and UL1
  ASoC: mediatek: mt8183-da7219: pull TDM GPIO pins down when probed
  ASoC: mediatek: mt8183-da7219: support TDM out and 8ch I2S out
  ASoC: mediatek: mt8183-da7219: apply some refactors

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 164 ++++++++++++++++--
 1 file changed, 147 insertions(+), 17 deletions(-)

-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
