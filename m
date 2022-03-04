Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7284CDF7B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941B11FA9;
	Fri,  4 Mar 2022 22:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941B11FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427693;
	bh=dcwGFPT6XXyeBKJO0Ll3/pe3EGm45fEoL6kv0BIApAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EW4tw7XwKo5zwNFROG6v2AFtaa2AZQLo6/LA9p3yMXFsJn4prKyW5JqT/XNYWE6oO
	 Cv8HCiBS0KSimKYZVzU4pgFhcy2f+tlOqONqoSyI9e2XdzxQn0XrliJlXKQi4B36qJ
	 TVCM0YzqN7CtFlcpQ0X50Cf3kmFootmWtn0o4L4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D2DF80538;
	Fri,  4 Mar 2022 21:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93A19F80525; Fri,  4 Mar 2022 21:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608F1F8051A
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608F1F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ff+MhkWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427472; x=1677963472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcwGFPT6XXyeBKJO0Ll3/pe3EGm45fEoL6kv0BIApAk=;
 b=Ff+MhkWg+zKNs/ZzQWwsYpeu2YR/6cYbROt0kLfJUHl2uUnQkxLlWHG6
 aa/ymaQFCSYsuZ0bWJylbUT5uK5Tqw+kjOGRxyMZwweTeJpwXl3mPnYJj
 cgbode8DXHzbZy+97SlMRaVFxRQdIm+oAJSNLuhmEYCtrwfx7zDVcYce3
 tAoyh1VFQ/+A23lYN1O3S/LN5911+OW9GvrlTtWxje0z7pA5YnT7NdBP6
 O8PCMyWp+4Op5ANGA+I6UDOal1fotbtaXbBfoNgql51lgtBSV+NHnKbdj
 inbTcmHs0OXYe754lDcTYm8bsQ6Fji/2T2XCQvHWBDvTvWb03KBO/UxRQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492559"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492559"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271309"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: SOF: Intel: hda: clarify operator precedence
Date: Fri,  4 Mar 2022 14:57:33 -0600
Message-Id: <20220304205733.62233-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>
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

cppcheck warning

sound/soc/sof/intel/hda.c:545:46: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
 char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e42b45722e9d..a99e6608f0b6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -534,7 +534,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *le
 
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
-	char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
+	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
-- 
2.30.2

