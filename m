Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C466997F4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:54:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E24EBD;
	Thu, 16 Feb 2023 15:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E24EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559275;
	bh=z8ZNE2ZtxjwVyZAbmSngctbfHv+T3MuUcnCHbXnwl3A=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JTocvN+xp7+alg0MVuJadCc5Xt4Bx/e8seyXl9hRtDkvNwC4FU4GSIRHq6rOSO3rQ
	 ra3NGJN8DO4EkLxACdZN2u13eiDC2WRqmXFsCJWHVDeVYzxa4dfYg+sqgSkA4dOAT/
	 /pz/qsaRxP10Ry0cNVAxb/0LYe6BFSA+UQU4hufg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9060EF80496;
	Thu, 16 Feb 2023 15:52:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5A01F8021D; Fri, 10 Feb 2023 05:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12850F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12850F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XbfKMKai
Received: by mail-pf1-x433.google.com with SMTP id b1so2771232pft.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmf+C+18uqHbrtjkcU8WtNHqdNX45uutvQ0nNnjGiio=;
        b=XbfKMKaiygftk+3FCoymQo0fjqqta8on7sN0Tah7vrlnRm06+fFEvNRRQkpxFgCYwk
         aN+aNZv4f8RmuYDwfAtZg4d5wCmLNGDYrulxaErNYDhjqqLH9ENZBQsHO64XNdBmVUca
         cG+4wwUPHIKnkLVQNVYyKX9BbTvA+VfTM3u2fh3UJAmhwFfQAWz+5qHkXOwdUfXU2d5D
         4ttDFUw+l+tQczr0v5GaMxLcqn+qbyUnx3AOexAQ21SeCVzuZQy2cPblGNgPFGr+Ll0V
         gv9aUSgaje+b9bxNqFb9rTehY/PwX9tnnQVvWUZNKJth4bqSm0POQGhuLB+hwe+F1Qgb
         mxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmf+C+18uqHbrtjkcU8WtNHqdNX45uutvQ0nNnjGiio=;
        b=mbKMJSHayZIB7P+jWsh0sCYDbUJu1vOZcbR0En2h2bV2EIxyp5QxSJP5sp/2AoFFf3
         U1CJ3OZwtmIQEoFgwg9uwYLLzghvLn9qWTTSIZvdsvVckWJ5NWzt3XstdXWnBRv844s1
         ZHHcAjGNCVFM/0nzWj369XnX8zaK3HkzekJTWDuThiXapFFPL4X6RVz1hPPYXEWgE3nt
         ccDvSAzwV3YmYWnkpOOfji8m+ALG21+WhDHDwxhr3zG116TTiRRX7nUt+WjN20dD6VWp
         3CyjLXm8LsD6P3pvyrJvZZ9ozjUJ4KphTPJOcauehLUoD7W4d+TjDRzIIhRgyNbgHCr/
         R0CA==
X-Gm-Message-State: AO0yUKWqb9iF/RFP/slrmEddctxH11UXPP7WxxeD0RZsSHVGQgDwWsZX
	YAu8tp+coYaGz/+eR9585Jc=
X-Google-Smtp-Source: 
 AK7set84McKVzgWzKB8PF4jKgFcuYCiQmlSa+pybg0QvHszf1ptNzpEuIbQiERcJYVwtm+ogtuqE6Q==
X-Received: by 2002:a62:64d1:0:b0:5a8:6463:8f77 with SMTP id
 y200-20020a6264d1000000b005a864638f77mr2587105pfb.11.1676004599534;
        Thu, 09 Feb 2023 20:49:59 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:49:59 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/9] apple-gmux: support MMIO gmux type on T2 Macs
Date: Fri, 10 Feb 2023 15:48:17 +1100
Message-Id: <20230210044826.9834-1-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B4ERAELS5C5HMBRKQWB2TGZNY6REWKOD
X-Message-ID-Hash: B4ERAELS5C5HMBRKQWB2TGZNY6REWKOD
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:52:48 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4ERAELS5C5HMBRKQWB2TGZNY6REWKOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

This patch series adds support for the MMIO based gmux present on these
Dual GPU Apple T2 Macs: MacBookPro15,1, MacBookPro15,3, MacBookPro16,1,
MacBookPro16,4 (although amdgpu isn't working on MacBookPro16,4 [1]).

It's only been tested by people on T2 Macs with MMIO based gmux's using
t2linux [2] kernels, but some changes may impact older port io and indexed
gmux's so testing, especially on those older Macbooks, would be
appreciated.

# 1-2:

refactor code to make it easier to add the 3rd gmux type.

# 3:

has a slight change in how the switch state is read, I don't
expect this to cause issues for older models (but still, please test if
you have one!)

# 4:

implements a system to support more than 2 gmux types

# 5:

start using the gmux's GMSP acpi method when handling interrupts. This
is needed for the MMIO gmux's, and its present in the acpi tables of some
indexed gmux's I could find so hopefully enabling this for all models
will be fine, but if not it can be only used on MMIO gmux's.

# 6:

Adds support for the MMIO based gmux on T2 macs.

# 7:

Add a sysfs interface to apple-gmux so data from ports can be read
from userspace, and written to if the user enables an unsafe kernel
parameter.

This can be used for more easily researching what unknown ports do,
and switching gpus when vga_switcheroo isn't ready (e.g. when one gpu
is bound to vfio-pci and in use by a Windows VM, I can use this to
switch my internal display between Linux and Windows easily).

# 8-9:

These patches make amdgpu and snd_hda_intel register with vga_switcheroo
on Macbooks. I would like advice from the AMD folks on how they want
this to work, so that both PX and apple-gmux laptops work properly.

For radeon and nouveau we just register for every non-thunderbolt
device, but this was changed for AMD cards in commit 3840c5bcc245
("drm/amdgpu: disentangle runtime pm and vga_switcheroo") and commit
586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD").

This meant that only gpu's with PX register. Commit #8 makes amdgpu
register for all non-thinderbolt cards, and commit #9 makes snd_hda_intel
register for all amd cards with the PWRD (mentioned below) acpi method.
An alternative would be using apple-gmux-detect(), but that won't work
after apple-gmux has probed and claimed its memory resources.

# Issues:

1. Switching gpus at runtime has the same issue as indexed gmux's: the
inactive gpu can't probe the DDC lines for eDP [3]

2. Powering on the amdgpu with vga_switcheroo doesn't work well. I'm
told on the MacBookPro15,1 it works sometimes, and adding delays helps,
but on my MacBookPro16,1 I haven't been able to get it to work at all:

snd_hda_intel 0000:03:00.1: Disabling via vga_switcheroo
snd_hda_intel 0000:03:00.1: Cannot lock devices!
amdgpu: switched off
amdgpu: switched on
amdgpu 0000:03:00.0:
	Unable to change power state from D3hot to D0, device inaccessible
amdgpu 0000:03:00.0:
	Unable to change power state from D3cold to D0, device inaccessible
[drm] PCIE GART of 512M enabled (table at 0x00000080FEE00000).
[drm] PSP is resuming...
[drm:psp_hw_start [amdgpu]] *ERROR* PSP create ring failed!
[drm:psp_resume [amdgpu]] *ERROR* PSP resume failed
[drm:amdgpu_device_fw_loading [amdgpu]]
	*ERROR* resume of IP block <psp> failed -62
amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_resume failed (-62).
snd_hda_intel 0000:03:00.1: Enabling via vga_switcheroo
snd_hda_intel 0000:03:00.1:
	Unable to change power state from D3cold to D0, device inaccessible
snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535
snd_hda_codec_hdmi hdaudioC0D0: Unable to sync register 0x2f0d00. -5

There are some acpi methods (PWRD, PWG1 [4, 5]) that macOS calls when
changing the amdgpu's power state, but we don't use them and that could be
a cause. Additionally unlike previous generation Macbooks which work
better, on MacBookPro16,1 the gpu is located behind 2 pci bridges:

01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
	Navi 10 XL Upstream Port of PCI Express Switch (rev 43)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
	Navi 10 XL Downstream Port of PCI Express Switch
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
	Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev 43)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
	Navi 10 HDMI Audio

Upon attempting to power on the gpu with vga_switcheroo, all these
devices except 01:00.0 have their config space in `lspci -x` filled with
0xff. `echo 1 > /sys/bus/pci/rescan` fixes that and the dmesg errors about
changing power state, but "PSP create ring failed" still happens, and
the gpu doesn't resume properly.

[1]: https://lore.kernel.org/all/3AFB9142-2BD0-46F9-AEA9-C9C5D13E68E6@live.com/
[2]: https://t2linux.org
[3]: https://lore.kernel.org/all/9eed8ede6f15a254ad578e783b050e1c585d5a15.1439288957.git.lukas@wunner.de/
[4]: https://gist.github.com/Redecorating/6c7136b7a4ac7ce3b77d8e41740dd87b
[5]: https://lore.kernel.org/all/20120710160555.GA31562@srcf.ucam.org/

Kerem Karabay (1):
  drm/amdgpu: register a vga_switcheroo client for all GPUs that are not
    thunderbolt attached

Orlando Chamberlain (8):
  apple-gmux: use cpu_to_be32 instead of manual reorder
  apple-gmux: consolidate version reading
  apple-gmux: use first bit to check switch state
  apple-gmux: refactor gmux types
  apple-gmux: Use GMSP acpi method for interrupt clear
  apple-gmux: support MMIO gmux on T2 Macs
  apple-gmux: add sysfs interface
  hda/hdmi: Register with vga_switcheroo on Dual GPU Macbooks

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  18 +-
 drivers/platform/x86/apple-gmux.c          | 416 +++++++++++++++++----
 include/linux/apple-gmux.h                 |  50 ++-
 sound/pci/hda/hda_intel.c                  |  19 +-
 4 files changed, 409 insertions(+), 94 deletions(-)

-- 
2.39.1

