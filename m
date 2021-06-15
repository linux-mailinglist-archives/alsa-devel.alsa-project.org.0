Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35F3A7362
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 03:38:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903AC166B;
	Tue, 15 Jun 2021 03:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903AC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623721133;
	bh=Vp+MQR/1NmN8O+iA5nmUWgDSSI/Y0X8Rd02xYSjMc9M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aRC2tPA2Qp+eTWUhL05CDKUvekV+VgqZjPUr09m7BSVA4ULjUJr1TiPS+ezb5tYwz
	 BMWMeibXq9z+dhQdcfqpapKbpiVwoV9XhtK+/3IE3ugQGwWDQHPFeTP68o2u6+PyYh
	 bnu0eMMNX7m9cM0GbkWirpL5dgw/eQQ5j0mPEqzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49497F804E4;
	Tue, 15 Jun 2021 03:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ACDBF8028B; Tue, 15 Jun 2021 03:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4FD5F804C2
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 03:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FD5F804C2
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G3rNg31Shz1BMYl;
 Tue, 15 Jun 2021 09:30:27 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:35:25 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 15 Jun
 2021 09:35:24 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <alsa-devel@alsa-project.org>
Subject: [PATCH -next v2 0/9] ASoC: fsl: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 15 Jun 2021 09:39:13 +0800
Message-ID: <20210615013922.784296-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Cc: broonie@kernel.org, timur@kernel.org
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

patch #1 ~ #8:
  Use devm_platform_get_and_ioremap_resource()

patch #9
  check return value of platform_get_resource_byname()

v2:
  change error message in patch #9

Yang Yingliang (9):
  ASoC: fsl_asrc: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_aud2htx: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_easrc: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_esai: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_micfil: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_sai: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_spdif: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_ssi: Use devm_platform_get_and_ioremap_resource()
  ASoC: fsl_xcvr: check return value after calling
    platform_get_resource_byname()

 sound/soc/fsl/fsl_asrc.c    | 3 +--
 sound/soc/fsl/fsl_aud2htx.c | 3 +--
 sound/soc/fsl/fsl_easrc.c   | 3 +--
 sound/soc/fsl/fsl_esai.c    | 3 +--
 sound/soc/fsl/fsl_micfil.c  | 3 +--
 sound/soc/fsl/fsl_sai.c     | 3 +--
 sound/soc/fsl/fsl_spdif.c   | 3 +--
 sound/soc/fsl/fsl_ssi.c     | 3 +--
 sound/soc/fsl/fsl_xcvr.c    | 4 ++++
 9 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.25.1

