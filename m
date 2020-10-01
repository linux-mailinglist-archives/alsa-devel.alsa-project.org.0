Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8E280746
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB5D1AAD;
	Thu,  1 Oct 2020 20:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB5D1AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601578504;
	bh=zSyouXSzbs9cKzFRJcH0AXftiUn4k6ySHEC5MVl7zyo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZR76vOvICA9mKmroBzssig99tKwduWFOHqTvm8TF2m6o9L7GX1tXxZTdIWT4JTNM
	 eHLwL7faS8NpYvFzkfm9Zvv81pS+iNGNvL3lnSjV0eJkV1uUig3web2ZE9umAT18Hc
	 Lo5HWFs5KYaoF0kXH2IG8UufSWc8NLM6dgTKIAZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AB3F80105;
	Thu,  1 Oct 2020 20:53:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1482BF801F5; Thu,  1 Oct 2020 20:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF051F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF051F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="ZUuykW6I"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4C2MhP4nqNz5q;
 Thu,  1 Oct 2020 20:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1601578391; bh=zSyouXSzbs9cKzFRJcH0AXftiUn4k6ySHEC5MVl7zyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZUuykW6IKbiwyU/SF5GlOUOqO1doBpgX/6vHlFQ4nRmPZbu2BNy8lC6+J4SPnZdvJ
 YbvCu6Ybs6Hjzce0qc++aSxSxiQ/CVyD5Ngoz826x3bwSE7EP5kQEgYkXZcp6HUY2V
 +pWzrN5r7iS6lvHfUiViZ+njU6M4JDng8Y4IKRq+LJBjwMsCfoVcmxhQmH+lmNMVWg
 d+qo+59JI92JnBjEPGCaJYA4YjppAsEeIqSDHV9b8gOQ7fQEquUIJb3OrekobpkECK
 04fwNJDbkJShaB2nb67QUQxO4x40vtRWazOHqymzJgaWOy5U350ksIsD/Z2xREVlaA
 kl0K/oYeL5zRw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 1 Oct 2020 20:53:08 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 01/13] ASoC: soc-core: Fix component name_prefix parsing
Message-ID: <20201001185308.GC23339@qmqm.qmqm.pl>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1601573587-15288-2-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, atalambedu@nvidia.com, tiwai@suse.com,
 thierry.reding@gmail.com, rlokhande@nvidia.com, swarren@nvidia.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 nwartikar@nvidia.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, linux-tegra@vger.kernel.org, mkumard@nvidia.com,
 viswanathl@nvidia.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Thu, Oct 01, 2020 at 11:02:55PM +0530, Sameer Pujar wrote:
> The "prefix" can be defined in DAI link node or it can be specified as
> part of the component node itself. Currently "sound-name-prefix" defined
> in a component is not taking effect. Actually the property is not getting
> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
> "prefix" is missing in DAI link Codec node.
[...]
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1124,7 +1124,8 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
>  	for (i = 0; i < card->num_configs; i++) {
>  		struct snd_soc_codec_conf *map = &card->codec_conf[i];
>  
> -		if (snd_soc_is_matching_component(&map->dlc, component)) {
> +		if (snd_soc_is_matching_component(&map->dlc, component) &&
> +		    map->name_prefix) {
>  			component->name_prefix = map->name_prefix;
>  			return;
>  		}

Hi,

It is not obvious how the patch fixes the problem described. I guess now
map->name_prefix is NULL on some level and overrides prefix found earlier?

Best Regards,
Micha³ Miros³aw
