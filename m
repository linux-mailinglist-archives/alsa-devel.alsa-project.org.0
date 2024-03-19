Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF987FC89
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 12:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571F82973;
	Tue, 19 Mar 2024 12:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571F82973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710846520;
	bh=bx+YI2AQp129Rzqab3AH8dC/L0agZgWgBAnagtxL3mA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F20xpNGV6kKpyNHUSxclhZB1v1XN5EtVl2URHM+WwGNY2Fz8UzAghFz1NH3O4owNv
	 W+5CC46UcpFh/nD5IEGqxEj8+E7YLlHKRBZH3L6j87tuZdJltKbagFeAJMNhXeo9iU
	 hy2mS5lGYj+zTz+35qCAigsUEFc6uj1rnj2iabnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C158F8058C; Tue, 19 Mar 2024 12:08:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D26EF8057C;
	Tue, 19 Mar 2024 12:08:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C94D5F804E7; Tue, 19 Mar 2024 12:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09005F80088
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 12:07:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09005F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WspEZDj3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710846468;
	bh=bx+YI2AQp129Rzqab3AH8dC/L0agZgWgBAnagtxL3mA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WspEZDj3EovH9wx6pGPopJdpqwby+SuLT7jWnsmDYX3K43ZOFNFMKZTe1yFTTQIlS
	 +wEp0jOn7ksh9SPR1bfBTmtUS1uIy6a477XGxKKWg++WOZHi749qkBtoNbjaomgDSk
	 O/CNvkojwzaDW+04pZAziRXGl1qfo6hMSCUrFNMbAfFHusK6Q0e7U++JYXDzF7Nxxc
	 Ry8M/0rZ3B4IRbb6TL2JE7sQScn7ySBHKpDHZtd2UYy+j1zkmMo4TUHukc+oLMlF6U
	 GmhijalzPROiRWXjsC0CQyYgzFTPg26p3cmu1KJXQJ1FnbLJics0wVkH3+4lZatgYr
	 GklFn93pXjB/Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82FF4378149B;
	Tue, 19 Mar 2024 11:07:47 +0000 (UTC)
Message-ID: <b1cc3856-fd06-4f3a-b7ff-4dabf249b68c@collabora.com>
Date: Tue, 19 Mar 2024 12:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
Content-Language: en-US
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
 Rander Wang <rander.wang@intel.com>, Trevor Wu <trevor.wu@mediatek.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240318183004.3976923-1-cujomalainey@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318183004.3976923-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MCRHCZD4ZVHGLCHVBL45XTWYEE3MCURZ
X-Message-ID-Hash: MCRHCZD4ZVHGLCHVBL45XTWYEE3MCURZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCRHCZD4ZVHGLCHVBL45XTWYEE3MCURZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 18/03/24 19:29, cujomalainey@chromium.org ha scritto:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> Default firmware shipped in open source are not licensed for 3P
> libraries, therefore topologies should not reference them.
> 
> If a OS wants to use 3P (that they have licensed) then they should use
> the appropriate topology override mechanisms.

That's ok, but still needs the sof-mt8195-mt6359-rt1019-rt5682.tplg firmware
in linux-firmware, or this change breaks sound.

Regards,
Angelo

> 
> Fixes: 8a7d5d85ed2161 ("ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies")
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Wojciech Macek <wmacek@google.com>
> ---
>   sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
> index 8ee7ee246344c..f143baf75af60 100644
> --- a/sound/soc/sof/mediatek/mt8195/mt8195.c
> +++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
> @@ -573,7 +573,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
>   static struct snd_sof_of_mach sof_mt8195_machs[] = {
>   	{
>   		.compatible = "google,tomato",
> -		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
> +		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682.tplg"
>   	}, {
>   		.compatible = "mediatek,mt8195",
>   		.sof_tplg_filename = "sof-mt8195.tplg"

