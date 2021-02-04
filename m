Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310430FBEE
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 19:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8263165E;
	Thu,  4 Feb 2021 19:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8263165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612464684;
	bh=PERNKqP3xyU17H9dngRkVdvoveGuqfHh43hEpGBVsTc=;
	h=Date:Subject:To:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TV/aK9mFAvQ/1yI3inJJ2TyY93iMw1fyfIQVfJ/pw9obfXpnd5Ph25NkXH1pjlw94
	 aWymRuV/pd3HeXNK/nq1Dr1l5B0A4U4aXCHOl6Oyj2qmsTLXkD2k6je3/nAKbPrSyK
	 HhbwPtq8QTfQgTPhKivPCAIRBSIwe+sjr1LgSZMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0267EF801F7;
	Thu,  4 Feb 2021 19:49:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85AD1F80171; Thu,  4 Feb 2021 19:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85784F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 19:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85784F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="BNokGwe+"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210204184942euoutp025efec5240a7b277910ff7f208ffa9b19~gn-6WxpLw0636006360euoutp02o
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 18:49:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210204184942euoutp025efec5240a7b277910ff7f208ffa9b19~gn-6WxpLw0636006360euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612464582;
 bh=wH+MwNpTr7oYcZ0xHHYd52OT1ll3Vch+G7dRTSp+KgY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=BNokGwe+AsErgR5iMopkPQAOSiCewufXxZoU0L9mciQ2ohsn9CXyHDmbQSHfejwCD
 cZQyPiWFPpqs0Dp5dK5iZ7dbcWMtpAqe2RM1rfaHQ76kSb3AAZgwRXbD+d/iLm5Kbx
 GSh1ekP23pmxZrojIE+wgKTib09ZrnHTaDk4uDyw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210204184942eucas1p1488f15f701f972f4620d508e6181f2b6~gn-6EgchO0320603206eucas1p1U;
 Thu,  4 Feb 2021 18:49:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.79.45488.5C14C106; Thu,  4
 Feb 2021 18:49:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210204184940eucas1p2eef7a2425aeb06584776b0aaa956c722~gn-4-oTYr0449804498eucas1p2L;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210204184940eusmtrp2aa41e1328e6a1720c10664d2c28f63be~gn-4_5doF2361923619eusmtrp2s;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-54-601c41c5d9bc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5D.F6.16282.4C14C106; Thu,  4
 Feb 2021 18:49:40 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210204184940eusmtip1b4b42074430fccd85fe57ae50c6e4094~gn-4ZQplK0753607536eusmtip1U;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
Message-ID: <d5d8ad95-dd45-2959-d84c-c23a452db644@samsung.com>
Date: Thu, 4 Feb 2021 19:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH] drm: bridge: adv7511: Add set_jack handler
Content-Language: en-GB
To: Jun Nie <jun.nie@linaro.org>, john.stultz@linaro.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210119044157.3801598-1-jun.nie@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87pHHWUSDNbNtbLoPXeSyeLKxUNM
 Fk0db1ktmlqnMFtMffiEzeLK1/dsFmd+61osefKQ3eLV4V2MFq17j7A7cHls+NzE5vHqqqPH
 5b5eJo9NqzrZPO5c28Pmsf3bA1aP+93HmTy+nZnIEsARxWWTkpqTWZZapG+XwJWx5vkn9oLr
 AhUPdj5mamBcz9vFyMkhIWAicWjaa8YuRi4OIYEVjBIPPp9hhXC+MEpMPb+BBcL5zCixecZk
 VpiW9q3XoBLLGSUWzVvIBuG8Z5T4de4aI0gVr4CdxJbVPUwgNouAikTj6WksEHFBiZMzn4DZ
 ogIJEhs6N4PVCAvYS5x4tgVsA7OAuETTl5VgtoiAhcTWU9fYQRYwC1xjlNg0+SdYgk1AU+Lv
 5ptsIDangJXEtMVrWSCa5SWat85mBmmQEGjnlGidNocF4m4XiS2LH0H9ICzx6vgWdghbRuL/
 zvlMEHa9xP0VLVDNHYwSWzfsZIZIWEvcOfcLaBsH0AZNifW79CHCjhJbm4+ygoQlBPgkbrwV
 hLiBT2LStunMEGFeiY42IYhqRYn7Z7dCDRSXWHrhK9sERqVZSMEyC8n7s5B8Mwth7wJGllWM
 4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBCez0v+NfdzCuePVR7xAjEwfjIUYJDmYlEd7E
 NqkEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ry7tq6JFxJITyxJzU5NLUgtgskycXBKNTB1VP1l
 SWeJWDOHY7aXTJS5ke8K/c6f95RyjlgwTH1X57Ot4YiY0o7D3yVP9v5InvT/zpyTuiHXj+Qe
 albKmJr1PLYztMJ1pa2hntSxlJ2ce2R/NMWxTYm6dJD7ycptfw0U5px4fcSuR1ho2v212tZT
 o+48brv8VhiowqEmafuy1R8ZXCysTpzernhzp2afVM3ku4d+V8Vcf/+Jh9lQ/P+nazEzIpfM
 /n/GgDGtOeWC884j3vdKV8yKSf1+gdHqOssM0VOf03Yun35D9tHKPenFV29rdCrUsImwv9RK
 XR/8MHXtzheT2nfvl7v2MOA5b6C66Dl/95t9ZbGuqtNWP1noJ+8R/e7v1d1v97WbvrJRYinO
 SDTUYi4qTgQAa3xzEM8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7pHHGUSDE7+NbboPXeSyeLKxUNM
 Fk0db1ktmlqnMFtMffiEzeLK1/dsFmd+61osefKQ3eLV4V2MFq17j7A7cHls+NzE5vHqqqPH
 5b5eJo9NqzrZPO5c28Pmsf3bA1aP+93HmTy+nZnIEsARpWdTlF9akqqQkV9cYqsUbWhhpGdo
 aaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex5vkn9oLrAhUPdj5mamBcz9vFyMkhIWAi
 0b71GksXIxeHkMBSRolL94+zQSTEJXbPf8sMYQtL/LnWxQZR9JZRYt3tb6wgCV4BO4ktq3uY
 QGwWARWJxtPTWCDighInZz4Bs0UFEiQm978GGyosYC9x4tkWsF5moAVNX1aC2SICFhJbT11j
 B1nALHANaMGfyVDbehkl7s9exQ5SxSagKfF3802wSZwCVhLTFq9lgZhkJtG1tYsRwpaXaN46
 m3kCo9AsJIfMQrJwFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiM2W3Hfm7Z
 wbjy1Ue9Q4xMHIyHGCU4mJVEeBPbpBKEeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4waeSV
 xBuaGZgamphZGphamhkrifOaHFkTLySQnliSmp2aWpBaBNPHxMEp1cDE5/YpuXzRVjMOxfvv
 z9kdapCeu1XOWn7ut5kCaQ/5wl8EC/197rrQ7JZp903R1bNvNB7dfkLf7rXyrbCFRn21ah5P
 nc/u32mcdr9ogvofeTul6lzLHcfz/pzL8dX/qJvrErv3vLdgOoNw67nfGiqzC05cn9vcYfW9
 /0LuTzELy7k67I4xlnu+/XnH27UkbR7b47Yf2244/wt9uPtia7L56RXzrxyS3tDRk8VzOfxn
 w5nlHca/z0V21f00eVgz94D9tBPp0yN6N8+5GFcW9038jn+z3HHBk71K03V5jRj5U7fnCi4X
 e3Ppv9H91L4EjqlxjF0T7La95qzTDjjqwBhQ8Du+z9Rj81J71aAy/UNKLMUZiYZazEXFiQAT
 dkLtYgMAAA==
X-CMS-MailID: 20210204184940eucas1p2eef7a2425aeb06584776b0aaa956c722
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3
References: <CGME20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3@eucas1p2.samsung.com>
 <20210119044157.3801598-1-jun.nie@linaro.org>
Cc: architt@codeaurora.org, kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, broonie@kernel.org, bogdan.togorean@analog.com
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


W dniu 19.01.2021 o 05:41, Jun Nie pisze:
> With commit 55c5cc63ab, the hdmi_codec_set_jack() will report unsupport
> failure if set_jack handler is missing. Add set_jack handler to resolve
> this failure.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 27 ++++++++++++++-----
>   1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index f101dd2819b5..16de1a8ca7a0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -217,22 +217,35 @@ static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>   	return -EINVAL;
>   }
>   
> +static int adv7511_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
> +					    hdmi_codec_plugged_cb fn,
> +					    struct device *codec_dev)
> +{
> +	struct adv7511 *adv7511 = data;
> +	bool plugged = adv7511->connector.status == connector_status_connected;

Maybe some locking, to protect access to adv7511->connector.status.

> +
> +	fn(codec_dev, plugged);
> +	return 0;
> +}
> +
>   static const struct hdmi_codec_ops adv7511_codec_ops = {
>   	.hw_params	= adv7511_hdmi_hw_params,
>   	.audio_shutdown = audio_shutdown,
>   	.audio_startup	= audio_startup,
>   	.get_dai_id	= adv7511_hdmi_i2s_get_dai_id,
> -};
> -
> -static const struct hdmi_codec_pdata codec_data = {
> -	.ops = &adv7511_codec_ops,
> -	.max_i2s_channels = 2,
> -	.i2s = 1,
> -	.spdif = 1,
> +	.hook_plugged_cb = adv7511_hdmi_i2s_hook_plugged_cb,
>   };
>   
>   int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
>   {
> +	struct hdmi_codec_pdata codec_data = {


I think const modifier should be OK here.


Regards

Andrzej


> +		.ops = &adv7511_codec_ops,
> +		.max_i2s_channels = 2,
> +		.i2s = 1,
> +		.spdif = 1,
> +		.data = adv7511,
> +	};
> +
>   	adv7511->audio_pdev = platform_device_register_data(dev,
>   					HDMI_CODEC_DRV_NAME,
>   					PLATFORM_DEVID_AUTO,
