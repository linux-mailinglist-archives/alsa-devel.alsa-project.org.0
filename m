Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0D56ACD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 15:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112211691;
	Wed, 26 Jun 2019 15:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112211691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561556304;
	bh=mtLGC4XoDflXGg3R+dGI4uTd2ukaUoQBTZgyFZUKqBY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X1bSvt/oh+nf2LHAfBpqTfVBYmKHwVyrJiig3lw9K22QebHzUSlxb6SE3nt2GbMwm
	 cBp4dG6wXQDfdR3oRpvmQCnWw+jKmxm5leC6OsymhX9btTmGlixCzTJVeP5j54BHTq
	 hqJYa/83ytZSYa0T8si/cIiNcQFCmf/sPdf/t3UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E56F896EA;
	Wed, 26 Jun 2019 15:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BF30F896B9; Wed, 26 Jun 2019 15:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4956FF8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 15:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4956FF8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="VHEsNntS"
Received: by mail-wm1-x343.google.com with SMTP id h19so4682533wme.0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FQg0smS+mfYMsusPPdodpkb22WraUSysEIqfJJV0yM=;
 b=VHEsNntS0B4pEO3c7fwECuQ4V7xeuFnooK6MO9IMX978YagrBVIBsBiTY/LeigduXr
 hEbi1aImDb5PmCDtCL69RpPzO091ws2GrWX+YPTWXyBl39/QnErn31JHaEHU3SibngUj
 FNNYMAXWu1Tqgnw5sz2ykr2xgdx7q4KTMKiPYaaQ3KGcDx/koVCST9+xzBl5+BtWNtFP
 5p9Zdc76EobXrkOX18uFkB+3jY53S8T2F5N8v1f5SFftwAhZPOnZY1ma88QRv2JP5rfh
 Tx4fBaWB37o2j1YJ6zOKCb4gZpNh05B4LnMrZroeTsw6Y75HgPdAiFYDfOektVxiXGer
 IPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FQg0smS+mfYMsusPPdodpkb22WraUSysEIqfJJV0yM=;
 b=dOxA0j+jMRCrBsS7CGAbZbMskmhpxP1wi3n9ynukcsJuXCGc6DY95Y+FkeTZcK30kY
 +ngUwoUuW3CVTIq8s1SGlKRmzq/8wfWd/VqrEb7WnInZsyV82I3OinIo7y5WHWETYKNd
 E3DzqYmwzRQ9U6kw7bXkowRIZl4Trv8gsOLdTnOP+lt5ZAfZGgDxcYaowrZARLj8Gn7W
 Mzht9RG/3bETLIesst75PizTsCNImZp+INAqoOXQSS/7i9YHxMiWCczdNlgBOUWG+/EU
 +hYTVHuzC4YOSvaHkAG8I7dLToozSy0meet1lpSSHOR9GnPsVSUUKOmfHNc+X8ZJaEXt
 FrEA==
X-Gm-Message-State: APjAAAVawdHD1ul74JJjp+beUP2KFWhjxq1zOWzFmEqttK+UiJtSnMgY
 ROUuB/lxGbavph+rdYt/14wnAA==
X-Google-Smtp-Source: APXvYqysws+jQlqShYlTKNd5YEBpxaojbCsgdCSKH4ZtXxVfdbxFbdzZ7FYDDAUJSCKD6wEDIJmj7g==
X-Received: by 2002:a1c:3:: with SMTP id 3mr2866435wma.6.1561556192208;
 Wed, 26 Jun 2019 06:36:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w185sm2877880wma.39.2019.06.26.06.36.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 06:36:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 26 Jun 2019 15:36:15 +0200
Message-Id: <20190626133617.25959-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: soc-core: update dai_link init
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

My initial goal with this patchset was to allow a dai_link to have no
no platform component, instead of having dummy by default.

However, when rebasing, I discovered that Kuninori Morimoto had recently
done that in a different way :)

I am still submitting my change since it should allow multiple platform
components on a dai_link, which is one of the FIXME note in soc-core.

I have also added a check on the codecs component availability to align
on what was done for platforms and cpus

Jerome Brunet (2):
  ASoC: soc-core: defer card registration if codec component is missing
  ASoC: soc-core: support dai_link with platforms_num != 1

 include/sound/soc.h  |  6 ++++
 sound/soc/soc-core.c | 72 +++++++++++++++++++++-----------------------
 2 files changed, 41 insertions(+), 37 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
