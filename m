Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3935763CE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64D91923;
	Fri, 15 Jul 2022 16:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64D91923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896250;
	bh=uR4D154ji/q8k8s+V7N+R8nQGUUkvsmHJvY2q9FVFW8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/FdnzrWzSZk9Vxa9bN5p5mJFUxfJv+/60YPjWtmy6mLaqEgM6BC0ktTmatLfeUOM
	 WFG/5YcHNsT4kr6g//LUpX/C1SASZpx7eYIgNBcemNcXlW1f/ReMiiMWL+fYtHq9tE
	 jxY850yk/zhhGMGozmrqkfQz44fN+2a07JkHNKRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB537F80557;
	Fri, 15 Jul 2022 16:42:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A95F8012F; Fri, 15 Jul 2022 16:42:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44ABFF80507
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44ABFF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BA2PjMc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896121; x=1689432121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uR4D154ji/q8k8s+V7N+R8nQGUUkvsmHJvY2q9FVFW8=;
 b=BA2PjMc7NHgLkpCH68phJC9PvqYDOPkhDps/CHFTXtSzBTcCyjrwQYlh
 8IAWLCAVRvbZiTHQpYcDvC8opq1sXbyYZ/e90sPy7D0O1i5Cl1dlBI0wh
 XOmwGPtcNroSN/yfKv1vbNMOL/z/ICwDgJYjbQdqdYAqMs1mxYrheTl6u
 Mi8Ga/kIsWxU2tlZf56KKT1BBkNrv9676cbzXa7yiQtjwDwhiblvyokwY
 WCXScrBWKXLm3Ewt6LlIQmRtEZtCbIzCN4bLpsK60/AouDhdIH0av0G0M
 o9O+bhAkxIR9ExU6pgVEXmUZpfzvXwC12qS9meUh3KJZgxl+RmUGe3qyT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286947102"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286947102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="593756524"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: enable dmic handling with 2 or fewer
 SoundWire links
Date: Fri, 15 Jul 2022 09:41:44 -0500
Message-Id: <20220715144144.274770-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
References: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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

When PCH-attached DMICs are used on a SoundWire-based platform, all
known devices pin-mux SoundWire link2 and link3 with DMIC, and only
use link0 and link1 for SoundWire.

The HP Omen16 is the first exception to the rule, with SoundWire using
link0 and link3. Rather than using a fixed mask, let's count the
number of SoundWire links used.

BugLink: https://github.com/thesofproject/sof/issues/5966
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b7fa95ea1090..be3c4f1d8ff5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1406,12 +1406,12 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 
 			/*
 			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
-			 * link 2 and 3, thus we only try to enable dmics if all conditions
-			 * are true:
-			 * a) link 2 and 3 are not used by SoundWire
+			 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
+			 * if all conditions are true:
+			 * a) 2 or fewer links are used by SoundWire
 			 * b) the NHLT table reports the presence of microphones
 			 */
-			if (!(mach->link_mask & GENMASK(3, 2))) {
+			if (hweight_long(mach->link_mask) <= 2) {
 				const char *tplg_filename = mach->sof_tplg_filename;
 				int ret;
 
-- 
2.34.1

