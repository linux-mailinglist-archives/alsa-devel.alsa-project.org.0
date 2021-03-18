Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45633340B96
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 18:19:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84AB01694;
	Thu, 18 Mar 2021 18:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84AB01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616087982;
	bh=B+9fwGpvJRio6grffaAKtkyKZ/eFySixZB3kG+HmN3k=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hm0rN36/CEB2J1s0+x9ySRvA3bLy5QEJT113IK75824x9OluyfltzEUPMniU+drNK
	 0aYE/G60xisDuHNJDgg5OH+U3y5DcKRZzKmCaxZel3syDwN850+k00M1Syfu8B2pof
	 tWnNje2poVflgFBrLkCSGLz+abRDHrBmdmcrpqYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81BB8F800C8;
	Thu, 18 Mar 2021 18:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D973F80165; Thu, 18 Mar 2021 18:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 278DCF80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 18:17:58 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4AA23A0042;
 Thu, 18 Mar 2021 18:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4AA23A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616087878; bh=0pxK5IkDVC4E+ICB2zfrZqaGgvtJMfFig3p0W03ejto=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=vjAFiyL2D1uci+LIcMm2a38OWOeLemdeAJ8NIqXNXHSpk2hLnKev3w1HNonpEAt2r
 KMs0BhqPM8BVtHFHnZGyCKQpkvh3F5svzjGYXdCaVpJdvY2QX+ktvRCsghz328Czby
 QMxbRF5BMrcwffVdzm8OeVFKFP3dzxsN6r8YibsQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 18 Mar 2021 18:17:54 +0100 (CET)
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
To: tiwai@suse.de, tanjeff@cccmz.de, alsa-devel@alsa-project.org,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
 <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
 <20210318163715.GA273829@workstation> <20210318165634.GA277809@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4629d814-4f45-5b8f-4853-ddf32f040cb8@perex.cz>
Date: Thu, 18 Mar 2021 18:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318165634.GA277809@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Dne 18. 03. 21 v 17:56 Takashi Sakamoto napsal(a):
> On Fri, Mar 19, 2021 at 01:37:15AM +0900, Takashi Sakamoto wrote:
>> As I described, your old implementation is not acceptable just by renaming.
>> Although the idea of inline definitions is itself preferable. I suspect whether
>> inline definition for your comparison algorithm is really less overhead than
>> function call.
>>
>> Anyway I'll post revised version of patchset later.
> 
> Oops. These APIs have arguments with opaque pointers. In the case,
> inline definition is not available since the layout of structure underlying
> the pointer is not available for userspace applications. Thus the rest of
> issue is whether to use 'tuple' or 'fields' in the name of new API.
> 
> In my opinion, 'fields' is generic expression and could give impression to
> application developers that it includes numid field as well. On the other
> hand, 'tuple' is weak expression somehow and the developers easily find
> its meaning in alsa-lib documentation (see line 80). When considering about
> helpfulness to developers, 'tuple' seems to be better than 'fields'.

With this logic, we can just create snd_ctl_id_compare1, snd_ctl_id_compare2
functions to force developers to go to the docs.

Perhaps, snd_ctl_id_compare_full() may be better. Tuple is a generic set of
fields, so there's no change. Again, I don't expect to add other comparison
functions soon.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
