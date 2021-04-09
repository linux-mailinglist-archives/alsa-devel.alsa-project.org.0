Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D035A89E
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 520A11684;
	Sat, 10 Apr 2021 00:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 520A11684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618006299;
	bh=UnvjL2YBU2vkHgizrzvifYluJpk/BDsUtQJYlD2RlOc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZ/Eo/ID2UsAXrPtCeuKo673GxfaR1I2CL17aCbBiVC+cZoNHkr4hwlNP0aI3ZJIO
	 xbBGJYqWWZ2FiDoKYMDGMocVzBfXP+DB//jwdI3x5NAYEuKhMM2pbTdcQThtnI/ttH
	 jmYmmDR951R2kQT5ZQ4M9LkKrRmT5PiS7/rmD/iQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9043F80168;
	Sat, 10 Apr 2021 00:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 428FDF8016A; Sat, 10 Apr 2021 00:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2218DF80162
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2218DF80162
IronPort-SDR: ehB8+UApHYObzJz8fpE1B1FPUtmB8v0hUu8GzRgQU7iYgwZlEf+cnCkwtfiMuFxq8XPpOSum6d
 6RJocBpcbQbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214285707"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214285707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:04 -0700
IronPort-SDR: SmvDBgfwtMcseT+7VmehDFh0jnD31rAE07AMXKJNjx2LT9Dlr2FoHVwqPqvkvkNuuQa/KfiAmb
 IrNRfiCSW5NQ==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599292823"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:04 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: simplify probe and report errors
Date: Fri,  9 Apr 2021 15:09:57 -0700
Message-Id: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

These patches simplify the sof_probe_complete handling and
address reporting of errors during probe.

Peter Ujfalusi (2):
  ASoC: SOF: core: Add missing error prints to device probe operation
  ASoC: SOF: Simplify sof_probe_complete handling for acpi/pci/of

 sound/soc/sof/core.c         |  9 +++++++--
 sound/soc/sof/sof-acpi-dev.c | 18 +++---------------
 sound/soc/sof/sof-of-dev.c   | 18 +++---------------
 sound/soc/sof/sof-pci-dev.c  | 20 ++++----------------
 4 files changed, 17 insertions(+), 48 deletions(-)

-- 
2.25.1

