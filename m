Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4B4D6E1C
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 11:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF81171E;
	Sat, 12 Mar 2022 11:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF81171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647080907;
	bh=EHQNhKJgn+oXPjosIvOZ3fzLWL1oHmTSrDrPrF5TrO4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dZzETMu+ry2sFOQ+JOBTJRD4baRaOsekWKFUJl+ODQ4K0vZcKVrF6CpwDBBzabCjq
	 QGn0fJtwYoWny5nstc1MDBPPsas79puFVLT6HynALybviUWNap1Q8CBkA6iBlwjEOa
	 HNyIdsNCmjRluYRRcGSDObggCTKC+Bn3hFBlNo90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C5CF8025C;
	Sat, 12 Mar 2022 11:27:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 913B8F8025C; Sat, 12 Mar 2022 11:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE25F800B0
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 11:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE25F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr
 header.b="j6QWgrxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sADzXucFbvYQxoGycjfde7/Wl6yGzio2SkMVBhdfarY=;
 b=j6QWgrxGryMhxSMA3Gi6JmdMZ2AEEwpWhkicG5GEBsR5gb7tpaRO9MKN
 qxPbbNFJS0mb0JLudfu5b6E/NXBAkB7IARm729wGXywLtuY0+WhQ5PUO4
 UwsVAy58sLeTRSxGNU80+9aDaVFZn9QhCg6B6X2BMu1tuitCTOC6d9UkD Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,175,1643670000"; d="scan'208";a="25781346"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2022 11:27:11 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-wireless@vger.kernel.org
Subject: [PATCH 0/6] use kzalloc
Date: Sat, 12 Mar 2022 11:26:59 +0100
Message-Id: <20220312102705.71413-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-cifs@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>
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

Use kzalloc instead of kmalloc + memset.

---

 drivers/net/ethernet/mellanox/mlx4/en_rx.c |    3 +--
 drivers/net/wireless/zydas/zd1201.c        |    3 +--
 drivers/scsi/lpfc/lpfc_debugfs.c           |    9 ++-------
 drivers/usb/gadget/legacy/raw_gadget.c     |    3 +--
 fs/cifs/transport.c                        |    3 +--
 sound/core/seq/oss/seq_oss_init.c          |    3 +--
 6 files changed, 7 insertions(+), 17 deletions(-)
