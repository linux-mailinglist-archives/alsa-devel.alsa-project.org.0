Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D63CC335
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jul 2021 14:27:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC211688;
	Sat, 17 Jul 2021 14:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC211688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626524844;
	bh=TaWmSeXWQvSB7kWmrqMVx0u2csLZFd4MJ+tOSFoJ5co=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y3QfE9HcOh8Bkoec8hsMc06FZqpK2BuziyVhe8UCF0NL6XLdHM9nVwYJ359hDx0sz
	 GZGr9w6AC8flMg1tpqvuzt6Y8SAe0iQ18Lr65YFnfvpCP3ehxO5g1teHVQvZv4AI7D
	 Aq5bTCm5xbgIrw+YQTF2e8BzB1V6uCc+Dq0PocAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C48F80240;
	Sat, 17 Jul 2021 14:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F67F80217; Sat, 17 Jul 2021 14:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B67CF800FE
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 14:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B67CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GsW3pyPD"
Received: by mail-lf1-x12a.google.com with SMTP id q16so20663676lfa.5
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvVBAukd9Gk1uTkhSPYm6/BYXRLISCOEs0bifnzXGkk=;
 b=GsW3pyPDhOy7vRDMD/iNnzOmA2qXh03z+50V6MZCQ9zzqKTgte9HMjQUWxsfRVFN6z
 NiIjwnNj7e6EJE/P+t7tAK0plvirq0Z5mwnv0h2gzuFboEtFkq66e0PI4tTZrMbg3G4k
 67g+l//tzX8UALSxtb/6szBhAGrj00Ql1cId29EvfSGVftrq4hqVljjWe9VA0bEpHNJN
 dBH5+Yvg9y403AcfzRWmaHzn0VMsSKfxcSNI+HT9ZgNp7kTfXrDRbsqdn/4gdTzbHm86
 AwIvrsEwbDKE+8f/koknE8bd61iXRVeeH74Txwdpx7legp3US6HMHYEcWQ8sh4Eqi9Uy
 S6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvVBAukd9Gk1uTkhSPYm6/BYXRLISCOEs0bifnzXGkk=;
 b=KOyTndyG18+AcqdfUQV/JOSDs0P7+PgZbtB/LV6kTZcJq4hKHMJgLwH4KVfYGaCZ8E
 Ef/wGateDnWFxnT8ubyhVjs4TBtSeWg8eRXKdqKyXM+KXaDTCbjVxeKwld/sko6R2WV6
 VoCl7D1RO+CkyVDLMIqGaKszWShs15D/hZ0eLQQgivlpi+w2FO3tQmgDlRNx9pOzcf3d
 QH9iAryvCXYYMtE+HiHx9Nx+NXcSEzwB9oue0Z947nYGwCZRJAWjxN4k2/x7183MA/Ni
 xwIMO/kXwHPsGyp0jt+TNDaE5/Tn7PheBBtF6c/MPXH1lYEyM32yZNFsQrzuNEA45ojB
 pI4w==
X-Gm-Message-State: AOAM530KOA7LlkGaSyORXChzZlxgQBCi71zbxg1DV+Tp+064eans0OU9
 MdXTNKyhjS8nvBJ91CDhyYc=
X-Google-Smtp-Source: ABdhPJyGwOE/kpU6SnOs76cMejCtGbfjIa5F8gIV5X+mQZyfYTHnEpZLZ3u/ZPBqiaxUzPzjDlsYlg==
X-Received: by 2002:a05:6512:ac5:: with SMTP id
 n5mr11534719lfu.434.1626524752522; 
 Sat, 17 Jul 2021 05:25:52 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id v4sm860087lfi.118.2021.07.17.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:25:52 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 0/3] ASoC: ti: j721e-evm: Small fixes and code cleanup
Date: Sat, 17 Jul 2021 15:28:17 +0300
Message-Id: <20210717122820.1467-1-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

Hi,

I have found two issues with the machine driver which for some reason did not
caused errors but they are certainly bugs.

The last patch is just to convert the IDs from define to enum.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: ti: j721e-evm: Fix unbalanced domain activity tracking during
    startup
  ASoC: ti: j721e-evm: Check for not initialized parent_clk_id
  ASoC: ti: j721e-evm: Convert the audio domain IDs to enum

 sound/soc/ti/j721e-evm.c | 48 ++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

-- 
2.32.0

