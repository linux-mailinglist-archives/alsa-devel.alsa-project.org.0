Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B24B171A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 21:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE25718F6;
	Thu, 10 Feb 2022 21:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE25718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644525829;
	bh=5QsItOEmHeMHQUdwn90lRyQBcic/WaCecMuc+C+xwVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fS3KgvLXSHYlb/cEbx3GBQKHJelM1LU+h48i9sSEURpKGgCT2OTs3SqKrFWluViSG
	 3Whp5+v34uhOiCrMrEe4ax3o1plrIs8xDiljMGqYcKWp0UxVMiLw5/VvKLwh4LU4JG
	 tSfEas44W/l/7+KQfkdP8GzDM5BEdrxGbbVS/qDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465EFF80302;
	Thu, 10 Feb 2022 21:42:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64109F80054; Thu, 10 Feb 2022 21:42:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F059AF80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 21:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F059AF80054
X-IronPort-AV: E=Sophos;i="5.88,359,1635199200"; 
   d="scan'208";a="5603081"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 21:42:32 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-scsi@vger.kernel.org
Subject: [PATCH 0/9] use GFP_KERNEL
Date: Thu, 10 Feb 2022 21:42:14 +0100
Message-Id: <20220210204223.104181-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org
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

Platform_driver and pci_driver probe functions aren't called with
locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.

All changes have been compile-tested.

---

 drivers/ata/pata_mpc52xx.c               |    2 +-
 drivers/crypto/ux500/cryp/cryp_core.c    |    2 +-
 drivers/crypto/ux500/hash/hash_core.c    |    2 +-
 drivers/media/pci/cx18/cx18-driver.c     |    2 +-
 drivers/media/platform/fsl-viu.c         |    2 +-
 drivers/message/fusion/mptspi.c          |    2 +-
 drivers/mfd/sta2x11-mfd.c                |    2 +-
 drivers/mtd/devices/spear_smi.c          |    2 +-
 drivers/net/ethernet/moxa/moxart_ether.c |    4 ++--
 sound/soc/intel/boards/bytcr_wm5102.c    |    2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
