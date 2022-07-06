Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E879567E4E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 08:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5EA843;
	Wed,  6 Jul 2022 08:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5EA843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657088515;
	bh=WCNFrp3GBFE7vxeb/x0ph+v6bM71Q3gAe1RlvA/BV6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NQO7odHvWid71+dAob02ZVBINLH23wMJXi6kcbmkj4FzFW6iIoJb9kKz7TZptqDTk
	 tANZ3C9Rv98Eb0/fpdXKmu1dxNhKCJNUFxdVFwf/h0Z+wPsjJccmVhhhu80j+V9TVc
	 4QWu4nZefjKRbt8kYQRyox4guwTRbxW3Ijj8rPwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7849AF8032B;
	Wed,  6 Jul 2022 08:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A6CDF8023A; Wed,  6 Jul 2022 08:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B317F80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 08:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B317F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J2r9YYxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657088446; x=1688624446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WCNFrp3GBFE7vxeb/x0ph+v6bM71Q3gAe1RlvA/BV6U=;
 b=J2r9YYxm8PsPkUxAmG1tQrgC9Wj+oQOxjlSmrB7hFa3pGMK2KJ4k5pa4
 9HGcBVSUn8Xh9I/XTcOq3WSqbv6GCVRivzNYZp35aquczG4lNBhZtDjyl
 aKuol/7q6Lx6S4beo7W8FEnYpdWjfAJlDZNMVj95WrEJvc9wsC3846Krh
 nrOAp71o0HmcJVicZP6oQxoqWayAdxpws11jXzFnNAmvam50yDwQ9JM2H
 Nr+JX4j8/dTQAc+A5RYYstHnDogpQLYBZxLkQOCyPImYbjHq+yoDChzZ8
 P9w6lu9sq5hxyliNhrgsSJQ39BmTaVs3LTGbRyl7P1hyb+aEUPIUwl4gN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="272441552"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="272441552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 23:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="650520723"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2022 23:20:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: avs: Fix i2s_test card name initialization
Date: Wed,  6 Jul 2022 08:29:52 +0200
Message-Id: <20220706062952.251704-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sfr@canb.auug.org.au, Cezary Rojewski <cezary.rojewski@intel.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, lukas.bulwahn@gmail.com
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

Update printf formatting as 'ssp_port' argument is of type 'int', not
'long int'.

Fixes: e39acc4cfd92 ("ASoC: Intel: avs: Add I2S-test machine board")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 461b651cd331..8f0fd87bc866 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -127,7 +127,7 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = devm_kasprintf(dev, GFP_KERNEL, "ssp%ld-loopback", ssp_port);
+	card->name = devm_kasprintf(dev, GFP_KERNEL, "ssp%d-loopback", ssp_port);
 	if (!card->name)
 		return -ENOMEM;
 
-- 
2.25.1

