Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B2E7BA6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55362119;
	Mon, 28 Oct 2019 22:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55362119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299079;
	bh=DDyOoApdMa/M9+yDhKXG6PFgPKhF3GlBv+McHyLXxes=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LsL+mvfd7f+0rRPb8XWvRNOVrsMGlGeRc/s3czwOl7ZMTQAYfVHdkUz5XlmwK+eqh
	 S+0YJmfaREcHOovXr0nUd4oZ80rH3SaKxYNz3nd5seMKVDdjbHNajwMqXyVmaZiYTI
	 fEywmFlVwsjgDq48SCIFds1YnOx62/dJu9s8Szf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C708CF8044A;
	Mon, 28 Oct 2019 22:42:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C96F0F803D6; Mon, 28 Oct 2019 22:42:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AEE9F8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AEE9F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YWjlhZcO"
Received: by mail-yb1-xb41.google.com with SMTP id q143so4621955ybg.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43S0AHLbjp3r3KHR5D4q2J9CsjfnDW7/f1tdadtRYLE=;
 b=YWjlhZcOsYMd0+g7TQ47JILtsga707wM2EHuuGr4C9cn9jZy0L7yb2wOdQtsK8UV9d
 U0xZUb+Sm7gdrXaF0EtXJGi5jLGOw8Zna1tX4qWu8+RLpIjhIGr6UMbjpY4Vc4WI4F/w
 IT0r+GirV1Efx9yJWWcThrnFT0kJXcSAVIl0J3IlkhqeDxpl+1cdg9fLt5SLtT4Pxss3
 rn1S38mpizSYH1+orVrOqoAscc5aZ70NSgFEN/yTWiMDHfRfwS/Ze94FKtWDIw18Revs
 eLHsf5gG8RJtK2C0o63mSh1Mt4cxoFXpJ9alq+xSYOHtCU5zHbZjC0KqcfC/K16kvplR
 nYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43S0AHLbjp3r3KHR5D4q2J9CsjfnDW7/f1tdadtRYLE=;
 b=gAo+ThBw+zdj+yQduYaYFSEAij+tJj8F2k01NAxfPq7XSJp/ywoGxFCoCICwxj5h7z
 qgW/9+d/rARSliqw81rPprC2w8V1Z7zqKcCLE3hIGBtgOhtklU0pZGncb1Mq0jE6gyRT
 YqwxOZjnkVLS7FRMagg5VqvlQxLWE7HHsSuy0u6g1HCzAYD5eok8efkmGq/zwwaE8jiU
 Ch2qo0rU933VWY5oPzxhpW/sQInIUeZJhSBBMOiwy2pj4Nu/Mb0ksJS+A0t1nWauJuv/
 uz3Ol+UykhBq7RXYl/JDVnnKzN1trokD9UuqE5ISQhUvmayYWNbSMRYnCIMVSU4Q3WWS
 dN7Q==
X-Gm-Message-State: APjAAAUeAdg/vJ70+DOPGoRflUyVNM0kHisg19W7jHdWwOAuUXmEa5LX
 f5EAyTdNzUgCFc//08CgpzA=
X-Google-Smtp-Source: APXvYqxHBSnLwQCJnhfCjHrYCxmQIPN5+UmUDZrDVrb3PF1grU9vWOfib/cAvVVarFk3KhOiZwrmKg==
X-Received: by 2002:a25:1382:: with SMTP id 124mr14847431ybt.1.1572298968762; 
 Mon, 28 Oct 2019 14:42:48 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:42:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:41:55 -0400
Message-Id: <20191028214216.1508370-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 00/21] Enable BACO for power savings (v2)
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

This patch set enables BACO (Bus Active Chip Off) for
power savings on VI+ asics.  Similar to PowerXpress
and Hybrid Graphics (PX/HG) laptops, we can disable GPUs
at runtime when they are not in use is they support
BACO.  The runtime pm code in amdgpu was originally
developed for PX/HG laptops, so it was pretty entangled
with the vga_switcheroo and ACPI code.  Since the GPU
contains an audio codec for HDMI/DP, there is some
interaction with the hda driver.  I am by no means an
expert on alsa, so any advice on those patches is much
appreciated.  I had to enable runtime pm on the hda
device to allow the GPU to enter runtime pm because
they are linked.

These patches depend on the clean patches and CI/VI
BACO patches I sent out earlier today.

The full tree can be found here:
https://cgit.freedesktop.org/~agd5f/linux/log/?h=baco

TODO:
- Turn off runtime pm when KFD is active
- Make sure audio still works
- Make sure PX/HG still works

v2:
- Split whitespace changes from baco callback addition
- Fix pci ref counting in px/hg handling in hda driver
- Handle CONFIG_ACPI properly
- Split adding new hda pci ids from adding runpm flag

Alex Deucher (21):
  drm/amdgpu: add asic callback for BACO support
  drm/amdgpu/soc15: move struct definition around to align with other
    soc15 asics
  drm/amdgpu: add supports_baco callback for soc15 asics. (v2)
  drm/amdgpu: add supports_baco callback for SI asics.
  drm/amdgpu: add supports_baco callback for CIK asics.
  drm/amdgpu: add supports_baco callback for VI asics.
  drm/amdgpu: add supports_baco callback for NV asics.
  drm/amdgpu: add a amdgpu_device_supports_baco helper
  drm/amdgpu: rename amdgpu_device_is_px to amdgpu_device_supports_boco
    (v2)
  drm/amdgpu: add additional boco checks to runtime suspend/resume (v2)
  drm/amdgpu: split swSMU baco_reset into enter and exit
  drm/amdgpu: add helpers for baco entry and exit
  drm/amdgpu: add baco support to runtime suspend/resume
  drm/amdgpu: start to disentangle boco from runtime pm
  drm/amdgpu: disentangle runtime pm and vga_switcheroo
  drm/amdgpu: enable runtime pm on BACO capable boards if runpm=1
  drm/amdgpu/runpm: enable runpm on baco capable VI+ asics
  ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD
  ALSA: hda/hdmi - Add new pci ids for AMD GPU display audio
  ALSA: hda/hdmi - enable runtime pm for newer AMD display audio
  ALSA: hda/hdmi - enable automatic runtime pm for AMD HDMI codecs by
    default

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 106 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  63 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  20 +++-
 drivers/gpu/drm/amd/amdgpu/cik.c              |  18 +++
 drivers/gpu/drm/amd/amdgpu/nv.c               |  18 ++-
 drivers/gpu/drm/amd/amdgpu/si.c               |   6 +
 drivers/gpu/drm/amd/amdgpu/soc15.c            |  36 +++++-
 drivers/gpu/drm/amd/amdgpu/vi.c               |  22 ++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  20 +++-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  |   3 +-
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |   6 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |   3 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |   3 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |   9 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |   3 +-
 sound/pci/hda/hda_intel.c                     |  84 +++++++++++++-
 sound/pci/hda/patch_hdmi.c                    |   1 +
 18 files changed, 371 insertions(+), 62 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
