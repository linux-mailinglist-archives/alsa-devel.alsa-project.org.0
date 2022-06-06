Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9F53F0B1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241FE1B44;
	Mon,  6 Jun 2022 22:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241FE1B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548564;
	bh=SkJVnwMNGKgBgiDZWcdM/AZTf7O5ClKvd96YOxwGnsw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pK05GRsRqEOdVsyD8kgJC4W1qok7xP3hhTnaasVZxIoo3coT1lic9pPogmuTSqkvZ
	 ed+uCStdQe4Rl0A2RJjTS1CLThwFpwJhfnm8kpqabxUMwo9RWarxWkzJtXHG6yhGiS
	 x3PK/FiDNXvzHbDXqa7c4nBR/jb/FRbKojQUGYcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A91C7F80423;
	Mon,  6 Jun 2022 22:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0766BF80310; Mon,  6 Jun 2022 22:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F433F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F433F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RMjt1CDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654548503; x=1686084503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SkJVnwMNGKgBgiDZWcdM/AZTf7O5ClKvd96YOxwGnsw=;
 b=RMjt1CDthBQslXx6z2u6wdTCma+A3csUvXYtZgJwmjk7qUZTl58R9yb+
 OoVq74iW/z3yFZ/fTKyhdkB/ybGugFvVRL7pOG9G1QDDL5emsiC3iOcvF
 8ww3Awt3ELZHuOBUEVBsxrZ/6I8I/F9dCAwn0RdqIKggWadet7TZvTKBq
 N4TACKSccQDetz+XewehAufQH+lzoLdrzCPra2iZBF8JE4ScKWXCcnZ1H
 Qp+skQZH1oB6hjyjOK0lANg7dRNz5Fde8XwFUaU0N/yjJDsJskvHG4HC9
 f2A6p68R0SDHndLjTPIIxUtvIztztbtih5LDQoQowSyg9QaR0jNf3w9C5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="337794625"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="337794625"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="906739451"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: soc-acpi and machine driver updates
Date: Mon,  6 Jun 2022 15:46:19 -0500
Message-Id: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Small updates to add initial tables for MeteorLake, SoundWire machine
driver support for tests without HDMI and RT1019 for consistency on
Chromebooks.

Bard Liao (1):
  ASoC: SOF: Intel: add MeteorLake machines

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw: allow HDaudio/HDMI disable

Yong Zhi (1):
  ASoC: Intel: boards: rename RTL1019 compatible driver to rt1019p

 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/boards/Kconfig                |  1 -
 sound/soc/intel/boards/sof_realtek_common.c   | 24 +++++------
 sound/soc/intel/boards/sof_realtek_common.h   |  6 +--
 sound/soc/intel/boards/sof_rt5682.c           |  2 +-
 sound/soc/intel/boards/sof_sdw.c              | 24 +++++++----
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-mtl-match.c   | 41 +++++++++++++++++++
 8 files changed, 75 insertions(+), 26 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-mtl-match.c

-- 
2.34.1

