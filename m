Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0049FE365
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:53:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57EDD1669;
	Fri, 15 Nov 2019 17:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57EDD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573836807;
	bh=dlfr8sXFGqN7FbUUhAn7jd3jC/b2v0intR5c0xF27Jo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OiQcjMrpcFuEUjWZmgyODCFw3/zC1ykw7HadBod8RTE8EF5Hoc/8lky3olKzFe+KE
	 DaXQC2DbLxRIkylzVqBsZ5z2/KHzUtjsOXO9V0KkiQ5qyoJilIF8h5oE+OuSPO9UoM
	 7oxvFkUC018uEaY4T0XGga41jACLDz7vZ1XiYuhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F6FF8010D;
	Fri, 15 Nov 2019 17:51:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F545F80107; Fri, 15 Nov 2019 17:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F4AF80103
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F4AF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sbghSlNM"
Received: by mail-qk1-x742.google.com with SMTP id d13so8624282qko.3
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKG53leD+VS+BIKsk2yJF791AEJDMUDmdfqQ8c5h1+0=;
 b=sbghSlNMyxMPfpAD5q1khmAPpxRApzzAiOuTfW37wjptTZABiXmjNYR8AzLB/9otzT
 FUj2XSzEV0PR2huAMXExh+sG2CkQi9fUSlMioJcvi0XELnLfYoACYU0cyZ8P6OSicahK
 v7hrxGR7xe/MZv4psEktFB88kDLeAPoYtV74YCaA8kv3/HmTPQ8SF72Jpq+W4sXwTIuN
 ZXyfLAHX/qs3qBB4sFFTxeCaMeRO8fhQQ71hOWDOG0FbClKnm+woS8GU5bUeZzosb7Gt
 aaLBz0DhcgaiB76XPih4DUOVN49XbFdDxoYm5dujRcFDRrP3Tc75c5I04O4YAlenJlte
 /Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKG53leD+VS+BIKsk2yJF791AEJDMUDmdfqQ8c5h1+0=;
 b=OIX/6cn8A7fGjG5vHRD/npnMlENw1p1a1JaAzevvNBBdFgFrwWPMWAvG43DZkS2rlB
 nmHTP4Gl/8szRdUAXMjEaIKf3DKbObe32AgQIcbGrQXnkarhueD7rT12ZnLDifJMndLG
 hU6sZz8dLud1C3bN9EPXrBEZ/LN3q3IpYOPvOROmPTwqvWXNQrg0CGwwYrPfVZ55RIrQ
 WhhO3M6JlyCa2o7jbxhj8/P58HFefpkMR66GtngQ8dV2UViJKC/B/5ibquDxs/p0QbGO
 kGKXoqRdyq9ttmzDOJ1+Wez/BD/czxedKLBDYnXu6byip46WPuz7icYGn2eE+gyeo1yr
 5V8Q==
X-Gm-Message-State: APjAAAVMBI0MgcbnjIM7j5nXlXmeB4mVlF2/t6xTB2OiMw2ugaIRb18i
 56Qt/kFcWiAxW8ijz6GqM5I=
X-Google-Smtp-Source: APXvYqyKj2APy9jGoN/4Buj+9lgiQIZlMXXiT9bO2e/R46AY329kD1/YIEL135SlLqTAsXQ/8Uqf0g==
X-Received: by 2002:a37:7d05:: with SMTP id y5mr358180qkc.27.1573836646870;
 Fri, 15 Nov 2019 08:50:46 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:46 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:18 -0500
Message-Id: <20191115165038.56646-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 00/20] Enable BACO for power savings (v3)
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
at runtime when they are not in use if they support
BACO.  The runtime pm code in amdgpu was originally
developed for PX/HG laptops, so it was pretty entangled
with the vga_switcheroo and ACPI code.  Since the GPU
contains an audio codec for HDMI/DP, there is some
interaction with the hda driver.  I am by no means an
expert on alsa, so any advice on those patches is much
appreciated.  I had to enable runtime pm on the hda
device to allow the GPU to enter runtime pm because
they are linked.

The full tree can be found here:
https://cgit.freedesktop.org/~agd5f/linux/log/?h=baco

TODO:
- Turn off runtime pm when KFD user queues are active

I've tested these pretty extensively on the asics I
have access to.  All seems to work properly.  HDMI
audio works fine with runtime pm both with and without
the GPU BACO stuff.

I'd like to land the the audio patches and the first 15 GPU
patches.  I don't plan to enable this by default
(last patch in the GPU set) until the KFD changes are
in place to properly handle runtime pm, however it can
be enabled via module parameter (runpm=1).

v2:
- Split whitespace changes from baco callback addition
- Fix pci ref counting in px/hg handling in hda driver
- Handle CONFIG_ACPI properly
- Split adding new hda pci ids from adding runpm flag

v3:
- Don't enable BACO on Navi chips yet

Alex Deucher (20):
  drm/amdgpu: add asic callback for BACO support
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
  drm/amdgpu/runpm: enable runpm on baco capable VI+ asics (v2)
  ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD
  ALSA: hda/hdmi - Add new pci ids for AMD GPU display audio
  ALSA: hda/hdmi - enable runtime pm for newer AMD display audio
  ALSA: hda/hdmi - enable automatic runtime pm for AMD HDMI codecs by
    default

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 106 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  63 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  21 +++-
 drivers/gpu/drm/amd/amdgpu/cik.c              |  18 +++
 drivers/gpu/drm/amd/amdgpu/nv.c               |  18 ++-
 drivers/gpu/drm/amd/amdgpu/si.c               |   6 +
 drivers/gpu/drm/amd/amdgpu/soc15.c            |  34 +++++-
 drivers/gpu/drm/amd/amdgpu/vi.c               |  22 ++++
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    |  20 +++-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  |   3 +-
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |   6 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |   3 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |   3 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     |   9 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |   3 +-
 sound/pci/hda/hda_intel.c                     |  80 ++++++++++++-
 sound/pci/hda/patch_hdmi.c                    |   1 +
 18 files changed, 366 insertions(+), 61 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
