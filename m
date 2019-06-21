Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DD4E934
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 15:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0EC1668;
	Fri, 21 Jun 2019 15:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0EC1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561123935;
	bh=m/1njuqsbNUo3pQ3EVpisoJP6xNi+VhpnK6jfXRoXK4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQC3HGgMbDrQsEjqagj3Ujk70ycJ8ickrfCd5zQ4kULC2Hyy4ZzpcyGMEY8yLl+D7
	 NgRXDL17Q2hD1sAsi8cZ3OljaCdJeUuZm2R14pielxMBMguvs7kbuMGgcxbKiz9J1d
	 0qqSFYrORoe6CY1Lf51iDdx7x+2gD7t/DhUWKyY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C2BF896DF;
	Fri, 21 Jun 2019 15:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB16F896C7; Fri, 21 Jun 2019 15:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=unavailable
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27B79F80059
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 15:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B79F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="Q91/YEzt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iuKedUAq"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D3722216E;
 Fri, 21 Jun 2019 09:20:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 21 Jun 2019 09:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gFw1o09izVXNlusSWNvyOBEz+mi
 9KMY//ltxGghUQDs=; b=Q91/YEztYMQm+78z6+GuAJhJDmqw+tXZBjrhE+jxpfn
 3cftDN0EpiiS+qcFQbr3HhGo0bBuVKMgr16D/wtXgfCxymtENYSy/oYUN1hzx2Cv
 NCW3ytNe5upBVEYAmBfOlKf6p0ZdPwBep0clkMlXenSQ6PkNJ+pkikHxW8EUIrL6
 9HyE/lwuDeJrv2O4JUSbG3pTdajqSYQ6z/ep5EDytQISkbM1dw7uRWtqNBGiAMU2
 rEaNOFI/uvx+q5wbsXCUZTR5vlXmbDkrnLHVKZqfUsclLBMRGdbN7dthty2JUu+W
 2DbWj7x/Md2FZnOBgBbB3QVdfgam1BUEzrLW8cYdffA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gFw1o0
 9izVXNlusSWNvyOBEz+mi9KMY//ltxGghUQDs=; b=iuKedUAq3P0LQXAoJa0CCq
 RiNqsR928oqFfNkHKrl4zoquMx1KwMkF+A2fxSbksGvbHNWcy2ztrSyzu1FZMy84
 sOddy4tXLYHKNQ/rlnSrnO85qMfyF5h1AdRH2/XkaUHpaDoJUItIcuvgBOqG9jbc
 /DWjljeOYvJw9IlpPyeBh8ADITm5LuMva65gUHuSw0V8EsgMZYPtCobmX3dXYRsf
 AhwHphbO2oj/Hp2FdfjW0DdUDnzmGaqmFq49d83sW7o0EMe0occrdXNLhJO5jgmY
 93j58hDUvcoPWOn90Ce5EIqgODBrGoY4XWEaFxwUvQaq6I2gljnjnvJfYZSaUoew
 ==
X-ME-Sender: <xms:qtkMXTCq3f9ydvMFnhF1M-fgENTm0o_zMCZMShgYB-y2ABSAprekZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdeigdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
 ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qtkMXV2DM14tMs85e_MtZ2mQOgsvFU7U6Dx6itGu_nYW96RJy17Mgw>
 <xmx:qtkMXRWGrzLnPIk-ZtbFyfIdCliUDILKhQCodUWgHO2kTkB4EJZNwQ>
 <xmx:qtkMXXmUIvFqa35EwyPVA25vxxRtRx9JrZ8fXYRNb0jARIYY71GqVg>
 <xmx:q9kMXbRNbVbh-jluUxvGRnZ18b5O315JSCnAG4RL2ZF7r5cl-1Ab-A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 897C980060;
 Fri, 21 Jun 2019 09:20:42 -0400 (EDT)
Date: Fri, 21 Jun 2019 15:20:40 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190621132040.GA10459@kroah.com>
References: <20190621113357.8264-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621113357.8264-1-broonie@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: core: Adapt for debugfs API
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

On Fri, Jun 21, 2019 at 12:33:56PM +0100, Mark Brown wrote:
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
>  sound/soc/soc-core.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index c510da2d4af6..6d5c09493f4b 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -165,9 +165,10 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
>  				component->card->debugfs_card_root);
>  	}
>  
> -	if (!component->debugfs_root) {
> +	if (IS_ERR(component->debugfs_root)) {
>  		dev_warn(component->dev,
> -			"ASoC: Failed to create component debugfs directory\n");
> +			"ASoC: Failed to create component debugfs directory: %ld\n",
> +			PTR_ERR(component->debugfs_root));

Why warn on this?  You will _never_ see this message :)

>  		return;
>  	}
>  
> @@ -219,18 +220,21 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
>  
>  	card->debugfs_card_root = debugfs_create_dir(card->name,
>  						     snd_soc_debugfs_root);
> -	if (!card->debugfs_card_root) {
> +	if (IS_ERR(card->debugfs_card_root)) {
>  		dev_warn(card->dev,
> -			 "ASoC: Failed to create card debugfs directory\n");
> +			 "ASoC: Failed to create card debugfs directory: %ld\n",
> +			 PTR_ERR(card->debugfs_card_root));
> +		card->debugfs_card_root = NULL;

Same here.

And keep card->debugfs_card_root to be the error pointer, that way no
further files are created for that directory.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
