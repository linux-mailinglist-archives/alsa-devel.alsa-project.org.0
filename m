Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15F56127E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 08:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686AC16BC;
	Thu, 30 Jun 2022 08:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686AC16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656570820;
	bh=GNy7ZyUw1fvwqcx3bnDlD52I+eDMuYjT7+APvrK/G7s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qRyS0ouEAgThbIMIrrLqAfOzK62+tmtIecLOF3Ggsrj5sQGSsU2YLSicNz1z3Dt/2
	 72cANqHausYZaje35thVjAiELKObh4+LnhUVW5KALlUFPdK2MQSlKtC/Y5XZfGjKlj
	 G4AqJJI1ilGstyJgYJjQ4VFx8ekm8/ttRJpYrtgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC818F804EB;
	Thu, 30 Jun 2022 08:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2CE5F804E5; Thu, 30 Jun 2022 08:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88D9DF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 08:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D9DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LS4z3NL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656570755; x=1688106755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GNy7ZyUw1fvwqcx3bnDlD52I+eDMuYjT7+APvrK/G7s=;
 b=LS4z3NL9nQ4kfFTxKLM8+iHPNGjDF0GppCxauRirstefhoZuiZ/Vxkx5
 uMKi2gaFsYrsq43uRhqmHlEysfExwzHK/ewrCYrJI1tMv7b6acP+fD5hu
 bK+JNoPpMi35Zpf002/xJgZIv4a9eplXNEohQwTbhMD5hEaeYecBB3zjm
 Nfw3LfCbmcME/abtXh9RjHJDHstOGGHLEr4YTmtA/x0Uaj0Yh6T0seFXo
 lYbpMZXai0ZY2AK0hd7quTZ8OJyZmh4scyZW/tU9akmtXA9CVn/sCSNn/
 tS3Pkb1hWEyzZmlByZ9cxHtbcNj67IHmMB0sf/9dXtip4s6SEVAOTMWWa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262663732"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="262663732"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:32:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="658872772"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.39])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:32:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com
Subject: [PATCH 0/2] ASoC: Intel: Skylake: Fixes for skl_get_ssp_clks()
Date: Thu, 30 Jun 2022 09:33:05 +0300
Message-Id: <20220630063307.23568-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

Hi,

while looking at long standing sparse reports regarding to arrays of flexible
structures (arrays of flexible arrays of flexible structures, really).

I came across these which did not looked right.
The skl_get_ssp_clks() as some issues and can work under only strict single
condition.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: Intel: Skylake: Correct the ssp rate discovery in
    skl_get_ssp_clks()
  ASoC: Intel: Skylake: Correct the handling of fmt_config flexible
    array

 sound/soc/intel/skylake/skl-nhlt.c | 40 ++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 13 deletions(-)

-- 
2.37.0

