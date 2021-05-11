Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DD37B0DC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 23:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAE918C0;
	Tue, 11 May 2021 23:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAE918C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620769172;
	bh=xTWVlamhGWBtdjjTY+VJkTADvSMSZudKfWpkeGCoT/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naQCi70BndFme84OldmcxZQ1DxGstdsh/KGsTr2aVUU5Bf+YjIxq/IR/uaI4yXvuS
	 qfbq51WibLIyfk1HDVyaplSCwHCKcCHqlvZk+o5AzTop+r9VmVyGZXNMIBqvHNMQ5f
	 PczeZdHwnepNkzGPyw0Lp4WqwunmTqMPcnBnbhBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC1AF804AB;
	Tue, 11 May 2021 23:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE17DF80431; Tue, 11 May 2021 23:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB55F8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 23:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB55F8013A
IronPort-SDR: GPDgxhMs1UZ1mFqsLWV9/mVD0yhltUtQeWYIfyT4bYwbCXYgqQmr9+EFLV2fpv3Kc074CgHRpW
 pp1VDhxGqJwA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186992042"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186992042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:31 -0700
IronPort-SDR: oML9I49U4L8mxCGbKjLHZOOyt3gix/VBb2De+uLj8TR/6UCQfcKSlvVq860coT7zCpwGFrGd9y
 2kjEFaF3suFA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="469098912"
Received: from seanwol-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.100.14])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:37:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: SOF: Intel: hda: fix index used in inner loop
Date: Tue, 11 May 2021 16:36:59 -0500
Message-Id: <20210511213707.32958-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
References: <20210511213707.32958-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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

With more warnings than the default, Sparse throws the following
warning:

sound/soc/sof/intel/hda.c:1127:49: error: self-comparison always
evaluates to true
sound/soc/sof/intel/hda.c:1128:49: error: self-comparison always
evaluates to true
sound/soc/sof/intel/hda.c:1129:48: error: self-comparison always
evaluates to true

This looks like an obvious error, with a likely copy-pasted line
leading to the use of the wrong index in an inner loop. One of the
worst single-character bugs in a long time.

This problem was not detected in our tests since in practice SoundWire
platforms only have identical devices per link and the index mistake
did not change the results.

Fixes: 6f5d506d7ff1dq ('ASoC: SOF: Intel: SoundWire: refine ACPI match')
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f8ad02d45863..126232a76a10 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1067,7 +1067,7 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 
 			/* find out how many identical parts are expected */
 			for (k = 0; k < link->num_adr; k++) {
-				u64 adr2 = link->adr_d[i].adr;
+				u64 adr2 = link->adr_d[k].adr;
 				unsigned int part_id2, link_id2, mfg_id2;
 
 				mfg_id2 = SDW_MFG_ID(adr2);
-- 
2.25.1

