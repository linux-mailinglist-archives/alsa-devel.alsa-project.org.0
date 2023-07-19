Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649EC759644
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0281F2;
	Wed, 19 Jul 2023 15:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0281F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689772197;
	bh=2AeP1o2C0s+VtApribmRvaqu3jF42vhryG4ijMmv2go=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cdkeYsH5gInfkHpVUQCekO9JUC4IDtQmznCblGvPAN6HoU+KNsfb2caNtXLF02ZVb
	 gEAuoMTKV9NxML+QrC0EDzbXJiovcaaTLhIfVMXPCGt+IGKLzQwNrRRNDyQBVJkTNh
	 oE2YbGTDhszLIzJBTeCBlKe5O1PO4hu48h5qGjx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B5B6F8053B; Wed, 19 Jul 2023 15:09:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08CE6F8032D;
	Wed, 19 Jul 2023 15:09:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE7EF8047D; Wed, 19 Jul 2023 15:09:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCBEBF800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 15:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCBEBF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AIHV9nDx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4E6C615AB;
	Wed, 19 Jul 2023 13:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1798C433C9;
	Wed, 19 Jul 2023 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689772132;
	bh=2AeP1o2C0s+VtApribmRvaqu3jF42vhryG4ijMmv2go=;
	h=From:To:Cc:Subject:Date:From;
	b=AIHV9nDxCVaxPnNI+SDmaRrWI4nURA9lMT6vJL5B4yMGXuon3wVEXexvNQyP0Yyin
	 aXaFsGLqKuNOAVOlHldfIDydCH/LJExbaax0LwS+IZEG+JyFfRd8Zn2eh5EpT+NGZG
	 CyHQGcuy1bpTzDQGNQAXzvA9flK4Rjyymr1poHUlV+DYhh1LBP54/Q8DMXE4Z6FRmi
	 8J8ChaxiPtyt4wCXRbiHX3dIj1h3+wTfPHy5uBJSKpHHP/MDtfEmn6PBszHGB1jfg4
	 Ns1DrHpcZMkN5oelIou64RvukNB1AZ2mTfGtGmZnlyHdFuiPiWaEx+0SwfdH6S09Fp
	 DP07jt2vx/cyg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: fix SND_SOC_AMD_ACP_PCI depdenencies
Date: Wed, 19 Jul 2023 15:08:37 +0200
Message-Id: <20230719130846.633701-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KNF4TXZRPERF4M6WMZ3MI24FSR7OERFB
X-Message-ID-Hash: KNF4TXZRPERF4M6WMZ3MI24FSR7OERFB
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNF4TXZRPERF4M6WMZ3MI24FSR7OERFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The new PM functions require code that is part of the snd-acp-legacy-common
module:

x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `snd_acp_resume':
acp-pci.c:(.text+0x23): undefined reference to `acp_init'
x86_64-linux-ld: acp-pci.c:(.text+0x58): undefined reference to `acp_enable_interrupts'
x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `snd_acp_suspend':
acp-pci.c:(.text+0x89): undefined reference to `acp_deinit'
x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `acp_pci_remove':
acp-pci.c:(.text+0xec): undefined reference to `acp_deinit'
x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o: in function `acp_pci_probe':
acp-pci.c:(.text+0x26b): undefined reference to `acp_init'

Select that Kconfig symbol as is done for the other frontends.

Fixes: 088a40980efbc ("ASoC: amd: acp: add pm ops support for acp pci driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/acp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 9e31b5d167908..631cdf96d6376 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -30,6 +30,7 @@ config SND_SOC_AMD_ACP_PCM
 
 config SND_SOC_AMD_ACP_PCI
 	tristate "AMD ACP PCI Driver Support"
+	select SND_SOC_AMD_ACP_LEGACY_COMMON
 	depends on X86 && PCI
 	help
 	  This options enables generic PCI driver for ACP device.
-- 
2.39.2

