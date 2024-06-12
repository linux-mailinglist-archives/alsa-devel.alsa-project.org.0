Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14823904BEA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D035EDB;
	Wed, 12 Jun 2024 08:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D035EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718174956;
	bh=249Jx5AQaxd0bNYD2GTJyZuwIG0Fy8JJ/BYO5WsK68c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jf9SZ/BjNGrioc2hQq46/EWDP/4ilOBsW3hGI2l9k6MdjOoMudvx0OozJ5duDFt02
	 67f/p/O7gJoMOsR/uxZSeb9nYP7JRqr5dAxyy2T8vHLZnz2NXMi9VXq8BycD08sQrY
	 k+Cl9x0O968VhtjPexh0MKxEx85Ixu9LVQKPWta0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61623F805FE; Wed, 12 Jun 2024 08:48:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45752F80602;
	Wed, 12 Jun 2024 08:48:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB408F80580; Wed, 12 Jun 2024 08:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83138F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83138F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZwtX91Jm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718174877; x=1749710877;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=249Jx5AQaxd0bNYD2GTJyZuwIG0Fy8JJ/BYO5WsK68c=;
  b=ZwtX91JmoCHnHMjM1miXeFOq+YZA81HSCNrcL7EkSA8My7Elxb5MVQ+J
   LqkbDlZmDPosEdMOey2nkGVz+pTA8iFUSMoGZQkWbeIAuYFAgxRO/2kSy
   by+Md4k9Sz/Iq23TPth39mV7yJCgNb356q1g513hKK9ff6Bg4rPla9NIt
   neoQS69l4EDPCXVsRFKLiHB18YSN/Ai1KmUcpAtY/TiZQjYS0uUFAYPeX
   XMpVy1MlhR69FuPX3dQWxndrdoAwH3aZmtadKHcg/RQkR+H1662u7xsNl
   Kf3VjnhQuHRZ0NjsDnlXG432uKOrLSXcsSGUMNx/EpkGhLa69BeWYWC6x
   w==;
X-CSE-ConnectionGUID: tLImiG7WS2u1xT9xitHHeg==
X-CSE-MsgGUID: 1/9lONjbQh+1j96d//UGEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15145880"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15145880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:36 -0700
X-CSE-ConnectionGUID: qraIR0ifRouPRFVmy51D1Q==
X-CSE-MsgGUID: +kdNbNIVQc6im4c+fJx8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="39751182"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:47:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ALSA/PCI: add PantherLake audio support
Date: Wed, 12 Jun 2024 08:47:06 +0200
Message-ID: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C3SOERQYCHG3L7GASWZT3HF3WYH3GKJU
X-Message-ID-Hash: C3SOERQYCHG3L7GASWZT3HF3WYH3GKJU
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3SOERQYCHG3L7GASWZT3HF3WYH3GKJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the PCI ID for PantherLake.

Since there's a follow-up patchset for ASoC, these 3 patches could be
applied to the ASoC tree. Otherwise an immutable branch would be
needed.

Pierre-Louis Bossart (3):
  PCI: pci_ids: add INTEL_HDA_PTL
  ALSA: hda: hda-intel: add PantherLake support
  ALSA: hda: intel-dsp-config: Add PTL support

 include/linux/pci_ids.h      | 1 +
 sound/hda/intel-dsp-config.c | 9 +++++++++
 sound/pci/hda/hda_intel.c    | 2 ++
 3 files changed, 12 insertions(+)

-- 
2.43.0

