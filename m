Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6F33C4AF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:41:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F2A18C1;
	Mon, 15 Mar 2021 18:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F2A18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615830080;
	bh=fCvHELi9y9Ws7qmlwxFHKukhKV6B8NeTX7cdTpKyySU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ko7Gxb9P8AYZASY14knpAJ8g7bwVcAHsDnTNT7bm6AJM+0sB8f9gu8S7lWMb8LieT
	 LwLMb8eoz/sj8b7Tfn+cGd3DOdJj9aFvn5vuagY3FR/IleXBT36+lqnYTlFHQ873S0
	 8LnW3CRnn1S0u9s/qA6kUwCdXBYJKUvh3VEUsx5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 322E5F8010E;
	Mon, 15 Mar 2021 18:39:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F14F80171; Mon, 15 Mar 2021 18:39:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35E7F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 18:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35E7F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="RZBHsDx9"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4A3D022234;
 Mon, 15 Mar 2021 18:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615829971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5Z7hIwaOvVEkPuQ/yO5n6QsbNAjH+MEMoi2JmnTPOE=;
 b=RZBHsDx9Y5MjBUY5csUgmC1nFPa8dTjN7jJIpPRI2n93+1k5+1DEroe2KSWAB1BXD655G/
 n8KQgVkL2apu2tHioXkWQJLrEA4uplu9369VnsQP84xo2jAZTV/DMKspBXYHnQBb989XTg
 gsHabVe+AdcOT3daGqCeASHgQCLOnIQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 15 Mar 2021 18:39:31 +0100
From: Michael Walle <michael@walle.cc>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Do not handle device clock
In-Reply-To: <1615829492-8972-2-git-send-email-spujar@nvidia.com>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
 <1615829492-8972-2-git-send-email-spujar@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <62f003b9cf2bc1ae238689ea811b870d@walle.cc>
X-Sender: michael@walle.cc
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Am 2021-03-15 18:31, schrieb Sameer Pujar:
> This reverts commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device
> module clock"). The original patch ended up breaking following 
> platform,
> which depends on set_sysclk() to configure internal PLL on wm8904 codec
> and expects simple-card-utils to not update the MCLK rate.
>  - 
> "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"
> 
> It would be best if codec takes care of setting MCLK clock via DAI
> set_sysclk() callback.
> 
> Reported-by: Michael Walle <michael@walle.cc>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Suggested-by: Michael Walle <michael@walle.cc>
> Fixes: 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module 
> clock")
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

Thanks!

Tested-by: Michael Walle <michael@walle.cc>

-michael
