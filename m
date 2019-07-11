Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE065F03
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 19:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A62F1684;
	Thu, 11 Jul 2019 19:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A62F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562867466;
	bh=nQ2jtQTFimDrXmJKJbE88wUopgrKp4+tTvrNwc+9Nhw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GFI7y9iM5ExUClefcg0HNcDL5Qc7hqSe2TTWCge0sGHbmqM9KJ2zlIyB/Rk4evA6t
	 o8D7wzAoAysjJoCd6p7cdA/fB7kXusXQD4bXYZgPIRIf+5+oapnBTn8kcY2+vJWMIq
	 SHWLnQrYmLX973Y9+pVFlwuYpIpluY2D9pkuJJZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B935AF802E0;
	Thu, 11 Jul 2019 19:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F58F802FB; Thu, 11 Jul 2019 19:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96674F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 19:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96674F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a1U5AoD3"
Received: by mail-pg1-x544.google.com with SMTP id m4so3303201pgk.0
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Mrtm+42mKXJyXI1jqGIgzb23Y5WaFCmewuRRxjnIfds=;
 b=a1U5AoD3hkSIItL8HiNNo7PFR4wX/QYAlw457C7RrSX5rOFi4TkzHWxCKO0LUF0Ofp
 StIat4u1q9RTPUeU3gX0H4AqbIljtz35UoRLLzRRW6SSj996v3KIWMhtvagA9QVhw7HA
 iI9EgguM0sZmy7c130Md82ABD0glJ/vJHtfphaRS/45jT4LJviORGdt33qqmfIHw51zk
 heocyYKTaZ7DQjn5Z6+nv/Cb/1Md7cGwkrxCv5LpsVR19I+OpLBEp8OJCH+AZuYxh4yy
 CPKwXb9o7FPmndgG0JcHMZovsY254hE4eg8SN1ZDRGl4yULogViTchMWdeiXGCfv+cis
 yxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Mrtm+42mKXJyXI1jqGIgzb23Y5WaFCmewuRRxjnIfds=;
 b=nR6Bzhno23EoTS5+3i3IAmMdA0CKJmDZC4inxzz6ecKuB2uWjfFuQ7bcTDcB2p3Tf4
 8Whb/jxCZ3dixAFk1y5lRITmgvQxt4wPCiQb5qV50AlWUIObnlZCmlymxOtxbzMs/VJt
 fAFzaXkFfLbqimsQyBjw/t/bGHx1Jz9Do2HyPmOCcgnV1WLcqdJLk8DKlAp7/a8YsIWA
 B9VqleHfYfFavAPs7pOO8H7mSIym3N8Wt0JWs//mfAll4l5eSByHxUArx7//QG5Kj2Mq
 U7LMQ1/yeUDjr9Oc89bFjcdJwtkWOrEuyHxA2AiB3DcjJ+Q5Wd8oBxo/0r5VfHAaS4mj
 fM8w==
X-Gm-Message-State: APjAAAVaAX6nQMl5U/edpudiJq4EIPw8R+BDiujbeAY760WwKsGGW5Qz
 IOrydS61jXkFzxllAO3WnIQ=
X-Google-Smtp-Source: APXvYqxCyTB+WLKmBXb76xa7SlBiPdhWde9HUOK2ZWNCd4igyy/yrwmLGCWZ37b9pSSSIlPgtws65Q==
X-Received: by 2002:a63:b46:: with SMTP id a6mr5801358pgl.235.1562867354148;
 Thu, 11 Jul 2019 10:49:14 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id b11sm6834267pfd.18.2019.07.11.10.49.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:49:13 -0700 (PDT)
Date: Thu, 11 Jul 2019 23:19:06 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>,
 Gen Zhang <blackgod016574@gmail.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190711174906.GA10867@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: fix "conversion
 to bool not needed here"
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

Fix below issue reported by coccicheck
sound/soc/codecs/wcd9335.c:3991:25-30: WARNING: conversion to bool not
needed here

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1bbbe42..85a8d10 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3988,12 +3988,7 @@ static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
 		regmap_read(wcd->if_regmap,
 				WCD9335_SLIM_PGD_PORT_INT_RX_SOURCE0 + j, &val);
 		if (val) {
-			if (!tx)
-				reg = WCD9335_SLIM_PGD_PORT_INT_EN0 +
-					(port_id / 8);
-			else
-				reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 +
-					(port_id / 8);
+			reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 + (port_id / 8);
 			regmap_read(
 				wcd->if_regmap, reg, &int_val);
 			/*
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
