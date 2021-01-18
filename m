Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779A2FA013
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3EE17F4;
	Mon, 18 Jan 2021 13:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3EE17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610973729;
	bh=VvNUuhj1iS+k+RKzgDaEElkaK85kTWVgprP86Qf8ad0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rCEebkFvQs4rTEogjvIj3AwcBMK7WyUJnueZCxNNfjptfBp+vVuG17X9xhdyBVd43
	 zBJ+nRY98qmTKlyBfh5XJu3B1dNXcO7JmCLmy4QIyhnwKCuUMUVERm+Zvhl6QOD4hC
	 Ej44u0/NbSKIWrTZRmTvwdxRBOU/ntOrPdvrwoXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55648F8019D;
	Mon, 18 Jan 2021 13:40:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3192DF8016E; Mon, 18 Jan 2021 13:40:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DA00F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA00F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ADCMWUCx"
Received: by mail-qk1-x730.google.com with SMTP id p14so18461946qke.6
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svau/GQaA1WyWyEiqC22YvV+pVe03axmyk//KuRqIvU=;
 b=ADCMWUCxEXx+QNyxHxjefSYJ067oMKPXigaCV0NpWKuyWeVIHjCpMyatmMFD0GwSTA
 Ts38koHKlgsNVVf0Yvw2ckOfUimmY+nlTnjamhkkMUFp24OHcWlQ7al2/s2AtL8G1b65
 Y3VjSKwE/nofXPjkiy6iesEhgtyuAq8WjByLNMKxZR3NZqgdEcdCEBFbntfhf9HNHuL5
 qYI7ZFIB/7EPd6os7rJXisGBCiDoizVacmUKfJchQiVrNudh0fDeeA4ngIKQFOOOrX4Z
 wKx3S2JHrcelNKiardPyFvWsoIaa31mRawfrWwnjm010mf6nLgSMTt+JUmngDIk/zU8I
 JFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svau/GQaA1WyWyEiqC22YvV+pVe03axmyk//KuRqIvU=;
 b=qfIh+WOMZ4eCZn/9ePBrPvjQI+YzHhv1HetL6sldfBMvHPh+Fq8kGFbpY6nRZyvavB
 F2oi8BIlliQDxfEOV1lXsrgL/n7MleW8xQ/vhaSXLVV14CnXeI87dF5MfkkQAiyP51vj
 Xp8l+2dwktlEukoWu8mmrO8hn8Q0X/xK/pyOgnAB651eUwjQmfIGIbHGpcRsMgEEtwnl
 RaS8whw/A22bCNDLjkgDxuO/2OfWqcmwo9YOygqAheVukyBmPNtKXLnLWRIWDQV1EAi8
 9Imhsp0VnYFM3Qe/tgkBCLfIcgRntsG9pJ18wPNLNATV5OJv0QSIXLSH/UPuV+/5O9od
 MF5Q==
X-Gm-Message-State: AOAM533l2GiCDq2HLdha7wfGifspaeBer69ayuZDpxW+w5tdAZR+tUp9
 9Kv/262HQZ974pfK+L8HseM=
X-Google-Smtp-Source: ABdhPJzI4srkD1NIa2+NkLeU4rAMNgAXY2+s0NWOrgEBvOXGWcsVgL8w2nZBEJKE6cQLgrhSheKnVw==
X-Received: by 2002:a37:27ce:: with SMTP id
 n197mr24095433qkn.220.1610973624971; 
 Mon, 18 Jan 2021 04:40:24 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q92sm10022654qtd.48.2021.01.18.04.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:40:24 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 1/6] ASoC: fsl_ssi: Use of_device_get_match_data()
Date: Mon, 18 Jan 2021 09:38:10 -0300
Message-Id: <20210118123815.1630882-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, shengjiu.wang@nxp.com, timur@kernel.org
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

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_ssi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 404be27c15fe..db4ba5f22b77 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1397,18 +1397,11 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
 {
 	struct device *dev = ssi->dev;
 	struct device_node *np = dev->of_node;
-	const struct of_device_id *of_id;
 	const char *p, *sprop;
 	const __be32 *iprop;
 	u32 dmas[4];
 	int ret;
 
-	of_id = of_match_device(fsl_ssi_ids, dev);
-	if (!of_id || !of_id->data)
-		return -EINVAL;
-
-	ssi->soc = of_id->data;
-
 	ret = of_property_match_string(np, "clock-names", "ipg");
 	/* Get error code if not found */
 	ssi->has_ipg_clk_name = ret >= 0;
@@ -1492,6 +1485,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ssi->dev = dev;
+	ssi->soc = of_device_get_match_data(&pdev->dev);
 
 	/* Probe from DT */
 	ret = fsl_ssi_probe_from_dt(ssi);
-- 
2.17.1

