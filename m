Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E66729153
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 09:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBF074C;
	Fri,  9 Jun 2023 09:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBF074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686296341;
	bh=nv3+VZ+nnLOqcVjviYsmHpsvTnWxCSfjsc5IBhYXT1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rcohgS+rMjZqUWTgAA5rsVXeI9dQSJQgOvjQvL9C8goyB742ATiAGjZ6SEthsuGsM
	 fdFljW/l8uB0N4QZY+zU2e4RBCBgeQrnxaYSF9mgcN9hA6DES9RENqvkuVLLCDQMsB
	 AYrtg/s9wrJ3FEFJOiF5Ps7iUExG6fuXd5/iDGn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A072F800C8; Fri,  9 Jun 2023 09:37:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D70A6F8016C;
	Fri,  9 Jun 2023 09:37:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91E87F80199; Fri,  9 Jun 2023 09:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97F44F800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 09:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F44F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PCWvFIrz
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A03186606F22;
	Fri,  9 Jun 2023 08:37:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686296257;
	bh=nv3+VZ+nnLOqcVjviYsmHpsvTnWxCSfjsc5IBhYXT1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PCWvFIrzIN+XpN/Vq0x86j0/3TfonqRrg6pxLZyyXg8fwOtMCP2OVRtvGi+r6h6Vy
	 6DMmDVMGSvr8MDzaDlC6yxw4BamffBmaxzQ7KpwzYl841EK1LrPndyyj46LFlrbQrB
	 WySANsG7/gIZJhvKPBFvNHY4+2p795s2EGQCa2S+tC8fg8duHTPrzA6bsnUCoXqZxB
	 +uebjZDx8pOGPRJgdQBT7M4QD7tnxoEktitlUZNln85ZmTA0Ar0eJTeZ9oto9RYXpc
	 vlkfzhIg1GX3NRJmv5yCBIKps1JE2l5asXqihKFvIYIf4VurtKGtVU7xIAJLf6vVRZ
	 CrmFb0jxDODiw==
Message-ID: <1bb65d99-d1dc-7a73-12c0-e7f4cba3525a@collabora.com>
Date: Fri, 9 Jun 2023 09:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack"
 from Headphone pin name"
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230608221050.217968-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230608221050.217968-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VWD7CAFMYYPF7KZ5WT2IUDCU5AL6FFJQ
X-Message-ID-Hash: VWD7CAFMYYPF7KZ5WT2IUDCU5AL6FFJQ
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWD7CAFMYYPF7KZ5WT2IUDCU5AL6FFJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 09/06/23 00:10, Nícolas F. R. A. Prado ha scritto:
> This reverts commit cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f. That
> commit removed the " Jack" suffix with the reasoning that it is
> automatically added to the name of the kcontrol created, which is true,
> but this name is also used to look for the DAPM widget that will be
> toggled when the jack status is updated. Since the widget is still
> called "Headphone Jack" the jack can't link to the widget and the
> following error is shown:
> 
> mt8192_mt6359 sound: ASoC: DAPM unknown pin Headphone
> 
> It is not possible to also rename the headphone DAPM widget because its
> name is used by a switch kcontrol, "Headphone Jack Switch", both to link
> to the headphone widget and to assemble its name. This switch's name is
> referenced in the upstream UCM file, so renaming it would break
> userspace. Since the original commit didn't bring any benefit, besides
> sparing a few CPU cycles, simply revert it.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

That commit is made to bring consistency in naming across MediaTek (with
other) sound card drivers.. I'm not sure whether the right solution would
be to revert this one, or to make a small change in the UCM, counting that
we'd be able to add more shared names around, finally reducing the config
length by sharing actual configurations across various SoCs.

Any opinion?

Thanks,
Angelo

> ---
> 
>   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> index 4e0d5bf12b47..5e163e23a207 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> @@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
>   /* Headset jack detection DAPM pins */
>   static struct snd_soc_jack_pin mt8192_jack_pins[] = {
>   	{
> -		.pin = "Headphone",
> +		.pin = "Headphone Jack",
>   		.mask = SND_JACK_HEADPHONE,
>   	},
>   	{

