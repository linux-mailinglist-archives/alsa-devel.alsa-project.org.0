Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD82133FE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 08:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 342EE16CC;
	Fri,  3 Jul 2020 08:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 342EE16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593757097;
	bh=lFhbFWoDcGZBrHMTP2Zrz7daL6Kx1o1qy/2JAe9aDPw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MF/Ni+qKu0yWXH8roZxMX4QM4TIIwPzJ2BuQTi3ye7KaPWu8h2jvu+gAxXLliKxzV
	 4MOpejinF9B7lzkO33SfYCp01sDhRvW4l442NdZIJiG2gp/kobb9fVKE8WppCE1a6R
	 k1VcBUhvpis3sVOpX/cYNfWsOMdzeC2ZN+zPlZVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C0ABF8020C;
	Fri,  3 Jul 2020 08:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8DCF80217; Fri,  3 Jul 2020 08:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3488F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 08:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3488F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="hno37GfJ"
Received: from [192.168.178.45] (x4dbdad84.dyn.telefonica.de [77.189.173.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id 4ED8617A08BE;
 Fri,  3 Jul 2020 08:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1593756987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0n9Km7xLnrGKEPSr4L7/+Wtf5RIVBC/bzkST4chlVNo=;
 b=hno37GfJPvsZdgRREpn1laAfbdbBab6BD4H6snIatEq9zi2cs2YWS9Ap0DZ5cZjVn2aH5w
 iCL1oN5VwP3h0gKqh6Z3QON15uYXXprccK2HYk94B8uYbJeLosVfqBBjdsY+y9euTYoB7i
 rC5ChTqW+gJrZb83ZsucvezOqTc6JVc=
Subject: Re: How to identify Alsa eLements?
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
 <20200703003420.GA349540@workstation>
From: Tanjeff Moos <tanjeff@cccmz.de>
Message-ID: <00efd9d1-8eef-fb06-d9bf-867ca37e2e74@cccmz.de>
Date: Fri, 3 Jul 2020 08:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703003420.GA349540@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Hi Takashi Sakamoto,


On 03/07/2020 02:34, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, Jul 02, 2020 at 10:05:01PM +0200, Tanjeff Moos wrote:

[...]

>>
>> My questions:
>> 1) Are name and index enough to identify an element?
> 
> In ALSA control core, 'snd_ctl_find_id()' helper function[1] is used to
> find control element set by the given information from userspace
> application. You can see the algorithm supports two cases:
> 
> 1. numid matching
> 2. the combination matching with:
>    * iface
>    * device
>    * subdevice
>    * name
>    * index is within the range of set
> 
> As you know, the numid is not constant between every bootup since it's
> assigned dynamically (see __snd_ctl_add_replace() helper function[2]).
> Thus the way 2 is available in the case to hard-code in userspace
> application.
Thanks for the clarification.

> 
>> 2) How can I obtain the index? The name and numid are shown by 'amixer
>>     contents', for example.
> 

[...]

> 
> Anyway, when using alsa-lib application for the purpose, you should pay
> enough attention to which API is used since alsa-lib includes several
> abstractions of API for control element set in each level:
> 
>   * Lower abstraction (snd_ctl_xxx)
>   * Higher abstraction (snd_hctl_xxx)
>   * Setup control interface (snd_sctl_xxx)
>   * Mixer interface (snd_mixer_xxx)
>     * Simple Mixer interface (snd_mixer_selem_xxx)
I find this quite confusing. If I could change a volume control using 
any of those interfaces, then I don't understand when to use which 
interface. I'm sure that there is good reasoning for each of them, but 
unfortunatly the documentation has very little information about these 
concepts.

Anyway, I will stick to the lower abstraction which serves my needs. In 
the worst case I will do more work than necessary ;-)

> 
> The configuration space of alsa-lib affects Setup control interface
> and Mixer interface. On the other hand, it doesn't affect the
> lower/higher abstraction. The amixer is a kind of application to use
> 'snd_hctl_xxx', 'snd_mixer_xxx', and 'snd_mixer_selem_xxx'.
So the controls offered by CTL/HCTL are determined by the driver? And 
SCTL, MIXER and MIXER_SELEM are influenced by user space config files?

> When you'd like to communicate to kernel land implementation without any
> effects of alsa-lib's configuration space. it's better to use the lower/higher
> abstractions. As long as I've used, 'qashctl' in QasTools[4] is good GUI
> application for this purpose. It's written with Qt5 and seems to be helpful
> for your work in both of GUI programming and control elements handling.
qashctl is indeed very helpful, thank you! As being said, I'll stick to CTL.

Thank you very much for your advice!

  - Tanjeff
