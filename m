Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19F2AB51D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 11:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989501662;
	Mon,  9 Nov 2020 11:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989501662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604918168;
	bh=/WNGKIcLnd4Cvg+y4UGZHPTcU0DKE1YhLcEvMO9sCko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U+Q8K4BXKvSiVEcDJ3njx6TmpywM7ZZ7vPnaWrQp1yEIYHAWVvL47uRzclKinVMOk
	 zzWrvV7Tq8e0a5Igx+kQZTYAQWGSjQfZrfuYBsNV9UYW72J84wPD6NuJZn0S7gZmV/
	 Y0dQf7GwcKVpG2BiX053ledLL/NgMd+EuAicwaz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10798F800BA;
	Mon,  9 Nov 2020 11:34:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E40F8020C; Mon,  9 Nov 2020 11:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FEF2F800BA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 11:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FEF2F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DIeqnSAf"
Received: by mail-pg1-x543.google.com with SMTP id i13so1996101pgm.9
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 02:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTmupo/EpjgAy2pPuwp43MJbMbOqAR0YnTyRbouORaM=;
 b=DIeqnSAfnkOX68rTluPtTr1Z/ka/uBkkJE++R5AZx3vtaCnXWhpOlbW7q6Pchny2LW
 nmpKKNAk0Kqmu2QugOYA5xZUpku0kpAb8JVxgrykC3wSOJZZZIzFlfQ8S9+YjQEVR8NY
 ogbIU0upC+fJ3ZgVbZYFAKoVWSRCFHev5GFUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTmupo/EpjgAy2pPuwp43MJbMbOqAR0YnTyRbouORaM=;
 b=l9OACDmvKmRurprfJUQ9gm7mS661XwlkomrJ05FYhNU1qEOpjxWF6oq4rXvrbRkObm
 ySFZASJT5hiHqkF9YBfUmFqg/hE9MX7/C4xfezMzxbrgcmooqoQz3SSpx+8EGiVS9a0L
 n4ElwHPbtJZ02ed+5CtJM/S6C86f6ejY2K3bP28en9uogfi61SGr3vRtYB4LoYsuomPb
 zATUqijfDdTU3YaGde3NcVKAWvcDYA7VYh6Pdd4dMHdzkm+QZsAr5nnHQwVAfHO7jBrs
 ajijSD+wEVrEQXhh7QjtSu56Re2URLrYbGbJF0+Y+HBv8dPtPGDbfkQX3JJCsHa4MfS/
 V6SA==
X-Gm-Message-State: AOAM531mGIpEFbXmLkLlKEmTAkdZOJpgqnHTbTu0uD8RG9q3jTjmyp5b
 U5fBsew3cZD64KFBi/6CRMb/Ew==
X-Google-Smtp-Source: ABdhPJyaNypAicS4XX7Fl08mgehF6nQZq7ki3Z9aXq2gKlrGrFfmnvTBvnq8T/JTZ4f0aahG8xTzeg==
X-Received: by 2002:a63:2a83:: with SMTP id q125mr12000933pgq.84.1604918065859; 
 Mon, 09 Nov 2020 02:34:25 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id w131sm10662101pfd.14.2020.11.09.02.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 02:34:24 -0800 (PST)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sc7180: Add missing PM ops
Date: Mon,  9 Nov 2020 18:34:15 +0800
Message-Id: <20201109103415.607495-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

Use PM ops snd_soc_pm_ops to handle suspend/resume like other machine
drivers.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/qcom/sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..42e366ecc689 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -258,6 +258,7 @@ static struct platform_driver sc7180_snd_driver = {
 	.driver = {
 		.name = "msm-snd-sc7180",
 		.of_match_table = sc7180_snd_device_id,
+		.pm = &snd_soc_pm_ops,
 	},
 };
 module_platform_driver(sc7180_snd_driver);
-- 
2.29.2.222.g5d2a92d10f8-goog

