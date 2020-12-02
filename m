Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397F2CC6FB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 20:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA1C17D3;
	Wed,  2 Dec 2020 20:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA1C17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606938613;
	bh=Ep7P3GGGh3bRG+445cnkfYWrB3pUnaYhrPLjcV61lSw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CDcEBk69KVEC8EqJiLKqMu9FIyjlXyWZ+rapCBd5AaPKLG2/f7V++P+gmLxJtadlZ
	 ASFns49ZAsIZ0a83mSVz68QD3zkinsg3cVju7B0c/QaHhR00C7DfaWsNwT3ZPRxKfn
	 ADAOwI9cIQsfdsnVpWRlDQs2DXUOwOv4AzSP7oTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95A0DF80158;
	Wed,  2 Dec 2020 20:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F8EF8026B; Wed,  2 Dec 2020 20:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 849D5F80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 20:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 849D5F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="onJj8ipS"
Received: by mail-pj1-x1044.google.com with SMTP id iq13so1616197pjb.3
 for <alsa-devel@alsa-project.org>; Wed, 02 Dec 2020 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dnQQ0ZO/6p33z1swbZoImrPF097nMjWL47oIMo++/1Y=;
 b=onJj8ipStbxkxO1WMW4vx6wNj6v6na0K0VYBNmFQ/TgoUyd1X+QuhKWOM9Q2hUY4uH
 PI37PA+QRy74rDEnFaGWxAzDOBo/WwymM51gZXXQOIeAvykEhSD9kByS6NDbeDQOB0gB
 dlSeHl0n0tNFnc/5e9QnxMwqAgMeviGwIfyu1tYVbluA5Ss8u/LWXKPoAaERlFD6mzv6
 y0iRo9mnNUd1x93YRZ/L1vC1OMPIef0qOKvWcNYnRo7seGzgbAUkxIabKOFy7bf+dKKu
 reBPVovWJfqqzr4y5seDB6W6wi5zyl6DyaNJ9ZUbn3blZQP7AEpNJYLMolGv8hzQiGdQ
 UItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dnQQ0ZO/6p33z1swbZoImrPF097nMjWL47oIMo++/1Y=;
 b=kXtATpMMwg5ecR/Ka0Rhwr3lUIHJJMYrXjfMjbEGLSFTthqWKHaUPubkrctbjSb/N2
 1JKPBrYr//T000AAtrCldt3kr7ujmnErpwZmxto+t+3MaBDW5P/kFl8o8ksH2SXHKsPk
 x0Kf4ghGnQ+ctK0pCXe1ixDkjSnGYK/cympxEY9hgvAPffvuSJ4OD6XGO/uQHLZF2T5I
 DKf69/DpPJ0gb5QqbdLeRAXfzSnXfXta+vxSV3eSGQAX9/VsAnDYiSvCxUUAN6OQTcmx
 n51zXXp3GSXBuNAhsN+PB0faoKZhOVeZ3VR2F86tFQiSTRQwUATjJvaL/cuVXkJgV9xE
 0QzQ==
X-Gm-Message-State: AOAM533Stky7n83pz8XVUUb6458m26lUWurvs+8T5ySIOSNL6InHBeUe
 eI+e5s4mYiqoyP5WzFuVazQ=
X-Google-Smtp-Source: ABdhPJynOsl/9mtFMTtbS3krXbaXRE8MqaHaMr7m3r88/8eYsCbneJHJzz+ir6n8gXwRYSd8V2dkSg==
X-Received: by 2002:a17:902:ee53:b029:da:4c68:2795 with SMTP id
 19-20020a170902ee53b02900da4c682795mr4119802plo.7.1606938505659; 
 Wed, 02 Dec 2020 11:48:25 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i10sm547720pfk.206.2020.12.02.11.48.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Dec 2020 11:48:25 -0800 (PST)
Date: Wed, 2 Dec 2020 11:45:31 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Add support for si476x codec
Message-ID: <20201202194530.GA1498@Asurada-Nvidia>
References: <1606708668-28786-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606708668-28786-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
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

On Mon, Nov 30, 2020 at 11:57:47AM +0800, Shengjiu Wang wrote:
> The si476x codec is used for FM radio function on i.MX6
> auto board, it only supports recording function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
