Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0D78A05A
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCC0AE8;
	Sun, 27 Aug 2023 19:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCC0AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155886;
	bh=4EmhAWBm2mSRcGTPJpedj+EvpmkYo9N5MgAlPs2iLJ4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dxzh19f1xLT/lY5CTkX5IRmlTZogM1yPM3kgUKaf5XDFZzqFifzIgUP7EwVdsn5G2
	 oAdaDP0R282PIEo0ZEekjSJOqC8HE9vCXoXt39DFk97huSrdriTBIczlpPdCBcsquz
	 DgbhtLFwb3gid8XY7vqfFUXQvucDw7D7HL59spQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D9EF805C2; Sun, 27 Aug 2023 19:02:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 615F8F805B6;
	Sun, 27 Aug 2023 19:02:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28E8AF8022B; Fri, 25 Aug 2023 08:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-21.mta1.migadu.com (out-21.mta1.migadu.com
 [IPv6:2001:41d0:203:375::15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5770AF80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 08:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5770AF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=sioG6nFD
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692944846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z6lCf1m2RyO5hkgphNEZhqasAxN18arSPKN7RCy/gyY=;
	b=sioG6nFDTUAy8CFxpG2MThcPbp+5KyEr17L9Uls/hwtb2QPUXiazjl+Brl/nDImrMd+Hpl
	fDCVMataoUSDuIWTtNcfkr1kXbnEtIKwI7qjJqfvu4pQwod98SEZV7YZHEqi36V1RaNbfM
	u1kUllzdxvMc3XelSI1oDxUiV4dxKQM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH 0/5] Add the pci_get_base_class() helper and use it
Date: Fri, 25 Aug 2023 14:27:09 +0800
Message-Id: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: sui.jingfeng@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HKEIHOYLF2N7TSRPU32WXTWDN7YJOKCK
X-Message-ID-Hash: HKEIHOYLF2N7TSRPU32WXTWDN7YJOKCK
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKEIHOYLF2N7TSRPU32WXTWDN7YJOKCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is no function that can be used to get all PCI(e) devices in a
system by matching against its the PCI base class code only, while keep
the sub-class code and the programming interface ignored. Therefore, add
the pci_get_base_class() function to suit the need.

For example, if an application want to process all PCI(e) display devices
in a system, it can achieve such goal by writing the code as following:

    pdev = NULL;
    do {
        pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
        if (!pdev)
            break;

        do_something_for_pci_display_device(pdev);
    } while (1);

Sui Jingfeng (5):
  PCI: Add the pci_get_base_class() helper
  ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
  drm/nouveau: Use pci_get_base_class() to reduce duplicated code
  drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
  drm/radeon: Use pci_get_base_class() to reduce duplicated code

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 ++++-----------
 drivers/gpu/drm/nouveau/nouveau_acpi.c   | 11 +++------
 drivers/gpu/drm/radeon/radeon_bios.c     | 20 ++++-----------
 drivers/pci/search.c                     | 31 ++++++++++++++++++++++++
 include/linux/pci.h                      |  5 ++++
 sound/pci/hda/hda_intel.c                | 16 ++++--------
 7 files changed, 59 insertions(+), 55 deletions(-)

-- 
2.34.1

