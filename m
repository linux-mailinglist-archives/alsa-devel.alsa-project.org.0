Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65235CAE2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCA61654;
	Mon, 12 Apr 2021 18:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCA61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244231;
	bh=cONklcI8XhZawLSgHPeE1dx9toCiT5HiBPe+Hf1wI1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WlTvVsPVrOQD+9Ul00tk7wlb2ymCW3EtEzYM56pVm5RnwXBTo25r4/RFXLJVSJq2h
	 wiUYrSbFH/wNg13tFLYYSo9zXdDB8HsZQo8u2cKCHkS3ktAfCLLncpDsuGZw547BiS
	 gFL0aRDEloukLOPA47XUTY7q3yDltSQBCkL9xo3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1AEF80271;
	Mon, 12 Apr 2021 18:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06A78F80273; Mon, 12 Apr 2021 18:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE079F8025B
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE079F8025B
IronPort-SDR: iEkIfs1KByJklvnj4d/wBOmdQdJtdIQTadJkoE1XWJlcfrCmwdIAGcKtyXAW/SZa47urYZR/ZE
 o3N/p1Au5zXA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181355506"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="181355506"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:29 -0700
IronPort-SDR: /S1zrLG5879c36pltVPl0smBVrcEuT6RgqJ0wRBhjKaaH8X1X3WjjEA/fcE4wqqAjkd0nwDlXe
 MrFMcm4D5vLw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="398428893"
Received: from pvquach-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.124.143])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: Intel: descriptor corrections for TGL and ADL
Date: Mon, 12 Apr 2021 11:15:17 -0500
Message-Id: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

One missed property for TigerLake and need for separate descriptors
between ADL-S and the other flavors.

Libin Yang (1):
  ASoC: SOF: Intel: add missing use_acpi_target_states for TGL platforms

Sathya Prakash M R (1):
  ASoC: SOF: Intel: Update ADL P to use its own descriptor

 sound/soc/sof/intel/pci-tgl.c | 20 +++++++++++++++++++-
 sound/soc/sof/intel/tgl.c     |  2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.25.1

