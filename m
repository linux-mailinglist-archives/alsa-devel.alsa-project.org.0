Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3762427EB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 11:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D81A1670;
	Wed, 12 Aug 2020 11:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D81A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597226013;
	bh=vys35bVF57oEttxGJzY6MDpoibAttwWRxwSn/xfErgM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r0OeO8rsAWPc7RYu62HShLJELg7Ac/SyX0/tAp5yFODuHAi4LucIk1YpY2dBs/n/6
	 IhI+DndN2zvLlfXvSlrca/UAiGABDd7UHyCbBAyHCuf8DLz0u4gr7KTHDDyXThzl6y
	 8RiFmPYHc9NaPS09ps0I+sOOTVyb1ZOzyVH4wxKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EB1F800F4;
	Wed, 12 Aug 2020 11:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DAAF8022B; Wed, 12 Aug 2020 11:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC4FF800D3
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 11:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC4FF800D3
IronPort-SDR: jigqSLUcdrV7W9e/28mLA8hl6gcSHGnF3VooV/4x17iUKN+CimSyuXCQyJAZ3tGs/iqpIT/ufG
 qlYQIzqVDU8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="151343954"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="151343954"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 02:51:38 -0700
IronPort-SDR: VhGUFkOi4LGJKU8oFo3Gi+0II5wwvUIVo6ARBMud9KFypnMZhR9UhhF8NLeRdZDf69xI4A0mk2
 rH6pcx4v3ZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="290983562"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 02:51:35 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] Codec workaround
Date: Wed, 12 Aug 2020 17:46:28 +0800
Message-Id: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 zakkaye@ti.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, dmurphy@ti.com
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

This patch series enables some features on the tlv3204 codec and also fixes some issues faced while testing

v2: Fixed the build error from snd_soc_component_read32
v1: initial ASoC: codec: tlv3204: Codec workaround series


Michael Sit Wei Hong (3):
  ASoC: codec: tlv3204: Enable 24 bit audio support
  ASoC: codec: tlv3204: Increased maximum supported channels
  ASoC: codec: tlv3204: Moving GPIO reset and add ADC reset

 sound/soc/codecs/tlv320aic32x4.c | 60 +++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 16 deletions(-)

-- 
2.17.1

