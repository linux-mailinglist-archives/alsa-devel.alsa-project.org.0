Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF435210503
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 09:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E0C167A;
	Wed,  1 Jul 2020 09:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E0C167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593588511;
	bh=voDv/4AFn5Km7Ucm14xI0m1T2sEdgfaRfqjladDcBbI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKz0Y76aUXSq1dFGxp5GWZG2on4pD0Y+3+RWlH+E3hYCJagHMpqb4VPjkRu9CAV9X
	 Q0OimaXxHRh4/fZS4ukAVd+EvGIFTVW+gBbspS3tJeQYCMiKN3mxb7pVVYqOGy5nDw
	 y4Kla3nfsWFN/1ygR+GCXY4LvP9+Gs9/0st7o3fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C29EF8021D;
	Wed,  1 Jul 2020 09:26:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CCCCF80217; Wed,  1 Jul 2020 09:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F7BBF800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 09:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F7BBF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lPh75AsL"
Received: by mail-pj1-x1042.google.com with SMTP id h22so10662915pjf.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Jul 2020 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=45+p9qFF6DBDwyHUNuh+QjqxoDwCR18zLYMQyIvcnBo=;
 b=lPh75AsLe9G9ybYhjZkjxk6QZlN5KZi2Q8aPMoLW9Ib/96WKvOA7So89gFbDEC3bE5
 JOKqxdj2ALsDZ6EcXBy0GV8uHce1Z4Czt+mgdSXsSqj7fSz1JneQ5uy4AqU3+V16rITM
 ZLb7InkKLW/bcOCCrap2HkSIAyN8eOR+TUS/CjUa5aqqk8jc7LPW0/wcG2/i8EJVXEdB
 45x2gXb9pEnb8/V88ZXNEcV8bB3102hgj55xRN//hJf5Og1dGK9V9aBsf9yzce/mCOSh
 5+EWSa7MP31xaWZoBwNrPqxFoCN4Uz3oq4twHWXYbRAYD5eE275bvRTuyBSE8XK7RX5h
 8zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=45+p9qFF6DBDwyHUNuh+QjqxoDwCR18zLYMQyIvcnBo=;
 b=JlR4CEcnxMyDUjg/QxLgIf3WCk4pePGZUXeYeWrrUrcZ6uT9j+byRh5t7Ao7KUDrKU
 9sNF6Kz2O//E5WqhMGjQ483VLlfTU1WotBREUx3RotiTKpz/YMADoox4EhxYcP+upUuu
 AX06fLwCdzk20bWLDckrB25gavaaSSxdD/xM1ZOV3l1EvJKUDRHn5piiVQFQq/V/YhmR
 yW4Q72jjaa2q4TYxgRHuHYsdzC2o6B9zfvFRTJrzO8RSWTSddQrUlhuFs9nPrmAyo16P
 CGYjqv2Vhat6sQ3klP7jqxThuMeHXbcwacKVeqfeL1/IGlWvjS69pDQayH/IpOFWBNUJ
 SnMQ==
X-Gm-Message-State: AOAM5322WwFyU61r48ybul/M0Y6Bh6OEk2yJk/qq+KLzcAmrCV8CyCPl
 f0SemKvlXhMoH8pyjANvvEY=
X-Google-Smtp-Source: ABdhPJytyFDyN/TwGZv+qVxhehOYWwLSsXhJW1Lqzbm2SjT/TlbF2UwIIvovKzYRSIAv1g/v1ARpMA==
X-Received: by 2002:a17:90a:d581:: with SMTP id
 v1mr26662363pju.33.1593588399632; 
 Wed, 01 Jul 2020 00:26:39 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 o12sm5123633pfu.188.2020.07.01.00.26.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jul 2020 00:26:39 -0700 (PDT)
Date: Wed, 1 Jul 2020 00:26:28 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200701072628.GA9868@Asurada>
References: <1593525367-23221-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593525367-23221-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
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

On Tue, Jun 30, 2020 at 09:56:07PM +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.
> 
> For internal rato mode, the rate of clock source should be divided
> with no remainder by sample rate, otherwise there is sound
> distortion.
> 
> Add function fsl_asrc_select_clk() to find proper clock source for
> internal ratio mode, if the clock source is available then internal
> ratio mode will be selected.
> 
> With change, the ideal ratio mode is not the only option for user.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
