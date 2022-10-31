Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2A613E9D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A8811676;
	Mon, 31 Oct 2022 20:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A8811676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667246269;
	bh=hKYaqbnRr8ECvC0kK+G3r/kD56mPyy46VqqXdz4uTc0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OQnpAk9rALR+MZLMDTTOHqUE1cDgochJI6BxJll4qfMB2/dO3XyOEl9Nln0AZMHvb
	 Keq08UD8Nw5OyhuPJ/MXmdQkQP5Demig43bWUeN/WGsW8kzPr7i8pFMBCWou4H1U4/
	 FwMwziuwGlGmwSC0UEeQE6nUKuvTkFwmUpbxfwck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE9BF800E1;
	Mon, 31 Oct 2022 20:56:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 735F7F800E1; Mon, 31 Oct 2022 20:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 515A3F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 515A3F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hQFOfqpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667246211; x=1698782211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hKYaqbnRr8ECvC0kK+G3r/kD56mPyy46VqqXdz4uTc0=;
 b=hQFOfqpJ2ImtK71QfkKoNoP+gn8vsbpLJwdlO5unJK7z6DobHt1SsDTM
 Yd4IZjrr7IuCagQW7S1bJz7ru+cR41V9E7R0inxqB6pXJ91kW6DQWwPsa
 Y+3jR6QMsxOvidHsB85EKECDRFquS9V/JPNlfbRjbaaV+dnKHxlhQUWqx
 iI5Bh3E7iAoE9Aw++Ygr9Fgn4cLtWDhvH5qEeaIKGrwP1QuKya3+/tjkG
 g1U2LVl8uqCJrOINMajP9l6dYc06ZbwerqmWKX32UviLEs3pdUva7EK4+
 fANSq4wTGtXyFWZKgZBVYEFgi7akfuONX6b+Pq7BBPDSFROL9428nfLHQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310076594"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="310076594"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:56:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776254798"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776254798"
Received: from kumarhit-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.6.36])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:56:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: hda: intel-dsp-config: add ES83x6 quirk for IceLake
Date: Mon, 31 Oct 2022 15:56:39 -0400
Message-Id: <20221031195639.250062-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Yet another hardware variant we need to handle.

Link: https://github.com/thesofproject/linux/issues/3873
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9eb3208f288..ae31bb127594 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -320,6 +320,11 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0x34c8,
+		.codec_hid =  &essx_83x6,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x34c8,
-- 
2.34.1

