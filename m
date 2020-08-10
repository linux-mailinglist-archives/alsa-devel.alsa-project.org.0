Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332A2413A1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 01:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6D11665;
	Tue, 11 Aug 2020 01:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6D11665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597101224;
	bh=DTC3H0Wg6mcic8SpTccRSVSJM9mt3iC7pJcHG5LHdek=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nj7/S02rLLAZ1GuUA7j/Cy/BbD1FuO/jV4qAvUmNQdL+f0n47bLXpsJMCFCZZPfsn
	 0WSL2pqc+G4j5jCqCyVg3hJeb+kMS6I+fqHsr8ahblT+VIYQMiBqzD4DWj3uSoEvqD
	 5lzNCSPdrEgXtP9bRRzFQsBZAfKJrbyeYwyevuH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20077F801DB;
	Tue, 11 Aug 2020 01:12:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756CDF8022B; Tue, 11 Aug 2020 01:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01C6F800CE
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 01:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01C6F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YOm0rklr"
Received: by mail-pf1-x443.google.com with SMTP id m71so6172057pfd.1
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iyYx+79mwCrZYi3nlfml4tfsSp9D2+EXuOvJ+LHVxHU=;
 b=YOm0rklrG+M8yFJVFuQfstvRO3v/Hq2XyONxrwKB7WZOa58+I2waQdvBPnfANWEeWd
 v5WN019344fkBd/eUIc5q/mc3sglQTBGZDEbM8ImbMp2WhdkG5RRxU7pqJnJaPrw3WCn
 +VCZvNgkDjq9REtEPH2RI17kTTXfMsoGMrpDtzTMLDGVK/Hs4tuMJinvZbhtK5F0CDfW
 vD2Lf3HLMgqNmaMxZfzFed+8IPMFkA3udQF3G1LCYaCNG0raW05Dxr9MbiCOHu/8QXal
 0WXPqS2vz1Z7OsqX/2vdlYryvbQk7whq3a/jKkt4UUUnuIODEDf7pXoMTvj+s4CZjfqc
 IVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iyYx+79mwCrZYi3nlfml4tfsSp9D2+EXuOvJ+LHVxHU=;
 b=Wv9msFnXg2lKBu0DnL9IDUa8VcGdiqXSQ+098N+BZ+I44mifqdOvOOs7U+Bvq7pPZ5
 4hMteAvuV16U+7/ts9kPVBu+lqR1kw4+CQXs3m/noUFrNjsohMTgj+yye3VkeWKnWDP1
 5mROUvfBlzeZH7L1mv1R8wGQJgokMRAbUw4HVcouz3WNdkt86jM5NU32UCF0bmF8eTiC
 slj+/Hh9tQ2pmlcJyFVpWCecBMisG0EFduRbSbOHba6Y2kiTIXYgdlzSY1gQs0pjxd2l
 sqAuUqVVSggd8POFBwVgdpYrN7US7EPAd5fObDJjnxTPBZqbii7IK5q/+8puQE/gxCYM
 yPuw==
X-Gm-Message-State: AOAM532HD+tFNqBLJzHBQh8GK0XCZSxmGGS9h2R8VtQ4jVkYvpgjTMlq
 qY6/B4sCrOMx96AWkNUWSAI=
X-Google-Smtp-Source: ABdhPJyuVXKLUZzlX+04asv1rO5NDwf3RYoPK3yQ/Y5WBimvbdL5XOOKrIANZFoQMNYFlRtNl7BTDQ==
X-Received: by 2002:a63:705b:: with SMTP id a27mr21206295pgn.405.1597101111429; 
 Mon, 10 Aug 2020 16:11:51 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y4sm19161705pgb.16.2020.08.10.16.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Aug 2020 16:11:51 -0700 (PDT)
Date: Mon, 10 Aug 2020 16:11:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add -EPROBE_DEFER check for regmap init
Message-ID: <20200810231144.GA16645@Asurada-Nvidia>
References: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596791682-4311-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Aug 07, 2020 at 05:14:42PM +0800, Shengjiu Wang wrote:
> Regmap initialization may return -EPROBE_DEFER for clock
> may not be ready, so check -EPROBE_DEFER error type before
> start another Regmap initialization.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
