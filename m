Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1376FBA7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE563E7;
	Fri,  4 Aug 2023 10:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE563E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691136407;
	bh=/ADLlEkBOshOWtuo7nw3XifPzKql28ntc70tpoOZQJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JkkymwUPapGTLQ94N0FGFdJUWQm/nZ2j1zsER3sWeXnbHLBzqXCCL0KhT3nlMdgUl
	 FCmiiSU//BU9yGH3thOHfKiF3mMim3cLHVfdCGK3Ojm592ysBadkH9/bLb3c7HU2r/
	 m6+SiTp1e8kaf5LaMc42fTMTc/uexOc6HeVEluhg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD9BF80549; Fri,  4 Aug 2023 10:05:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EC9F801D5;
	Fri,  4 Aug 2023 10:05:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3AF8F8025A; Fri,  4 Aug 2023 10:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F10CF80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F10CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FDTVqknY
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso1355607b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691136296; x=1691741096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbV+gYNDujKbJYn2Rz5cAnqQGKoJDHNbW2fLENJYzXY=;
        b=FDTVqknY2GDfTRU6BHkEVEI+YIi8YxR1dTYObLysTNsJ+pi58EstB2nQBKMYV3Kqd4
         KhCHGimKFhUeuWMsHe/GTS00A/q4LlAW5ORHfo5WmYiQ9AGdiF/s9TPCH9GK8s/jVMG+
         LXoIzNW6d/uPxVauzggs3TsNAY4MzVQ0VyREuyM/bd4VIN/QdqnjyhWiNohnED9ZtZS/
         HQ6CRm0RM00k6KHcNbaCsq/blkgraad7p/J3+3bb2d9YTXf1ZkNQCbnxXeZCg5s66FN+
         5VzZIs//1YlYz1Zo1Iq/TnqRW6LFFVeVcXeb0ibBBTTHmqxu9ttKMs/uY6K/x/RvID5r
         pHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691136296; x=1691741096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbV+gYNDujKbJYn2Rz5cAnqQGKoJDHNbW2fLENJYzXY=;
        b=LEZVP/L1icyvlTs7KEGKB4A8kPiUgS3JWa9vfOA32JcMnCIxi40y/qFsOU4Fr6XgJc
         1ggS2wHf5CE0rFcdw5MgXLxCqrdPQqPvp4LcE/y4q6Nhv+Iu/idxpU68NOr57hMgAglQ
         +psZ2vEwQwE6xPul3y16OaAEsc43DH8K9br1OyS4S5f3fHNSpnk5AFPmTmOorNMBDUVR
         R2l2KpeIb1EnzennygL1PS5XzD4/cQOhikIZr2qxemmh93BUCOt2JKYq5vGUYgYFiqzn
         PKvj7rcLbQ9RLVvnMyQkPk/OQejyYzJ20S3UdNsoROtnPc++5vQ+aKoDj1xBSlwq6fY9
         ttuw==
X-Gm-Message-State: AOJu0YybMll0muwoaPI1t1ZTXdh9djboITIWcimrWGmQ4qxMbnIHmDt4
	sAFL7MN2qyrzlpCDRJ9pi9I=
X-Google-Smtp-Source: 
 AGHT+IF+z3baLyPsBoBifRMrSdMiWRiq01bLpw51R9+4NPbdIk8fjEHIm9UHz51UfDkd8oCW8x/gnw==
X-Received: by 2002:a05:6a20:7d8a:b0:132:cd2d:16fd with SMTP id
 v10-20020a056a207d8a00b00132cd2d16fdmr1123760pzj.38.1691136296389;
        Fri, 04 Aug 2023 01:04:56 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id
 u2-20020aa78482000000b00666b3706be6sm1023976pfn.107.2023.08.04.01.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 01:04:55 -0700 (PDT)
Message-ID: <277be798-9bd0-baa0-9e0d-8a7a9ac67f02@gmail.com>
Date: Fri, 4 Aug 2023 17:04:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230802175737.263412-5-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RWBPLOVSRUGGJ2JVR3GXGD2B357PVF6G
X-Message-ID-Hash: RWBPLOVSRUGGJ2JVR3GXGD2B357PVF6G
X-MailFrom: akihiko.odaki@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWBPLOVSRUGGJ2JVR3GXGD2B357PVF6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/08/03 2:57, Alper Nebi Yasak wrote:
> This driver does not properly map jack pins to kcontrols that PulseAudio
> and PipeWire need to handle jack detection events. The RT5682, RT1015
> and RT1015p codecs used here can detect Headphone and Headset Mic
> connections. Expose the former two to userspace as kcontrols.
> 
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
> Should the SND_JACK_LINEOUT be removed from the jack_new_pins calls?

I had patches to remove SND_JACK_LINEOUT and to add separate kcontrols, 
but I forgot them.

Mark Brown has a raised question if the jack is really not driven as a 
line output[1], but I never answered him (sorry for that!) I don't know 
if the hardware is capable, but I think we better to remove it for now 
since the codec driver does not handle it.

Mark, does it sound reasonable?

Regards,
Akihiko Odaki

[1] https://www.spinics.net/lists/alsa-devel/msg147970.html

> 
>   sound/soc/amd/acp3x-rt5682-max9836.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
> index 0543dda75b99..3bf7e1e83c36 100644
> --- a/sound/soc/amd/acp3x-rt5682-max9836.c
> +++ b/sound/soc/amd/acp3x-rt5682-max9836.c
> @@ -28,6 +28,17 @@
>   #define DUAL_CHANNEL		2
>   
>   static struct snd_soc_jack pco_jack;
> +static struct snd_soc_jack_pin pco_jack_pins[] = {
> +	{
> +		.pin = "Headphone Jack",
> +		.mask = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin = "Headset Mic",
> +		.mask = SND_JACK_MICROPHONE,
> +	},
> +};
> +
>   static struct clk *rt5682_dai_wclk;
>   static struct clk *rt5682_dai_bclk;
>   static struct gpio_desc *dmic_sel;
> @@ -86,11 +97,13 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
>   	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
>   	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
>   
> -	ret = snd_soc_card_jack_new(card, "Headset Jack",
> -				SND_JACK_HEADSET | SND_JACK_LINEOUT |
> -				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> -				SND_JACK_BTN_2 | SND_JACK_BTN_3,
> -				&pco_jack);
> +	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
> +					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +					 &pco_jack,
> +					 pco_jack_pins,
> +					 ARRAY_SIZE(pco_jack_pins));
>   	if (ret) {
>   		dev_err(card->dev, "HP jack creation failed %d\n", ret);
>   		return ret;
