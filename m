Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8714D9993
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 11:50:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EFE6174E;
	Tue, 15 Mar 2022 11:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EFE6174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647341453;
	bh=TICBgvtM+44FO30/Gg9BDeVxcra4Yhn67pDOFHFh2qI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MyhG9XYnvebALTHAgTnb0tjcznwVqcpC4r8nSYUr7JABP/sZnt8e/kX4kHBZTCtDE
	 IJt1wlRfP9vEUrl4HAbBYU1D892Et+onKI1n8lgiK9AbPVCZ4tBpI7K7QFuvMAxsju
	 GG72ffXwIySbJfHDJMYHduQM25e2NeKwP0OZ3aew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2778F801F7;
	Tue, 15 Mar 2022 11:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEA21F80162; Tue, 15 Mar 2022 11:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218EDF80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 11:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218EDF80128
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@wistron-corp-partner-google-com.20210112.gappssmtp.com
 header.b="Asw3ejzF"
Received: by mail-pj1-x1033.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so2055355pjb.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=L0zB6xiTLN7TUWW0GnFoc7P7DsjjNa+huYBviFNpk/k=;
 b=Asw3ejzFHzmZ8Qj2Cl6z7ou1/pNfJUvJFC6QKsaWW/GMcRVaaJUt9dOjo/zbD9SoyZ
 TBT+vVioR1XolNTX0/d6YUpSXVsk1XJMeyXvUzvGzXnIwXZhU0UL9ICce8qDzCZi6eXO
 NEBU22zLsFEKIKTk4jMrrtXfpeNxbjahFUqw0wCQoOXcZG97kXoXphdeuWu1WAQzcDjZ
 l+MVlieElD3yTLLlRndn47rxx+UllqbkN8kiIXSwXah012P4Y5vlz2zgCQjXy6TnhjGX
 DZ5jL8WU8gbg7YGn1VID9qNlM7e+4B+gSv6zrvN6rvZlLCqb26be/yr6c+qp0tqrZba2
 3lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L0zB6xiTLN7TUWW0GnFoc7P7DsjjNa+huYBviFNpk/k=;
 b=j7HN8etVYj/XQAwLkc/qJw3VtH9VGt+x7rVjVDnHMxEehG5jJjCEaSXr5HNYFq/LzH
 JAR0eZd20BWH2aiEUbY0zkWZVduNQqeUriMddUOAcpyMDZC4QDBnbQKek27RtwdXcgWl
 xxtt+DSf70Ar8ISff5HUhGgDno+jWhaSwVY7aoNZwRutV1+5hs17SYS1E+SCdiH7c5Pv
 NnSksxlfA3AUp1iA/k7nB8I1l2ky4NcTtRJEpPKnQQakv+L6g8qE+G38sAfA1erz4ONf
 bPMOH7KNmO/pgw6pbRhL6TN/TIv4D1EqcBmZxmoCl5h/OYostDAbiwKrYmNSOL9mlB1D
 ih5g==
X-Gm-Message-State: AOAM531+CnvNjnP8fbQaxN8P6wb+W18B7wSVRLKUH3rKfvy3deIwA1F8
 uJ+MbcipKC6/cNKThH31fq9jM1DslDdJmA==
X-Google-Smtp-Source: ABdhPJyyqrwYzuBpLM3XB5q1jITpmje1aXRxtGvKoxQE1NPnalZWS5gCD/vMNe5QJ78Z5OrE1de9mw==
X-Received: by 2002:a17:902:ab52:b0:14d:7ce1:8d66 with SMTP id
 ij18-20020a170902ab5200b0014d7ce18d66mr27413334plb.88.1647341379202; 
 Tue, 15 Mar 2022 03:49:39 -0700 (PDT)
Received: from localhost.localdomain (60-251-182-145.hinet-ip.hinet.net.
 [60.251.182.145]) by smtp.gmail.com with ESMTPSA id
 o7-20020aa79787000000b004f8e44a02e2sm4415915pfp.45.2022.03.15.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:49:38 -0700 (PDT)
From: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] nvme-pci: disable write zeros support on specific SSDs
Date: Tue, 15 Mar 2022 18:49:35 +0800
Message-Id: <20220315104935.21244-1-mark_hsieh@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Cc: Mark_Hsieh@wistron.com,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
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
Change-Id: Ic6ebfe141702d1869490bbf210627055b5b4d80f
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

