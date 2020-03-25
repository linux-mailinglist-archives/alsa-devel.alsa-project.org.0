Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AEC193301
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1522A167E;
	Wed, 25 Mar 2020 22:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1522A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173002;
	bh=WDy56ya0PKlFikbw0gf4FCywruQH+B1JVDZ5HzRAcjI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hgEyIMvXZ68cazWTY0/ceEbZbRw64s3wME+NkfLhyXRV6Olie8dUFVmsXv1MIEfcw
	 Mw0KXjWQ91/t5uTx4MkCQMmYsHC174OSPUo0BekD4mtSUBu7fP9fgdwMQHDjU4bNhR
	 PbvdGS0SLEtjyunCt3PZg/CMWSdoiV6HaUsVKlu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC74AF8028E;
	Wed, 25 Mar 2020 22:47:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C259EF80299; Wed, 25 Mar 2020 22:42:43 +0100 (CET)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86CF1F80147
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CF1F80147
IronPort-SDR: LqjGbdW3JfqmCdE28FEyvdIxXIps5XBHyqe+EGnieitWBMPppudF2TUF+0smkS4f/G2GSFZ4wN
 FZb/fKqad+AQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:32:49 -0700
IronPort-SDR: DtDnzzVMcLD51qYVXgaLPoQV9TP1YKnyEUaG/MK6M/LejkuE4p8icOSlfHqdacY7sAW+yrEgfR
 1Rk3QOrNQ+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="420455869"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga005.jf.intel.com with ESMTP; 25 Mar 2020 14:32:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: machine driver updates
Date: Wed, 25 Mar 2020 16:32:41 -0500
Message-Id: <20200325213245.28247-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

One correction for GeminiLake and 2 additional machine drivers for
Chromebooks.

Curtis Malainey (1):
  ASoC: Intel: Make glk+rt5682 echo ref dynamic

Sathyanarayana Nujella (2):
  ASoC: Intel: sof_rt5682: Add support for tgl-max98373-rt5682
  ASoC: Intel: common: Add mach table for tgl-max98373-rt5682

Yong Zhi (1):
  ASoC: intel: sof_da7219_max98373: Add speaker switch

 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/Makefile               |  2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  1 +
 sound/soc/intel/boards/sof_da7219_max98373.c  | 67 +++++++++-------
 sound/soc/intel/boards/sof_maxim_common.c     | 80 +++++++++++++++++++
 sound/soc/intel/boards/sof_maxim_common.h     | 24 ++++++
 sound/soc/intel/boards/sof_rt5682.c           | 21 +++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 13 +++
 8 files changed, 178 insertions(+), 31 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.c
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.h

-- 
2.20.1

