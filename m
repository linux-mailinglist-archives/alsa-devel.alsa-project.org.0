Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D432B813
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 14:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B567318E5;
	Wed,  3 Mar 2021 14:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B567318E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614778791;
	bh=7X3zWC8sv43JidvGXEJ+sxG+iFcCaZnwd3GWkVHn2QA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=er65PRGPZdUMWDGOwPEUhRMLhszuZg/DLtU3W7UuLsPkynreTBPzqRmq3A54E9aDN
	 JH2ibbLapJNL1n5FAD1khqTekbYAk7RHLHtm75easPd7g97KWA/H4sM5F0ktW8d88p
	 tAkmTyxWBmjSBmknWXI2rADR4BxUlch+ylc3vW6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF213F8026A;
	Wed,  3 Mar 2021 14:38:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2170BF8025E; Wed,  3 Mar 2021 14:38:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCF28F80227
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 14:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCF28F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jfBdSINz"
Received: by mail-lf1-x12e.google.com with SMTP id v9so19337093lfa.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Mar 2021 05:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7X3zWC8sv43JidvGXEJ+sxG+iFcCaZnwd3GWkVHn2QA=;
 b=jfBdSINz37HSrdFGnR+6H3pATTxbQpYj2UOeoXb+AdSBeZ9+RTage79zGmlP1tJ27V
 yKuiSaKmTISJjOzC6svcUltAcpl2pCPtZIzF0opf8QtBGTK1tqwrOGqsWaDy8uR/Iz7u
 ffNWNNrSvY7lS5rbtzNDtHVteYBcLJMVcdfM0JHYMP+LZYdzi6pk5utjKw+1ZMtL0Q8a
 5K3GErMzYf60UFNnXMMZdlmvwhG0c2lRU/mjPMCJsGjIRVXvlgFROVEEFla80cBu+m9k
 X5Rvnw+53pgGzxkoMpR8gOLa92SH45HJp3FsbtY8XQCl8YXJXCshw8JLngX+MOtNP84d
 1kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7X3zWC8sv43JidvGXEJ+sxG+iFcCaZnwd3GWkVHn2QA=;
 b=L2qO1NJkUABznFaLbiEUIJMeusJDRAjwV55LmlwWew8xcPCRgzk1NC1bcUcE/mise1
 z3uufIGFVxUOdfqPWfmClS8yoH6Zwigs+eudc3hp9kdSo2M2FU/DVA1JFuCGXt7i2oP6
 gX0h60dspoipUhKw5LSqIGLYGwXOcIStOs5nGkb6Hxt0eSuNtwsQMGHPxWnYKjeSaJF6
 nb17uN4Jn4JXEO/LugU/QZZi5ihu0h0or+v4DwXLWucWTtuLHp68vewJSfhVOBlJ6YHy
 SyqIvb8GbKr3qsUE9l62dDTCukbISKsQWDaKo2+hFQzI2w1RL9L4xbDqVgBey+gcp6cy
 4fQw==
X-Gm-Message-State: AOAM532yQqur0uG75x3VWWjqhF2pJLORYGol8zomLRuYFLiKqvfrhiHE
 vaScBuwIOtZ9GlzYTJpGg776E3ryHZY7wfLDfsU=
X-Google-Smtp-Source: ABdhPJxAbpN/v8nH1IMKL/0Yhn98LsdY93KrfCpYhZOjPth1T7NFb3VeIt9Sd5cBNd1j5i9L446+OO+8m4icOEYwBvg=
X-Received: by 2002:a05:6512:6c3:: with SMTP id
 u3mr14579626lff.443.1614778688677; 
 Wed, 03 Mar 2021 05:38:08 -0800 (PST)
MIME-Version: 1.0
References: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Mar 2021 10:37:57 -0300
Message-ID: <CAOMZO5DhvAX3=Xv=v+yCRyzXhP0g9=016GcsRKOjBzjTvZ9X_w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix platform_no_drv_owner.cocci warnings
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Hi Yang,

On Wed, Mar 3, 2021 at 5:54 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> ./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
> will do it.
>
> Remove .owner field if calls are used which set it automatically
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

The patch looks good, but please send a v2 with the correct Subject.

It should mention imx-hdmi instead of hdmi-codec.

Thanks
