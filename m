Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32395732B1F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9319283B;
	Fri, 16 Jun 2023 11:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9319283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686906637;
	bh=2YXvEte0tHvF2Un7MoBdoKftmOVsekrDTNUHt5cOEDI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Th+bWo7lTcpdn2287AVT0VdNnIKzSv6DhJn+VWLDsBXMlM1K1CO7r3GL4dCdZxXeh
	 OVAsFjCv6CromNyNNmgiAtvtiPxmdmXl5mfVDBRQM1wP6T4w6ak14vVdTZqMnjqyD/
	 wBLCngLALFn3cRSopS+iXcmWyaWOFjZT9YVRHBjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63420F80132; Fri, 16 Jun 2023 11:09:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC2C0F80132;
	Fri, 16 Jun 2023 11:09:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35068F80155; Fri, 16 Jun 2023 11:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAA12F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA12F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YYX3cJ4i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A181611F6;
	Fri, 16 Jun 2023 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2457C433C9;
	Fri, 16 Jun 2023 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906578;
	bh=2YXvEte0tHvF2Un7MoBdoKftmOVsekrDTNUHt5cOEDI=;
	h=From:To:Cc:Subject:Date:From;
	b=YYX3cJ4ianisLazJgdikgP155Wib9XYqSbKA2QwXMR7ujm8QXtx7Favmp76BalGzh
	 up411kYjoZn7deAEgja1U0Q80VurO5KBOm433islAMN8gbElUJbxwlTDMo4Ah3Hovz
	 KHsVggBR5LThQvatMUAVD0FUCQOSaUsqwJt1qfmsvbkVCjFG/WKlx9MiKo4kDOJnI5
	 4wouy+SJgmpM3u54ID5lTz+I6w+DjHOGQLszNQFdPCQOGy0IAKN7MuAujk9kxJzOcm
	 TgyqxIwvIpwpk1zSh0hEKRl5M60EuRlZdSaEhP7IJ4xrVtCKjtzxLAEMHFFPdZ3f7H
	 XNYGbDcwfG8kQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Rander Wang <rander.wang@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: intel_ace2x: fix SND_SOC_SOF_HDA_MLINK dependency
Date: Fri, 16 Jun 2023 11:09:24 +0200
Message-Id: <20230616090932.2714714-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TWGWRHW3OJTCNX3VTM4NV4TYN5EBAP27
X-Message-ID-Hash: TWGWRHW3OJTCNX3VTM4NV4TYN5EBAP27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWGWRHW3OJTCNX3VTM4NV4TYN5EBAP27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The ace2x driver can be build with or without mlink support, but
when SND_SOC_SOF_HDA_MLINK is set to =m and soundwire is built-in,
it fails with a link error:

ld.lld: error: undefined symbol: hdac_bus_eml_sdw_wait_syncpu_unlocked
>>> referenced by intel_ace2x.c
>>>               drivers/soundwire/intel_ace2x.o:(intel_link_power_up) in archive vmlinux.a

ld.lld: error: undefined symbol: hdac_bus_eml_sdw_sync_arm_unlocked
>>> referenced by intel_ace2x.c
>>>               drivers/soundwire/intel_ace2x.o:(intel_sync_arm) in archive vmlinux.a

Add a Kconfig dependency that prevents that broken configuration but
still allows soundwire to be a loadable module instead.

Fixes: 4d1e2464a1104 ("soundwire: intel_ace2x: add sync_arm/sync_go helpers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soundwire/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index fa71c9a36df7a..4d8f3b7024ae5 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -37,6 +37,7 @@ config SOUNDWIRE_INTEL
 	select SOUNDWIRE_GENERIC_ALLOCATION
 	select AUXILIARY_BUS
 	depends on ACPI && SND_SOC
+	depends on SND_SOC_SOF_HDA_MLINK || !SND_SOC_SOF_HDA_MLINK
 	help
 	  SoundWire Intel Master driver.
 	  If you have an Intel platform which has a SoundWire Master then
-- 
2.39.2

