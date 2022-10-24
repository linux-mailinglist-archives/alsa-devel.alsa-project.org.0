Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5A60B331
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B7A6FD1;
	Mon, 24 Oct 2022 18:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B7A6FD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630718;
	bh=EIW4RUhtrCNYD5GG4iwRe+aaOzzEqGdGun5VizkT/cw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1Zc+46A1uaDtTOHapKvFWZFOZ9laLkJRmkHJ66beW1XCC3BG/cm00kA4UkMrH7Dq
	 6ztJoYepAqLg3dPkUAkxqAWur04dLfLMGoHBhjXV8zvX/eFHH9Uhjkurp/b6bGRabo
	 t6q9bD3NPwq3p7uRMalX5MI8Ji9txho37Ndlv0qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9A9F805D2;
	Mon, 24 Oct 2022 18:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3129F805AA; Mon, 24 Oct 2022 18:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6BFF80571
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6BFF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lL/tybk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630418; x=1698166418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIW4RUhtrCNYD5GG4iwRe+aaOzzEqGdGun5VizkT/cw=;
 b=lL/tybk+o5egEShXSPl9u+sd4vsp6/HAqzjHjzykoVJR/rM8JuEmsqcb
 wPjXAWYCAnsSZftpUaUJvOtIqR+4cKIBMcEaVdtML77gljNnI/RR4aw/X
 1aTPv5HBuOJAzRri4nI1hfVcSUwer8vKSIzLPlEdZA8MKfSHchYD1GOwQ
 44f7AESWs0fmiQIN8lElIWqoXMnzSytkZfZWjZx6N5NiLwPQ7LHQ8EMO1
 5VwaQHRQZtwY7QxefgJRQR0E/8sS68qofaA6NnH7v5A5ESrx3No7QAa2K
 /BMh2sb+xjDjq4GDFzmHMnv0PTAbC9aizFf1ljho3MWg4YLrG84fRVUeN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868675"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868675"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263091"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263091"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/16] ASoC: SOF: Intel: hda-stream: use readb/writeb for
 stream registers
Date: Mon, 24 Oct 2022 11:53:10 -0500
Message-Id: <20221024165310.246183-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

readb/writeb are used directly without any wrappers or references to
the BAR, as usually done for other registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 1a39178cbf20f..c858f30c08f9b 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -736,11 +736,11 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 
 	list_for_each_entry(s, &bus->stream_list, list) {
 		if (status & BIT(s->index) && s->opened) {
-			sd_status = snd_hdac_stream_readb(s, SD_STS);
+			sd_status = readb(s->sd_addr + SOF_HDA_ADSP_REG_SD_STS);
 
 			trace_sof_intel_hda_dsp_stream_status(bus->dev, s, sd_status);
 
-			snd_hdac_stream_writeb(s, SD_STS, sd_status);
+			writeb(sd_status, s->sd_addr + SOF_HDA_ADSP_REG_SD_STS);
 
 			active = true;
 			if ((!s->substream && !s->cstream) ||
-- 
2.34.1

