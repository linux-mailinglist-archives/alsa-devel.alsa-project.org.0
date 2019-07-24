Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6883733CC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9B01933;
	Wed, 24 Jul 2019 18:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9B01933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985583;
	bh=BElm6cxKq120MG99iwFVZIDmyhtylabwVtpsx88zx+Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fVfRO6Si97Up4wdZTkfUDzrs8XSUxMZ3UThbsYtDLedOhcA/+LJOJDR4Uo+dp8SAM
	 DP1/vZN2ecZN0siNoX6uHMaFS+YbwAu/Cbh+5ATBPolFOgA3gu+5tWlNanErtuo13I
	 zydUg3A54z0JOnZXUc7au488SrdFS5W07ZDMJVio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A825F8049C;
	Wed, 24 Jul 2019 18:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAC7AF800E3; Wed, 24 Jul 2019 18:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F58F800E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F58F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="jITz/uDE"
Received: by mail-wr1-x442.google.com with SMTP id r1so47646245wrl.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rscQz3KUGOpkCDKHMcXdQe7Cl/GoBVV86V2E9kxxK1s=;
 b=jITz/uDE43k3A8NB1nlk3u+xzG/Y0MTElmt4Smge4Q7/p2i4AQP+Ot+lzFSbs47nGs
 nn730d5rJ1NTniNhwvL69qjT1i8otT5IErkH1IiOMTNxW24JI06varqHToVixQg9jubW
 apzUCJPFyUzn7NKyoVzr34ZHbOSBLFFqurZhsZcz1QT5CYE5yCVjRWij5XwCt1SsMLH6
 gO3Jx9ohRvjRTh/gNM246+tC38Ty8u7M+KUP7nIZiB3NUacjKhIFZsBmuWhWZ1skiHep
 HHskYmreyeF6CvNKUjIf88ehFvrMJu1k0LGqCrX+Itgq1xAhb/3oczCVjg1ktXi2w5x3
 +efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rscQz3KUGOpkCDKHMcXdQe7Cl/GoBVV86V2E9kxxK1s=;
 b=ZXOvAV767vxH1LQgnd9cz6U6aUehIInDfjbvMfopijvv2r4EMWK+lZrz0uoMDL8ZEm
 GPRTJtG4WLzbwPhLqqCXLo085/hkoeu2pLz2hb9mWgUxuuy31G3IQWShf9qMWIcdmBj1
 4DyUEGcX5KRSh5pdtRyaY/LohCRuSYwSYD7x8TfC9T1YJF7JekNoSIsHwEhB9UfqARrU
 GBNR7P2+bG/DAvGHUYCQiUobV7YuQFwRlgFsXlC2KDup2t8/ViG/K5FRJOn4rNcY8ROg
 ZVGyanj+zz97eFQUuXEXVctLbZthh/bNly57XmA5KN72q+cHzFfvAuBftKVl0HHkZCA3
 yHOQ==
X-Gm-Message-State: APjAAAVDzhtyD6xe8/wVrIywpT2IUHsxYzhibwxZl4JjykWE3mYpTCEx
 jnhDHQIM31WodG6ctsHJsz1yNg==
X-Google-Smtp-Source: APXvYqwzABCOBCOzXWxksAWXozHEuvx2wpN+ZOBXgno4LlJoOSdi7K6PGndRhEJOhxZWMIuNGujEzw==
X-Received: by 2002:adf:8bc2:: with SMTP id w2mr5964754wra.7.1563985449460;
 Wed, 24 Jul 2019 09:24:09 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:23:59 +0200
Message-Id: <20190724162405.6574-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/6] ASoC: improve codec to codec link support
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

As explained in this previous series [0], on Amlogic, we are using codec to
codec links to deal with the glue which is between the i2s backends and the
synopsys hdmi controller.

This worked well until I tried to .get_eld() support in the dw-hdmi-i2s
driver.  Doing so adds channel mapping controls to the codec. This shown
several problem

1) .pcm_new() is not called on codec to codec links.
   struct snd_soc_pcm_runtime do not even have a valid .pcm
2) struct snd_pcm_substream and struct snd_pcm_runtime are ephemeral
   This is a problem if a control needs to access them

The goal of this patchset is to resolve the above issues and improve the
codec to codec link support enough to correctly handle the hdmi-codec

The support of these codec to codec links could probably be improved in the
future to behave like any other link and use soc_pcm_open(),
soc_pcm_hw_params(), etc...

The challenge lies in the dapm mutex. The soc_pcm call dapm function locking
this mutex but the dapm mutex is already held in snd_soc_dai_link_event()

[0]: https://lkml.kernel.org/r/20190515131858.32130-1-jbrunet@baylibre.com

Jerome Brunet (6):
  ASoC: codec2codec: run callbacks in order
  ASoC: codec2codec: name link using stream direction
  ASoC: codec2codec: deal with params when necessary
  ASoC: create pcm for codec2codec links as well
  ASoC: codec2codec: remove ephemeral variables
  ASoC: codec2codec: fill some of the runtime stream parameters

 sound/soc/soc-core.c |  42 +++-------
 sound/soc/soc-dapm.c | 186 +++++++++++++++++++++++++++----------------
 sound/soc/soc-pcm.c  |  35 +++++++-
 3 files changed, 162 insertions(+), 101 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
