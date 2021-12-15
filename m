Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8589475E03
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 17:57:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1A618DD;
	Wed, 15 Dec 2021 17:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1A618DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639587479;
	bh=OYwIr4+/ESj1pbOwVvAiXXwKE+ON79R2Bbun8JGFpT8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SW7s3h6LZgEOnxZkwWcBdsOLG9hpHHt29oXrSRsAUagdSWuw94+sw7/L3rr0bP0Vk
	 9von0iKFfMFwSeXWcPBiGVdtbkABVXpSkrKL4KCxMZdYY/iEQtNTeOz5pgUaMAUOH/
	 BkXK8UIiX9s4hxqgi+H/p/JQM9jdCOoNcRbxq5ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B1BF80237;
	Wed, 15 Dec 2021 17:56:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE4DFF80236; Wed, 15 Dec 2021 17:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAAC6F8019D
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 17:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAAC6F8019D
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226556246"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226556246"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="755469354"
Received: from lperezja-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.39.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: hda: intel-sdw-acpi: fix controller detection
Date: Wed, 15 Dec 2021 10:56:30 -0600
Message-Id: <20211215165632.152976-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

The SoundWire-related information provided by platform firmware (DSDT)
hasn't changed since 2016, but with a recent change of device
hierarchy we need to change how the controller is detected.

These patches were tested on existing devices and don't break
anything, but are very much needed for newer devices (quirks already
in Linus' branch for 5.16, see e.g. commit f55af7055cd4 ("ASoC: Intel:
sof_sdw: Add support for SKU 0B12 product"). Unfortunately the BIOS
changes happened *after* the initial patches were contributed.

Libin Yang (2):
  ALSA: hda: intel-sdw-acpi: harden detection of controller
  ALSA: hda: intel-sdw-acpi: go through HDAS ACPI at max depth of 2

 sound/hda/intel-sdw-acpi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.25.1

