Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FA5E7C04
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A5B827;
	Fri, 23 Sep 2022 15:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A5B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940257;
	bh=YcQvfZQh9cHt5912qq1EUNPLvAzuxceiLzpYn2MTXkc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SehemrhdYKXSW6ROknylO2Hfp7Pgs1CVt2jZWK3Mh38IB8NoSDRVKGfrPM8iubDTF
	 5joqr5TJIxCQ3vm5bYw0iFqBmWqhToTpRIVmYm91NnsVjeOoHF9EhJW26rL5zEYHwu
	 kKbdShesWO0duiddG03scez8yz9Qyi1idOsQRtyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D10F8053C;
	Fri, 23 Sep 2022 15:36:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDCE4F80107; Fri, 23 Sep 2022 15:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BE10F804AC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE10F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="asGbfgq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940178; x=1695476178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YcQvfZQh9cHt5912qq1EUNPLvAzuxceiLzpYn2MTXkc=;
 b=asGbfgq+MQcjZq/qCRbJyz14rPwBTeFZe1NZiQT2WaQssTX8hiuOaXc/
 tI74+D7avd4i/RkIERvp+d16A0aeGKU9yMIPYGpwdPdiuye9nm+M1uO6H
 Xp7ViUTSkyb/I5Obmgdvu0kGs4X4Gz9OwO92Hx7tYSvCjIToZqpa6Up5W
 y6UdthzWr7/mk2LaqpGg958xeqtm1liVBXgNRdRKivFun9Kr3cmiZXC25
 ADFHZM1z2BCbdt0YoMDCLigfzBZfLdgi1cfgHsUus19rie2EabqdsxwVY
 cTPBpTbRD+UZeWuD6daloPAy6r2dbKDwkLqMyBEr5atrxnLc8fkqMYnqD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575607"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375279"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/6] ASoC: SOF: ipc4/Intel: Improve and enable IPC error dump
Date: Fri, 23 Sep 2022 16:36:10 +0300
Message-Id: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

On Intel platforms the registers for DSP communications are used differently,
the IPC dump information is not correct since important registers are not
printed and existing ones are used a bit differently for IPC4.

As a last step, enable the IPC timeout 'handling' and allow the printout of
the now usefull IPC dump.

Regards,
Peter
---
Peter Ujfalusi (6):
  ASoC: SOF: Intel: cnl: Add separate ops for ipc_dump for IPC4
  ASoC: SOF: Intel: hda: Add separate ops for ipc_dump for IPC4
  ASoC: SOF: Intel: skl: Use the ipc4 version of the ipc_dump
  ASoC: SOF: Intel: mtl: Print relevant register in ipc_dump
  ASoC: SOF: Intel: hda: Only dump firmware registers for IPC3
  ASoC: SOF: ipc4: Call snd_sof_handle_fw_exception() in case of timeout

 sound/soc/sof/intel/apl.c     |  7 ++++++-
 sound/soc/sof/intel/cnl.c     | 28 +++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-ipc.h |  1 +
 sound/soc/sof/intel/hda.c     | 21 ++++++++++++++++++++-
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/icl.c     |  7 ++++++-
 sound/soc/sof/intel/mtl.c     | 17 ++++++++---------
 sound/soc/sof/intel/skl.c     |  2 +-
 sound/soc/sof/intel/tgl.c     |  7 ++++++-
 sound/soc/sof/ipc4.c          |  1 +
 10 files changed, 77 insertions(+), 15 deletions(-)

-- 
2.37.3

