Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C459DB1F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEF3E11;
	Tue, 23 Aug 2022 14:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEF3E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661257066;
	bh=pLVIVNuMsaghkgLG2eokbG3Sdr/1ODyile/4VjeDL5E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HGdqI5z3ScAztO0yEipNXQeroKCzAsVfZdZzfR9nmuvFQhtefg5cj332ES8fx5Pqc
	 7w0y2DDE120OFPMRVYTz0bOEyNFLJgH1nE3HvAhEdrL6eXPIAWJOtS7Yfh2LJ54kKe
	 HaQFm4KlshtUeieen8Mu2ycscrd15UlkWsLYd524=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8462F804E7;
	Tue, 23 Aug 2022 14:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F1FF804E6; Tue, 23 Aug 2022 14:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E771AF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E771AF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gcs4QiPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661256973; x=1692792973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pLVIVNuMsaghkgLG2eokbG3Sdr/1ODyile/4VjeDL5E=;
 b=gcs4QiPTDyHyp5TzKAsmzZpdzq14RLeGrSAMXMLCuhMJcZKhd3f8ut0k
 YCfFGCK6f1rDqG7OvL67MNUgJrl/VYLaebEihEc6P3T9k7MeFpBT5g7wx
 vpQKCz0AzD04bcx3j+gYGLjrbDBpxHQ8JFy/vXALQTQLj1U6nEDP5Q6P7
 dBiAXk+Q63HKNQA0qNtZ3/lmPhkKz54xs+1c4yU84yqNIOOHgKRyYYrMf
 qr3TuLDA1hOqvLTKVuEkJ0tB7TyOea6aAORev6znTMqne4AZoNorR//vi
 QLyU4xH5bw0OF10zoF/ItVvnhyCiiU2qSSQt/cQ/cmEAoemae6PWSADPb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355401042"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="355401042"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:16:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="735464308"
Received: from mjglynn-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.28.206])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:16:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Kconfig: Fix the dependency for client modules
Date: Tue, 23 Aug 2022 15:15:52 +0300
Message-Id: <20220823121554.4255-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

There is still a chance to end up with a client driver selected as built in
while the core SOF is as module.

Fix this by making the client drivers depend on SND_SOC_SOF.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Kconfig: Make IPC_FLOOD_TEST depend on SND_SOC_SOF
  ASoC: SOF: Kconfig: Make IPC_MESSAGE_INJECTOR depend on SND_SOC_SOF

 sound/soc/sof/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.37.2

