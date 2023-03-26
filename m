Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7707A6C97E9
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 22:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3CF886;
	Sun, 26 Mar 2023 22:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3CF886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679864300;
	bh=AA3VxSM2xHTRRvcpw/aQcZLJcbC/CT/VaMN0US/HuV4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VSAoEz30KOfubBO7n6ddbIkftztFWIqJ1CmHAQ4aCy4RgT/2pKeVmMw2268HOJxCi
	 dd6DY3aW24Z+CrjhQgww+avdMgov4KaG+FFEm9gqo4IiylZ7s3/ktA5Ry6JueyBj+r
	 2kx5ldJSVHno0lzRz3GxCOQq8z5OQN2SETyctKTg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ECE7F8024E;
	Sun, 26 Mar 2023 22:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6672CF80272; Sun, 26 Mar 2023 22:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEDA7F800C9
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 22:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEDA7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DkNsDvcx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679864238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ufG0EzSJoZX2ZjEcM3na2tjubK9S5CNNR2tM4hGa6ao=;
	b=DkNsDvcxWgUP+8VBbEl4RMzZhibv7Zdwn/MGLVpErXowxpt9bdcjm3WbrLozDXgUrKeDn3
	14lpWrWdCdrp+h7GPWrbWA2LEgOvHU/rRj6CkhP5bqOLz16GUCkKWCfu51nA3t+cj3BBIB
	F0hkgLch5698fYEduMk7wtz/2mo2CMc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-u9F98JVHMVehIjT1Gu3Ngw-1; Sun, 26 Mar 2023 16:57:16 -0400
X-MC-Unique: u9F98JVHMVehIjT1Gu3Ngw-1
Received: by mail-qt1-f199.google.com with SMTP id
 r4-20020ac867c4000000b003bfefb6dd58so4794413qtp.2
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 13:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679864236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufG0EzSJoZX2ZjEcM3na2tjubK9S5CNNR2tM4hGa6ao=;
        b=Z4oS7jO0j7anftOyBxrteAjqRXdOY2/DIkpZxQgaNxiusdkrkB9IEmN+fOq5v4Qws0
         kBri9OOWUH51zMuaiOUrRkaLMGUgeZaMy1KrfXmXKD193MwiQv1cv09vl7iYpbrPuTL2
         jDBquWf+v0KprbBTTSl06MKAxHXHUhNZTLKAZiBgbixKQuqAKPWsRSXQv2A014skEkUF
         7/MA989VwdI2NTOT1S168Z/lERyGHPO7kav3pOy8a+uGm+wyfVe3MdyDe26UBGToZeXz
         7kF/CkIhuffnetr0dOnWBdWqhAOp75ib1xch87sbT0kXKi3ZW8cvphuZzyZ4Jy5kUp3Q
         /ziQ==
X-Gm-Message-State: AAQBX9dci7EcpM/exjRAGw2ib+pKZQnSwUFenWaeVpyR4JricQn+RA0Q
	JMBeqlMsERUnqTXKGo5nIDHMoaNM1T/aNNU+F6zceyxazAEqs14hUQMBrmfXsqbLItyNPzc0zIl
	/muvaYCsUmDuHtOsp24vQr+8=
X-Received: by 2002:a05:6214:27c6:b0:5cd:f9fd:f66a with SMTP id
 ge6-20020a05621427c600b005cdf9fdf66amr17047967qvb.0.1679864236125;
        Sun, 26 Mar 2023 13:57:16 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350bvbaW/HvmNUD1O5GI6KZgnKPbVGv3bPPwbsQ+CWQB5zxGNwM7H9VkAJkVX4CFGJxeRjvsYFQ==
X-Received: by 2002:a05:6214:27c6:b0:5cd:f9fd:f66a with SMTP id
 ge6-20020a05621427c600b005cdf9fdf66amr17047944qvb.0.1679864235774;
        Sun, 26 Mar 2023 13:57:15 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 l4-20020ad44244000000b005dd8b9345cesm2409267qvq.102.2023.03.26.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 13:57:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	wangjianli@cdjrlc.com
Subject: [PATCH] ALSA: remove unused loop_count variable
Date: Sun, 26 Mar 2023 16:57:12 -0400
Message-Id: <20230326205712.1358918-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MKBG4CMGAMDDEJNZF2Z74EYTOHVHVDA3
X-Message-ID-Hash: MKBG4CMGAMDDEJNZF2Z74EYTOHVHVDA3
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKBG4CMGAMDDEJNZF2Z74EYTOHVHVDA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang with W=1 reports
sound/pci/asihpi/hpi6000.c:1256:6: error: variable
  'loop_count' set but not used [-Werror,-Wunused-but-set-variable]
        u32 loop_count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/asihpi/hpi6000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/asihpi/hpi6000.c b/sound/pci/asihpi/hpi6000.c
index 88d902997b74..72aa135d69f8 100644
--- a/sound/pci/asihpi/hpi6000.c
+++ b/sound/pci/asihpi/hpi6000.c
@@ -1253,7 +1253,6 @@ static u16 hpi6000_dsp_block_read32(struct hpi_adapter_obj *pao,
 	int local_count = count;
 	int xfer_size;
 	u32 *pdata = dest;
-	u32 loop_count = 0;
 
 	while (local_count) {
 		if (local_count > c6711_burst_size)
@@ -1273,7 +1272,6 @@ static u16 hpi6000_dsp_block_read32(struct hpi_adapter_obj *pao,
 		pdata += xfer_size;
 		local_hpi_address += sizeof(u32) * xfer_size;
 		local_count -= xfer_size;
-		loop_count++;
 	}
 
 	if (time_out)
-- 
2.27.0

