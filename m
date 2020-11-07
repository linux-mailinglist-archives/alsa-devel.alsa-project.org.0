Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BA2AA23A
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Nov 2020 03:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255301664;
	Sat,  7 Nov 2020 03:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255301664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604716941;
	bh=9EgexDvO5XuTQwI+XMErr26+rbq3Np0yEoarUJfBSXs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRmjIpHLg58BCLJhQStY3HATlpx7Nbbge17OCSAbh3wbGjjvOYon3KH+N3xOzZDiv
	 mRGPCzq0vEXgclWNqAJH6z/AyVmDHufsXf254YDKkqTO3ZuNndB7frjaFhoaQWWlMD
	 nwRw95d4jgk1xWqGgXb8DzemdOWLerNdrluIbgqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46E3F80245;
	Sat,  7 Nov 2020 03:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72242F80171; Sat,  7 Nov 2020 03:40:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24F14F80114
 for <alsa-devel@alsa-project.org>; Sat,  7 Nov 2020 03:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F14F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UwI9OV4X"
Received: by mail-pf1-x441.google.com with SMTP id y7so3294592pfq.11
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 18:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uIZQwyu3heVWOuZiTU19D+Rn7MoOiKM8zu84y+cy574=;
 b=UwI9OV4XjHg/GOytA2RlHLo2M6JLlW7M5230uqzFpBC2M9Mtkw30LzLDYQ69j0W7Iz
 KJvGsPiCipMbg8JMEm9fW8u1REnbRLHe+lh4W8Ssz++RgLG2DKQnJQJhMqMeE9hFwOEb
 fG+8RdA6cyA8TWfJ8nPCA+d6OL81wPnp0j3mENUpIzfW4GoLgQ9sM5D3bkuzQI+y4alf
 bTay6lXpq+gBveRpOK94h8DQF+ZDYHBJmCfvdbJ09U3Lp/MNQ67qO6P4Pov8neD6GJ6M
 hJX5AQ90xKKCRRFM641cHKHqagg+mKQ5HyM3XIHcmryL782zL1wcEBGQEEFKKVYr7vj2
 My9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uIZQwyu3heVWOuZiTU19D+Rn7MoOiKM8zu84y+cy574=;
 b=srtNkHFAhvYw2Usnp1GgmenECMvMbEcjwDqW14BMYgGmldKFck+hjNN7jehLEBASK/
 FxD/XVDQyNcP8yl1ji3HsqpPZvW3xIjJvSa+Y/5zdVKYWffOxm9LWTIKegBmGn2Th8G1
 5QeHC55Go6koDjkRJyh0pTJvwVtQLeGIDWEhyKQTy1UmGTgJtJL3vCR1r2ey9vwuNAHq
 DMf+0qRb+3Eb1WCw5WQnaqeCJ2wOksl1oeFDF+zM6XlKsUChnh2HQDocqYz0V72SpzH7
 3lcxGX5Oq0xx4cDZNpEyft4k6pok0O4y2BmSVv9XpHkoM31PCEqMa2U37IYlCirBJawS
 XP+g==
X-Gm-Message-State: AOAM532mBa30W+TfSgn0ZDNjutlCA2UKxA5YYB10Ml8sjrKwapeAkYdf
 HNm9h6+MMs6qGTWExosa0Ss=
X-Google-Smtp-Source: ABdhPJwppyyTWHSp5pmK5h5/8Fa9jyRxfiLX2TJyLtAO4il12N3D8xn3qiRuq1mH+2JebQBByBlSqw==
X-Received: by 2002:aa7:815a:0:b029:164:cc2e:2c56 with SMTP id
 d26-20020aa7815a0000b0290164cc2e2c56mr4532319pfn.21.1604716836081; 
 Fri, 06 Nov 2020 18:40:36 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d68sm3670126pfc.135.2020.11.06.18.40.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 18:40:35 -0800 (PST)
Date: Fri, 6 Nov 2020 18:28:22 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20201107022822.GA5163@Asurada-Nvidia>
References: <1604715643-29507-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604715643-29507-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Sat, Nov 07, 2020 at 10:20:43AM +0800, Shengjiu Wang wrote:
> platform_get_irq() would print error message internally, so dev_err()
> after platform_get_irq() is not needed
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
