Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D95B2D22
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 05:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70C7168D;
	Fri,  9 Sep 2022 05:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70C7168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662695753;
	bh=2+8m8QVh44nMjZoktTyM6iHYlCPf/WZkxQVZaJkzH2M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lVCSByRsusGT4SRkZI43xA6b1VIkbMhQwoYdcqDOu4lvmWtkgExK1rWCkG6cUmsuk
	 VLZjLqOpkEQMaDTDKb8UeRtokoVq5iy7Tf2dhF/B6uNHpNQJRUtppif7lj12PYWi2o
	 GzuGOz2V5zRyyzt5k7MO950/1CtatMv4cryikK1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADCDF8023A;
	Fri,  9 Sep 2022 05:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55748F803DD; Fri,  9 Sep 2022 05:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFF0F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 05:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFF0F8011C
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MP28Z18NTz14QWW;
 Fri,  9 Sep 2022 11:50:54 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 11:54:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <johan@kernel.org>,
 <stefanha@gmail.com>, <dhowells@redhat.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH 0/2] Remove unused declarations
Date: Fri, 9 Sep 2022 11:54:41 +0800
Message-ID: <20220909035443.1065737-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This series contains a few cleanup patches, to remove unused
declarations which have been removed. Thanks!

Gaosheng Cui (2):
  ALSA: line6: remove line6_set_raw declaration
  ALSA: memalloc: remove snd_dma_sg_ops declaration

 sound/core/memalloc_local.h | 4 ----
 sound/usb/line6/driver.h    | 2 --
 2 files changed, 6 deletions(-)

-- 
2.25.1

