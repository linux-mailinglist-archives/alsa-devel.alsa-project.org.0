Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368529446FC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBFD36EB;
	Thu,  1 Aug 2024 10:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBFD36EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502192;
	bh=lkx6BQgqONdqFQOIbH/EuQ8hnuW8Il25wmr3Eq2tXco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CzPN1Ajl+p6wA96o3kJX3cDOImspF+e7Vo+Q9xbkhW47gJflhF5JJ5wgVmbgJo4zi
	 v/vS8D4+p3IPvSP75XVrNcWaqjLokwBsjDFtWuTuQ1FyvL76STu23onFNfDgNio9dG
	 f774ig8YsU1r6DVfp9O8pfiCxsZ8nYKWvQPbaSeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4036DF805F4; Thu,  1 Aug 2024 10:49:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA067F80606;
	Thu,  1 Aug 2024 10:49:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625B7F8026A; Thu,  1 Aug 2024 09:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 032A8F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 09:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 032A8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=pMO3uwxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722496642;
	bh=lkx6BQgqONdqFQOIbH/EuQ8hnuW8Il25wmr3Eq2tXco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pMO3uwxzZs+sN12cZxxfKRBkEDfgUws7FD7Yc+UorE4oYcdGaviLFKnMwPN31JZsh
	 +4cqHouiClFMsB/yUv3/aDN5mrAD2C0t8Rxx6hTbq71IOQ+3qZIkdRfZCHvtOyCzqI
	 9uooYBMXQ0joA9Jn/XVaICHrPtc6NuO9UVmaraqlGGuX0kp1AdjKSXwTZGqPyJ6L1F
	 vVQ+Ww0MHkdQZTM/w+JD/IGUJn8+jP1FSG8dXTJAG6DsVTJIX420uUz8aDyrT8er/e
	 xYDJGR/tqKT360JuRgGY70BDryzGWDcfNZcGKIgS3eHJws38X45ok2MyOd92lXwUjZ
	 YPMKN+7LrG6Mg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6EA7C3781139;
	Thu,  1 Aug 2024 07:17:21 +0000 (UTC)
Message-ID: <87ef7ba3-2bf7-4c46-bdf4-801bd2920695@collabora.com>
Date: Thu, 1 Aug 2024 09:17:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: Wojciech Macek <wmacek@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240731212153.921327-1-cujomalainey@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731212153.921327-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7PTRAADXDDDV4SJWHCFBTMPGNDKR5LMF
X-Message-ID-Hash: 7PTRAADXDDDV4SJWHCFBTMPGNDKR5LMF
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PTRAADXDDDV4SJWHCFBTMPGNDKR5LMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 31/07/24 23:21, cujomalainey@chromium.org ha scritto:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> Default firmware shipped in open source are not licensed for 3P
> libraries, therefore topologies should not reference them.
> 
> If a OS wants to use 3P (that they have licensed) then they should use
> the appropriate topology override mechanisms.
> 
> Fixes: 8a7d5d85ed2161 ("ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies")
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Wojciech Macek <wmacek@google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
> index 24ae1d4959be..1c6e035fd313 100644
> --- a/sound/soc/sof/mediatek/mt8195/mt8195.c
> +++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
> @@ -573,7 +573,7 @@ static const struct snd_sof_dsp_ops sof_mt8195_ops = {
>   static struct snd_sof_of_mach sof_mt8195_machs[] = {
>   	{
>   		.compatible = "google,tomato",
> -		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
> +		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682.tplg"
>   	}, {
>   		.compatible = "mediatek,mt8195",
>   		.sof_tplg_filename = "sof-mt8195.tplg"

