Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF726D0D2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 03:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D8E1660;
	Thu, 17 Sep 2020 03:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D8E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600307373;
	bh=rjSC3r5lczvd8oTKvyjlfCQUNJDfBG3SShTpq9kVWzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8VT6bcEDd4dOWdEVVPRuGCwRv13s1znFAJBKHVrRsCOUOmz8+YdnNypj2Xbr2qFo
	 k9yPwVW0ssoy8NYRB8qN3DpExAD8IIAsqIa97Noz8WCqJYLF0SU3+MMbMcBXQNfGfA
	 JjKxNuQMfxWa27ghVC4Tk2favjaGjp4NESaYieaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 682D5F8013A;
	Thu, 17 Sep 2020 03:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0D19F80212; Thu, 17 Sep 2020 03:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DA5F8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 03:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DA5F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BRj0knLs"
Received: by mail-pj1-x1043.google.com with SMTP id fa1so422955pjb.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IAe9YrO2c2nTBXJ+6AECIPfq5RqNfakgD6ec87G1lRc=;
 b=BRj0knLsGJxxYLXBhVmfZKGmxujjz+/Hmqi/qEwMX//OJvKf9yyDeEixQBGPd4wts4
 6a1NAlBUMJK+9HsT0tHExIiIBY51fBoIN1yU3XQ8O9EkJj//97LGtCL11Pe5o+QJ+bcS
 et0sT0lWTzye+QnNs4WZa5DghwevjSdMMaI9tIfXsfOrCJHnbGucKLqyBveNCMYoqf3A
 9t6u+brl3mB9g4hGos+8dgLT0f8ElY0zna3yl8gzeOh5Pr+C5judrj0NmF4GGrl6ENI7
 ParWAThpX6/xse3rOFEo2Qr7eC6Z7XHGuVFMsX8cwQuJ1jtwBxjW95ySSrHiGJABu2XO
 wuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IAe9YrO2c2nTBXJ+6AECIPfq5RqNfakgD6ec87G1lRc=;
 b=RNBd5VxImfcir1u/cCzwFBvvjDod0oBhl67Qhwl1ZAgA4PSz/+sY3GZJhOG3uRtm6x
 chsPPm4ISrVlT0iKE17K5+aGv7Owz5BwnGdE/WoLFGZEYb3yuz5C7TzJukoajAInuOXJ
 VnPueK6Fb7SZhZq8Vmx3ll8PJiWoKVQcvQNH9i/jG1zoYuxmXlSHhZGUFYPNio+Mj1X/
 RcMfHNSlnwnhK6oMEhO0GEQnIQXLsTLLkt17CGFv18SzEdVer+vSotSjA7+PbduEL1q0
 75gxbc2GK3lLSftgfyzZfNdC4QWVdMNKzVUqTRK+pPItZSVlFixgEHclPUjIGukaJi8J
 CSkQ==
X-Gm-Message-State: AOAM531jcO87KaTwgmufFizSTGPB5pOYjiULAUUcqgSP+IDOaEfAogfz
 VJPSyBp9xk0JwMBI3Vio6xE=
X-Google-Smtp-Source: ABdhPJxQrmqIyoEdGAwBvg6EW9yUh/vXTcfWc6Q0cRa/d1a/exrU70dlGhePTvzfeLRNM6mxTIWJgA==
X-Received: by 2002:a17:902:8605:b029:d0:cbe1:e773 with SMTP id
 f5-20020a1709028605b02900d0cbe1e773mr27020490plo.26.1600307259038; 
 Wed, 16 Sep 2020 18:47:39 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u2sm3883917pji.50.2020.09.16.18.47.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 18:47:38 -0700 (PDT)
Date: Wed, 16 Sep 2020 18:44:27 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: Add new added registers and new bit
 definition
Message-ID: <20200917014426.GB22566@Asurada-Nvidia>
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Sep 16, 2020 at 06:16:25PM +0800, Shengjiu Wang wrote:
> On i.MX850/i.MX815/i.MX845 platform, the sai IP is upgraded.
> There are some new registers and new bit definition. This
> patch is to complete the register list.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Change itself looks good.

Can add once fixing the commit message:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
