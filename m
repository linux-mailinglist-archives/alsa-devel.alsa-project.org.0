Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C146D3BC335
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE0816E7;
	Mon,  5 Jul 2021 21:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE0816E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625514144;
	bh=5qZeiYbxuz10gFdRgNypXGX6EMZhzV8dzOo+Rf1bNfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Iz0ivD7LYJ7vj1QAfTIc/uuLuF6a6mTk2OGZ3sionCAbqem+Efb/kpxIlUR17PVh6
	 RPfmMrUc0eOD44EsupZtBU58EaAZyfjpET2LBQZXR1kdA4GsizyWSVBCVfygV7mSgQ
	 /pzVFy/ZTt5cJcNsjdJjo6PImHYl2xLlBoWmAvn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E92AF804E2;
	Mon,  5 Jul 2021 21:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040BEF804E0; Mon,  5 Jul 2021 21:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02922F8016B
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02922F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LP7li9Wx"
Received: by mail-lj1-x236.google.com with SMTP id w11so26045625ljh.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2U0wvxPRKxvDIv/UsBUgP1f1+9ZNjFw1lh7hg331W6o=;
 b=LP7li9WxtyVh6I4wyeda/ydzYLij+dGAuC4DGZksPaI1cVn+R8/rq9EgLPUTZ8jCt8
 kGzm96nodNX0cAg3wL0PTyAOJSgfTBOMvR9FlSw4HJLIsm28hkdUWdegoq9x97NPZo5d
 fHC/hKVCtjW+Roc/+V3gJEZDuQHcxiSmH0zJgiSEdryZOMb4tKA/ti4XftJkxioaDnff
 2myBI5regMViCbspFLMBC5G5IgIQScqM1ewA1KFijvG82nPg1oIZ+JomQfGp5G0VT74Y
 ize6fXJehGpHoElHYbdjyyQqBZ7BcV8O+tMZj+sdrq/XkIHtQ+qh2H0HTCHqVHb99ld6
 Z7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2U0wvxPRKxvDIv/UsBUgP1f1+9ZNjFw1lh7hg331W6o=;
 b=JazU/N2pLdwgLKcxTsknKVxtYfRNurf7hVOMqjwM2O41jmMLyonV9pykj2TFmKvwNo
 mr/HBFvEquN0vr4KI6vEm7Efbm2UQsKV6HKP9JjwlYS0DyVyajvzqbbr4RK7mpnzzTIS
 I2rir8IDg/MyEDZ1uDlaAjJPnF5HigbG32YzHzh+Zp2y7cX4drUjvv7aZiH9Y2EpK32n
 Vm82P1FMLNspjkxn1J+ifODkEDkz9yKEG2Hm0PyyxZHNU0XUrUkk6jxHypW0czJyvATB
 QFoUQc5iBkyWk0vucXG/7O/VkItcuWMluzjhkfPSl9DMOOroAbKGcLmc2I+/PKVLklNl
 YyRg==
X-Gm-Message-State: AOAM531y/6naOfazQpXjlW6HxpddXJKmnEcSAMRERr2fy8iFKCpdZ32B
 Qp1PmOIrjRS7NupjJxxl2Vg=
X-Google-Smtp-Source: ABdhPJzs3XKPF7dxtOZ7jnHpnB9/6EpP5VmrK9kqc4/pd1Kc/4KaZF2AI/infMrzAk0zyqsFzK0jKw==
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr12351302lja.47.1625514031141; 
 Mon, 05 Jul 2021 12:40:31 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 12:40:30 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
Date: Mon,  5 Jul 2021 22:42:44 +0300
Message-Id: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
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

Changes since v1:
- Do not calculat that we allow one serializer in DIT mode, just set the
  max_active_serializers to 1.
  Reported-by: kernel test robot <lkp@intel.com>

it has been on my todo list for several years to support McASP on OMAP4 devices.
For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
davinci-mcasp driver) to support what was needed on that specific phone + it's
dock for S/PDIF (48KHz, 16bit, stereo).

Not many (if any) device available to test the DIT mode of McASP.
I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
not used and the signal is routed to expansion J6 pin14).

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
 sound/soc/ti/davinci-mcasp.c                  | 176 +++++++++++++++---
 5 files changed, 175 insertions(+), 43 deletions(-)

-- 
2.32.0

