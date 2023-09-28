Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025877B27C9
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 23:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82EA4AEA;
	Thu, 28 Sep 2023 23:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82EA4AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695938269;
	bh=CCOmPtaIPAksl9FwVME2X9kGTjH7x0T2LVT+vz1R4gI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gFQhnNbj014wko3q2BGehrdiV03B33kq8YaiS5yBMfjovSzpqtBKfKYSMMhdmcfTJ
	 2Wgdq1tHxhGbBLeccUTofT6shCK43yiteASR+7xbMRXWYrkbmqfdRBxzehdMkSMRkT
	 FDrKtQUPH/urFlrg8XoTdugwThwTngQJ8Myl5w1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D893DF8016A; Thu, 28 Sep 2023 23:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6165FF8016A;
	Thu, 28 Sep 2023 23:56:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C512F801D5; Thu, 28 Sep 2023 23:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68EB3F80130
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 23:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68EB3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s4LDK5AR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0309161DB8;
	Thu, 28 Sep 2023 21:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D58C433C7;
	Thu, 28 Sep 2023 21:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695938205;
	bh=CCOmPtaIPAksl9FwVME2X9kGTjH7x0T2LVT+vz1R4gI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=s4LDK5ARohl7qAnovUvynqNIvU0/b3bTTmaLsUmuJtrcWtxe92gX+eqwyvILh6IHq
	 uDpLdB+qdEj1x/WA1mYpzeaCdaYK5cvYmK4HX1T5kemXL2PcdefesTsa+WhXnqesjE
	 WMjak6vKupls/2afH4o7RKu3w8LANEbobTxzY9l6fo6iK+op3M/5KYbo0c8KyxZH0O
	 719btZeOdZf4US21Wm0jATfP1Sh3NI8phBKTfiTYSgm1yEyEojpkG+T9oWSV8CXvuz
	 bQHoyPhW2ITiU9HDQNup/JW99w6piiXTnTMEwLWomQAwUzRwdkvdOxMPrZ3BV1Sj/y
	 XgYHOwGXxa/8Q==
Date: Thu, 28 Sep 2023 16:56:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Bjorn Helgaas <bhelgaas@google.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org, Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 0/5] Add the pci_get_base_class() helper and use it
Message-ID: <20230928215643.GA506151@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
Message-ID-Hash: QCTWVQZODK3SQP7C76MYJTMI27DK2GLA
X-Message-ID-Hash: QCTWVQZODK3SQP7C76MYJTMI27DK2GLA
X-MailFrom: helgaas@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCTWVQZODK3SQP7C76MYJTMI27DK2GLA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 25, 2023 at 02:27:09PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> There is no function that can be used to get all PCI(e) devices in a
> system by matching against its the PCI base class code only, while keep
> the sub-class code and the programming interface ignored. Therefore, add
> the pci_get_base_class() function to suit the need.
> 
> For example, if an application want to process all PCI(e) display devices
> in a system, it can achieve such goal by writing the code as following:
> 
>     pdev = NULL;
>     do {
>         pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
>         if (!pdev)
>             break;
> 
>         do_something_for_pci_display_device(pdev);
>     } while (1);
> 
> Sui Jingfeng (5):
>   PCI: Add the pci_get_base_class() helper
>   ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
>   drm/nouveau: Use pci_get_base_class() to reduce duplicated code
>   drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
>   drm/radeon: Use pci_get_base_class() to reduce duplicated code
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 ++++-----------
>  drivers/gpu/drm/nouveau/nouveau_acpi.c   | 11 +++------
>  drivers/gpu/drm/radeon/radeon_bios.c     | 20 ++++-----------
>  drivers/pci/search.c                     | 31 ++++++++++++++++++++++++
>  include/linux/pci.h                      |  5 ++++
>  sound/pci/hda/hda_intel.c                | 16 ++++--------
>  7 files changed, 59 insertions(+), 55 deletions(-)

Applied to pci/enumeration for v6.7, thanks.
