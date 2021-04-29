Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A867F371471
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 13:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BFE167C;
	Mon,  3 May 2021 13:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BFE167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620042116;
	bh=zTD5XNpQcNgkJT83Q2al0FE7LUgrZGM1S6a2eWeWBEc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B7Z6eX9OtQ07ZFmzSve2Y85Ri2VQRibC+YkxD+skNwE2ILWlKU/BD471YBQAg0Grc
	 RbIMHF4dZY1OmN28kw1Benw8WubAy+Quiqt4dVApbmvM4OkvvkJtVZw86Z/IdGc40X
	 o/zpymzFwUYCpVLAxCmx5ITxHbToqwJsim4OmTsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5405BF80268;
	Mon,  3 May 2021 13:40:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2907F801EC; Thu, 29 Apr 2021 11:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B602AF800E4
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 11:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B602AF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="doJSUANF"
Received: by mail-pj1-x102b.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so6911891pjb.4
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Hc7qwEWt0TQypk1NpxmfhrdUGD/9xTC+FVNkE0PCDPk=;
 b=doJSUANF+Dq7ZsjoPCEistPnbGK/JuTWTDxUpl1X+jLEN/iAxF5HyqYv47fIS8EOS1
 aWfgcvdUjOOc8RR2wDvrI3QcPgsdvmboE79Z0PA2eD8SkZl71zB0EAAwXwDwtyWQhZw0
 r+NGGlnKMwxXpqTwDm8mUGnZ+i1wG8cp4D74H5GWBn0EZbLo1mzgMrrRxGa2DoUednKH
 yx7v8WMtcPTGL50QaTzmqbWMFJ8wmse8Q9Z+59ciTX4R/qvCItQQdENBJFB3Ge35+jc1
 BPGhK03Xb/kJIyEBxz5ktnfq88PZjZKboFIfAwGVisicojSU6fcr9V25WyassBo1XYk2
 wR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Hc7qwEWt0TQypk1NpxmfhrdUGD/9xTC+FVNkE0PCDPk=;
 b=n1l4s7Bc9hMz8yUIX384LIPpE1o86pZ4vYw+X/FcAeKxqSB7X+rhQjC52xnFy6VeAr
 56788pKp4BoNFhMSy2a4QwrH3qhtOvAL7HOc17Aj6QMV8pXExF2EWIoKzhgxn8SXwC6C
 k383BNq/Qx4mx1FLX1VnFQFf6mYLDJdPV5tE4FfHOiVnPUBN/MFfRB6GOaDPYEORdnE4
 DgrcXAj5+cCxIk7l0Z7geWD90t5UJTCwDPxmuLIsQwXZJEzArBa98b4IaKSi0l3586Si
 yU+irQPErZY8BR0cccGFRZeuI20cXtGF32w1EBFhab9nlmFB6JpRGBVcRov4Yz4hNYCK
 63Ag==
X-Gm-Message-State: AOAM531PtwG97xBxYWwpHCMccIWuFimMi2ThovqTayDovUSw5Th+tSqr
 /JTGYS6tTM6BFoHuY72Jy2M=
X-Google-Smtp-Source: ABdhPJwIKMM5WeakUgaxHGL5V94vdsm/Y7DRjAdrvfr1VxbJ6AY43JpMQGSBU46hdFmarfcpO1NiEA==
X-Received: by 2002:a17:90b:370a:: with SMTP id
 mg10mr6303916pjb.219.1619688313938; 
 Thu, 29 Apr 2021 02:25:13 -0700 (PDT)
Received: from localhost ([157.45.42.16])
 by smtp.gmail.com with ESMTPSA id j23sm2069548pfh.179.2021.04.29.02.25.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Apr 2021 02:25:13 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:55:05 +0530
From: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To: agross@kernel.org
Subject: [PATCH] drivers: slimbus: qcom-ngd-ctrl.c: Added space after comma
Message-ID: <20210429092505.lamh5km4inoynjar@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Mon, 03 May 2021 13:40:20 +0200
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 sanjanasrinidhi1810@gmail.com
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

A space has been give after the ','.
This is done to maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index c054e83ab636..cb9612a5c30c 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1348,7 +1348,7 @@ static const struct of_device_id qcom_slim_ngd_dt_match[] = {
 	{
 		.compatible = "qcom,slim-ngd-v1.5.0",
 		.data = &ngd_v1_5_offset_info,
-	},{
+	}, {
 		.compatible = "qcom,slim-ngd-v2.1.0",
 		.data = &ngd_v1_5_offset_info,
 	},
-- 
2.17.1

