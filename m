Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C5221D33
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD881614;
	Thu, 16 Jul 2020 09:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD881614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884057;
	bh=0xQ/am6woNxh3DruGf+dAScKAPL+8zkB9Nmyj1htUOM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XFl77YTrib3ZEByuhhO1kg+/t3HD57KHQor3fqXNL9BHPStmkfNlY+xiL5EYkCjJG
	 BsvbZ4arbYpenc7VVsMwbNgTitF3k70Y4dLMXDel1Gm2BgWhrOQyTS1QVmM6IxjJTw
	 aa7aWV+BK9KfE1AHNwKXOGBjkvuuw2T1VJGTi1cM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F703F8028A;
	Thu, 16 Jul 2020 09:18:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06A97F8019B; Wed, 15 Jul 2020 02:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9DE1F8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 02:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9DE1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rawG1LNi"
Received: by mail-wr1-x442.google.com with SMTP id z13so571577wrw.5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iewP6kBBGkoM+NWaS3DfjUXvQDRr2nJUEdxQPlIIFM0=;
 b=rawG1LNi+RAb1ZzCXDdwd32vQxg7rvvqBJiHSOWkRGlttzJ8pqTMEsWwmtvcFKTfvX
 Ut3tOUR0s/AkQSrZiCrJPS/biRHToPRz4/PNQCMbo0JXds3zuRERaseMpyG2TBD7mmJZ
 BUzLpGxAKG4ZT0HCOA0muhLorV7Hu7vPPmQiGiF7pNPAjvcTeyWcSRfL7IDCheONIV/d
 oQ37wF3EFBlLSQYn1ub1ASjtUacrWtnJSvc3YkreYTZRTpEgBOKJRvA21bNq1iARoA0k
 nbTjrN+yr10T/FQ9DTbEZylp45wl6ztXkPAb81ALO+Fp5ecOwRiEhvCHRGddgWsggOWK
 JWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iewP6kBBGkoM+NWaS3DfjUXvQDRr2nJUEdxQPlIIFM0=;
 b=SY9CcmTdaOFF0mHVmkvQIA4VZyuyoK5uCjnWjeuR4qb0yzg+oCqMLXNXZS5eVBydJt
 wg4tPcclqpwPrLQdhPprf1lnXFYdChTfHJbVJ09mP9a4DmefkLPOI3OmYBBPmuMaWafO
 HQwzMr2I0ddKgO9iVCtjTukFfmyYO78cqu5AsSMiC5YMeo0iORdviBnp3gXo1I33xOez
 3da7NlrTwM5YtL9wVvNTFKyMGGBT0GSyusvbTcX/hRQaVh8wEGPk+Xt31f4uY+mc2MtT
 rjO+ZTYnpYaHQ67Gc9Dl/J/PQ6ZeR52yREqlRfdpcjxivOnCm5yg/OJn+/OeDKLtmYqu
 iYuw==
X-Gm-Message-State: AOAM531rSyGDR2wu8SoY4HCsNoIo6JKeXSyzCbiQwF/HGv+/L9dTkA1K
 hxXnAGXv85UImfzCiKN1WuP/PrFuvLpdS70UjTk=
X-Google-Smtp-Source: ABdhPJzMsiHuahVmxHGl1O1iCFxyz0OXaHxlhJ9mKuK/83xI4YCn4L7U1waH+DACUr56IBhQt1IiTWFEc/aRP/zNFCc=
X-Received: by 2002:adf:82f5:: with SMTP id 108mr8356831wrc.218.1594772656307; 
 Tue, 14 Jul 2020 17:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <5f0e49da.1c69fb81.1ede7.a8fbSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <5f0e49da.1c69fb81.1ede7.a8fbSMTPIN_ADDED_MISSING@mx.google.com>
From: mnlife qiao <mnlife.qiao@gmail.com>
Date: Wed, 15 Jul 2020 08:24:04 +0800
Message-ID: <CAGjHXR2ExzMO3ntwzZy9QUhpuqe-VZAXOucNkXXZK+0XZcaQWQ@mail.gmail.com>
Subject: [PATCH] ASoC: soc-jack: calling snd_soc_jack_report causes a null
 pointer access
To: lgirdwood@gmail.com, Jaroslav Kysela <perex@perex.cz>, 
 open list <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, 
 broonie@kernel.org, mnlife qiao <mnlife.qiao@gmail.com>,
 mnlife <mnlife@foxmail.com>
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:18:09 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

When snd_soc_card_jack_new is not called or the call fails,
calling this function causes a null pointer access

Signed-off-by: mnlife <mnlife@foxmail.com>
---
 sound/soc/soc-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index 0f1820f36b4d..51b799ee98b7 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -44,7 +44,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int
status, int mask)
        unsigned int sync = 0;
        int enable;

-       if (!jack)
+       if (!jack || !jack->jack)
                return;
        trace_snd_soc_jack_report(jack, mask, status);

-- 
2.17.1
