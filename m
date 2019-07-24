Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32081741E0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 01:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C311906;
	Thu, 25 Jul 2019 01:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C311906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564010091;
	bh=NLagntxoVFG+UVUnfRkVSjXVfdAi1r8Wbjb2VMw29JM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNriXRqbXhq1595Vx29olJ954JPSkQfffVEhPW2T9GpzxScMiVqnZvifCkC972MF0
	 dHtzGIOahGmIFBwYJjjulybKL9Yna8Nmpj1q9ESZm9R6VOa/ax+Fx+z5tvzRxqSu9i
	 grYekUT8sqxHKEdP/BaUohgBNjgfbNuv/emlqZbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183BFF803D5;
	Thu, 25 Jul 2019 01:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42BC5F803D1; Thu, 25 Jul 2019 01:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 717D6F800E3
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 01:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 717D6F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Sa4QuXYT"
Received: by mail-pg1-x543.google.com with SMTP id l21so21954902pgm.3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d+t+952qOGIU1AddOHVH/nDFUA90m4SMJ1NCUq2nKKI=;
 b=Sa4QuXYTDpG4z9VPVpCPn4be1hY1xZdVOzdRfkm5eeTmruwirxYioQZkmJndvCu/OF
 bzrzowYqU0xUjsFcb/9Gak318sfFLVIUWd1bEtZKQSov5e25ZaPricXKIHgcMDs0D9GX
 zM4mJcESv6Ad3QBx4ZTbbA70n96sGRf8fa97U7fgYq1Q7ckfFSCLwjZDEYTKFL4RE9Ft
 /noDhPKAvG871BL+wzXVGZMFh6VtQgbUW2K1P1E0a5GOgU3n9cNJKc903vD2QtySQcGn
 N/X+a3Lt7zuy7QItV4ewrlRjb576kj58NUH5FtirVnBLqvk8l5R+TPgYJ1PrxyBsAdIW
 EekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d+t+952qOGIU1AddOHVH/nDFUA90m4SMJ1NCUq2nKKI=;
 b=VVWNoyC+NdyukqxD/+Vz0+C0cJg5bwIdyy02f80SykU7sAMEfW5E5P5sa4L/MZhaGH
 ROzCjNfYRyClT4z+NjzvbkQgsiGeEm0lr0FlxcD6JJywYMP2ouQqM6S2R5fTPCMY1icQ
 Vt3/wWjNbJzJB5YgKReXBvmmiS6IqMVG7wWSdbr5Heb+qs0p4vcHhshXXtQHCRUpuWy/
 6PE/Ru16scncuXOYmTovdPYMVXQA0oRAs43uoxy2v1OADfJo2Cjl0lA8u+0u1cjx6XZJ
 QX4/I6f7cJtc4pJBxdFrSnzINzFWhygmUlmjg2oWkkGFOPHEZrMDP542lCGZKhMjDR+Z
 I26w==
X-Gm-Message-State: APjAAAXa4X95TzAsrNhQ/p9SBFe0R7z1x8H18m8xVgDnJAhNRaP+fzU+
 CWvKb+C4Bo+Fk3YNWL7CPNs=
X-Google-Smtp-Source: APXvYqze9AAhyT3DRIx1dZFNDLjo8o8XIOYbw6gQScrKQK72ISZdadufL/dJOqjjN+UT+iUZgOd2WA==
X-Received: by 2002:a62:f20b:: with SMTP id m11mr13713991pfh.125.1564009979132; 
 Wed, 24 Jul 2019 16:12:59 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t9sm20439665pgj.89.2019.07.24.16.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 16:12:58 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:13:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-7-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-7-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH 06/10] ASoC: dt-bindings: Document dl_mask
	property
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

On Mon, Jul 22, 2019 at 03:48:29PM +0300, Daniel Baluta wrote:
> SAI supports up to 8 data lines. This property let the user
> configure how many data lines should be used per transfer
> direction (Tx/Rx).
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..59f4d965a5fb 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -49,6 +49,11 @@ Optional properties:

> +  - fsl,dl_mask		: list of two integers (bitmask, first for RX, second

Not quite in favor of the naming here; And this patch should
be sent to the devicetree maillist and add DT maintainers --
they would give some good naming advice.

From my point of view, I feel, since data lines are enabled
consecutively, probably it'd be clear just to have something
like "fsl,num-datalines = <2 2>", corresponding to "dl_mask
= <0x3 0x3>". I believe there're examples in the existing DT
bindings, so let's see how others suggest.

> +			  for TX) representing enabled datalines. Bit 0
> +			  represents first data line, bit 1 represents second
> +			  data line and so on. Data line is enabled if
> +			  corresponding bit is set to 1.

Would be better to mention: "as a default use case, if this
property is absent, only the first data line will be enabled
for both TX and RX", since it's an optional property.

And one more extension(?) of it could be what if there's no
data line being physically connected for one direction, for
example "dl_mask = <0x0 0x1>", indicating that SAI enables
one single TX line only, so driver would disable RX feature.
What do you think?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
