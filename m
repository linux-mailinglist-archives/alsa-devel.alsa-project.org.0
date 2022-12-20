Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C6652112
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 13:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A76D20F7;
	Tue, 20 Dec 2022 13:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A76D20F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671541064;
	bh=h7i4yLv34vNJ9hY3EhSR7pp7GPsH2Hane5m3XiLI3eY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ECeWbaEweeMVtKkIea2UHu11DsYGnkehwfmF2UvrHxDu6bYdvYXyAK8Sby3ngZRjq
	 15IBblC725tTrfUayHMxh0bBBMuBV4SOjuo+Lba7bbNaGPIZXRtC+tQzG4ySyKcblY
	 HodAMioSqisD5agmj5Uak6XPsM2ykMsU6OOZHwQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2FBF804AD;
	Tue, 20 Dec 2022 13:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D68FF8045D; Tue, 20 Dec 2022 13:56:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15854F8026D
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 13:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15854F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fXJpoBvZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671541010; x=1703077010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h7i4yLv34vNJ9hY3EhSR7pp7GPsH2Hane5m3XiLI3eY=;
 b=fXJpoBvZM5pvpuKBVfxPCVLpbJ5IwE0FjWN2mpwnh7WEvyntZOLAGBuM
 A04GaYIgG/gyoA8D3fCuAYcZeNedH8yWc+BcgrNzrkFaEz8V7DSFC2W5Q
 BgRjOSPcY46ewENItWtEJ9LygIpEXIbZkLVPmdZLCJg2C45QYAkMTLcFp
 LPOGmUoLSqji3sqJvvbTJ2MgqJR4rek3IadsK948dqLRyxuLlbJPMynT0
 4+pIEtH+perUiCSWP6iQIEhUWDNRGSi3ycOkbejfSl+FlRCQkelgUD4I4
 HOQ0AMclKXGn/6k70b+G1B0/kky7uJFo/x9UvcJfNmOcz/G58rA0fQ3hL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299280469"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="299280469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825222224"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="825222224"
Received: from vadimbel-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/3] ASoC: SOF: Fixes for suspend after firmware crash
Date: Tue, 20 Dec 2022 14:56:26 +0200
Message-Id: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This is the followup series for the v1 sent out by Ranjani [1]. Unfortunately
Ranjani was dragged away to another issue and could not send the update herself.

Changes since v1:
- In patch 2, move the tear_down_all_pipelines call instead of duplicating it

Amadeusz: I have kept the check as it is:
if (tplg_ops && tplg_ops->tear_down_all_pipelines)
I'm preparing the ops optionality change series which would require this change.

[1] https://lore.kernel.org/alsa-devel/20221215185347.1457541-1-ranjani.sridharan@linux.intel.com/T/#t

Regards,
Peter
---
Curtis Malainey (1):
  ASoC: SOF: Add FW state to debugfs

Ranjani Sridharan (2):
  ASoC: SOF: pm: Set target state earlier
  ASoC: SOF: pm: Always tear down pipelines before DSP suspend

 sound/soc/sof/debug.c | 4 +++-
 sound/soc/sof/pm.c    | 9 ++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.39.0

