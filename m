Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CB52728B
	for <lists+alsa-devel@lfdr.de>; Sat, 14 May 2022 17:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3431718;
	Sat, 14 May 2022 17:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3431718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652541729;
	bh=OmN52EO4vRkOdenMMbIcS5PlqMEK5v+P6FS3k4jYaB0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIGEJbGtuVhXbow1VCIcTuuSibJclJhTZzkD/aKEuy9s4kJVPR2u3VjUYIt0+k/bn
	 eyQetGyhCLMEkxDBxn7vy9Ns6rZHpvg+Tfs1Gu689nj1I4P5hQhP5i+vDhsxjetYW9
	 NRq2wnAwzmvW07l5xMCYNx2W2uIN3pF7rIA0o6/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE5E5F80166;
	Sat, 14 May 2022 17:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C328F80163; Sat, 14 May 2022 17:21:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-m121145.qiye.163.com (mail-m121145.qiye.163.com
 [115.236.121.145])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C1CF80141
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 17:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C1CF80141
Received: from [192.168.3.48] (unknown [220.250.45.22])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id E939880017B;
 Sat, 14 May 2022 23:20:42 +0800 (CST)
Message-ID: <7ff0ed31-6326-9dc8-6003-0aab8370ad0d@rock-chips.com>
Date: Sat, 14 May 2022 23:20:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Add option for ELD bypass
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>
References: <20220430134006.v2.1.Ide2a04ad0c123cc6990a63632e6f9bb7d7f9be13@changeid>
 <20220503083852.be2aihvkd3gestdw@houat> <YnGUHcFOYrvcA2Ol@sirena.org.uk>
From: sugar zhang <sugar.zhang@rock-chips.com>
In-Reply-To: <YnGUHcFOYrvcA2Ol@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlJTU5WSElJGU9PH0tKHk
 xIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITk9VS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nk06Kxw6Sj05TU0JSzJLFwo8
 HilPCRJVSlVKTU5JTk9KTU9IT0JJVTMWGhIXVQgOHBoJVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZSUlLVUlOS1VPTlVJSVlXWQgBWUFIQkhONwY+
X-HM-Tid: 0a80c32859c3b03akuuue939880017b
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
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

Hi Mark, Maxime,

在 2022/5/4 4:44, Mark Brown 写道:
> On Tue, May 03, 2022 at 10:38:52AM +0200, Maxime Ripard wrote:
>
>> I think some more documentation is needed there to describe how it's
>> going to be used.
>>
>> Like, you mention that it's relevant when the EDID is not valid. But if
>> the EDID is valid, is bypass still allowed or not?
> I'd expect so given that it's explicitly an override and that it's not
> like it's unknown for people to put nonsense in ID information.
>
>>> +static int hdmi_codec_eld_bypass_put(struct snd_kcontrol *kcontrol,
>>> +				     struct snd_ctl_elem_value *ucontrol)
>>> +{
>>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>>> +	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
>>> +
>>> +	if (hcp->eld_bypass == ucontrol->value.integer.value[0])
>>> +		return 0;
>>> +
>>> +	hcp->eld_bypass = ucontrol->value.integer.value[0];
>>> +
>>> +	return 1;
>>> +}
>> If the ELD bypass is set, how does it affect the hdmi_codec_params being
>> passed to the codec?
> Presumably we should tell the CODEC what we're trying to play (looks
> like that's what the current code does)?
>
>> Also, what is being returned to the userspace by hdmi_eld_ctl_get once
>> the bypass is enabled?
> My first thought would be that we'd always read whatever is there
> rather than trying to make something up, bypass just says we're not
> enforcing it.
>
>> And shouldn't we call get_eld when we remove the bypass?
> Or given what I just said above should we not change any get_eld() calls
> but instead only change things so that we don't look at the ELD data
> when setting constraints during startup() and during channel map
> operations?  In that case we wouldn't need to read again.

I agree this idea that just don't use it for constraints and channel map 
or something else.

but still do get_eld() as it was. will do in v3.


-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.

