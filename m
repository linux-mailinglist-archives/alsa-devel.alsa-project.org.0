Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBDE748FDB
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 23:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFCF3E7;
	Wed,  5 Jul 2023 23:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFCF3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688592779;
	bh=jh5Rm3wTiTgdIPqZurNeEEgGjpGLTPcGzW6ZzoTpIhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pop7mKX8faVgbbjifPO2viRNke0xQgYK5GnHxrDGwRSOOgybfp0FkELd/4Va4waBX
	 C5N8vfFQDsN+PNWZdv0EyK69U0SxkV2+1ULKftwqNYacIQySxbfpiHyLyyivU1xgtb
	 Fynr6cT21nlTIulvPBt2i9j/nO1QwRzht+I3jjUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 358BFF80125; Wed,  5 Jul 2023 23:32:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B86F80124;
	Wed,  5 Jul 2023 23:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94106F80125; Wed,  5 Jul 2023 23:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42CFAF80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 23:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CFAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=LD6EtXLh
Received: from [192.168.1.90] (unknown [188.24.137.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 273C96600B9D;
	Wed,  5 Jul 2023 22:31:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688592715;
	bh=jh5Rm3wTiTgdIPqZurNeEEgGjpGLTPcGzW6ZzoTpIhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LD6EtXLhaVUngxCpx5poLbPut4matVhG+XwQUqULp8UkQfF1eoIoDAjktEXXuqwnS
	 mnDvclWSE74xYYpW/huTSi6XY6OFkcAaVpmoGqIvlR1LTpjXnArGws0l62kI7VZu7L
	 GbdeAQExK92rPRq16jKv4OIfezUrXbBnKS/OHZp0NN2pzGKp+EDLKuOlY+2FupYoBI
	 5bJ+Clv3A0rulATX+dimS2sGos5pUzpK0Glfrj+EyMaSDegmYFSGAD7s0sQm/4Kod7
	 k2aUCB/swKfTaFybg/0FLsAFUWKnH1uiKpBkA9+9sRKoXkvmwVaJMjpR3mj0Yw/HVg
	 Cbrp/4HVHDR3A==
Message-ID: <8a404cb2-ef2d-4df5-1f91-e5562f8204af@collabora.com>
Date: Thu, 6 Jul 2023 00:31:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] ASoC: amd: vangogh: Add support for
 NAU8821/MAX98388 variant
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20230705134341.175889-1-cristian.ciocaltea@collabora.com>
 <20230705134341.175889-4-cristian.ciocaltea@collabora.com>
 <a414b971-381b-4695-9ba4-d2c777bff330@sirena.org.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <a414b971-381b-4695-9ba4-d2c777bff330@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4F76DXKO7AMGCPKEVOUCI3S3LIIHAT77
X-Message-ID-Hash: 4F76DXKO7AMGCPKEVOUCI3S3LIIHAT77
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4F76DXKO7AMGCPKEVOUCI3S3LIIHAT77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/5/23 19:16, Mark Brown wrote:
> On Wed, Jul 05, 2023 at 04:43:41PM +0300, Cristian Ciocaltea wrote:
> 
>> +static int acp5x_max98388_hw_params(struct snd_pcm_substream *substream,
>> +				    struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(rtd->card,
>> +							     ACP5X_MAX98388_DAI_NAME);
>> +	int ret;
>> +
>> +	ret = snd_soc_dai_set_fmt(dai,
>> +				  SND_SOC_DAIFMT_CBS_CFS | SND_SOC_DAIFMT_I2S |
>> +				  SND_SOC_DAIFMT_NB_NF);
>> +	if (ret < 0)
>> +		dev_err(dai->dev, "Failed to set format: %d\n", ret);
>> +
>> +	return ret;
>> +}
> 
> This never varies, why not just set it up statically in the dai_link?

Right, will handle this in v3.

Thanks,
Cristian
