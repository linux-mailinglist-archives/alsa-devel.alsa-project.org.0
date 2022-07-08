Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5F56BD02
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 17:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98422847;
	Fri,  8 Jul 2022 17:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98422847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657295123;
	bh=C9e8etBg/94GadxYv8MdzYOOgITsxTDLOb+J9ydTXUI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tz7/OHT0thWyNhrepAqfgfBpQJe5mFtJb6Is8SG66ko1wKvzR37AZ/egXOinrWtB9
	 67pxGQIw0cZj7PNX/f7U8P3jawOJ+MNp5MK/fGcyiB/mJyw7VFOcaz9i+DNASSd843
	 skvhqXxttp9kmB1rAavMPRAhY0W3n15LpSrglWiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3EE9F804E7;
	Fri,  8 Jul 2022 17:44:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98646F804CF; Fri,  8 Jul 2022 17:44:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2C91F8028B
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 17:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C91F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="bogbx1s1"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B8C85660191B;
 Fri,  8 Jul 2022 16:44:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657295054;
 bh=C9e8etBg/94GadxYv8MdzYOOgITsxTDLOb+J9ydTXUI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bogbx1s19Ny4+aonY/okvHFLJtBHdmRxtkEfd1xOkVJPG/pCRbiXuDyiQZt+3sEpv
 0MP0rJ7WxFIvF6O0LTlWTmpnVQtAcA0pQYxjzyquj3HcBm9CmVi+wOarpRO4oZ1zhv
 h3OnP1zB6fnKVqj2lDInyqfDRRKtqTdG75rQ33ZuAO7DjhxtkX71Zke4XqBfXPf6pk
 /xZK7Y8sm+CRVgvv0ozMkwpUa2cLD/HfuG/HhYHT2TmnB1U2RSxr3qYxkBOzVdT0z1
 /Y6udKRV95q1mMx15ceWrXvR/rsAYvS5abCrFCsGK4WiI/pYTMAZ0K4w8fT0Y/DBhR
 vpasooaBoS8VA==
Message-ID: <ac4179e3-decf-f620-c5c8-5f8ec28fc69f@collabora.com>
Date: Fri, 8 Jul 2022 17:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, Zhongjun Tan <hbut_tan@163.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.c, tiwai@suse.com,
 matthias.bgg@gmail.com, tanzhongjun@coolpad.com, colin.king@intel.com
References: <20220708024651.42999-1-hbut_tan@163.com>
 <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
 <503a71aa95b8e4b75eb7e9e5de03a013f5155036.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <503a71aa95b8e4b75eb7e9e5de03a013f5155036.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Il 08/07/22 12:19, Jiaxin Yu ha scritto:
> On Fri, 2022-07-08 at 10:01 +0200, AngeloGioacchino Del Regno wrote:
>> Il 08/07/22 04:46, Zhongjun Tan ha scritto:
>>> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>>>
>>> Remove condition with no effect
>>>
>>> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
>>> ---
>>>    sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> index db71b032770d..6be6d4f3b585 100644
>>> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct
>>> snd_soc_dapm_widget *w,
>>>    	case SND_SOC_DAPM_PRE_PMU:
>>>    		if (afe_priv->mtkaif_protocol ==
>>> MTKAIF_PROTOCOL_2_CLK_P2)
>>>    			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x39);
>>> -		else if (afe_priv->mtkaif_protocol ==
>>> MTKAIF_PROTOCOL_2)
>>> -			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x31);
>>
>> I think that this needs some clarification from MediaTek: was 0x31 a
>> typo here?
>>
>> Regards,
>> Angelo
>>
> Hi Angelo,
> 
> This patch can be accepted. The 0x31 is not typo, the logic of this
> code is not concise enough.
> 
> Thanks,
> Jiaxin.Yu

Thank you for the clarification. In this case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

> 
>>>    		else
>>>    			regmap_write(afe->regmap, AFE_AUD_PAD_TOP,
>>> 0x31);
>>>    		break;
>>
>>
> 

