Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9935708344
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 15:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0301FC;
	Thu, 18 May 2023 15:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0301FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418070;
	bh=dBmLrtCXELC2ckN+9EW8GQ3HOaehzIulYVtzsSUaKys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=paU7iLhncYhiZO99DB7qQ5QPhYoVH9DIu9TN7jSFkUHhJTkakEd3LcZ7r3h2FDrPO
	 JQDHbcDvOnPkDQe+p2E98UX0cRANlZ7UFJNsaN/UpoN1k4MH1k8cB/ugUNIXAC7kFY
	 w9RHupxTagTJP7Sixhz1nt79dBXHCThnIqRbd86s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B058F8016D; Thu, 18 May 2023 15:53:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABB1F8016D;
	Thu, 18 May 2023 15:53:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6442CF80272; Thu, 18 May 2023 15:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69543F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 15:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69543F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256
 header.s=dkim header.b=YFjVINfx
Received: from [10.0.0.182] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 757FB1606D6;
	Thu, 18 May 2023 15:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1684418006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOj9DkEAsffGRvIc8YyAR4RG7FpCib/7HWlSzpx9EZ0=;
	b=YFjVINfxoE+aBlp4VV2kbChSgiAOoB9PyHhWF4UAUAIP+rTmMSIcyV37JXpc1mbRMBd6iS
	Plj0O1o2aM+3+O8m2K/S9QUzccpMUxkQU44Cy95o6K1Akw+HsQnFuVLPMdMXzP7vqclMTm
	zh7U2tA0JCiTyYNQOTOo9u/H/zPuqXE=
Message-ID: <2ae4d22c-b278-e21f-bccc-f8a1757dcf3b@ixit.cz>
Date: Thu, 18 May 2023 15:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from
 Headphone pin name
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, nfraprado@collabora.com, wenst@chromium.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
From: David <david@ixit.cz>
In-Reply-To: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G7IRPEM7G7GAVZYKKMVB4MNB7DZV3U5X
X-Message-ID-Hash: G7IRPEM7G7GAVZYKKMVB4MNB7DZV3U5X
X-MailFrom: david@ixit.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7IRPEM7G7GAVZYKKMVB4MNB7DZV3U5X/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: David Heidelberg <david@ixit.cz>

On 17/05/2023 17:15, AngeloGioacchino Del Regno wrote:
> Function jack_kctl_name_gen() will remove the redundant " Jack" from
> the name, if present, and then it will add it back, so that all of
> the controls are named "(pin-name) Jack".
>
> Remove " Jack" from the Headphone pin name to spare some CPU cycles.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> index 5e163e23a207..4e0d5bf12b47 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> @@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
>   /* Headset jack detection DAPM pins */
>   static struct snd_soc_jack_pin mt8192_jack_pins[] = {
>   	{
> -		.pin = "Headphone Jack",
> +		.pin = "Headphone",
>   		.mask = SND_JACK_HEADPHONE,
>   	},
>   	{
