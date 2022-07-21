Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6F57D5DD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 23:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF18A185B;
	Thu, 21 Jul 2022 23:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF18A185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658438622;
	bh=2csh2IPzZB9Q9+L8yOL8SYU7r0lrEKvI5elBmtDV4/c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GiNLVSCML9z1WDqtfNaYTr//CwL30iE42dUX2dhxvEfI8wA3dAYuumrG3HGacD/h0
	 JRbVaBXNDOsZm7WZVlwC8UnMyX43Kx0IQMK4CY+9OTPGgwi2T0d92wYPrswOAy36/q
	 1Gvlk/7Fn6PbgakUqYDhA0AoJbBvBDN5Tv5JtHCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0849FF80256;
	Thu, 21 Jul 2022 23:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C25AF8016D; Thu, 21 Jul 2022 23:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BDE6F800ED;
 Thu, 21 Jul 2022 23:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BDE6F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b6dgBxwP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A61461821;
 Thu, 21 Jul 2022 21:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD762C3411E;
 Thu, 21 Jul 2022 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658438552;
 bh=2csh2IPzZB9Q9+L8yOL8SYU7r0lrEKvI5elBmtDV4/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b6dgBxwPawsXvrs8FUNrO+XL/BjA70/JzCpatMpkSzj7k4H1NCNOiotZyhdFxGAVC
 PP0TouGwpOyksZ+JkyaViKZi3wwSpRxAUa4jll8RuuLciixdPnP+QJ8lxUivlSpKsB
 IZaLl9ccELLbadWEDYu2IUFTzanj8FANZM1pKkqE8MnVhWfswSrv0nZn71HKHlkutm
 rTvsprQlzBRrdkkI6jlkYjSpIZgIRtAsx7h78aYQqKCBAMIfBoZolXCk9gp8uaOVoL
 jXUd9dVTvLgfSfSAipukCS4ycfOPt6bw0Whg/TNDhpzYHimHr2ZCe/fZQOmVqeudAP
 26pIQWRO6TIwQ==
Date: Thu, 21 Jul 2022 14:22:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] soc: sof: fix clang -Wformat warnings
Message-ID: <YtnDltqEVeJQQkbW@dev-arch.thelio-3990X>
References: <20220721211218.4039288-1-justinstitt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721211218.4039288-1-justinstitt@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Tom Rix <trix@redhat.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Thu, Jul 21, 2022 at 02:12:18PM -0700, Justin Stitt wrote:
> When building with Clang we encounter these warnings:
> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
> 
> Use correct format specifier `%d` since args are of type int.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Indeed, decimal integer literals with no suffix are of type 'int' when
they can fit in an 'int'. In this case, there shouldn't be a bug since
the values of these macros can fit in an 'unsigned char' (so no
truncation) but it is still correct to use '%d' instead of '%hhu', which
matches the stance of commit cbacb5ab0aa0 ("docs: printk-formats: Stop
encouraging use of unnecessary %h[xudi] and %hh[xudi]").

This was introduced by commit 323aa1f093e6 ("ASoC: SOF: Add a new IPC op
for parsing topology manifest"), not sure it warrants a fixes tag for
the reason I outlined above, but it might be helpful for other
reviewers.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
> 
>  sound/soc/sof/ipc3-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
> index b2cc046b9f60..65923e7a5976 100644
> --- a/sound/soc/sof/ipc3-topology.c
> +++ b/sound/soc/sof/ipc3-topology.c
> @@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
>  	}
>  
>  	dev_info(scomp->dev,
> -		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
> +		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
>  		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
>  		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>  
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 
