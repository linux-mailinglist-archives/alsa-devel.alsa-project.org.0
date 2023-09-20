Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1977A76D2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 11:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA44852;
	Wed, 20 Sep 2023 11:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA44852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695200732;
	bh=fO32P0+z8LQ2zu1di2mv+Du/u4oPYdW+ceregpvLAEs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h7TA/2+vk/i8WozwTYvf8oKn7KznG4iapGHvKZNPxlanmZ2R0rSbzkAKpL+8PIEqe
	 jt0VCFIna21BiUhUPTG75/SUaAwxi1rBvdaZEZJFG4yuBtLO6BMLl8AOygepa4uvD8
	 X2FKerD3Qs1ZvhjvaJ3rauQxAnd9BoTGhuw6myTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE5EF80558; Wed, 20 Sep 2023 11:04:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D2C3F801F5;
	Wed, 20 Sep 2023 11:04:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD51F8025A; Wed, 20 Sep 2023 11:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CF28F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CF28F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hHpaLLuG
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38K3GoSr018911;
	Wed, 20 Sep 2023 04:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=v
	Em9S6Wha8oGRe3mleV8+Gy4YEDfjz8SVmCnJA061Dw=; b=hHpaLLuGQLHxyjeS5
	ZKQ2VhWfa7IdccTgbX8Cr05H+0NVvQ0NW8+J4ZQAuPS/k+v0FkVobzDuPGKBck+d
	T7yV74yxRea1DbmM0C/EgoRlnpVE5HE7otj7gOhWV8LDFmEHC5eTg93RscG6rJV5
	zZXCe3kwq1SNw2PHEf6pswy4tV27BVrLepEPJVnRRIMfE1xh3334fAy31hUzrhc5
	xG7eDrnAAnvgK+CvWprne+zAMec/pFRdeZHhCGvIgLlsrkJBpgEtF5ktqwPMTmCb
	xJ+s0jA0d1hu3JgSKOfjKehFzM8Uvs+QrcdWQwr+kYJNrKSgEhtag7jOUPuk4VWW
	Y6mvg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry572h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 04:03:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 20 Sep
 2023 10:03:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 20 Sep 2023 10:03:45 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (unknown [198.90.238.129])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0FD0511AA;
	Wed, 20 Sep 2023 09:03:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: hda: cirrus_scodec: Select GPIOLIB for KUnit test
Date: Wed, 20 Sep 2023 10:03:38 +0100
Message-ID: <20230920090338.29345-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _F5HLFKgPHp6ijuj-437vxI4GfFRzN4h
X-Proofpoint-ORIG-GUID: _F5HLFKgPHp6ijuj-437vxI4GfFRzN4h
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6ZQWRLD2SAGH6V6A7NVBP2XMUDMIS5C4
X-Message-ID-Hash: 6ZQWRLD2SAGH6V6A7NVBP2XMUDMIS5C4
X-MailFrom: prvs=4627bb6ac3=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZQWRLD2SAGH6V6A7NVBP2XMUDMIS5C4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The KUnit test for cirrus_scodec uses GPIO library functions so select
GPIOLIB in Kconfig.

This fixes the ld failures on builds that didn't already select GPIOLIB.
 ld: vmlinux.o: in function `cirrus_scodec_test_gpio_get':
 sound/pci/hda/cirrus_scodec_test.c:40: undefined reference to
	`gpiochip_get_data'
 ld: vmlinux.o: in function `cirrus_scodec_test_gpio_probe':
 sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to
	`gpiochip_generic_request'
 ld: sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to
	`gpiochip_generic_free'
 ld: sound/pci/hda/cirrus_scodec_test.c:95: undefined reference to
	`devm_gpiochip_add_data_with_key'

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309201646.NnjfKPWk-lkp@intel.com/
Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
---
 sound/pci/hda/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 706cdc589e6f..21a90b3c4cc7 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -97,6 +97,7 @@ config SND_HDA_CIRRUS_SCODEC
 config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
 	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
 	select SND_HDA_CIRRUS_SCODEC
+	select GPIOLIB
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 	help
-- 
2.30.2

