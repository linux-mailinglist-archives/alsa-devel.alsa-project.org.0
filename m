Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7172415B5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 06:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12BB41661;
	Tue, 11 Aug 2020 06:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12BB41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597119935;
	bh=bAzC1e44IlR66iF34GHqaEMWhsfwVybCMAn9zPXukfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u44aNMvc+2D3ayWCADxN4rYckFookdYDYQahfEeA/wRRtSuLJG7rF2FB0pVILP/9S
	 nMk4CknjBZSwd1t/5sw/BE/JfiQhUBd7Lcl77Kr6NiPpGmGNpFfDG1tlXPlxZkBKaM
	 zApRT4llwpbOImRFBXMX0cpKi5vGj+TvSoVt0/vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A3C4F8014C;
	Tue, 11 Aug 2020 06:23:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDAE7F8015B; Tue, 11 Aug 2020 06:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F6EF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 06:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F6EF800BC
IronPort-SDR: Vu91M7kc6PRz7hQ0pIhONHtLVYCoVRv/coFE8qNrZW5N6icRo9XNwj4uPCCYatntloABTFksxy
 WiX0WiEnpKDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="238494037"
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="238494037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 21:23:41 -0700
IronPort-SDR: 8VbacyApk9no5kX6PLr6sXKNcmtAm33EHs+AUVkgBUajEqJgDh5+AG2KBopN6McQPPxnZpO9lN
 l9Yr4cW4NbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="495020861"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga005.fm.intel.com with ESMTP; 10 Aug 2020 21:23:39 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] This patch series is to enable multiple features on
 the Keembay Platform
Date: Tue, 11 Aug 2020 12:18:34 +0800
Message-Id: <20200811041836.999-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

v2: Change channel-max device tree property to use new compatible string
v1: Initial patch series

Michael Sit Wei Hong (2):
  ASoC: Intel: KMB: Enable TDM audio capture
  dt-bindings: sound: intel,keembay-i2s: Add new compatible string

 .../bindings/sound/intel,keembay-i2s.yaml     |   1 +
 sound/soc/intel/keembay/kmb_platform.c        | 145 +++++++++++++-----
 2 files changed, 109 insertions(+), 37 deletions(-)

-- 
2.17.1

