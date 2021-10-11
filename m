Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43488429578
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05C216AC;
	Mon, 11 Oct 2021 19:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05C216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633972696;
	bh=ueUOlhbZaj30eoCY2UOPjVHrl493ptGrFAtvDurC+TY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NbHhwAfUIXC3IJrVaXH6fne31NGJ+OAVxHYxF02A405P068WJKuHZNjtril3oZ/8r
	 l34soAJeB6XMUwc+pe4wpTfPnvbRa1BgFcDNtUTOa0V0s7k36dcOFBMuBKg/JkgG/R
	 JZV/Fuzhm3msr0T19IctVSReKZLM2Jr08P7f2qX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D889F800C0;
	Mon, 11 Oct 2021 19:17:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDACEF80269; Mon, 11 Oct 2021 19:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6687DF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:16:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C4DE4A003F;
 Mon, 11 Oct 2021 19:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C4DE4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1633972608; bh=QRB5Ou1NGnbNid6JFfjU38Lss1F7V2ixqJfm4FYhiPw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fug/BqNlw3eZvAAw/uX5lfGAXUi44nPGHYrG4qmeeATh2kPPfZbkaQnzADYiZJdzm
 dN0/vLBA2laqK9wQ91k+H418whIm8nHiZDfqZZ5suqFTofU4xR5ENi9EWqQVFBfqSs
 iTc6bj2Od87GNb6vlkXD6CCmpY1XUGXWJZwEk8vA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Oct 2021 19:16:37 +0200 (CEST)
Message-ID: <f7efde11-067d-8822-45fa-7cdbe2d17d93@perex.cz>
Date: Mon, 11 Oct 2021 19:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Content-Language: en-US
To: Diederik de Haas <didi.debian@cknow.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Guido_G=c3=bcnther?=
 <agx@sigxcpu.org>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend>
 <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz> <5069869.zQgEQKRxDW@bagend>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <5069869.zQgEQKRxDW@bagend>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10. 10. 21 12:40, Diederik de Haas wrote:
> On Sunday, 10 October 2021 10:40:09 CEST Jaroslav Kysela wrote:
>>> Unfortunately this change broke multichannel audio on my Rock64 device
>>> running Debian. My Rock64 is connected to my AVR (Pioneer SC-1224) via a
>>> HDMI cable.
>> This looks like an user space configuration problem.
> 
> I have placed ALSA card definitions (I think) from LibreELEC on my system from
> https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Rockchip/
> filesystem/usr/share/alsa/cards

Apparently, the alsa-lib configuration is used in this case.

It seems that there are four sound cards (Analog/HDMI/I2S/SPDIF) created for 
your hardware. The alsa-lib configuration is a bit weird - an obfuscation for 
the simple-card driver use. The simple way to resolve this is to create a 
proper UCM configuration.

If you need further assistance, create an issue for alsa-lib or alsa-ucm-conf 
on github and with an output from the 'alsa-info.sh' script.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
