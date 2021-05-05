Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938837434A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 19:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410E717E8;
	Wed,  5 May 2021 19:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410E717E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620234330;
	bh=/8lqr95oi6hiGEjpdXw8iX15Naijl8FLgwO7rmQ9N+E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rr9dLoVDbyhZjJc0hzDu5YkL8RuMYmtvGGeYNBMjq++VA5lb++Qr6nEee1/IV48Ys
	 RUXlgO5pUBC2+thbajsziDZ0A6rET0hXvJk1Oo7tvAMDoJrdFm1oyOankTowGSfZml
	 BH+9UzAt+njn+P9dlplCKk8ceZWyqkaha0JF8mb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934B5F80279;
	Wed,  5 May 2021 19:03:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B39F8026A; Wed,  5 May 2021 19:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B1DBF80163
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 19:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B1DBF80163
IronPort-SDR: QcR+ttxpmdZpvbwjx7JGPYdkUyPaDHl3pOtWW+1BpkuLVcLVokoylyVkIQhCmZI+uPduC5LdBC
 Wk6t2LJKjLWw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="262200749"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="262200749"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 10:02:58 -0700
IronPort-SDR: b1SiYbBG2hMJBxMiAkhiC7jdAVHvRSvKh6pOu6Yy07bBECDBXcpibMH/vU/GY97W//YZmOiN3/
 OZ0NMFC96d3A==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="406619711"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 10:02:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: Intel: split Baytrail and Merrifield
Date: Wed,  5 May 2021 12:02:33 -0500
Message-Id: <20210505170235.306797-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, arnd@arndb.de
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

We've had recurring randconfig issues with the two platforms relying
on ACPI and PCI. I think it's time to split the two and introduce a
common 'atom' module, so that dependencies are better handled.

I chose not to add a Fixes tag since the changes are rather invasive,
and the randconfig issues only happen in non-functional cases.

There should be no functional changes with this patchset, only code
moved and renamed.

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: byt: prepare split between Baytrail and Merrifield
  ASoC: SOF: Intel: move common ATOM stuff to module

 sound/soc/sof/intel/Makefile  |   5 +-
 sound/soc/sof/intel/atom.c    | 463 ++++++++++++++++++++
 sound/soc/sof/intel/atom.h    |  74 ++++
 sound/soc/sof/intel/byt.c     | 768 ++++------------------------------
 sound/soc/sof/intel/pci-tng.c | 171 +++++++-
 5 files changed, 783 insertions(+), 698 deletions(-)
 create mode 100644 sound/soc/sof/intel/atom.c
 create mode 100644 sound/soc/sof/intel/atom.h

-- 
2.25.1

