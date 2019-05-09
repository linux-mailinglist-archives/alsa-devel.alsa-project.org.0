Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD919452
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013C0188D;
	Thu,  9 May 2019 23:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013C0188D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557436561;
	bh=gGG8PEM6wrRAvZNs3w361U/6JkhfizI+UQdaWmkpilY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U1vcZiBps2BoIN3mzmCejR9ZG9ClOwOJlPC6lK8SKGs4r5ocbAodkyWP8YG8W+lBt
	 LS/ENYRJ7Iw2fpf1QIKdtX2wKQ+ZDNxJzxA/6/0MdkuJTMHJ3Tjvls4yl1QebmKcqq
	 hjxUOdk5DZpqQzur+xZlp8PjyEC8WAy/DPamKxG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB0DF89701;
	Thu,  9 May 2019 23:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC729F896DA; Thu,  9 May 2019 23:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5438F89674
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5438F89674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PuAzQQMz"
Received: by mail-pf1-x443.google.com with SMTP id t87so1964895pfa.2
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9AsCRlkOOmYTXd62VCE+TLaRBh2EP8zJGBIvpPdv+s=;
 b=PuAzQQMz7nwC9LEZewasSekHzr0gzavO/OiUWtrEjI2oRvWoSOlhf23dIs2YNuL8+I
 hjQzfRQubWGAS97DozJVYiZkX1o6rwy8U0L2nQVVJXC4iTo4kh7mrNxL0WxOE6XUBMaL
 AFAb1N/SveVKB8LKCd3n40EJH9pcpBSkZtzcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9AsCRlkOOmYTXd62VCE+TLaRBh2EP8zJGBIvpPdv+s=;
 b=LJHueNiihGPCgr8ZyHBA7oHbx4RVd8oXg22KlSRMKlzJf8f+mxdhQckvU/VT2ID4p2
 MRfmex0jLP+KVjqUytrpanpZef9ZJSF10yLa2CWaGm6NPrNCWoJdlBHFm3IEkLG7xBpH
 Pm/ECrNJNtLi/mYQM8brIRNnpRJOGcjs8+sWi3ZiA2/1lycIuinlwbWjXVDjb+9AXswl
 IN6rV7NUBTm7QFk+EgvGX0p0EvGHp308dBECUazkfT4KHxdTIb0n/Vrf2sUVNr8FOh6z
 733Nj3LUPkvMoFKo1KimWHvTGB5maQXJfFUn9S5RqtK3Q1K6iAJPmbQN2MB01NZ514fG
 2WZA==
X-Gm-Message-State: APjAAAXUFMVsyrymeiTs0HkXa2V4V4PUXq/BYzu4GaLYPKsN4kvS78s0
 c+iODTWnGywtgsqRBMp5ePus8w==
X-Google-Smtp-Source: APXvYqzOA+ux6Z4uGST2w2ScerR1nnAkn72owRHC1ECieOpbdEaZoJNeaELR4m34RLFLexWgNiS4ow==
X-Received: by 2002:a63:3190:: with SMTP id x138mr8583878pgx.402.1557436442056; 
 Thu, 09 May 2019 14:14:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id r8sm4162245pfn.11.2019.05.09.14.14.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:00 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:23 -0700
Message-Id: <20190509211353.213194-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

The interface between CrosEC embedded controller and the host,
described by cros_ec_commands.h, as diverged from what the embedded
controller really support.

The source of thruth is at
https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h

That include file is converted to remove ACPI and Embedded only code.

From now on, cros_ec_commands.h will be automatically generated from
the file above, do not modify directly.

Fell free to squash the commits below.

Changes in v3:
- Rebase after commit 81888d8ab1532 ("mfd: cros_ec: Update the EC feature codes")
- Add Acked-by: Benson Leung <bleung@chromium.org>

Changes in v2:
- Move I2S changes at the end of the patchset, squashed with change in
  sound/soc/codecs/cros_ec_codec.c to match new interface.
- Add Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Gwendal Grignou (30):
  mfd: cros_ec: Update license term
  mfd: cros_ec: Zero BUILD_ macro
  mfd: cros_ec: set comments properly
  mfd: cros_ec: add ec_align macros
  mfd: cros_ec: Define commands as 4-digit UPPER CASE hex values
  mfd: cros_ec: use BIT macro
  mfd: cros_ec: Update ACPI interface definition
  mfd: cros_ec: move HDMI CEC API definition
  mfd: cros_ec: Remove zero-size structs
  mfd: cros_ec: Add Flash V2 commands API
  mfd: cros_ec: Add PWM_SET_DUTY API
  mfd: cros_ec: Add lightbar v2 API
  mfd: cros_ec: Expand hash API
  mfd: cros_ec: Add EC transport protocol v4
  mfd: cros_ec: Complete MEMS sensor API
  mfd: cros_ec: Fix event processing API
  mfd: cros_ec: Add fingerprint API
  mfd: cros_ec: Fix temperature API
  mfd: cros_ec: Complete Power and USB PD API
  mfd: cros_ec: Add API for keyboard testing
  mfd: cros_ec: Add Hibernate API
  mfd: cros_ec: Add Smart Battery Firmware update API
  mfd: cros_ec: Add I2C passthru protection API
  mfd: cros_ec: Add API for EC-EC communication
  mfd: cros_ec: Add API for Touchpad support
  mfd: cros_ec: Add API for Fingerprint support
  mfd: cros_ec: Add API for rwsig
  mfd: cros_ec: Add SKU ID and Secure storage API
  mfd: cros_ec: Add Management API entry points
  mfd: cros_ec: Update I2S API

 include/linux/mfd/cros_ec_commands.h | 3658 ++++++++++++++++++++------
 sound/soc/codecs/cros_ec_codec.c     |    8 +-
 2 files changed, 2915 insertions(+), 751 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
