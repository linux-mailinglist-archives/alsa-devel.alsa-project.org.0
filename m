Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C996D40C7
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 15:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB96F165D;
	Fri, 11 Oct 2019 15:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB96F165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570799676;
	bh=0h77Pz9FbBpYhtQ04q4kuq/K/NPkfnhuhXltWVswrxI=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D8H4b9R1/csa6lGuBDJESRE9lvOi6bnAvtzGgv2mcBGYaDGoiO7p+DaNdP3HpNkWV
	 ig+k5vRqgVB12gkh+e4KckENT0pYWsqM8UBRZzBpVyDQyE3+8G6BH6uz9J4fvZN08B
	 BCfKsd92RjG4xldB7/08CjytMCRS4ET1vRJrmhi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 478A4F8026F;
	Fri, 11 Oct 2019 15:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B97F802BE; Fri, 11 Oct 2019 15:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC4DF8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 15:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC4DF8026F
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46qSzx30QXz1rdjb;
 Fri, 11 Oct 2019 15:12:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46qSzx0Xm2z1qqkW;
 Fri, 11 Oct 2019 15:12:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 1iBTdqjoxA5y; Fri, 11 Oct 2019 15:12:44 +0200 (CEST)
X-Auth-Info: P6pHhQefh826x5I3OGRMQajpdWG1pcG3yVxAquADxtTDkGfuDnxuuMluprMpWmf5
Received: from igel.home (ppp-46-244-181-31.dynamic.mnet-online.de
 [46.244.181.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 11 Oct 2019 15:12:43 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 4F2242C01FC; Fri, 11 Oct 2019 15:12:43 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: YueHaibing <yuehaibing@huawei.com>
References: <20191011105606.19428-1-yuehaibing@huawei.com>
X-Yow: I'll show you MY telex number if you show me YOURS...
Date: Fri, 11 Oct 2019 15:12:43 +0200
In-Reply-To: <20191011105606.19428-1-yuehaibing@huawei.com>
 (yuehaibing@huawei.com's message of "Fri, 11 Oct 2019 18:56:06 +0800")
Message-ID: <87mue7ifxw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: fsl_mqs: fix old-style
	function declaration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Okt 11 2019, YueHaibing <yuehaibing@huawei.com> wrote:

> gcc warn about this:
>
> sound/soc/fsl/fsl_mqs.c:146:1: warning:
>  static is not at beginning of declaration [-Wold-style-declaration]

It's not a function, though.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
