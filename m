Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D43EC7FB
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E711726;
	Sun, 15 Aug 2021 09:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E711726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012871;
	bh=Um+j3fWsJYJbipjrM90N2ckCHT6pDYYn9vhIzYJj6tM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZigf8d6KGjfXGctC+rqqe12mA3KNoP3g/20+HMNrZqQViY//qfuLaEnYRarpedyM
	 b/p8eNfKpOeozkggnvSk3/hnxzvKPaJkYkl21uDiknjHDIYLPXHSMQHqwLpQA+9TPw
	 L50dYdDujAbWLtngi4HV52MNPlRVJdDBjlwXvvWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A8EF80507;
	Sun, 15 Aug 2021 09:30:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A8EF800AF; Sat, 14 Aug 2021 22:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA2F1F80127
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 22:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA2F1F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BE2s+NqE"
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so26057980pjr.1
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 13:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvKMQmOLj6OmKuLluvPksBR7uMBeqMOloBYYGumCRK8=;
 b=BE2s+NqEn4DbtEps+vzNh1JAevWZM+ii/JtaK0P+fMlRBIjZOdbdfRMfP8e9tjUlpx
 P5e4VgIRXGtvSqDkbasFfH37FOOu8ieIi5KwK4sq8sXoChap+DF6ND84F+FIjp+95CXi
 0xQGrnAUXUBD/gJ1hFbo1ANodVcxw+HWctQJvVGU4neUfE9Ow/eWKCOt+ABIH38uu+GV
 BhboIPUGgQ3yuEEka7jeCF7eKR7UJt9oW1usflutpkBQ5QZCcjMFFOULfwNoaODsbtLX
 nwjkYJS03kZlexIMT2lgIxpbukNSOGfBbbcAOdo3YjU8rIg0vy10N+myueD/D2IrfdU5
 uA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvKMQmOLj6OmKuLluvPksBR7uMBeqMOloBYYGumCRK8=;
 b=ZxfENR17OPrhPENI0GbeNqM4gx3qfBm18+i05oQreP8U2dY2JvTu4r2aHKYUIZ1p9P
 DsuLJ+6ozzwl0l4vPMVrAnGfI4z1oS6snuGX8ciZhGcTSmlg91aaZEUaPXGpQO+KQNL5
 Fg62zhK7i3zLVq56qD5PfLuM4Fn/iOwO+GXWdO4Vt9lN3HE/ezf0GKf4/vcwDrVNsY6u
 /oTrah9KqI4R+UULvLvueKimlNoLML2lxWkGD7Lcq1ciZ1hQ9Hc/1+LRasMTEwbcKD8+
 y+S+d3sXujbKkcBHKBICNi20DjSUFI460Y2sKc3to5YSh+uhluMuPsLxbpznlbPAp7uz
 Xpzg==
X-Gm-Message-State: AOAM532JhMipDXg2v0PhHvqR/Ia8UyXJxKd0u7dWqWZZX2Sw3fquGCN6
 AnZLIpw7o8NEBD1T1mchrlE=
X-Google-Smtp-Source: ABdhPJxA06VZoHW86ZtZg2aIgjU9cv15c2XHAQctF98Bsnsi0yv/B8oD8+fyzzFL/ayLTD6Ao1fvng==
X-Received: by 2002:aa7:8503:0:b029:3bb:6253:345d with SMTP id
 v3-20020aa785030000b02903bb6253345dmr8259509pfn.35.1628972399802; 
 Sat, 14 Aug 2021 13:19:59 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id u13sm6413121pfi.51.2021.08.14.13.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:19:59 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/3] ASoC: ti: davinci-evm: Use of_device_get_match_data
Date: Sun, 15 Aug 2021 01:49:41 +0530
Message-Id: <6ebb350fa8a960b8775ce324b7786dbaa865a1c8.1628972198.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628972198.git.aakashhemadri123@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:27 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bjorn@helgaas.com>
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

Prefer `of_device_get_match_data` over `of_match_device`

Retrieve OF match data using `of_device_get_match_data`, this is cleaner
and better expresses intent.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/ti/davinci-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index b043a0070d20..bf13f3d25cec 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -389,7 +389,7 @@ static int davinci_evm_probe(struct platform_device *pdev)
 	struct clk *mclk;
 	int ret = 0;
 
-	match = of_match_device(of_match_ptr(davinci_evm_dt_ids), &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		return -ENODEV;
-- 
2.32.0

