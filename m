Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91315028D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 09:29:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C63168E;
	Mon,  3 Feb 2020 09:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C63168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580718560;
	bh=OJN2/uLVIsgqcH/AghU5E9YOiwvt7AH8COaAvsyz2+U=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kpY5fdqpOs1zz4+PuXx/cd6ZJ5cre7nymnapZW6vilZp2wdtGsrWvzdNtk1+Z8bW6
	 h+h6E71kHKOLhu60LnoOEJb+eogg+NWdsgxlAQUdQ4i8fJXn2ipZA47kwBHGPfXFYd
	 FEu+PmKor98DYwpwkxbHW2O9hQy/zEu4flsurysc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B1BF800B8;
	Mon,  3 Feb 2020 09:27:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E70F80148; Mon,  3 Feb 2020 09:27:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 778B3F8011D
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 09:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778B3F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iB13GvNr"
Received: by mail-qt1-x84a.google.com with SMTP id d9so9443217qtq.13
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fy+9LdJ89SvcriLXoMLV6KLxbywnLrRnH5G3aSoB3SE=;
 b=iB13GvNrJSJbeyMfRETinWYRYCzr/wkXG3AO8qNduyJMq8snOX1jWXWpUtSNNn7FVj
 Nn0b3yf+hSANi4ZLhoFzF7f7sS/MiClijT7CBvdRgGdSuueqZ5gxrofSHpWEbK6Jaq9V
 1DsWbPwm3RX3jLdyJsPi+7PoELoPAHcCiFu34MDNq/IJpiBp/9j7PH33ncxUWZ+LMVi9
 6YTmo8WKDFyLMJp39lmx8MjXCOeMfPl93C1bqlSEdkVjgeG6FGS743sihubX30wN3gF8
 pPUjT64As/bKLIlo2qgMVQtW1hanMYspTnnHUmwpkDD0wLC6olYN6hZNlmcm6Xfsg8RR
 UEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fy+9LdJ89SvcriLXoMLV6KLxbywnLrRnH5G3aSoB3SE=;
 b=sWtQT/jmnmIxREtY6DMBq7BZ/pm7dyb+2B+EtM5FJ+vsTf5TuMhYXVF2/t1Ez8fB5Z
 yORyXeIei618n3tV4ftSWcdx6YF1GH2SExh9QA1/9c1xQEC2xHU6mNw5+X7PHWKL5rsA
 BVUR7SkIwaqU3dBPNbXLY29Jdbc22LezZWM2hgjEZOaw/1SbkM4rFV4qAmcdYHzqsh4W
 5zyD2KS1BE4tFwWHvr1z76buxtgwSC2XP1rtH0wQy/RvYqXj2mYfi667ziKiL1MAcMr0
 IrMlO2Md//3hP4IjKcDIw0jGK0cGORRuwnYVZn0AcwGX1rOaNy+w9RhQgQQstEuiXX3Z
 GMfQ==
X-Gm-Message-State: APjAAAWvtoyhjEcOxCUyT6AFpqV+GKjbal/Fz0jCmlqNKfO8bumFeeLn
 2sbcka6ceMrL89O6kjM5WDC9xxwffk4o
X-Google-Smtp-Source: APXvYqxh95b8T3Ep/ZqxwsC/tOb36xvPmPQEMiGpP9ByAIGo07PbD4gNd2Ng3ZaOE248oHfhtNnOP5DaV7Zm
X-Received: by 2002:ac8:7c94:: with SMTP id y20mr22435940qtv.147.1580718449888; 
 Mon, 03 Feb 2020 00:27:29 -0800 (PST)
Date: Mon,  3 Feb 2020 16:27:14 +0800
Message-Id: <20200203082718.59614-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 0/4] ASoC: mediatek: mt8183-da7219: pick fixes
	from mt8183-mt6358
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

Tzung-Bi Shih (4):
  ASoC: mediatek: mt8183-da7219: change supported formats of DL2 and UL1
  ASoC: mediatek: mt8183-da7219: pull TDM GPIO pins down when probed
  ASoC: mediatek: mt8183-da7219: support TDM out and 8ch I2S out
  ASoC: mediatek: mt8183-da7219: apply some refactors

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 164 ++++++++++++++++--
 1 file changed, 147 insertions(+), 17 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
