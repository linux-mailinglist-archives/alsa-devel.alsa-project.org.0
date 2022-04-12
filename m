Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2F4FDA39
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E081A9F;
	Tue, 12 Apr 2022 12:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E081A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649760543;
	bh=Zy7ybo7a5CfIhcxPjd+Kq4OAOvGM4DXiZzh09TYR2kI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dka54eOmD0O1/G4f4X/qu1O01mtQKQZDuv6V36d6C9uwVEFiWE3XVzA/XsdHeoD+M
	 SzvRdwJSBwxwCpIytKbq36S4s7Ww1xEyVAza7AjLqJAOfScZyq7gvExbK3uhI+BoAq
	 NI5NlqKvMMg3siKwHLfsNOUK2J/9J1soJ/9b97K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2074F80245;
	Tue, 12 Apr 2022 12:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E36F80134; Tue, 12 Apr 2022 12:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E583F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E583F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="j2tKOFrl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iPf6dTS5"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E1C215C0134;
 Tue, 12 Apr 2022 06:47:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 12 Apr 2022 06:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1649760471; x=1649846871; bh=Uu
 Psia8ENL8vM8kfkuzH1mirj3XEjchWDvdFOjW0N1o=; b=j2tKOFrlgEv3nZy6MG
 eszwTYzbdQhzxyXwUpucZu1dUBkt46U8DgtcXKuwYGyubdfEMCXmIXmEOcxM955P
 wm1NKZVbAx3wpp24BNnYIU3kWdUAKBuM94AO/yso7qUM4x4Gay9NcrGyeMLyM+tW
 l3bzg8Z3EhxjAz35GKuoUsAKaAQ0ib4+Z6DSyrnOVuxdzf8TYMTgw5J++VdD9yQw
 eLbEnofT9uZAjvN84RZEztRR22pjwAvcz8MvyUN3siV1U/gDyutpMlavsMeu4QGF
 h5HMsqxb8mI1L7CbFuDfLtgEbrHN09LvPkTpVhWbskwECafZY1S9lU1qvawNsZ+3
 JWrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649760471; x=
 1649846871; bh=UuPsia8ENL8vM8kfkuzH1mirj3XEjchWDvdFOjW0N1o=; b=i
 Pf6dTS5zj5eUuqjjV5giyEqjM2I/DwSQoVVvzEnurX1FhEAx1X+8TLTKdz2cCbbp
 iE130SX9N/Rv27ycShISLRWV7Un3G2tdYF8WLrzR/IOrK3nKul0tTeiJohjt8Q1l
 jxOYYG3oQeLhIAwiQn8+49YX+5Y1bnL0M3BiCQ/hxXVuSZ25Z4sjZQ3xL+AcFBKZ
 M6ICxSWdPabVVXdbmKcEXrqz8tD40LZCjGn614sBYU3ufPRcB3wWQtRW5C4oriRp
 Ph657NsITpTfwWp59lZAGYA/42icYs2bxsp3npu12AXZMATdEN1YrvhbV2hcQVIE
 2oGTBv8xNA5pimqm1/J9g==
X-ME-Sender: <xms:11hVYvjJwNSGNyJwKdIAySaJkDuNM1HSe485y0bmf91wQVR4dR_vhA>
 <xme:11hVYsDqIFT_3jmoZwPH3H8MkMatnJi0PTL3j5attF9pBE0hYACnXPEKJfM5MaJtp
 aXuPqusdWp9hQ9G6j0>
X-ME-Received: <xmr:11hVYvHLTEWTj_8neeiZckVqs_WOEj4IkUctR-7bztvC6IYFGjHL9x_-PGsBqP15kfU-Y2o-DQMRdbgyLaLTjGLieq_IymDd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:11hVYsTH_MV8iwNI5YjfT0OYRLwRr3xjGAeB3NqGR5X2VaEGSvNBVg>
 <xmx:11hVYszqDsUEGYwxZiMiKk8-zleZeZS36HaSQ4ZCgTOmku7WIT2Fqg>
 <xmx:11hVYi7dQyvNi8dj9gozHwKUmDGlLITJJjEKNy6H23TShTmOIJrWJA>
 <xmx:11hVYpqHUzwbGqjUup3GodOXz9qNqnvDYg2tq1XvFgETHF_unKflFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 06:47:50 -0400 (EDT)
Date: Tue, 12 Apr 2022 19:47:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/2] ALSA: core: Add snd_card_free_on_error() helper
Message-ID: <YlVY08C4/maO5s93@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>
References: <20220412093141.8008-1-tiwai@suse.de>
 <20220412093141.8008-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412093141.8008-2-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>
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

Hi,

On Tue, Apr 12, 2022 at 11:31:40AM +0200, Takashi Iwai wrote:
> This is a small helper function to handle the error path more easily
> when an error happens during the probe for the device with the
> device-managed card.  Since devres releases in the reverser order of
> the creations, usually snd_card_free() gets called at the last in the
> probe error path unless it already reached snd_card_register() calls.
> Due to this nature, when a driver expects the resource releases in
> card->private_free, this might be called too lately.
> 
> As a workaround, one should call the probe like:
> 
>  static int __some_probe(...) { // do real probe.... }
> 
>  static int some_probe(...)
>  {
> 	return snd_card_free_on_error(dev, __some_probe(dev, ...));
>  }
> 
> so that the snd_card_free() is called explicitly at the beginning of
> the error path from the probe.
> 
> This function will be used in the upcoming fixes to address the
> regressions by devres usages.
> 
> Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/sound/core.h |  1 +
>  sound/core/init.c    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/sound/core.h b/include/sound/core.h
> index b7e9b58d3c78..6d4cc49584c6 100644
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -284,6 +284,7 @@ int snd_card_disconnect(struct snd_card *card);
>  void snd_card_disconnect_sync(struct snd_card *card);
>  int snd_card_free(struct snd_card *card);
>  int snd_card_free_when_closed(struct snd_card *card);
> +int snd_card_free_on_error(struct device *dev, int ret);
>  void snd_card_set_id(struct snd_card *card, const char *id);
>  int snd_card_register(struct snd_card *card);
>  int snd_card_info_init(void);
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 31ba7024e3ad..726a8353201f 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -209,6 +209,12 @@ static void __snd_card_release(struct device *dev, void *data)
>   * snd_card_register(), the very first devres action to call snd_card_free()
>   * is added automatically.  In that way, the resource disconnection is assured
>   * at first, then released in the expected order.
> + *
> + * If an error happens at the probe before snd_card_register() is called and
> + * there have been other devres resources, you'd need to free the card manually
> + * via snd_card_free() call in the error; otherwise it may lead to UAF due to
> + * devres call orders.  You can use snd_card_free_on_error() helper for
> + * handling it more easily.
>   */
>  int snd_devm_card_new(struct device *parent, int idx, const char *xid,
>  		      struct module *module, size_t extra_size,
> @@ -235,6 +241,28 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
>  }
>  EXPORT_SYMBOL_GPL(snd_devm_card_new);
>  
> +/**
> + * snd_card_free_on_error - a small helper for handling devm probe errors
> + * @dev: the managed device object
> + * @ret: the return code from the probe callback
> + *
> + * This function handles the explicit snd_card_free() call at the error from
> + * the probe callback.  It's just a small helper for simplifying the error
> + * handling with the managed devices.
> + */
> +int snd_card_free_on_error(struct device *dev, int ret)
> +{
> +	struct snd_card *card;
> +
> +	if (!ret)
> +		return 0;
> +	card = devres_find(dev, __snd_card_release, NULL, NULL);
> +	if (card)
> +		snd_card_free(card);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_card_free_on_error);
> +
>  static int snd_card_init(struct snd_card *card, struct device *parent,
>  			 int idx, const char *xid, struct module *module,
>  			 size_t extra_size)
> -- 
> 2.31.1

The idea looks good itself to me. On the other hand, the name
'snd_card_free_on_error()' is not so suitable since it assumes that
'snd_devm_card_new()' is called in advance, while we have another function,
'snd_card_new()'.

I think it better to use 'snd_devm_card_free_on_error()' instead since
the function doesn't work as expected in the case of 'snd_card_new()'
(the snd_card_free() is not called because nothing found in devres).


Regards

Takashi Sakamoto
