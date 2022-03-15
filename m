Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5B4D9C0C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30D917EA;
	Tue, 15 Mar 2022 14:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30D917EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647350539;
	bh=yFUTpvjTShNUOFr4Ug4HHBwyu0kPSjljpZdSnXx6hnk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ws96ywxcsRgf/Tw+yCn8QKy0vzwaPM/NuGu5fsj85MHZ8+WbV6hOOks7KxFFd3bGb
	 /VuxN8F8LZCuE7u4VZKjBJna/GFPYYZ/omBEW2KDC2w9UdL3pENQ6NKGkeKigsh9LS
	 rDgEpOGAXYvoxfGT/zMdgTsgIVFMFhmCDzeVeb98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57128F801F7;
	Tue, 15 Mar 2022 14:21:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DFBEF80162; Tue, 15 Mar 2022 14:21:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF0D4F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0D4F80095
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.b="CGNQE+Y7"
Received: by mail-pf1-x430.google.com with SMTP id l8so9156939pfu.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=U8P88lCh/VwB2wUul8vJe/3MyhfV7Zsin+/7eQmPKwE=;
 b=CGNQE+Y7o6dJhK3Ix3rctbGZ3d7y/SZinSIvHEqwYEbv0L7LoDn+ercdgfN/W+ZgQy
 7JFKUiGx8JCTdQik3W60vE1OrEqjjYaMdJ5E6Jk9T4GZwdTvGEhSG6LLMx1jTcudPd2f
 tKBYNDjpqijSWglvm0zpj/Yiz/tec1ViKhxvkvHruZrsV77kj54np315IZoWtZ5nZCwn
 tkBGm67+CMaeBIdRxF4eCRjGpR7toHHIuIRw986IFaW0WurEB1K+pBC0vWDLQvSGUnk3
 hIzKfUv90b0FLO2bJETZYP5sjj9AMzpsnicpI/59dOhp/+z9SuWNKyDHQD1cpB/1MQNK
 1okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U8P88lCh/VwB2wUul8vJe/3MyhfV7Zsin+/7eQmPKwE=;
 b=0jWQsqs8bWlu4rFM6Z3a1dx7fqqBeBjtGYLjFTfJ/ATlWZ/Dgvr0jndLgickJXSO60
 4KOcEPyZg0V4LKB3oUwTa48Bm4zEvPQ5vSfrJxU1zliuIqT7HzKvE4tRk+6dwf7Oi09R
 emTug3+oh+nTlZxRvgkfT7IvQrQPEjc8nH4RTuLAVN4BZubm3EkWTQzTPzUBdltV760+
 H+rNNSUFEh230e8OUqK6HYOIdCkQ4pyUAI7MFhRKhH8eQkoTqo8L4fJGqdq70cznc8Gj
 fbYQBTa0SmhevCVAx8eQQ/D1KUBC1o764R+aQ5UB65r8ytC7I95lHEFg/rqoMJqfjMbc
 W8FA==
X-Gm-Message-State: AOAM531L7OhXyFaxL8bHuodNTXWqkBTH/sLMMDJAgS7pSFwq9+ncQY/P
 GdLXJZsTXGlgC+it0o1argB9jg==
X-Google-Smtp-Source: ABdhPJyhzBKkWPvMhy/74LFEX3gJL3CN4TZBwIzQE+DlCZozw2t3UHKFnBLVOMEQZbyh7TivzeRfeQ==
X-Received: by 2002:a65:6951:0:b0:381:f10:ccaa with SMTP id
 w17-20020a656951000000b003810f10ccaamr17361593pgq.587.1647350466322; 
 Tue, 15 Mar 2022 06:21:06 -0700 (PDT)
Received: from localhost.localdomain (60-251-182-145.hinet-ip.hinet.net.
 [60.251.182.145]) by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f7b8b3a44csm11589987pfv.29.2022.03.15.06.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 06:21:05 -0700 (PDT)
From: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] nvme-pci: disable write zeros support on specific SSDs
Date: Tue, 15 Mar 2022 21:20:59 +0800
Message-Id: <20220315132059.12747-1-mark_hsieh@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Mark_Hsieh@wistron.com, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, axboe@fb.com,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>, kbusch@kernel.org,
 hch@lst.de
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

Like commit 5611ec2b9814 ("nvme-pci: prevent SK hynix PC400 from using
Write Zeroes command"), Micron has the same issue:
[ 6305.633887] blk_update_request: operation not supported error, dev
nvme0n1, sector 340812032 op 0x9:(WRITE_ZEROES) flags 0x0 phys_seg 0 prio class 0

So also disable Write Zeroes command on Micron.

Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a7a502a5b2b5..68745e1d7b6a 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3245,6 +3245,8 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x2646, 0x500d),   /* Kingston OM3PDP3256B-AH 256G */
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
+	{ PCI_DEVICE(0x1344, 0x5411),   /* Micron 2450 MTFDKCD256TFK 256G */
+		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE_CLASS(PCI_CLASS_STORAGE_EXPRESS, 0xffffff) },
 	{ PCI_DEVICE(0x2646, 0x2263),   /* KINGSTON A2000 NVMe SSD  */
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
-- 
2.17.1

