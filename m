Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE23BAD94
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 17:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3176516B4;
	Sun,  4 Jul 2021 17:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3176516B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625411047;
	bh=GuSMYdTaPMmK+NNppqcVO7GpXbUt+DLVqFO7qkSmpX8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XaiWf1/tejuNj48f82+ts3e8u5dlj9jd9GFOSPUK53PH0orPr4N1XwMoEDJZKzGgc
	 hpk4A0oem/7LMSZb0o28DyYs3g5JACbYlY4otjIEtCXK1aTS8IZa9GV4eWLbwmwS2T
	 OdfOaO8666LlG4iCYna9OY0je9y7VkfbrOXMPglY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC55F8028D;
	Sun,  4 Jul 2021 17:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D92F8014E; Sun,  4 Jul 2021 17:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9578F8014E
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 17:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9578F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NbADD9+7"
Received: by mail-lj1-x231.google.com with SMTP id a6so20961917ljq.3
 for <alsa-devel@alsa-project.org>; Sun, 04 Jul 2021 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xTN97w8XIGDTjxvTLbrfb/afaXrPnyo60XpFbJbFNc=;
 b=NbADD9+779eUTcOL97RoK3y83GFYbdFskagr7niqpCqjGw3mmIetLbv8U/hFMDKmTB
 PokV0QEuqTP2ory/M/34m4xpZq6re/iTbM+eI4m7kpvweWmf7iyp00lIu87Koh1+lr6o
 dLJkBvO2QGCcHGeBi5VV/Gw94CfYvVhXmnllbDTebehtTnHueq8iLjiU+URC8mwVsTOw
 24RG7Jp5DDjVnrbeOcqTC3446Y+B5zV9WhZNJFxr7iitOrkZmEGJ/BVK0xF2yiEPuEQY
 T+ocLk3PZ3SLRpUihqXGCpPwsD79XgnxADpdyPZnmuwn1OvHCiY+KPsNE5brIWZrwiIN
 o+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xTN97w8XIGDTjxvTLbrfb/afaXrPnyo60XpFbJbFNc=;
 b=tCtSmOTpazBocHYUndYZm69AYmApwIbj8LbND7UgJeWkPRqD/s/0k1wtkkNE57EYN5
 D9A6+opiIOGQMl1THeGP2KjAZSU+YYANZtUDlAD6/NIpUL4YKhEuhVbrD85h6u5xxlsM
 pEx8PusaGdmA9nfBuNMtLVMY2zmEc6NY/vvT9tj17M7dw3o6FbSguMObMoM5Yvv46jSa
 YUycyuJvuayJ042NC7z0Cf2IYKD09QUAX54LniRRseCkPNNR2/VQVA98uV9adl5HwKAk
 bf+Jt6s6ifeRRiXZAbXQWY/O5AFaxk/zAWNvyL3XIfj/GiEPuFE/ghd1bDF+Vc5EMT93
 Jq4A==
X-Gm-Message-State: AOAM532u/vv3Ym7Yu+/35Do2ldTOQ+y3gHdr+2biAccsuwOAwqrL9jIc
 r5dbCFOSZ0YD3+wKnZjThvE=
X-Google-Smtp-Source: ABdhPJyXzi8stOptuSmyIr/cDlu0eVO6W3HQthBg6222BpaKwGnxJPww36YudAw+sOST2Y5/dl4lGQ==
X-Received: by 2002:a2e:89d6:: with SMTP id c22mr7639726ljk.132.1625410953365; 
 Sun, 04 Jul 2021 08:02:33 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 08:02:31 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
Date: Sun,  4 Jul 2021 18:04:45 +0300
Message-Id: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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

Hi,

it has been on my todo list for several years to support McASP on OMAP4 devices.
For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
davinci-mcasp driver) to support what was needed on that specific phone + it's
dock for S/PDIF (48KHz, 16bit, stereo).

Not many (if any) device available to test the DIT mode of McASP.
I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
not used and the signal is routed to expansion J6 pin14)

In theory the McASP in OMAP5 should be working after this series, but the OMAP5
TRM is not public and I do not have one to check the addresses and see if there
is a way to test it on omap5-uevm.

Mark, Tony:
The ASoC and dts patches can go via separate tree I felt that it is better if
they are together, at least initially.

Nikolaus: fyi, this might be useful for Pyra?

Regards,
Péter
---
Peter Ujfalusi (5):
  ASoC: ti: davinci-mcasp: Fix DIT mode support
  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
  ARM: dts: omap4-l4-abe: Add McASP configuration

 .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
 arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
 include/linux/platform_data/davinci_asp.h     |   1 +
 sound/soc/ti/Kconfig                          |   1 +
 sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
 5 files changed, 168 insertions(+), 42 deletions(-)

-- 
2.32.0

