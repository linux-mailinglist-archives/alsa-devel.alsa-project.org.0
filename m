Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A9429922
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 23:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57C1916D2;
	Mon, 11 Oct 2021 23:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57C1916D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633989015;
	bh=CizBxvPT/1Om1GG7WSKVxbCBWyjL6FdlfXPomXbUFLo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=modjEouLIf/CVn9VXOO9g1/HFCv1SxaHLuegzvesE+iftl32T36DiFpM72S5U4Ksf
	 jsrSmQjmJPwGvZX/U6gReZ6ePTITE32CHlF+xZWQ5s03FF6TaYdSySpU/02PSdr4h4
	 IAbPk5NbXK8Afb8isV+nkCA4eUU6E0wK1xijfeEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD8B5F800C0;
	Mon, 11 Oct 2021 23:48:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 903F8F80269; Mon, 11 Oct 2021 23:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2396BF80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 23:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2396BF80104
Received: (Authenticated sender: didi.debian@cknow.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPA id AB6031C0002;
 Mon, 11 Oct 2021 21:48:48 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 11 Oct 2021 23:48:48 +0200
From: didi.debian@cknow.org
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
In-Reply-To: <f7efde11-067d-8822-45fa-7cdbe2d17d93@perex.cz>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend>
 <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz> <5069869.zQgEQKRxDW@bagend>
 <f7efde11-067d-8822-45fa-7cdbe2d17d93@perex.cz>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <97a1c38c48765fb6634de34387e3ce3c@cknow.org>
X-Sender: didi.debian@cknow.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org
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

On 2021-10-11 19:16, Jaroslav Kysela wrote:
> On 10. 10. 21 12:40, Diederik de Haas wrote:
>> On Sunday, 10 October 2021 10:40:09 CEST Jaroslav Kysela wrote:
>>>> Unfortunately this change broke multichannel audio on my Rock64 
>>>> device
>>>> running Debian. My Rock64 is connected to my AVR (Pioneer SC-1224) 
>>>> via a
>>>> HDMI cable.
>>> This looks like an user space configuration problem.
>> 
>> I have placed ALSA card definitions (I think) from LibreELEC on my 
>> system from
>> https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Rockchip/
>> filesystem/usr/share/alsa/cards
> 
> Apparently, the alsa-lib configuration is used in this case.
> 
> It seems that there are four sound cards (Analog/HDMI/I2S/SPDIF)
> created for your hardware. The alsa-lib configuration is a bit weird -
> an obfuscation for the simple-card driver use. The simple way to
> resolve this is to create a proper UCM configuration.
> 
> If you need further assistance, create an issue for alsa-lib or
> alsa-ucm-conf on github and with an output from the 'alsa-info.sh'
> script.

Will do.

FTR: It's now working again for me on a kernel with this patch included:
https://github.com/LibreELEC/LibreELEC.tv/issues/5734#issuecomment-940088156

I have no idea whether this is a proper solution or another 
'workaround', but
it's working for me again :)

Thanks for your help.

Diederik
