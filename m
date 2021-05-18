Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F1386E37
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 02:16:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F33166C;
	Tue, 18 May 2021 02:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F33166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621296998;
	bh=q9PraTSHc5kkvWK8/hS9Y1EKGz12jr6frLa87B/70ec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5uOhYvHoXF92G5U8ZGDUhVO/58/3med4DUSDgNFfuhy/ciMbos6bQqe+pPWPNtF7
	 +R45dVapeFZJZjmxOdvVwiGzVmz1HHhFOPTgVMd+TaLbkijtSnQKsA8QaAOdf/m654
	 cIhZLWOVINswIqXi98VIliHPpoD9YVOO7eWEFbOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817C6F80246;
	Tue, 18 May 2021 02:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF4BF80249; Tue, 18 May 2021 02:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA0D1F8016E
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 02:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA0D1F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vATPGbMM"
Received: by mail-lf1-x129.google.com with SMTP id x19so11399917lfa.2
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSMTeudjmbqslYZm6BULQgpkK8TB81O41ed4uaKwacM=;
 b=vATPGbMMpoPn7Egs/BRTAKdPALZJMoHc9Ins8ZW4pMvBGzcA1e4Q6eFLnYVuClZmq6
 Zz79YHFfAk68qQRkvcuJ1OR4LmjvNijKU3MTtaF64IfcCgU2u6OSwESBMAvdSDT6E4MA
 8G4z25/Dq7PNKd6NG3X46VmCmXxFZeqmMZ3ckYOgWCh1Ok/oekcN4ixtw2bkWC3+qgfM
 ArFmNhmMctygtBSrf7F2oUV+ikmMlab9czYda6TlabPiDQxxpg2W+uthMz4k6suGmLxe
 stWxB0WHQDh1p3T1Ia7V+reGNXGU0rladR+FERffeaUOLWhqfKrFdPvLfJ+9iJP2eSp9
 841Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSMTeudjmbqslYZm6BULQgpkK8TB81O41ed4uaKwacM=;
 b=GsNiev0YXDRiGp2WQAIlU6+aqGe8Ba6tFZ3bac7X2kYvkoxicx6lgrVpu5vpl4Adzu
 hgjGSKiCazNAjgaQLxrN9J2tDp22Zp2YOgEMnHp17LRrYoDdvigsvpOokSZEtq0Arv1b
 QriwWLYYsI4gmiFhuqTkXFwANszqqJXd/RVv/Egzf8YqEl6gLaAlY+ZhO631AzTDMGAm
 GuGMYEcxRjR5O0BOfiR8M3zHbLBeHfBZUH3YNDUbH1emttmTjUR9slkfYV7GkC6KT6Vq
 gAbeekadVpokE2bF+1EZRH34aKzeVEM/9aP/FE61zhh5UUI1Q2RBWkuzvflyqher9od2
 9ytA==
X-Gm-Message-State: AOAM530FNuhvWXdGPIicOP/lIT/CEMUd0q6XRvYgoNJ3lr7WPHNjp3pt
 VRxsBFNQReOFfryLUZXTTLs=
X-Google-Smtp-Source: ABdhPJyQ/JQKLMRzRq4CChV/hgp8NZ/kqbg8XtoFu6JyF6Gdy0dFgQvHaPZTbHL0YMQZL/TeCVn3Kw==
X-Received: by 2002:ac2:5cc9:: with SMTP id f9mr1909771lfq.109.1621296901902; 
 Mon, 17 May 2021 17:15:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru.
 [109.252.193.91])
 by smtp.gmail.com with ESMTPSA id p4sm2108062lfa.155.2021.05.17.17.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 17:15:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/2] of: base: Export of_device_compatible_match()
Date: Tue, 18 May 2021 03:13:55 +0300
Message-Id: <20210518001356.19227-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518001356.19227-1-digetx@gmail.com>
References: <20210518001356.19227-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The of_device_compatible_match() will be used by the updated NVIDIA Tegra
ASoC WM8903 driver which could be build as a loadable module, export the
OF function.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 48e941f99558..eeca92467531 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -556,6 +556,7 @@ int of_device_compatible_match(struct device_node *device,
 
 	return score;
 }
+EXPORT_SYMBOL(of_device_compatible_match);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
-- 
2.30.2

