Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194D499E0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D1B171B;
	Tue, 18 Jun 2019 09:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D1B171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560841598;
	bh=4r3S9pBvVSIXkQxpx2KBg4qQxVQbyBMvd7U10wBi5ZY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFKdUBW5UBRRhyEi5WQ0/owa51hTUsZKeBMx8eS8JZweAppDyXndncMCXKqpFnxQg
	 XN7OKDhXJk5rFeIdjrXp3uXYjxxXSEE5DYz3wmXi8AzCTW+/Pn5R4kohUM2MnAP653
	 vi/rM3XZAcQ03XLO8K0G1WuEgvTxtmfMn9dTwC6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0C4F8971B;
	Tue, 18 Jun 2019 09:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FF4FF896F4; Tue, 18 Jun 2019 09:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22E58F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E58F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sV1OT6Ni"
Received: by mail-qt1-x84a.google.com with SMTP id i9so8880841qtc.15
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Yg+VoeBIFsiUo3RNykj9ImGJrrFAXDPPQeNcP19TPSg=;
 b=sV1OT6NiJJ782QXQi3gxoIptdU1fl/aRHBp6I42cMykOl8GpqsqkfuDnJT/xWEoprH
 rHVYZYIANYCfNDdZBwih1cNlVhiXDHw0BYoYkJpv8sjaQ9u4SLDP2LQX4X4WoK3E+vEJ
 11coR1q6eZGFdAsCl8UJk4lKF1LEIZkXZ7btzvTNTayAO1aVs6aqJ2rs6EnQXlwBHcXu
 ndQV/EzIbKy6iW4a/ZoZ2Igb7lBpESnmPCzsTucHHvA9XcF60M1PNwNgbiGtoFqkz13W
 aytWbb9ewWE8BkstBXpJwBroB79bHZ9JYV9RZU3OeKuTJsCxY2oZF2062FxVysNrPjEj
 oFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Yg+VoeBIFsiUo3RNykj9ImGJrrFAXDPPQeNcP19TPSg=;
 b=fV3oMg0Y14RwEPDZ3Vpy6omQrOfYtB9gWY4NxunH8CobRj2zKm+ao0JZlZ42NlGpDy
 gHqdvPGY4X3R/5L5/roDPXSTKlZqEDtx21GJeIASINI2xTJsS9ICh9D9d32r6qsd71ti
 tei77d6wHQmYxckraei7rUNParoIUw8hnG14KocvlS/n9aUfqPj5s5WOm/a+5SMbLwIq
 iX07SAPhT4CNv1jGh6WOehVRvVzXWRHWpsFaqeAqnQOtbcoscGr9x/pdZQoy81GMEeHn
 RAQurQ1LYNgtg66jOo+2XQyegeFL+qqS2z5AOHsjG2JglgwvL57QN7olRbSjA/ur/UPU
 MARg==
X-Gm-Message-State: APjAAAUa+q6pR9447bWPa/1vrLhG3ca2IJpY05IUNmCEL2KYHcSeb7Pu
 oHMtYXcv7CtN+eypRi3Ju2V6U5KXUBBp
X-Google-Smtp-Source: APXvYqzMzTASkLn3TpZXvX9k0gnXI5E0SthLaWOJILLEDiQak4iNWkX8Jp9R935LzLPICWs4iMPeP1FKE+WM
X-Received: by 2002:ac8:2225:: with SMTP id o34mr14515597qto.222.1560841487226; 
 Tue, 18 Jun 2019 00:04:47 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:04:26 +0800
Message-Id: <20190618070426.35405-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: dgreid@google.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, cychiang@google.com, tzungbi@google.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: sof_rt5682: use GFP_KERNEL
	instead of GFP_ATOMIC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Change the memory allocation flag from GFP_ATOMIC to GFP_KERNEL because
probe of platform device is unlikely a place where cannot sleep.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
It might be a typo introduced from copied-and-pasted.

 sound/soc/intel/boards/sof_rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e2e5f97d9920..02138aa8a850 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -498,7 +498,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	int dmic_num, hdmi_num;
 	int ret, ssp_amp, ssp_codec;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
