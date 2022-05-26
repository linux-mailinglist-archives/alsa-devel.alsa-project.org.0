Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE5535012
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 15:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA25D1709;
	Thu, 26 May 2022 15:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA25D1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653572209;
	bh=eCL+lz/DTl78RitlPsWn+zYo7CVntKFVBjTAXADe22U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nu8CH0GrZz3kXKPQCx4PmBEyzdqsl+ozyX5uYR30rTWdj77S4C+v7o0BFO9oNnGIL
	 ZFU9rxJa9yo8ZN+g3rKQZMtY8bH6fkVjgh13yLrju4M28Ku8sUgYrni14ene0lfUrw
	 yHUbwQKFm++xg1/ieKN9RO1+uSmJsCEH0hihLQLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 087DBF8027D;
	Thu, 26 May 2022 15:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F49EF8025C; Thu, 26 May 2022 15:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 697D9F80171
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:35:44 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BDAF9A0046;
 Thu, 26 May 2022 15:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BDAF9A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1653572143; bh=dLGgahsDMPTwe5ZYMvO+GM+Fx3PNAynNJASWgoSCbSg=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=FBQmK9Wmm4KmxKkUU21n3EKAEL/ECEJWC81ZvBO2j8F+914SDEcjOSJzQ6COyqjym
 I1FWkmwQb9M9pmcxtxHnkRrruuiIAlGHXjqeVK3OGJCR8k1JPDSB2SEUjRBZcEoHrP
 FlOsSB0Y6/tkeJEf6Qh4yw6aVdJHdFWFJ9mX+9to=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 26 May 2022 15:35:40 +0200 (CEST)
Message-ID: <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
Date: Thu, 26 May 2022 15:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <Yo95YGyUSSBOipM2@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 26. 05. 22 14:58, Takashi Sakamoto wrote:
> Hi,
> 
> On Wed, May 25, 2022 at 08:37:37AM +0200, Jaroslav Kysela wrote:
>> On 25. 05. 22 3:42, Takashi Sakamoto wrote:
>>> Thanks for the suggestion. Indeed, we can choose the way to put
>>> documentation to specific branch in the repository. I've already
>>> investigated the way then had complexed feeling.
>>>
>>> ...To be honest, I'd like to avoid it, as much as possible, in a point
>>> of the essential concept in source control management. The branching
>>> idea forces to put several histories disconnected each other into one
>>> repository. It's surely available technically, however I feel sort of
>>> awkward somehow.
>>>
>>> (I think I'm enough conservative when using tools. I feel something
>>> shooting myself in the foot when doing it. It perhaps comes from my
>>> experience under UNIX-like environment...)
>>>
>>> The separated common repository for documents had room for integration of
>>> documentation. For example, I can put library documentations as well as
>>> overview page for included software such like Rust crates. It's flexible
>>> and logical in a view of top level of software stack.
>>
>> It's fine for me. The gobject-introspection-docs is created now.
> 
> Great. I pushed some documents except for index page:
> 
>   * https://github.com/alsa-project/gobject-introspection-docs
> 
> Later I'd like to use Jekyll backend of github pages[1]. Would I ask you
> to grant my privilege in the repository so that I can add configuration
> for it? I think the same privilege set in libhinawa-docs is enough.

It seems that it's just a configuration file which is stored in the 
repository, so the standard github pages setup should be sufficient.

Anyway, I made you as maintainer of this gobject-introspection-docs repo, so 
you should do more changes in it, if you like.

> Additionally, please archive below old documentation repositories? I've
> already configure them to publish redirect pages. I hear that github
> pages service still publish pages for archived repositories.
> 
>   * https://github.com/alsa-project/libhinawa-docs/
>   * https://github.com/alsa-project/libhitaki-doc/
>   * https://github.com/alsa-project/alsa-gobject-docs/
> 
> And it's helpful to change page URL in 'About' section of right pane.
> (I think it's good to remove it for convenience.)
> 
>   * https://github.com/alsa-project/libhinawa/
> 
> Today I release new releases for libhinawa and libhitaki. Thanks for
> your help.
> 
>   * https://github.com/alsa-project/libhitaki/releases/tag/v0.1.0
>   * https://github.com/alsa-project/libhinawa/releases/tag/2.5.0
> 
> [1] https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
> [2] https://github.com/alsa-project/libhinawa-docs/

I've tried to follow all instructions. If something is missing, please, ping me.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
