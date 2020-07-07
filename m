Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B98216A2A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA3C15DC;
	Tue,  7 Jul 2020 12:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA3C15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117510;
	bh=A8RlL5xUC4mw95aZXaV138aCA5UJoiVEAsJ/Tuf+rZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mW1qX+UWwcUviY+lPMSSAlgeRf6T8v0fV/2h3RRskTLsor4Qcs8TzBwWmnBPvAwn0
	 1LrNOtaOicJlOW7+QXkP3dvjI/a+FXvJMHSeQHdUR3Wjs09FjyGjCmUrX1kHNjkvzg
	 dwFEYSsmaKCpfLvjRxdf//JqM0qpns4RrfQpaJFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CAAEF80343;
	Tue,  7 Jul 2020 12:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F311F8031A; Tue,  7 Jul 2020 12:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A980F8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A980F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yjtJryfp"
Received: by mail-wr1-x443.google.com with SMTP id z2so22274944wrp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=yjtJryfpQL6B6O+GfgFViYidP0Zfm2TNnBAeSexpzgadJ0xpgfrAVW4b+dn87kGz6C
 EZ20LZ2Ach4spz+6mWWhfonGFfs2/rcy9nw1nAUr6v3gjXQ3E0cGVWpLruB6V7BWcVKA
 NCL298eJZDj7ZhP4xvIuCDI1BvtD35Mo5E9bGkX6iUv4iYAAQPpZP38IaOr9k6wvCT0n
 Jauv59h1FuWhqhRbx4pA4BUC4us6dOrcZW5shkE7d6GTM45WW2uOaKGiuBEwVYlhIvDm
 Ht9quBZq0GIUYGteKk4rPBi59T6GO0mAXIXQ0Kg0IC8E0hgNv6gc97KOTf9D6n8+RNH2
 QigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=RpDspkX0JTEgwPu5RrTV/MaM3zxVP/PRcm7SqR27jYlh5TDuTRibhLfexnvGS1AUXH
 XLOzSqW5G+8e+FY2HCK/WbftInnGhWShCo9iXoKm84XB46Bom83nsU5QlyZ656HqsaFd
 nbrd9WlU+zNp8dIzqHlkiIi++R3NHJGyHZZVv+aiZ8drRsAxxEJntAa5dl7PbhzCc8BM
 6OkhsBj5dqOJu7nhvw5+Zp/tEQFnQ3NXcStuap8GZCbRnJgc1corZKoUbG6e6lGjVnC8
 4ducagkrxFkM+54m3VJYpH1psJlkb0x5gwbg8MNTdNsUB1TbSPPELBJcOVtl39m/Rm5y
 +zHA==
X-Gm-Message-State: AOAM530LX9doxA5SF/iQbT8Jzl1sTgjTVU1kc2stLqf9qAtndtIZf/1C
 5bLt4nP2npKxwXb3a4z16/vzgw==
X-Google-Smtp-Source: ABdhPJwPGZGh7haWMlGt/1TcC8QGkDnJP2knf1a1NGX34zsnQYiFoWMcsNgAkfwT9eECzK95dCDJuA==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr50993417wrs.320.1594117017437; 
 Tue, 07 Jul 2020 03:16:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 07/28] ASoC: fsl: fsl_spdif: Use correct formatting when
 denoting struct documentation
Date: Tue,  7 Jul 2020 11:16:21 +0100
Message-Id: <20200707101642.1747944-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Kerneldoc expects struct documentation to start with "struct $NAME".

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_spdif.c:104: warning: cannot understand function prototype: 'struct fsl_spdif_priv '

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 5b2689ae63d4d..7aa3bdec5b6b5 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -81,7 +81,7 @@ struct spdif_mixer_control {
 };
 
 /**
- * fsl_spdif_priv: Freescale SPDIF private data
+ * struct fsl_spdif_priv - Freescale SPDIF private data
  *
  * @fsl_spdif_control: SPDIF control data
  * @cpu_dai_drv: cpu dai driver
-- 
2.25.1

