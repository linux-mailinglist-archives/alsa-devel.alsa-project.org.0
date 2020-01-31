Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01214E789
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 04:22:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A403B1678;
	Fri, 31 Jan 2020 04:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A403B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580440967;
	bh=0csSxmWTM0vA4Ff8Gip7UmZ15xiFbMWsjhwX7vDnqxo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qn+8FpOjuk1CoZfbWMbs5CMAvSTJkbAZSBHshJFqeAEQQgkRLb5sD084DpjjbYHA6
	 Umpuutj9jGACbkwowwrgbFqYbPO1wI7UuWuKBjyr8so6ArE70/nsvMfRwZYlT0cJdZ
	 d8LwVDbfhpzCsV5SD0Ac5Vsv86c6mvUs5DtMCCiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AD7F80218;
	Fri, 31 Jan 2020 04:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD9AF8021E; Fri, 31 Jan 2020 04:21:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDBCF80143
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 04:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDBCF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="C3B+OFol"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e339d0b0000>; Thu, 30 Jan 2020 19:20:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jan 2020 19:20:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 19:20:58 -0800
Received: from [10.25.73.84] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan
 2020 03:20:55 +0000
To: Oder Chiou <oder_chiou@realtek.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "perex@perex.cz" <perex@perex.cz>
References: <1579501059-27936-1-git-send-email-spujar@nvidia.com>
 <74a42452-f19c-1175-9928-da12ccad621d@nvidia.com>
 <c700f22c-a053-7f39-dddf-41abe52cad77@nvidia.com>
 <67328e51035e4eb5a6a78c3156e5d11f@realtek.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <d99e7cc4-f69b-55a2-a9e9-623ad11d6312@nvidia.com>
Date: Fri, 31 Jan 2020 08:50:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <67328e51035e4eb5a6a78c3156e5d11f@realtek.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580440843; bh=WmI/B6AsuQiNTGM7yM8QllMGfzZ7qHsDpaBdPWuw/4g=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=C3B+OFolt+pEfYtV7JECEFIFpfqBUdvQJKlv4iFaTHkDWjn1amJPzfW4U6Ln/q6W6
 jqjJc/J8JqAnFRCdL5sBWWXVtlkFGqM0f/4m22fo2t+roFd7sndrLQ6RvRxOZB2zYy
 tu+1o4+WNdoXA7qBMGWn9doOHZuuUa3vpunL1viukXUwMxBhwLSF8namDJ/1ZtyxyS
 w+fT7CTV5Yc8BPH7L1m1n9yRY26hDzjLEfjR6msgFW0RRHkhH12SAVs6VkKr53uuJj
 eA19eHOoVMioZG8f2YuBgQvQ74iUYRX+X7QuUWm5inwcXoRyYYHXjLYrgAjUrRn3d+
 pEUdMMhOk9rxQ==
Cc: spujar@nvidia.com,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5659: add S32_LE format
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/30/2020 10:00 AM, Oder Chiou wrote:
> External email: Use caution opening links or attachments
>
>
> Acked-by: Oder Chiou <oder_chiou@realtek.com>

Request maintainers to consider this patch for approval. Thanks in advance.

. . .
>>>> ALC5659 supports maximum data length of 24-bit. Currently driver
>>>> supports
>>>> S24_LE which is a 32-bit container with valid data in [23:0] and 0s
>>>> in MSB.
>>>> S24_3LE is not commonly used and is hard to find audio streams with this
>>>> format. Also many SoC HW do not support S24_LE and S32_LE is used in
>>>> general. The 24-bit data can be represented in S32_LE [31:8] and 0s are
>>>> padded in LSB.
>>>>
>>>> This patch adds S32_LE to ALC5659 driver and data length for this is set
>>>> to 24 as per codec's maximum data length support. This helps to play
>>>> 24-bit audio, packed in S32_LE, on HW which do not support S24_LE.
>>>>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> ---
>>>>    sound/soc/codecs/rt5659.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
>>>> index fc74dd63..f910ddf 100644
>>>> --- a/sound/soc/codecs/rt5659.c
>>>> +++ b/sound/soc/codecs/rt5659.c
>>>> @@ -3339,6 +3339,7 @@ static int rt5659_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>            val_len |= RT5659_I2S_DL_20;
>>>>            break;
>>>>        case 24:
>>>> +    case 32:
>>>>            val_len |= RT5659_I2S_DL_24;
>>>>            break;
>>>>        case 8:
>>>> @@ -3733,7 +3734,8 @@ static int rt5659_resume(struct
>>>> snd_soc_component *component)
>>>>      #define RT5659_STEREO_RATES SNDRV_PCM_RATE_8000_192000
>>>>    #define RT5659_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
>>>> SNDRV_PCM_FMTBIT_S20_3LE | \
>>>> -        SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
>>>> +        SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE | \
>>>> +        SNDRV_PCM_FMTBIT_S8)
>>>>      static const struct snd_soc_dai_ops rt5659_aif_dai_ops = {
>>>>        .hw_params = rt5659_hw_params,
>>
>> ------Please consider the environment before printing this e-mail.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
