Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08813445
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 22:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E85A1820;
	Fri,  3 May 2019 21:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E85A1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556913615;
	bh=1JFjhpZtxok9PtoWb54A+P1mN0qnCy/KxIxPWH5GNuw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HM3gCTYeknOtSEpjkt7XM8+eq7eI80sELHBULfkm005PyMehNyORDXG+KHs1s7rL0
	 wCFoLfYnlqXAVS6mBPlji4ohA518JWW8hPwePDy912jxuqmcWuNBH8RKCK1D3ciGNV
	 1+C26SiGOHrDtGOtQYa02ewSNYmm9bjyhrtEtekE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E72F3F896B7;
	Fri,  3 May 2019 21:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95084F896B7; Fri,  3 May 2019 21:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6DA6F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 21:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6DA6F80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AHZqjeYB"
Received: by mail-pg1-x544.google.com with SMTP id p6so3199641pgh.9
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WB6WukALIt5LPSFOLetrqCfdn6458xhXun4VAeBfku8=;
 b=AHZqjeYBooF34dvlJEEYqeS5a/OwB/N3wk8oRUX3xMNSZkJpPj2xUUUhnfeja/ANyO
 tLcv8IyusQA50EJQjTWkpWqIyRR/dEIwxDFO38PsT9Yr/CGqyAmXM0zi/CYIKU/Tpdzs
 R4tXGXyS977mH72o1FZgcd3NrHQ4BhL4DfLfyNDG3TvWlrO7QMvI2+13BEABMzrV9zd3
 Wu4t6R2/qCSX4OIx24AO7VADifBn7OP2NwFxU7vTCga6cc0iM6EblGTAsERoUhKpvbSm
 0soVKjoHaKXoMJZbuEM6ie18l9NrzilF1wzJWAIFdQoBCxxpogrzCe6g3QHS4vuShJz1
 UlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WB6WukALIt5LPSFOLetrqCfdn6458xhXun4VAeBfku8=;
 b=H6i28tbCQmzD8WdHiNqwdg7p4jSIACLgl/7jfl0jCG03Mejz1fwOO3+IGqHDypGnxF
 pMLvk0O4bZ0B5Ego/xS8rZPe1RqL+92FVxal6yEYvZb5lU+oA1uV4JZ0QFLeB68c57u2
 JXPIYCEU12HdFwc4JEHNgjRYfBek7E5qJp5JhOsFK1e93qjvpuMii24ZPdoAKu1sPwMO
 D90G5Gw8CGwcZfBzM95lIYgfuduK3tnCaftTUVk8OcN8dobAXQ1t7big/wb3Gv+zA02I
 6kv3UIy9UXjf8gIKAsJKXxaRySG7KdGCP0BtsToWCQcc3SBnd9XNw2IEdIY9tjIGVrhV
 kwkQ==
X-Gm-Message-State: APjAAAVITDVFs/mQ5G5p7TY+/C/3jg63Wvgrtd++Twq0fX8tAq2w1HsM
 nheq8Ydd6U/gE073PPExJeSk13UPBag=
X-Google-Smtp-Source: APXvYqy7TK+EVMdOx5DGkjrJ0eA7+vRZ/pb3vRx0DHFz2qS0ZuFK5ZP5l67SdIG88fBWSJiRE/CyAg==
X-Received: by 2002:a63:d347:: with SMTP id u7mr13073160pgi.254.1556913503804; 
 Fri, 03 May 2019 12:58:23 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i15sm4868020pfr.8.2019.05.03.12.58.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 12:58:22 -0700 (PDT)
Date: Fri, 3 May 2019 12:56:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190503195648.GA30289@Asurada-Nvidia.nvidia.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
 <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190503042731.GX14916@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503042731.GX14916@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm
	runtime function
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

Hi Mark, 
On Fri, May 03, 2019 at 01:27:31PM +0900, Mark Brown wrote:
> On Thu, May 02, 2019 at 09:13:58AM +0000, S.j. Wang wrote:
> 
> > I am checking, but I don't know why this patch failed in your side. I 
> > Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, all are
> > Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git.
> 
> > I can't reproduce your problem. Is there any my operation wrong?
> 
> The error message I got was:
> 
> Applying: ASoC: fsl_esai: Add pm runtime function
> error: patch failed: sound/soc/fsl/fsl_esai.c:9
> error: sound/soc/fsl/fsl_esai.c: patch does not apply
> Patch failed at 0001 ASoC: fsl_esai: Add pm runtime function
> 
> which is the header addition.  I can't spot any obvious issues visually
> looking at the patch, only thing I can think is some kind of whitespace
> damage somewhere.

I downloaded this v4 from patchwork and resubmitted a v5 for a
test. Would you please try to apply that one?

If my v5 works vs. having merge conflict at v4, maybe something
wrong with Git version of Shengjiu's? I compared my v5 and his
v4 using vimdiff, there is no much difference of whitespace.

Thanks
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
