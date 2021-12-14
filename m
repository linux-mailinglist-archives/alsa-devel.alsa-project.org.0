Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE2473AAC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B557A1F05;
	Tue, 14 Dec 2021 03:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B557A1F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448153;
	bh=sKblV5eTzNMbrV8+n6vDt1bRP8aKO7Na92dspOY3hHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mgf2h+k7RcvzhaPVpPb7Un75gEX8YZol4wPi/L1cTxXMGMb8ifg5tvk9gmrlXCKl+
	 5Y/RdHYN7o6lbKLJBlMv8sEGijzkG9j4Fz7dLWMMAAMAIaR1BC2UHvcHQY9q86KvIM
	 FaaCb+Dy0l7bFSMGZPqUw2q65+p+Uv7UBGWfRvdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A70FF805AC;
	Tue, 14 Dec 2021 03:10:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2585AF80589; Tue, 14 Dec 2021 03:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2921DF8053E
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2921DF8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gflC/poU"
Received: by mail-pg1-x531.google.com with SMTP id 133so16099447pgc.12
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6u6FkCPCfv4J7pdg4Ybljstse/ix+a86moRRp7mRqHM=;
 b=gflC/poUt+2r7cA9Q5zzWqPY8DRXaTP5MRDsuAQXZiUILJxP5ELCxq6TEKRuP7gi5e
 tjkaWbVFlIXFuxWZRrzv1amRPpBaPUUHHz5/YCxBuyt+yNfO8fVuryrTEWKLN7tXu/e2
 NJ38CrTYOPE/k4ZjQz2EZ8kSXfU40hAZIgnoqb/yp5JWOK8BvaNvVRlrMK9I4OyDmctx
 oHInFeWTtW0QSfrvv2v3a5iWz9GuZUxaePkKHFG9nBB3utZP3m6b3JDlO3oUfuf5WTuz
 Rbb7PFY34SYuv9DY4YdnNhspQaoY8S5jkkYkmJ5AjdYOluPyhswU/i3O3X26Qf734uIY
 sQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6u6FkCPCfv4J7pdg4Ybljstse/ix+a86moRRp7mRqHM=;
 b=due9Q76a2VgKTPl6f02YEpuFOmfIQaE3x9x6eKfHlp/o4EaYi+ld+rZ4qceLRhVX5X
 fSFpyihu+KEczNEqt+oYsXoxnDd5xPiPcmXgI29CaR5pW+P8AfDt2FyiJDWgCOpxr/2A
 yYYACz+Rh0Hyemh0DESSJLFuontEGpADtqqBAs9jIQbu/IlXj75KLi7BW6JYmUMD7rqu
 ny+BjmuNDKmRf0Ua2PR9E/UdpiLYb9xKNVhgwdJ1DhJxocB3mf7MyM1/JrUwhqzt/h3o
 A9478pMAZyw256PvDfplBPQ4lAbuB1MLwEKqbrbPnVV6WEqouxI7Im5jOQ4PlZououZA
 bZFw==
X-Gm-Message-State: AOAM533xtezJx1bSF57ycCnpDBIbp7HJSMjARdCcfcxkz53Sp87EproI
 oEy07uw/4FtohWXgSI3/RDE=
X-Google-Smtp-Source: ABdhPJzSVH3Mnxdpn9YFOt4CPLgiUCSLVVw9mCHtXX79l7AP11X9GIpLmL8ENtNUOcz8kBIX8vxTNg==
X-Received: by 2002:a63:191d:: with SMTP id z29mr1743341pgl.358.1639447788205; 
 Mon, 13 Dec 2021 18:09:48 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:47 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 18/22] ASoC: qcom: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:39 +0900
Message-Id: <20211214020843.2225831-19-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 2e1c618f7529..e1bf04d00625 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -94,9 +94,8 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(card->dev, "%s: error getting cpu dai name: %d\n",
-					link->name, ret);
+			dev_err_probe(card->dev, ret,
+				      "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
@@ -116,9 +115,8 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
-				if (ret != -EPROBE_DEFER)
-					dev_err(card->dev, "%s: codec dai not found: %d\n",
-						link->name, ret);
+				dev_err_probe(card->dev, ret,
+					      "%s: codec dai not found\n", link->name);
 				goto err;
 			}
 
-- 
2.25.1

