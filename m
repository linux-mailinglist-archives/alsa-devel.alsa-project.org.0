Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A743653B672
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35B17171F;
	Thu,  2 Jun 2022 11:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35B17171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654163934;
	bh=kpPaX56lBf+tIZIINHZDwzyp1intuK3GC0SG9H695Ts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jh+9k2eZwTKM+VrYYF+0cYqvPR4Rx0oWEQW/pa8LvIMLT21E2CEs5MU5PBiNE8WeS
	 Llcfw/z6nUUaIhJa9Pk9bmiHFu/Bs5zBbPFLosUCGhRV3fDNj/w1P6wW/gaS2xcrWH
	 t8nsWLQCA2JSLmQGWyP81LZHiji8P71UJbFGQf0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD8A6F8025E;
	Thu,  2 Jun 2022 11:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00E78F80236; Thu,  2 Jun 2022 11:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83FD6F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FD6F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="bzvD3rvb"
Received: from [192.168.0.109] (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 988393F179; 
 Thu,  2 Jun 2022 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654163869;
 bh=HtrcoL/sKxjjV2joBvDu6fwrt5cBv84TcnLB377r1lM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=bzvD3rvbvl1XyhamF052b5eTpXlyN9dV78FKMWi4UkRIuArS7ywE+OMnMYGtDnUtl
 +x9uIvgIT1rkPOvvA+coHiDPbEYidsfDk4N/AYcno0PPuem5cuOvkKnuiNIZnCFP4v
 0WTopmDbQb3CLu5QjggGDeHQiR6z4cF/9ZSH8FL4eTyDV5MXEUw6NRK0caTviKqSvz
 KScLzcsykoM9oLs0EwpxalzgoXcxaYNh3Qszhc64lvSSi+qfwRcHgnoGrIfoslWRtT
 oVKgI4+9lFanVtf9MXS2tSQAHcXTgiZa+cdqvyn21F13+6OhF4xr1gyo0IBd0BVHa7
 NxxdmW/OD5pNg==
Message-ID: <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
Date: Thu, 2 Jun 2022 17:57:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off and
 on
Content-Language: en-US
To: David Lin <ctlin0.linux@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, ctlin0@nuvoton.com
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


On 6/2/22 17:24, David Lin wrote:
> On 2022/5/30 下午 12:01, Hui Wang wrote:
>> We tried to enable the audio on an imx6sx EVB with the codec nau8822,
>> after setting the internal PLL fractional parameters, the audio still
>> couldn't work and the there was no sdma irq at all.
>>
>>
<snip>
>> +#define NAU8822_PLL_EN_MASK (0x1 << 5)
>> +#define NAU8822_PLL_ON                (0x1 << 5)
>> +#define NAU8822_PLL_OFF                (0x0 << 5)
>>     /* NAU8822_REG_AUDIO_INTERFACE (0x4) */
>>   #define NAU8822_AIFMT_MASK            (0x3 << 3)
>
> Sorry, reply late.
>
> From our internal discussion, the revise seems to it is redundant 
> operation. The reason is driver set the PLL as a dapm supply node and 
> consider PLL on/off from dapm route.
>
> So when the playback/recording starts, the PLL parameters from Reg 
> 0x25~0x27 will be always set before Reg 0x1[5] power enable 
> bit(PLLEN). When the playback/recording stops, the PLLEN will be 
> disabled.
Thanks for your comment. But it is weird, it doesn't work like you said, 
probably need specific route setting in the machine driver level?
