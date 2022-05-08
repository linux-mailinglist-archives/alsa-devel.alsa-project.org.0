Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA251F17C
	for <lists+alsa-devel@lfdr.de>; Sun,  8 May 2022 22:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1602187B;
	Sun,  8 May 2022 22:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1602187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652042137;
	bh=LozBoXn0sbuokdjgEIcC+fyYOgL36DaJNDgraXgE1Os=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzYg58OurQshiKsluzJAcNxxF1CfNOvg+EU9ZM4Dp+3sNWoPYjFQact9m90yVlPo6
	 XIR+/Oq3S60+4fxN3XTxRym7ZgawR6OOMlFz7E1CVJrWtxBFbxYUmmIxU75WNKhs0f
	 +jGAZ770PTIRROiZOwCGg8d1E7waLM43gkEdWezY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC25F800D3;
	Sun,  8 May 2022 22:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E37F8023B; Sun,  8 May 2022 22:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from server.euro-space.net (server.euro-space.net [87.117.250.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CF73F8014C
 for <alsa-devel@alsa-project.org>; Sun,  8 May 2022 22:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF73F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="sukxMNUG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=enKuQ8Lxz3Vmf8dpbbmnpEMeOx7tjLz+buX9syc5yZ4=; b=sukxMNUG1Ojoy7irTnr/sFq6Qx
 hmL+VR8IC1lmHDBuncP/m0KfvOB7QzgcoCs+1vHIOjiXXEOW/++GlPkHM/Ibx+1jHXLFecAT8YlJh
 1q8wxC35N3WxiGqkjB7Er/vW2qRa0syY1VE1o65qbu7tixJTABkuFL02uSz9Xajp5vqroI8mtPumn
 XRy/w8RXBIflyAMN16lz8YPd4nTUI2TqmVYkbem3z7myeN4vKoqtUHwkqx8jbkL1QE4bY+ZKLpi9x
 QrkXBNTqDHcsR9Tovp/cpj1YHPczYKREFsIcfJ4PBgWcrI7RX9qXPO+BN8tKHxbRzGQKNISkCExBj
 lYKP74Sg==;
Received: from dynamic-176-002-223-001.176.2.pool.telefonica.de
 ([176.2.223.1]:38050 helo=localhost.localdomain)
 by server.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <kmarinushkin@birdec.com>) id 1nnnbj-00037D-Py;
 Sun, 08 May 2022 21:34:23 +0100
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness
 flag
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
From: Kirill Marinushkin <kmarinushkin@birdec.com>
Message-ID: <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
Date: Sun, 8 May 2022 22:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: server.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: server.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, chrome-platform@lists.linux.dev,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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

Hello Charles,

In the [PATCH 00/38] of this patch set, you write:

 > 2) Devices behind non-audio buses, SPI just moves bits and doesn't
 > really define an endian for audio data on the bus. Thus it seems the
 > CODEC probably can care about the endian. The only devices that fall
 > into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
 > cros_ec_codec.c (only the AoV).

 From my experience with some PCM codecs by TI, they can not care about the

endianness. For example, in driver [1], if I allow BE format as well, 
and configure

the sound card to use BE, it will not work. I have no sound with BE.

In these cases, the codec HW supports *only* LE. That's why their 
`snd_soc_dai_driver`

structures provide only LE in the `format` field.

If such drivers specify `endianness = 1`, then `soc-core` will extend 
their supported

formats with BE counter-parts, see [2]. AFAIU, it will have the same 
effect, as if the

drivers themselves provided their formats in both LE | BE.


I don't think adding `endianness = 1` to such codecs will work as expected.

Unfortunately, I don't have an easy access to HW today, to confirm or 
disprove

this understanding.


Best regards,

Kirill

---

[1] 
https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/pcm3060.c#L189

[2] 
https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L2540


On 5/4/22 7:08 PM, Charles Keepax wrote:
> Add a comment to make the purpose of the endianness flag on the
> snd_soc_component structure more clear.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   include/sound/soc-component.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 766dc6f009c0b..5a764c3099d3e 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -169,6 +169,15 @@ struct snd_soc_component_driver {
>   	unsigned int idle_bias_on:1;
>   	unsigned int suspend_bias_off:1;
>   	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
> +	/*
> +	 * Indicates that the component does not care about the endianness of
> +	 * PCM audio data and the core will ensure that both LE and BE variants
> +	 * of each used format are present. Typically this is because the
> +	 * component sits behind a bus that abstracts away the endian of the
> +	 * original data, ie. one for which the transmission endian is defined
> +	 * (I2S/SLIMbus/SoundWire), or the concept of endian doesn't exist (PDM,
> +	 * analogue).
> +	 */
>   	unsigned int endianness:1;
>   	unsigned int non_legacy_dai_naming:1;
>   
