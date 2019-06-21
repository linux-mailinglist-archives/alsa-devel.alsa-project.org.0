Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77D4E93D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 15:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA3461668;
	Fri, 21 Jun 2019 15:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA3461668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561124139;
	bh=w8NnJqQ27VRMyvam24aCOs+5X4mTzUOFAY5pDhU37mk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j1RiNFq/sUld7sPDMsSiKdYVCDV1xPwCCxiLLhbrH+U2IZlUw5qkYvyHsRGljhSVh
	 LwyUcCVpnM8oSFDtc1b58qe/4cwstMrjJJlELIi3cwI4p40114qiQsYUKt2pGIn17W
	 bXEqg2O6X2L6i4a/LcZwkICrdeq+iYAHhfxQQuHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE244F896DF;
	Fri, 21 Jun 2019 15:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA191F896F9; Fri, 21 Jun 2019 15:32:35 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A82F89682
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 15:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A82F89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="EG56U/jb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GHUSNjtj"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D157522114;
 Fri, 21 Jun 2019 09:22:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 21 Jun 2019 09:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=j2yp05g5qDYVNwtcnROr99uPzOS
 RalFOaQ4HvtAIMIA=; b=EG56U/jbXzULxT28b/phGRsCWHmuR1ZdgKId0cAwd20
 Y7ov5N/XHnG6Fb3ZUucSeN1HF0xG7Rt277e8nQ0XQLfN3vVfxqtjbs2ahRuaWNJl
 MBWTCDSnqGISwjrgM3l+qo0MkFn/0/l+NQJy9rxYXQq9HQZZU1ptzGHyYo7Bx/le
 NZBG9uKvuacp0uaSjiLb3LjLZo6ZQe1cqzo3W9cSfd2YgLvry0nGP6okz2iYKslv
 ZnbtY5TCSXRiYueZQE4jXVFvDqyWDzf4Q/KEELeFD/vF1qzgIUaCujBTrQ8h9h44
 XiJ1p4xkkLMidQM6Y+rp+rBUh2qu5bQTS1ZWFwK5ROw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=j2yp05
 g5qDYVNwtcnROr99uPzOSRalFOaQ4HvtAIMIA=; b=GHUSNjtjqsEm6lqCXDNlUh
 k3l6jiYurctCnFxopabUQyHaCx5qsY5WdKDueK2l9OGrbFT2KTDRnHutRREHNfd1
 OOfMHmW/bX8Q711uuoY3Yq1gsK2xOPCjq4bIOkZjwags3zKwC/KOvSHM2V7hoSoP
 /iJ52OL+16OJOdEWGwt25dLKx08E6q01EqczOkKhZp4FJFg/SmyQSGkxFBgCEw+s
 Kk6/gBIhelZD3K6j4GAes8887dwDFrPYkVdJwNkd3vNwX7Cg5UFPL0pWQluyMsKU
 gCR/4kxd2rd4gUAx1rk8xhozTcIRvlLbweZxX/jS1FFFxOF5pwP2Wx68tI3/076A
 ==
X-ME-Sender: <xms:ENoMXX09UFveOIfAKVS5RVZk8Uz2_iesQJoi_qZhBYgoZMTp09uEdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeigdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
 ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:ENoMXRCb1JwPzzG-77Cbsp_VlCbYBh-q-VhisoTzA60qfLOgl3iXWA>
 <xmx:ENoMXW7cnqpFU1EmC41lwptpqfbmRQV0al6qc6GC1PUzefXluL72fQ>
 <xmx:ENoMXSKz5Pd_dHoOv3T1BAX5C0IGPiz_B2AYf-oNbHBuEMUeab3Eyg>
 <xmx:ENoMXaq1XSLf09y7XYjmf-SAbWq6Mf7h-CHzTHgxNWOFa5EPI6WM_g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id F246B80063;
 Fri, 21 Jun 2019 09:22:23 -0400 (EDT)
Date: Fri, 21 Jun 2019 15:22:22 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190621132222.GB10459@kroah.com>
References: <20190621113357.8264-1-broonie@kernel.org>
 <20190621113357.8264-2-broonie@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621113357.8264-2-broonie@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: dapm: Adapt for debugfs API
	change
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

On Fri, Jun 21, 2019 at 12:33:57PM +0100, Mark Brown wrote:
> Back in ff9fb72bc07705c (debugfs: return error values, not NULL) the
> debugfs APIs were changed to return error pointers rather than NULL
> pointers on error, breaking the error checking in ASoC. Update the
> code to use IS_ERR() and log the codes that are returned as part of
> the error messages.
> 
> Fixes: ff9fb72bc07705c (debugfs: return error values, not NULL)
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  sound/soc/soc-dapm.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 6b44b4a78b8e..f013b24c050a 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2156,23 +2156,25 @@ void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
>  {
>  	struct dentry *d;
>  
> -	if (!parent)
> +	if (!parent || IS_ERR(parent))
>  		return;

How can parent be NULL?

>  
>  	dapm->debugfs_dapm = debugfs_create_dir("dapm", parent);
>  
> -	if (!dapm->debugfs_dapm) {
> +	if (IS_ERR(dapm->debugfs_dapm)) {
>  		dev_warn(dapm->dev,
> -		       "ASoC: Failed to create DAPM debugfs directory\n");
> +			 "ASoC: Failed to create DAPM debugfs directory %ld\n",
> +			 PTR_ERR(dapm->debugfs_dapm));

Same comment as before, no need to print anything.

>  		return;
>  	}
>  
>  	d = debugfs_create_file("bias_level", 0444,
>  				dapm->debugfs_dapm, dapm,
>  				&dapm_bias_fops);
> -	if (!d)
> +	if (IS_ERR(d))
>  		dev_warn(dapm->dev,
> -			 "ASoC: Failed to create bias level debugfs file\n");
> +			 "ASoC: Failed to create bias level debugfs file: %ld\n",
> +			 PTR_ERR(d));

Again, no need to warn, no one will see it :)

I am trying to make it so that debugfs doesn't return anything for when
a file is created.  Now if that will ever be possible or not, I don't
know, but I am pretty close in one of the branches in my driver-core
tree...

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
