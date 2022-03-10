Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D454D5025
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:24:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F1D19FD;
	Thu, 10 Mar 2022 18:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F1D19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646933040;
	bh=XtMGYYmwX5L7loH/k8Xp6EGLdSPG9V28wmHctEabBy8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E5Lg/VJIKFRo5idH6e2ikk3X850tqBqbEsVWTeqIPrykHZMWyeajfG64wjVVdJSgo
	 C8V6QHfQmO/iWhOpxRIF1Kaj5YmCRtPFYtJWL4ka86KP0tqCOYn8cTMKF7e8xhuroz
	 Edco5+cxXRRFj4LCQyhAKR1pO1ig83g7n2bV1AHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 594B1F80425;
	Thu, 10 Mar 2022 18:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6EA4F8012C; Thu, 10 Mar 2022 18:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58BFCF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58BFCF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IK9e5y4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932967; x=1678468967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XtMGYYmwX5L7loH/k8Xp6EGLdSPG9V28wmHctEabBy8=;
 b=IK9e5y4ERU7x2X3Bo5vB5Ob55jhKaTfcS7qXt8eiR0wfXTpvzJeyVDlg
 MwFh+y5PLUH8mdsIxdJqf03hNWL+ZUGN/K2GdCXmT0lQ6VZGdupgu/SjK
 8WzH4FaYBUJS1xBVZEvapOFP3U8ViA+eglqyxJWcQpMFMfoKTw4P1FRBE
 Qza/6aNp0AtOcJ3qAJTn6LxLBWCdqvhkdIy/ZlMZyeefrP9Dd8VZG9vup
 Z8y2KSGa8iLOeVFPHbTjLAH8j7uaQK04xtLqbPb+D9gMqd8DHtOrofJrm
 RWll6pg0IhbqHrIVMgiTTNhCA9I2+LLmrIqPEphO8J27MdvU3Gx+kxLWr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235918906"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="235918906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="554738620"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.77.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF/Intel: small fixes and updates for 5.18
Date: Thu, 10 Mar 2022 11:16:46 -0600
Message-Id: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

One important fix from Kai to restore DM1 L1 functionality, one
important update from Peter to use DMA trace buffers as capture-only
and sync them and a couple of minor updates for Intel/SOF platforms.

Brent Lu (1):
  ASoC: SOF: Intel: add topology overwrite for Taniks

Kai Vehmanen (1):
  ASoC: SOF: Intel: enable DMI L1 for playback streams

Muralidhar Reddy (1):
  ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw in ADL match table

Peter Ujfalusi (1):
  ASoC: SOF: trace: Use proper DMA direction for the trace data buffer

Weiguo Li (1):
  ASoC: SOF: compress: fix null check after dereference

 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 15 +++++++++++++++
 sound/soc/sof/compress.c                          |  6 ++++--
 sound/soc/sof/intel/hda-pcm.c                     |  1 +
 sound/soc/sof/sof-pci-dev.c                       |  8 ++++++++
 sound/soc/sof/trace.c                             | 12 ++++++++++--
 5 files changed, 38 insertions(+), 4 deletions(-)


base-commit: 52eaf2bbcf022a61872c812ce41855a90b814ebc
-- 
2.30.2

