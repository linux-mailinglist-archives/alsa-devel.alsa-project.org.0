Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779665F59B
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 22:20:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D950011FCA;
	Thu,  5 Jan 2023 22:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D950011FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672953619;
	bh=YmNvJU3x+eslYBxDse0+K0vFQCmawRvOpTpfPPatX8A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=R3ODUHxvga4ncS8jmkco9gZxNiyZcCsnTpu3EKmqfQdrVmUXrrvzKrbUsJ8nmnkv7
	 D1mhM+ujtIv3ITCrM/v2J9zEsJCOJHjhff3Dw7T/lRCxD6tu5TSe52qg0r82QnxjDM
	 YN0aS/YGJMC3AxffUPcauN8IkCjl7xsYOhiAfz90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C579CF800C0;
	Thu,  5 Jan 2023 22:19:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 738D2F80238; Thu,  5 Jan 2023 22:19:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B890F804AA
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 22:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B890F804AA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c81gaJqK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672953559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dr6WuGFgn3lsUzUTklOx1mec9m003HYE8pI42id0om0=;
 b=c81gaJqKa+4CRbURTX4d/xi7JuP1GclfyonKLoefFIDfTbyr1J2cCkVZfwZkMUoaswXEJL
 JU4gJL6inRNjGTPc+QD7t1ML3QjZQiRzAB5LIJUkOIZLypd5Cw9MfeXS67khhBkFWj3sEp
 IeCmJKphArKaQVWf+syhHrjRd/1BJ40=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-Bavv1rwROKm8XCwZy0Lu-Q-1; Thu, 05 Jan 2023 16:19:18 -0500
X-MC-Unique: Bavv1rwROKm8XCwZy0Lu-Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 i7-20020a056214020700b004ffce246a2bso19595883qvt.3
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 13:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dr6WuGFgn3lsUzUTklOx1mec9m003HYE8pI42id0om0=;
 b=ty6U7ccNHr4RDDkhRFBo3EyPzEy44DkM2EHZY4tBywp/tq+zA2RXzlE+jXg2K1k5sa
 GEvp8lfHQfQgbMiQuuhpEVqhueaTPtasZ45EsnFwqk0ijr9XIQzeXMtJvp6A/WKWO6e+
 146G9WLyXiwXcKUj4UNW03bTowWhwXJYTs5yNilKpc67aBCjw4H0MrFLd5W10hYMfXxa
 9RZzo+97D4VmxV+lXAhWJ7SS7od9R0Qc3CINBWWwTA8k5zYJWLmyLaHu5JkE5gVLNkmB
 LVwX8GoQ2yubUcH77rjfla1acppX+GVAVtx61vObKKQ9OoPEwGwKopA9F9Ed1BiiWHPx
 9DgA==
X-Gm-Message-State: AFqh2krQ2+MRxB7/rBrSjygirzLYqu8FSwFyJpCBJ3pDDuIKNzckJdiM
 NbfBNM5XozpHnUw/UvB/uoZ9KgPE1NeAWK8zJfzFrQFeXTMxBc6fyYHIzZwdFWcpdP9O9wU1Vgu
 FYk1SetlQU0g3qmETXxZhqZ4=
X-Received: by 2002:ad4:5362:0:b0:520:f8fa:5ad8 with SMTP id
 e2-20020ad45362000000b00520f8fa5ad8mr64600738qvv.17.1672953558272; 
 Thu, 05 Jan 2023 13:19:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseXrlDGPJVvsIgIjlWKLibyWOq+e3SjxItVbfKqMuTnJRcqgiNlKhtIddkByXDz+/MSbYMyw==
X-Received: by 2002:ad4:5362:0:b0:520:f8fa:5ad8 with SMTP id
 e2-20020ad45362000000b00520f8fa5ad8mr64600701qvv.17.1672953557847; 
 Thu, 05 Jan 2023 13:19:17 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05620a25d100b00705377347b9sm11643264qko.70.2023.01.05.13.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 13:19:17 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 nathan@kernel.org, ndesaulniers@google.com, Vijendar.Mukunda@amd.com,
 Syed.SabaKareem@amd.com
Subject: [PATCH] ASoC: amd: Return ENODEV if acp63 is not found.
Date: Thu,  5 Jan 2023 16:19:12 -0500
Message-Id: <20230105211912.824250-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The clang build fails with
sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used
  uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
        default:
        ^~~~~~~

When no device is found -ENODEV should be returned.
A switch with a single case is overkill, change to if-else.

Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/amd/ps/pci-ps.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 401cfd0036be..cba8800ab4ea 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -205,8 +205,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 	}
 
-	switch (adata->pdev_mask) {
-	case ACP63_PDM_DEV_MASK:
+	if (adata->pdev_mask == ACP63_PDM_DEV_MASK) {
 		adata->pdm_dev_index  = 0;
 		acp63_fill_platform_dev_info(&pdevinfo[0], parent, NULL, "acp_ps_pdm_dma",
 					     0, adata->res, 1, NULL, 0);
@@ -214,8 +213,8 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 					     0, NULL, 0, NULL, 0);
 		acp63_fill_platform_dev_info(&pdevinfo[2], parent, NULL, "acp_ps_mach",
 					     0, NULL, 0, NULL, 0);
-		break;
-	default:
+	} else {
+		ret = -ENODEV;
 		dev_dbg(&pci->dev, "No PDM devices found\n");
 		goto de_init;
 	}
-- 
2.27.0

