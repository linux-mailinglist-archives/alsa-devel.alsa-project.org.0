Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA89231A76
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 09:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8F61755;
	Wed, 29 Jul 2020 09:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8F61755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596008452;
	bh=TkQ51LBFKROrZjZo1oZLDifO5pmMOaCbmlcfYmoFqdQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AQgttFEtmGVVMNBCtBNXr3Ykso2Mm0vcD1goIiEjzRHqAuGIJ8a4a36wXM/HghjeB
	 jakqU+S2Y09RbIpJmaXyVCrDPRtoBBalTpQbZZDStvajNvlrn9v6pN6GedwOMMzDHJ
	 ebQ4yzOk9O8gAnHvfS0RHUfG76NqAqNoWZdlkQoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC36F80292;
	Wed, 29 Jul 2020 09:38:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9772DF801ED; Wed, 29 Jul 2020 09:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EBDEF80171
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 09:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EBDEF80171
IronPort-SDR: k04fQceD1X3Fk/cGqfSC2gOnjYgcoAFQEGkfQerVDkPNp7Ao83fuR/H/uWhxUWpaXWvrBwqU4r
 mDv8xCnEEvYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="149216417"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="149216417"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 00:38:00 -0700
IronPort-SDR: GRp/kI6xIrCYBkzX3bYtCDLvtXoMQBZXy6wYT0yiNwg4J9LdSgigxY7UzxaAmCm+2SU3NTpnzV
 LIzqxxmnVJJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="434604190"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga004.jf.intel.com with ESMTP; 29 Jul 2020 00:37:57 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: codec: tlv3204: Codec workaround
Date: Wed, 29 Jul 2020 15:32:53 +0800
Message-Id: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
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

This patch series enables some features on the tlv3204 codec
and also fixes some issues faced while testing

v1: initial ASoC: codec: tlv3204: Codec workaround series

Michael Sit Wei Hong (3):
  ASoC: codec: tlv3204: Enable 24 bit audio support
  ASoC: codec: tlv3204: Increased maximum supported channels
  ASoC: codec: tlv3204: Moving GPIO reset and add ADC reset

 sound/soc/codecs/tlv320aic32x4.c | 60 +++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 16 deletions(-)

-- 
2.17.1

