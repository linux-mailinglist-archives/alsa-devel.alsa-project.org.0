Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CF2049BB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 08:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFA0172C;
	Tue, 23 Jun 2020 08:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFA0172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592893131;
	bh=2F2wvMbcvu6apR7dhfA3IirGfuklB3GD9tjoSrehaCE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DhG/UMbIKDfIeX+iiDwk85NIJRC6uTZoCHaADgMoWRYNA+rlSdDKxvZPR/lZ67iTv
	 iT59F2fxNTUMtJ8FVkPqZgOrED5/1qkc+uyBptu30xg7eNHIhX6tnZP9GF46uXAMgz
	 bJ7uvCeSS8BMXbLP15zah1JLyq6Y4GLhslVByIaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1472F80218;
	Tue, 23 Jun 2020 08:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBACF80234; Tue, 23 Jun 2020 08:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06551F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 08:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06551F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ntaRcLow"
Received: by mail-pg1-x541.google.com with SMTP id e8so4151230pgc.5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aRgKar6UhjVPbbeMviZl5LaaMbKjszzBO+Eoi1rtDeI=;
 b=ntaRcLow8nO0pWaGgySgikdwt4YMvOtBKNxrRwxoC1oZq6NHbWlPoPhyg5Wc0nNQQq
 liNy5Z/BjBVk5/jawKVHkCa52CTdka/HYUgKICPTjKMb0CRq0fy1SF2TDV+qlmhVROT9
 qO8Hgmu4BQnT3hctqsX1UnGty+OmjNUskMYhGHDorFPZCGZrZmPSPm+MxIcte9oYnAt0
 HMP6iauHOp9STPPXrvunv0Ztq1vot7Y5hHy4QNyHN63Q5GLy/9/UL5XBO2CxgdX/w8Hr
 ZWhSSyVLC6/zLAiV4Ob9ll4w01BuVKJSwBakDpD9BX1/oE2TPZDKOCi2ZlSquCfiCMMX
 fgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aRgKar6UhjVPbbeMviZl5LaaMbKjszzBO+Eoi1rtDeI=;
 b=cvzaiGEqZ5uMBQTkLHUW5gB11pkRW6J9wbB+WBWzCQyqjmrtLThMY5G/PLwlgy8Q3F
 t6MGLVYxLbjzGSIfhtNeqNM5Mc5ur8l5NterCPXPW9h2VqicQa0dhOpSZLIJOrZA5EPe
 QTOjUEawWIvCoT3rcluP0zRvKhwvn+gecZ4/i4UmBwc+cLSqUmnR9/ALqlHZ1NGU7LBr
 BKENSgtl2sZLIVgxlCn30o58HYZzQ38Ig0T8fW6hUVpMCO6e1ALjXQ1OtTXCIE04heGS
 EkW3bYHqHCt7SaKppx1s9OLGKR8wwPPK01ShFtNW60p+kIuCJrOf/otNdcOVs4jpmTZt
 BfEA==
X-Gm-Message-State: AOAM5326lijHyT0FZYPVnIX4amUOLvo0k/kGd8VTbZDKmWetLjcIlCGt
 Xny5e01UFdk6Vac6W197hzo=
X-Google-Smtp-Source: ABdhPJwm3iPXSzpwN/FxG3dnBLyTWtXeYz4zMOZSGTqWgN9hRZz6rmb2HkE4A5XcbWeutGtmxHc2wg==
X-Received: by 2002:aa7:9738:: with SMTP id k24mr22282623pfg.44.1592893021976; 
 Mon, 22 Jun 2020 23:17:01 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id l61sm1255318pjb.10.2020.06.22.23.17.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 23:17:01 -0700 (PDT)
Date: Mon, 22 Jun 2020 23:16:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
Message-ID: <20200623061635.GA17085@Asurada-Nvidia>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
 <743be216bd504c26e8d45d5ce4a84561b67a122b.1592888591.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <743be216bd504c26e8d45d5ce4a84561b67a122b.1592888591.git.shengjiu.wang@nxp.com>
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

On Tue, Jun 23, 2020 at 02:01:11PM +0800, Shengjiu Wang wrote:
> Because clk_prepare_enable and clk_disable_unprepare should
> check input clock parameter is NULL or not internally, then
> we don't need to check them before calling the function.
> 
> Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
