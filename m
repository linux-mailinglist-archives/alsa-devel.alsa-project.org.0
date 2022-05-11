Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0853452346B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765551A26;
	Wed, 11 May 2022 15:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765551A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652276326;
	bh=3DMcYljnO5WjpjjKsfkl7fRzBcwVUQ0mo8c+iVAs0Vg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jssAzn/pUZYdn3Is33VC0zF/KHYCqvGGD356EXe0KTQRD8tdicICtJJHyIYYWzBYW
	 cAfiyTLkYdnT3UVKlKQBe9an+40OTfZTb6scbHrBEsrKoOmh7p2Px1UaunxRpEbRyg
	 7apwyvmiR+UmDNMhDiO/v+GTfiBjeiqTfhThaEwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2BFEF800BB;
	Wed, 11 May 2022 15:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3D8F8015B; Wed, 11 May 2022 15:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E246DF800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E246DF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jvnIeRP3"
Received: by mail-pg1-x52b.google.com with SMTP id a19so1609353pgw.6
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZddwKY35pUrh6R5AAj9OCEj0zF8sOKGHECLF2uLCy64=;
 b=jvnIeRP3G/HbVmLPD7w6dkgxT0piYIz88WFV06yyQu91PXBZ2cPblZHFShL3Kk7iJg
 SylzzqYDiMsmjkqyRYPPIMdPBTxPdba7UNRLnZb+aJD3siim0k+8zAK9bOcohRQ4fBnx
 C8/xCp0aqJpv2AiKulUVIAkeKPBFdYNmbOF4iI2ZN4GcGZHpbI6HqCqy9VQUWP5HGSuH
 S9Np3y3ao934wf7u5wpJIulciBzXm9tQDBDP8MX9lNrBy0cxldKW5lIXvmmMBsAPJe3T
 dUbZMZBqzCGCEAaGIdVcUu/l+xmzKkmYoOSJXh5Pk1V+frCY+JqgiDIQJCVJxC99LKl8
 u85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZddwKY35pUrh6R5AAj9OCEj0zF8sOKGHECLF2uLCy64=;
 b=FXr3uMsmDXwNNP72yXf6IaM5wa8Su6qtS9XMyPs0Rjn5zgDcSnmbv8aFVmHhwxO52j
 PkGE7Tcw0GbdMOX7hh7sLhbcOuOVVrQ4eaBlo1fzd4U5Fvl8CY8q9Xup3WRAOCqcXlZl
 GPROk/145BWwByFE9r6ArvO5K7NIbBvNJWB960EgfekkTyWOVE5BJLAsCc+6OZVFEtfo
 /jWU1NPQh8fpT+nLUrLxgnUrcTbFwBbl81fKb0CZskGTscihkUlgrtCVZKs4krUelqzl
 xU6+2SAokURmdsbx2TSFnCE8+Z4WHf+Sr+tnp8uURiIWAb/NqsEJD12MvSCjzz7gSBc2
 U89A==
X-Gm-Message-State: AOAM530ODoW05NX5wdZKctBQ6MmwSF0WUoeIVp5GDntb1HyeR0UG7v8o
 bhdmk8unyHQWalIkLU49YZE=
X-Google-Smtp-Source: ABdhPJxL4qPnoibT3RMP2XXaUwIm8HlwdKX4ysIXOXXWBN6ZnU+aVvmJ/CK4tHzv9bgNCDSgwTbrvg==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr25314048pfn.31.1652276260106; 
 Wed, 11 May 2022 06:37:40 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 o16-20020a170902d4d000b0015e8d4eb299sm1971367plg.227.2022.05.11.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:37:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Miaoqian Lin <linmq006@gmail.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mxs-saif: Fix refcount leak in mxs_saif_probe
Date: Wed, 11 May 2022 17:37:22 +0400
Message-Id: <20220511133725.39039-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.

Fixes: 08641c7c74dd ("ASoC: mxs: add device tree support for mxs-saif")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 879c1221a809..7afe1a1acc56 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -754,6 +754,7 @@ static int mxs_saif_probe(struct platform_device *pdev)
 		saif->master_id = saif->id;
 	} else {
 		ret = of_alias_get_id(master, "saif");
+		of_node_put(master);
 		if (ret < 0)
 			return ret;
 		else
-- 
2.25.1

