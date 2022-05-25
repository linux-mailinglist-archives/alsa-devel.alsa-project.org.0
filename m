Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C675336D0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 08:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78C41669;
	Wed, 25 May 2022 08:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78C41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653460729;
	bh=lfql6zH6rIKoE/VkPmyUmAPT7oRgCyb0h64iapLLHcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbyjnaIf0PLn7LgW5sx5Buy8PZLIdpsLGqrl295oe0zibkHrR+JnaM6cT5mt3P/fb
	 m/Z+DU8nLbx24wv01tk1mjegtPVnGvGOoifuSciQehDne8FxuF75a/AO52Aya3ySoC
	 5vCTM+Z2HYzflYkTYFYZ3vGeV6urrLWu056DwhlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AC9F801EC;
	Wed, 25 May 2022 08:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 245F2F80169; Wed, 25 May 2022 08:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B3F8F800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 08:37:41 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 45F12A0040;
 Wed, 25 May 2022 08:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 45F12A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1653460660; bh=4geO2k9JOuUuxhf4kWR2PCbqmRxSGcRd3MyMtU3Lsro=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=BwyeaZUbMYpOesIvJL3SjuIonrBS/MKndvj4nCOXF3XBpt865V/Msk7tWtQkbcrsh
 AuvMIavUT3LRs9KEMTQTWwE7wk27O1gJ/mc0dc465279hQYtY6fHpZfXYFAmD2RDHq
 W5t8P81sFJSMqWphe+KuKCgWKlq9UQ+w1qsINTOA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 25 May 2022 08:37:37 +0200 (CEST)
Message-ID: <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
Date: Wed, 25 May 2022 08:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <Yo2JcNT9rQ0xw0+Q@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On 25. 05. 22 3:42, Takashi Sakamoto wrote:
> On Tue, May 24, 2022 at 02:36:19PM +0200, Jaroslav Kysela wrote:
>> On 24. 05. 22 13:25, Takashi Sakamoto wrote:
>>> Hi Jaroslav,
>>>
>>> On Thu, May 05, 2022 at 09:49:52PM +0900, Takashi Sakamoto wrote:
>>>> At present I prefer separated pages from source since the pages can be
>>>> generated from the source, however as you say the inclusive way is worth
>>>> to reduce repository maintained by the project. I test the idea later in
>>>> my libhinoko repository. When it looks well, I'll request you for
>>>> configuration change.
>>>
>>> I'd like to fix the issue for the URL of documentation before releasing
>>> libhitaki since I put the URL to configuration for gi-docgen.
>>>
>>> I'm investigating to put the documentation into the same repository
>>> where source is maintained, however I prefer to separate the two into
>>> different repositories. Then I suppose it good to put several
>>> documentations into one repository rather than maintaining them in
>>> different repositories.
>>>
>>> At present, three repositories are maintained for documentations:
>>>
>>> * https://github.com/alsa-project/alsa-gobject-docs
>>> * https://github.com/alsa-project/libhinawa-docs
>>> * https://github.com/alsa-project/libhitaki-doc
>>>
>>> Let us consolidate them in one repository. For example, by referring to
>>> team name:
>>>
>>> * https://github.com/alsa-project/gobject-introspection-docs/
>>>
>>> The documentations are expected to be public under below URL:
>>>
>>> * https://alsa-project.github.io/gobject-introspection-docs/alsa-gobject/
>>> * https://alsa-project.github.io/gobject-introspection-docs/hinawa/
>>> * https://alsa-project.github.io/gobject-introspection-docs/hitaki/
>>>
>>> I'd like to ask your opinion about the idea.
>>
>> Thanks for this idea. I just noted that github allows to specify a branch
>> for the git pages (github.io). Do you think that a 'doc' or 'docs' branch in
>> the separate source repos will be sufficient for your work? It may be more
>> logical than having a common doc repo (logical URLs) and things (source and
>> generated pages) will not mix together.
> 
> Thanks for the suggestion. Indeed, we can choose the way to put
> documentation to specific branch in the repository. I've already
> investigated the way then had complexed feeling.
> 
> ...To be honest, I'd like to avoid it, as much as possible, in a point
> of the essential concept in source control management. The branching
> idea forces to put several histories disconnected each other into one
> repository. It's surely available technically, however I feel sort of
> awkward somehow.
> 
> (I think I'm enough conservative when using tools. I feel something
> shooting myself in the foot when doing it. It perhaps comes from my
> experience under UNIX-like environment...)
> 
> The separated common repository for documents had room for integration of
> documentation. For example, I can put library documentations as well as
> overview page for included software such like Rust crates. It's flexible
> and logical in a view of top level of software stack.

It's fine for me. The gobject-introspection-docs is created now.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
