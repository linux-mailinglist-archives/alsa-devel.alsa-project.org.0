Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41ED389818
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 22:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478DD167C;
	Wed, 19 May 2021 22:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478DD167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621456780;
	bh=8sVTukADyGryI2Py1L1HMZItjH7YGbtelP2AQ7vX6Tg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shMuumJ75c33Hbv1OFsIpfbwwP29fOVOCXen/MfU7PmlPhDql+tr8UjI/9a4Gyr7C
	 m5XIL09DmhnUC02I70HGBG491EstUSt6R1JU9w3BIaUXHwYL8aLyNwFB4Xwh8fviX3
	 TtXJWJSJhlK7W/0cHmvH6sd6aNQq5aW8Y549fqaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1706F8014C;
	Wed, 19 May 2021 22:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0737F80246; Wed, 19 May 2021 22:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA75AF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 22:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA75AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vY8qkzr4"
Received: by mail-ot1-x336.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso12943106otn.3
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zoJsK2/3QCBxYlpIkU9Vv7NwsJFupqw/wU/nB19xMXc=;
 b=vY8qkzr4c+lc8o4NVC8uztEgqhKsGcWE5hJ5LRL8y/GbdTOcwdx86hkt7waVPHlk3W
 XHypI1bKlLJWRz9cR42KQ0GQ1LXZ2AgdjLpy3jix2OLjACcAaTXBr5bmfABnarq84QZX
 MdI+Yq35QOGpCdx7FKYnpwuxL5+AbIr3g0Kg2N9wEZkp5cgJmydRiWGJxXW2b3fADLAd
 J21vHUrdgEA0rloEsnMrqPztnASsr6afqHEia6EZjHwDZdoWN9wPz2WixrFZZe4K3D4i
 Vx0ReVImMZEf4h1QOLU0cBxmrUctXqvZWOl15/yNp8W9IpKJVyDSvO1FnQtoCKDRYH9v
 LPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zoJsK2/3QCBxYlpIkU9Vv7NwsJFupqw/wU/nB19xMXc=;
 b=TRZtMH2vqtDI6db1pWJO4aFvppZ/uqJttaDIiRF/xkgCHv/MOiMxucofgPe2WmcprM
 yOtLmwSwRC776JLvSzSbc5yu7VgOvp0U18am8OMpButqsqQJMsMR34Ynh2e6Y69TN4hV
 br3oQG1ZUPVbhhYRmTkGhqyQKagWwxHRB2yb5Nt8+5KWVCbaLqxiMtSAJG9rR+5QvQCQ
 uqlCKrwGDVm/yjH+V6oxFuDuB2ZM6n3XM+Fl31SJkoEZK5lOyRttrNziie5mxuRnAMkV
 JSb73HGrb/epZvgOWF7+K9/SBTDwNhH6Y60e5ZDIPJF2Sdp5Ka2W9dDPF6r3Rfj3QlPU
 khuQ==
X-Gm-Message-State: AOAM5330EB12GuNiSezO/VucKrKqmiGwU3Q+PF4XSaQsmST9ufUpZxg2
 T4JES1vLrPqGeW2kr8TACi4g7GUP3Xg=
X-Google-Smtp-Source: ABdhPJySgaibEkkhNuEo+cdWp/uOpKYJKp5GKX3bingGqeu3+KD77l3RbQHH3sA3PdeITiNBdGdWKA==
X-Received: by 2002:a9d:6255:: with SMTP id i21mr1120079otk.284.1621456682631; 
 Wed, 19 May 2021 13:38:02 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id w6sm189223otj.5.2021.05.19.13.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:38:02 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v12 0/4] ASoC: codecs: add rk817 support
Date: Wed, 19 May 2021 15:37:50 -0500
Message-Id: <20210519203754.27184-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

From: Chris Morgan <macromorgan@hotmail.com>

This series is to add support for the Rockchip rk817 audio codec which
is present in all Rockchip rk817 MFD chips.

Changes in v12:
 - Updated codec cell in MFD driver to a single line.
Changes in v11:
 - Stopped checking for presence of parent node in codec driver, as
   driver should never be called if parent device doesn't exist to call
   it.
 - Made codec subnode optional and stopped returning errors if it is
   missing.
 - Downgraded missing codec clock message from dev_err to dev_dbg.
   Users who choose to use the rk817 PMIC but do not choose to use the
   codec will not get an error message unless they have debugging
   enabled, whereas users who wish to use the codec but don't have the
   clock defined will not get an error message unless they have
   debug messages enabled. This seems like a fair compromise between
   mututally exclusive users. Note that errors with the clock or codec
   will still result in a dev_err.
 - Updated DT documentation to note that codec subnode is optional if
   no properties are to exist beneath it.
Changes in v10:
 - Correct order of test/ack/signed-off to chronological order.
 - Removed ifdef from mfd driver keep cell from being added when the
   codec was not to be built.
 - Changed codec DT parsing messages from error to debug to prevent
   errors in dmesg log in the rare but valid case a user has the rk817
   PMIC but does not use the codec.
Changes in v9:
 - Add cover letter.
 - Remove documentation for interrupt parent per Rob Herring's request.
 - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
   robot.
Changes in v8:
 - Added additional documentation for missing properties of
   #sound-dai-cells, interrupt-parent, and wakeup-source for mfd
   documentation.
 - Corrected order of elements descriptions in device tree documentation.
 - Changed name of "mic-in-differential" to
   "rockchip,mic-in-differential".
 - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
 - Removed unused resets and reset-names from the i2s1_2ch node.
Changes in v7:
 - Removed ifdef around register definitions for MFD.
 - Replaced codec documentation with updates to MFD documentation.
 - Reordered elements in example to comply with upstream rules.
 - Added binding update back for Odroid Go Advance as requested.
 - Submitting patches from gmail now.
Changes in v6:
 - Included additional project maintainers for correct subsystems.
 - Removed unneeded compatible from DT documentation.
 - Removed binding update for Odroid Go Advance (will do in separate
   series).
Changes in v5:
 - Move register definitions from rk817_codec.h to main rk808.h register
   definitions.
 - Add volatile register for codec bits.
 - Add default values for codec bits.
 - Removed of_compatible from mtd driver (not necessary).
 - Switched to using parent regmap instead of private regmap for codec.
Changes in v4:
 - Created set_pll() call.
 - Created user visible gain control in mic.
 - Check for return value of clk_prepare_enable().
 - Removed duplicate clk_prepare_enable().
 - Split DT documentation to separate commit.
Changes in v3:
 - Use DAPM macros to set audio path.
 - Updated devicetree binding (as every rk817 has this codec chip).
 - Changed documentation to yaml format.
 - Split MFD changes to separate commit.
Changes in v2:
 - Fixed audio path registers to solve some bugs.

Chris Morgan (4):
  mfd: Add Rockchip rk817 audio CODEC support
  ASoC: Add Rockchip rk817 audio CODEC support
  dt-bindings: Add Rockchip rk817 audio CODEC support
  arm64: dts: rockchip: add rk817 codec to Odroid Go

 .../devicetree/bindings/mfd/rk808.txt         | 188 ++++++
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  36 +-
 drivers/mfd/rk808.c                           |  81 +++
 include/linux/mfd/rk808.h                     |  81 +++
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rk817_codec.c                | 539 ++++++++++++++++++
 7 files changed, 931 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/codecs/rk817_codec.c

-- 
2.25.1

