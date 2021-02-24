Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873B3245AA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 22:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC201658;
	Wed, 24 Feb 2021 22:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC201658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614201663;
	bh=R5I/gQJLOJsbQnwISs5xTBVjbHY3IXLBkWv6W7GENNY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LML92khiadKkoUvEOlgnFaaXWau8pgsFXJmg947SHvBY6/9MTrtl3zxf1Zb6dr3P+
	 bZdzylU/rDCfytfs+RGKTXDakIm9Lb/U3OVS+RX0fGdar3j3aCEY3SWb0ehXfjEw84
	 X6fQq6P+oVDvpx2OxLK+t3C2Q3j6WINog5ja0sJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3B1F8016C;
	Wed, 24 Feb 2021 22:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BE72F8016C; Wed, 24 Feb 2021 22:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 065BFF80159
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 22:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065BFF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vSNWtu+h"
Received: by mail-lj1-x22f.google.com with SMTP id e8so4107386ljj.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wS6FEYlpa8V4SEOFzYNw75kR4rI+of4Jli7dMikAW/s=;
 b=vSNWtu+hdZAgtGKmRpzoRNIgHdtE+qvx53E31I0OX56mL6IjztTv7/ajsYk4wdhrSk
 IKi9gnrqOcBV+kmvtzjxCz0Duso+Jr1r/ntqEvM/8GT0530QS9J8WGRcJ4IjI1uso5IV
 mw/Ree6XVGE5leCEI4WLeb0VivamUWvMj8O6o9hypzKRMdn6sSd7hZF4mEWFvQ9KEwCc
 CBmBSbGPpH5BPYqpNL552wH3yyj2kwPEH1DSSmCkFrxJQgi2RxmmUgp/Rq6O8D6dYRRt
 wuymtqGgsIbfW5aCyMN+KP6YeHndtmMdfLhbjE29laTRGBDX2zTVnL/IvAO9mfcwsHDw
 ZyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wS6FEYlpa8V4SEOFzYNw75kR4rI+of4Jli7dMikAW/s=;
 b=gOEe4P8ayWVW2eBZ0X67Bdb6KEUdswX5K6AsShEf10nXK6xIFB+W+X8utUSeBU7Iiv
 loKJjK4F0eLFioSHjWQVfs5ceWPoK1NYtT9ht+W+2KJzBCVmdFUaG+qqI5K/c7O2aCsq
 Vy1OwdWjXqgk63rSgPTRHD7JPUhAU4IuEc7IHvhdhT6y/4KVIeefp+mR5k6gnxpizwQS
 WHMI0DDVkdfOkP1j/2JKzwWJw0V0s6gR6Qi9kc/dDzymt2WFT+18/OEgEVb7swMf0hAn
 GDIpGEhMt9a88QeC2lLdH+trurri45TJkZU7GNXWEARtDV0APLJV3WIulRLEeL1MjiOS
 zgAA==
X-Gm-Message-State: AOAM531wZ8e941HviH0EUXkU/qo+mNLbZy11HI5a9V8/JnSAxC0moxzS
 F2Ay93hDS+mJp4GiaTakk9Y=
X-Google-Smtp-Source: ABdhPJzTH6jZIK2lpsxudYsQmD0/OWsjX2ws8hrKG2PLJX/OCQVQ9kR/mAXtyt8MnrFOQ0b2CQ5Ktg==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr20734452ljv.105.1614201563059; 
 Wed, 24 Feb 2021 13:19:23 -0800 (PST)
Received: from localhost.localdomain (h-98-128-229-129.NA.cust.bahnhof.se.
 [98.128.229.129])
 by smtp.gmail.com with ESMTPSA id w26sm717116lfr.186.2021.02.24.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 13:19:22 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] ASoC: rt*: Constify static structs
Date: Wed, 24 Feb 2021 22:19:14 +0100
Message-Id: <20210224211918.39109-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
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

Constify a number of static structs that are never modified in RealTek
codecs. The most important patches are the first two, which constifies
snd_soc_dai_ops and sdw_slave_ops, both which contain function pointers.
The other two patches are for good measure, since I was already touching
the code there.

When doing this, I discovered sound/soc/codecs/rt1016.c is not in a
Makefile, so there is not really any way to build it (I added locally to
the Makefile to compile-test my changes). Is this expected or an oversight?

Rikard Falkeborn (4):
  ASoC: rt*: Constify static struct sdw_slave_ops
  ASoC: rt*: Constify static struct snd_soc_dai_ops
  ASoC: rt*: Constify static struct acpi_device_id
  ASoc: rt5631: Constify static struct coeff_clk_div

 sound/soc/codecs/rt1011.c     | 2 +-
 sound/soc/codecs/rt1015.c     | 4 ++--
 sound/soc/codecs/rt1016.c     | 4 ++--
 sound/soc/codecs/rt1305.c     | 2 +-
 sound/soc/codecs/rt1308-sdw.c | 2 +-
 sound/soc/codecs/rt1308.c     | 2 +-
 sound/soc/codecs/rt5631.c     | 2 +-
 sound/soc/codecs/rt5682-sdw.c | 4 ++--
 sound/soc/codecs/rt700-sdw.c  | 2 +-
 sound/soc/codecs/rt700.c      | 2 +-
 sound/soc/codecs/rt711-sdw.c  | 2 +-
 sound/soc/codecs/rt711.c      | 2 +-
 sound/soc/codecs/rt715-sdw.c  | 2 +-
 sound/soc/codecs/rt715.c      | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.30.1

