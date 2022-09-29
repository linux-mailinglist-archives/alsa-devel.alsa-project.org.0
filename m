Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4B5EF9D9
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 18:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EE615E5;
	Thu, 29 Sep 2022 18:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EE615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664467867;
	bh=Kk1SvwppFOG4f019U7aBgOMC7PQ+wKh15/FG8OwLRh8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2FklWiOju7QLqlIqqQY1by1gDmpA+doXhHrnYE6mabrTIVSH9BCJFhqvn9FFPNfY
	 JcPoCDa8aZ2mYGjKdoEWYsZ/eQIXUXLlJpKjgjd5MbcFa67cOEIcQ6jBBClXOtMh/W
	 m5u9JrK0zs0K1/3igSQ5xTeKk4Agfz+Ad3aSmy9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68704F800AA;
	Thu, 29 Sep 2022 18:10:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E822F800AA; Thu, 29 Sep 2022 18:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC473F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 18:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC473F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="PkBAe8KB"
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 32B0166022BB;
 Thu, 29 Sep 2022 17:09:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664467796;
 bh=Kk1SvwppFOG4f019U7aBgOMC7PQ+wKh15/FG8OwLRh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PkBAe8KBJ5Fz8WOkrwOeG1AfHQE0hSXHkkhgW912BGQEPu1sjpPPptcYY50VcKTcb
 6bFV+gvZey6bj5La2QLuCk9AxortfZZiMM2Fl+yun3d7gZR8ouzmmwFZACl6mJFuaE
 QfjDjg3JXy3rbBCKmnBUbsjyzH3MziNEgtqW2zx9D8ISIpfq+oCJ9IorN+GF9SzDsV
 +n6UImgeAfqxq98mIbg+RU/15fIh9inzHawJzyRY464tmGpRUGhCw4Kn4BFIWdvhTf
 lKcyc0TUIVjsygVJ1ccf7LF1Dvix5dp8Sh/NxBGPs7Y49j2+yu+xc59tVO4eIjXeW0
 nWH4aYqJ2XgNw==
Date: Thu, 29 Sep 2022 12:09:52 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Message-ID: <20220929160952.li4aaaqgog2ouot3@notapiano>
References: <20220929143754.345144-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929143754.345144-1-perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, Sep 29, 2022 at 04:37:54PM +0200, Jaroslav Kysela wrote:
> The driver field in the struct snd_ctl_card_info is a valid
> user space identifier. Actually, many ASoC drivers do not care
> and let to initialize this field using a standard wrapping method.
> Unfortunately, in this way, this field becomes unusable and
> unreadable for the drivers with longer card names. Also,
> there is a possibility to have clashes (driver field has
> only limit of 15 characters).
> 
> This change will print an error when the wrapping is used.
> The developers of the affected drivers should fix the problem.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> v1..v2:
>   - remove the wrong DMI condition per Mark's review
> ---
>  sound/soc/soc-core.c | 37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e824ff1a9fc0..590143ebf6df 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1840,21 +1840,22 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>  	}
>  }
>  
> -#define soc_setup_card_name(name, name1, name2, norm)		\
> -	__soc_setup_card_name(name, sizeof(name), name1, name2, norm)
> -static void __soc_setup_card_name(char *name, int len,
> -				  const char *name1, const char *name2,
> -				  int normalization)
> +#define soc_setup_card_name(card, name, name1, name2) \
> +	__soc_setup_card_name(card, name, sizeof(name), name1, name2)
> +static void __soc_setup_card_name(struct snd_soc_card *card,
> +				  char *name, int len,
> +				  const char *name1, const char *name2)
>  {
> +	const char *src = name1 ? name1 : name2;
>  	int i;
>  
> -	snprintf(name, len, "%s", name1 ? name1 : name2);
> +	snprintf(name, len, "%s", src);
>  
> -	if (!normalization)
> +	if (name != card->snd_card->driver)
>  		return;

The changes do more than the commit message implies by also reworking the need
for the normalization flag, and now that you're special casing most of the
function based on a particular pointer, I wonder if splitting the below logic to
a separate function would make more sense.

In any case,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

>  
>  	/*
> -	 * Name normalization
> +	 * Name normalization (driver field)
>  	 *
>  	 * The driver name is somewhat special, as it's used as a key for
>  	 * searches in the user-space.
> @@ -1874,6 +1875,14 @@ static void __soc_setup_card_name(char *name, int len,
>  			break;
>  		}
>  	}
> +
> +	/*
> +	 * The driver field should contain a valid string from the user view.
> +	 * The wrapping usually does not work so well here. Set a smaller string
> +	 * in the specific ASoC driver.
> +	 */
> +	if (strlen(src) > len - 1)
> +		dev_err(card->dev, "ASoC: driver name too long '%s' -> '%s'\n", src, name);
>  }
>  
>  static void soc_cleanup_card_resources(struct snd_soc_card *card)
> @@ -2041,12 +2050,12 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  	/* try to set some sane longname if DMI is available */
>  	snd_soc_set_dmi_name(card, NULL);
>  
> -	soc_setup_card_name(card->snd_card->shortname,
> -			    card->name, NULL, 0);
> -	soc_setup_card_name(card->snd_card->longname,
> -			    card->long_name, card->name, 0);
> -	soc_setup_card_name(card->snd_card->driver,
> -			    card->driver_name, card->name, 1);
> +	soc_setup_card_name(card, card->snd_card->shortname,
> +			    card->name, NULL);
> +	soc_setup_card_name(card, card->snd_card->longname,
> +			    card->long_name, card->name);
> +	soc_setup_card_name(card, card->snd_card->driver,
> +			    card->driver_name, card->name);
>  
>  	if (card->components) {
>  		/* the current implementation of snd_component_add() accepts */
> -- 
> 2.35.3
> 
