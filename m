Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81672790C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 09:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2625C3E8;
	Thu,  8 Jun 2023 09:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2625C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686210316;
	bh=we5aCBFoTW+thcKB92wuegRxA5OPMUVdjGvjN3Drdzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UBIoE3eqsD1I78S0rZk2EHaPQUFDNsk2J3iR07AGcjnc6YUPUQF7XgyuVj/MoIfVj
	 qABFpZ/3lLfrZRGsrtgR9IrwOXohNHoQMToPmeS+6pAb7hhsKSKU9mKkaPzfI/jiEz
	 ipqRNU5XNd/Epg22UWnAiHjaHmIGuuyMT5Bsp3xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A0E0F80527; Thu,  8 Jun 2023 09:44:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D70C6F8016C;
	Thu,  8 Jun 2023 09:44:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA07F80199; Thu,  8 Jun 2023 09:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1AA8F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 09:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1AA8F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=gnpJL9sl
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 434F06606F10;
	Thu,  8 Jun 2023 08:44:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686210250;
	bh=we5aCBFoTW+thcKB92wuegRxA5OPMUVdjGvjN3Drdzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gnpJL9sll4ZRnlKzXB9dG5D+jtA/ftb/CXMz+G3t5/Y22veNs2CYOoWpNosf96TEd
	 KIsVkQudbBhM39QnzPNdmUJnWC4vnPBRrgFhyNUJgJ9tYYy3ugxQMV/pxfwP5I0zD1
	 X/HCsIX6vQUqEezDlRJXhvLMltN3KxE1UoWyQ+IomU0Do0Eukh1s5JqDS1Xni2hyjV
	 mXwqz348XwMSArI9sAKHV0r3ttxdx0fEGOyHYhYiPD68MBFehAjbRsWBcBGp3MOA28
	 nV8bMlIrmLtPgEZBlNuF4aI190mM1fMjEIXBtP1diZ/nL0tb2suVgyB9kONKTvpb0r
	 9h7iHc8alahmg==
Message-ID: <b1145f54-17c2-9ae0-517d-c5e89a8086a9@collabora.com>
Date: Thu, 8 Jun 2023 09:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
 <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7BICM2NIP7LZU2KIPPBAZP52NP2ASETI
X-Message-ID-Hash: 7BICM2NIP7LZU2KIPPBAZP52NP2ASETI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BICM2NIP7LZU2KIPPBAZP52NP2ASETI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 08/06/23 06:02, Trevor Wu (吳文良) ha scritto:
> On Wed, 2023-06-07 at 17:57 +0300, Dan Carpenter wrote:
>>   This code triggers a Smatch static checker warning and does sort of
>> look like an error path.
>>
>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:597
>> mt8188_max98390_codec_init() warn: missing error code? 'ret'
>>
>> However, returning 0 is intentional.  Make that explicit.
> 
> Hi Dan,
> 
> There are several similar instances in this file. If using 'return
> ret;' is not recommended, should we update all of them simultaneously?
> 
> For instance, the value of 'ret' at the end of this function should
> also be zero.
> 

I'm already in the process of performing a further cleanup to this file,
will include Dan's patch in my series.

Please hold on (sending today).

Regards,
Angelo

> Thanks,
> Trevor
> 
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>> v2: At first I thought this was an error path but it is a not.
>>
>>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> index bc4b74970a46..5ad8d2a5bbc4 100644
>> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>> @@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct
>> snd_soc_pcm_runtime *rtd)
>>   }
>>   
>>   if (rtd->dai_link->num_codecs <= 2)
>> -return ret;
>> +return 0;
>>   
>>   /* add widgets/controls/dapm for rear speakers */
>>   ret = snd_soc_dapm_new_controls(&card->dapm,
>> mt8188_rear_spk_widgets,
>> -- 
>> 2.39.2
>>


