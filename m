Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF179216F0C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B0D820;
	Tue,  7 Jul 2020 16:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B0D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594132961;
	bh=A8RlL5xUC4mw95aZXaV138aCA5UJoiVEAsJ/Tuf+rZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bXyf+ZgSM2CSozKfQ2rbQ50gMILAkC9RAejvMv1kaXR/rwME4IHF4m9bEJEINGUgy
	 sRC7QOas6yhfTjx50a2n1UzxKzh2yNM407Tmw7lnW+TQZlatQNIZx2XdiuQ0mD2SEQ
	 /N1M/iK9k48KQKRs4mj3Ek35rXgxnvagVTXp29YU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C2A6F802FD;
	Tue,  7 Jul 2020 16:38:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34313F802DB; Tue,  7 Jul 2020 16:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBB54F80264
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBB54F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lhNJKuTp"
Received: by mail-wr1-x442.google.com with SMTP id r12so45336161wrj.13
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=lhNJKuTp0CYdX9JvN+4GWjIHCd6ykjyYPgZscDP4ZJr3VhIQgn6l+v31ttYzo82MNJ
 9/FrRsudQ4kC1XEUyGzfI6aXU1wYt86SIEYwImLLbLkivHL+ZDpYENA6suz7PtNuVlLC
 Pi1aRNWquTNYhR+LvPy7//58CtbJRZefqWVbRDfubzrRxeTcDhnMoQlUrtt/uMD3ibnE
 /CH+Ukq5GCbNhM/5K3UFviwFYqEBkxwMJe4OG0YkJU5PmrdxXTKLKJdJGh7vwUriWyRl
 gAe7+yi6dotNXn5Fkf0yGEnFrBKnhin1xRZ/tfzjZGdhoAG1t95ogiyxYbvIwOPyD3qX
 YHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNlZaQWHbaIHYTs0iyc+dtmoOXHEctaupDIvIqecIP4=;
 b=ghKHGhPSGlh8jM2Ljplc/1nNOXzXOJFRuc2MwuJ2Hau23buGRAGwAxC+ulZBxBWCbm
 LnI4S8m7FJMhFMCBFfRYb0xwQhKZpfjy9NBKRryafEfqHPAW8xtfZS4ugm+X+hO0ELYj
 UaEubaOG1hPVerEBH1Fe8gpa3TkC4wba6siu1NpCXrvd93SFwNsJOIc3F3ssFuG2/b2p
 852zMlDP03JXXXsVS3Z3j1K/jum+RK3/PJ5vrQd/BGfCwuZ8NANSdR4wIyMxdBnK6AIO
 TGJDkWOlfZnInUFL+GF3fU2/30RKgE5T2qxlKFDrEig0s3nsaui2w37/0RJDNOP8qYmx
 T4Hw==
X-Gm-Message-State: AOAM530jbyMkIpFi4KwbKM2vWP6Os2+u8J5L6yBTzPAHYcL3coWmuaSy
 AFCC/pDC+pdXahtObKtOhdZ7aQ==
X-Google-Smtp-Source: ABdhPJzLNQlLqusIHk2mLl1/WjSQ/SnrLnewJMjZfIAz00+9GI0iQljPIoAb6xWPa8CAe0qK4FdXSQ==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr18532930wrm.327.1594132675143; 
 Tue, 07 Jul 2020 07:37:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 07/28] ASoC: fsl: fsl_spdif: Use correct formatting when
 denoting struct documentation
Date: Tue,  7 Jul 2020 15:37:21 +0100
Message-Id: <20200707143742.2959960-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
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

