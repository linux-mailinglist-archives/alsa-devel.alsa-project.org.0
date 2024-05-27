Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FE8D0E5C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9A6852;
	Mon, 27 May 2024 21:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9A6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716839148;
	bh=ER/znK/s8ewD6cpmlot+Ja1dpoTPCYtblyYvr6l2PyM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FlBsy3qCNyLwfEpzC8pa0UmpQTnVY382/Vrck2VwIhsObvyBDK/raEdJBMFF3BGEV
	 CCJKJRjZGlWTBmiVcUONAni5CHq0AW62R/hMasIpzjtkuwX7JjccyGuP3qJBsKHm2P
	 dGy9u0k+mL7cffvrwrKnGa9WVOoufuFaJ/ul0B/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C585AF80149; Mon, 27 May 2024 21:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD35F80051;
	Mon, 27 May 2024 21:45:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2160F804B2; Mon, 27 May 2024 21:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9B3BF800AC
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B3BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZQvwOSt2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839106; x=1748375106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ER/znK/s8ewD6cpmlot+Ja1dpoTPCYtblyYvr6l2PyM=;
  b=ZQvwOSt2qYG+MtfJy74Px4TRQ4brS/L0UI8o6i3+sCGWxa1YvkI1ga3Z
   mK9bJ9dbqrbi2jhQMFBhIksAFpRnzgap2f2vVSSFrG8piKbX8o5h22il4
   baRgkYg/Z4MAoKXq7HEie0V/n4W8kl+WrLYNgiuAXz1wDKVVCAcsJD9my
   4XIMEUTKdMHbNlGyitobMSXZf3e5uv1B8DLKfWcGaPcybHqHNZMz+DKrc
   KlsML+tMNHifb14HzMJGXNgPqubtMtONydYtuQzeNngJO07AJFUd1fvOr
   PsCvYGrHLoVt2EfW4hXcg9ofUOBDVdQwvcYHYEgziW/dhVBuRFIA4w+kC
   Q==;
X-CSE-ConnectionGUID: pEv7vaQqQC+H56L9KBhWBA==
X-CSE-MsgGUID: 2cRNOXZRTKOFJ8AowlZ2ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679477"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="30679477"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:02 -0700
X-CSE-ConnectionGUID: uyVeeZUJTZe1E2idY8w7Tg==
X-CSE-MsgGUID: K/Fglqf5ShOiBpVpqGGVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="39280541"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: add missing MODULE_DESCRIPTION
Date: Mon, 27 May 2024 14:44:10 -0500
Message-ID: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EATW5BPCEUNORJDKVPR3QPSTKOIHBU4I
X-Message-ID-Hash: EATW5BPCEUNORJDKVPR3QPSTKOIHBU4I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EATW5BPCEUNORJDKVPR3QPSTKOIHBU4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'make W=1' now reports missing MODULE_DESCRIPTION lines. This patchset
cleans-up all the module definitions and adds MODULE_DESCRIPTION lines
as needed.

Pierre-Louis Bossart (4):
  ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
  ASoC: SOF: AMD: group all module related information
  ASoC: SOF: reorder MODULE_ definitions
  ASoC: SOF: add missing MODULE_DESCRIPTION()

 sound/soc/sof/amd/acp-common.c                 | 4 ++--
 sound/soc/sof/amd/acp.c                        | 2 +-
 sound/soc/sof/amd/acp63.c                      | 4 ----
 sound/soc/sof/amd/pci-acp63.c                  | 1 +
 sound/soc/sof/amd/pci-rmb.c                    | 1 +
 sound/soc/sof/amd/pci-rn.c                     | 1 +
 sound/soc/sof/amd/pci-vangogh.c                | 1 +
 sound/soc/sof/amd/rembrandt.c                  | 4 ----
 sound/soc/sof/amd/renoir.c                     | 4 ----
 sound/soc/sof/amd/vangogh.c                    | 4 ----
 sound/soc/sof/core.c                           | 2 +-
 sound/soc/sof/imx/imx-common.c                 | 1 +
 sound/soc/sof/imx/imx8.c                       | 3 ++-
 sound/soc/sof/imx/imx8m.c                      | 3 ++-
 sound/soc/sof/imx/imx8ulp.c                    | 3 ++-
 sound/soc/sof/intel/atom.c                     | 1 +
 sound/soc/sof/intel/bdw.c                      | 1 +
 sound/soc/sof/intel/byt.c                      | 1 +
 sound/soc/sof/intel/hda-codec.c                | 1 +
 sound/soc/sof/intel/hda-ctrl.c                 | 1 +
 sound/soc/sof/intel/hda-mlink.c                | 1 +
 sound/soc/sof/intel/hda.c                      | 1 +
 sound/soc/sof/intel/pci-apl.c                  | 1 +
 sound/soc/sof/intel/pci-cnl.c                  | 1 +
 sound/soc/sof/intel/pci-icl.c                  | 1 +
 sound/soc/sof/intel/pci-lnl.c                  | 1 +
 sound/soc/sof/intel/pci-mtl.c                  | 1 +
 sound/soc/sof/intel/pci-skl.c                  | 1 +
 sound/soc/sof/intel/pci-tgl.c                  | 1 +
 sound/soc/sof/intel/pci-tng.c                  | 1 +
 sound/soc/sof/mediatek/mt8186/mt8186.c         | 3 ++-
 sound/soc/sof/mediatek/mt8195/mt8195.c         | 3 ++-
 sound/soc/sof/mediatek/mtk-adsp-common.c       | 1 +
 sound/soc/sof/nocodec.c                        | 2 +-
 sound/soc/sof/sof-acpi-dev.c                   | 1 +
 sound/soc/sof/sof-client-ipc-flood-test.c      | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 2 +-
 sound/soc/sof/sof-client-probes.c              | 2 +-
 sound/soc/sof/sof-of-dev.c                     | 1 +
 sound/soc/sof/sof-pci-dev.c                    | 1 +
 sound/soc/sof/sof-utils.c                      | 1 +
 sound/soc/sof/stream-ipc.c                     | 2 --
 sound/soc/sof/xtensa/core.c                    | 2 +-
 44 files changed, 45 insertions(+), 33 deletions(-)

-- 
2.43.0

