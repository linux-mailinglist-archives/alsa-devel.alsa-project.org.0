Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAD55B319
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jun 2022 19:24:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2591631;
	Sun, 26 Jun 2022 19:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2591631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656264273;
	bh=dB3qYCCyEJn1O3Vou1SC4wmZCAwoMipbN+CaUTr6atI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irmFTR84RQzoGBIYs37N6cp69W5Qs2EFQQ1Qb1e2nHdDoWEtaET/8rAvNjnRC1H45
	 bYjV4SqgRxHfQo0TwCVGi+VzqqmWKK6nr03D8h7FjFC/Mr95NHZcIo6Ghwo0u72EMx
	 /6nKqrQNW7MkEPhMrnOxw0ynyw4X2UKbymIb6d/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C780F8023A;
	Sun, 26 Jun 2022 19:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07797F8016B; Sun, 26 Jun 2022 19:23:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4EBF80107
 for <alsa-devel@alsa-project.org>; Sun, 26 Jun 2022 19:23:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90044A003F;
 Sun, 26 Jun 2022 19:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90044A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1656264205; bh=b8/qv8sNSuu8DUScnxPvvAdSsRkPWO7LX+f2uStybl4=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=nATaGoaa6mVaQhvJcrGajsGMdtXUW5iWHf+cjork+HwBjSEW+PeonnmBLlAfkqZ7M
 GqagKeAnS5yl0xHaPDjJVBCN8+aa2HVrWlym9EgNc+MscBMYK1eUAAN4EiLXzTV0H1
 bzFXS774SQpgU4A/Vkq453lIRhMhftXYYTxr/fmA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 26 Jun 2022 19:23:23 +0200 (CEST)
Message-ID: <119caa05-b6ca-ecd0-919f-b6ec8257824b@perex.cz>
Date: Sun, 26 Jun 2022 19:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: attach/detach by mixer class implementation of alsa-lib mixer API
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <YrbxZ2b+3rIdi7Ut@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YrbxZ2b+3rIdi7Ut@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 25. 06. 22 13:28, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> Recent years I'm bothered about unexpected abort of pulseaudio and
> pipewire processes when testing user-defined control element set.
> They aborts at element removal event.
> 
> ```
> pulseaudio: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
> wireplumber: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
> ```
> 
> Would I ask your opinion about the design of alsa-lib mixer API?
> 
> As long as I investigate, these programs seem to have careless coding as
> alsa-lib mixer API application. Both of them attaches an instance of
> snd_mixer_elem_t to an instance of snd_hctl_elem_t by calling
> snd_mixer_elem_attach() when detecting element addition, but never detach
> it even if detecting element removal.
> 
> In the case, the link list (=bag) of mixer API internal never becomes empty.
> It has link entries as much as the number of registered mixer classes which
> attaches snd_mixer_elem_t. Then it hits the assertion.
> 
> I think the design of alsa-lib mixer API demands mixer class implementation
> to detach at element removal which attached at element addition. But I have
> less conviction about it since enough unfamiliar.

Yes, if the REMOVE event is delivered to the mixer class, the reference to the 
associated hctl element should be removed. The assert does the check for this 
consistency.

> I'm glad if receiving your opinion about it.
> 
> I wrote test program for the issued behaviour:
>   - https://gist.github.com/takaswie/8378fe3bc04652d83428694cd7573bc0
> 
> For test, please use sample script in alsa-gobject project:
>   - https://github.com/alsa-project/alsa-gobject/blob/master/samples/ctl
> 
> The patches for pulseaudio/pipewire are prepared:
>   - https://gitlab.freedesktop.org/takaswie/pulseaudio/-/commit/topic/fix-wrong-handling-alsa-ctl-event
>   - https://gitlab.freedesktop.org/takaswie/pipewire/-/commits/topic/fix-wrong-handling-alsa-ctl-event

Your fixes seem correct. Please, create the PA/PW merge request with this 
code. Please add me (@perexg) to your merge message.

Thank you for your work on this.

						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
