Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9619145D4B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 21:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B74168E;
	Wed, 22 Jan 2020 21:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B74168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579726300;
	bh=eJLVU5k1vJetPESVH/cFlcl6R54M3QQEy3V5H1vznak=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clPNODY/7zl9057toNqNLeNqbTQT13s6z/ZapPozO+8j3svHMW1+guqpG6eqtUNWB
	 z3eHGPHkhptW8yU+EyjKyC1HCCs0EfwBCiDSpGXtvysAzeYjmXsn6RekknCYMuvVkx
	 Zv6Wq5R//f5jOHahfvgOJVDB1vW65tbtIuqTF88Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D6CF80229;
	Wed, 22 Jan 2020 21:49:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E75F8020C; Wed, 22 Jan 2020 21:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36F3F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 21:49:50 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CD3B5A003F;
 Wed, 22 Jan 2020 21:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CD3B5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1579726189; bh=P3Kp39KyT/Pvr8uGRVk6sasIqbfPwA+qafavKi1te/Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vNx/xskWAXeLwGmtwdKeQQIopwF1We1BS2P6cka7AAFbUYD0ze3jUBHkeBHZnECNj
 zvGKO013YwARZXramFQyhBEaiXaMb86sk9Acv6NFlFpYlHgn6tpxspzklVqZxgE98p
 wzmviF8b69LqHbKNuhS0HP45Z2Pc0wVXOvH1abQA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 22 Jan 2020 21:49:40 +0100 (CET)
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200122190752.3081016-1-perex@perex.cz>
 <26ae4dbd-b1b8-c640-0dc0-d8c2bbe666e2@linux.intel.com>
 <20200122202530.GG3833@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <045401f5-8d4c-cdc3-12fb-cf35148411e5@perex.cz>
Date: Wed, 22 Jan 2020 21:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200122202530.GG3833@sirena.org.uk>
Content-Language: en-US
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, Sasha Levin <sashal@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: topology: fix
 soc_tplg_fe_link_create() - link->dobj initialization order
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

Dne 22. 01. 20 v 21:25 Mark Brown napsal(a):
> On Wed, Jan 22, 2020 at 01:28:57PM -0600, Pierre-Louis Bossart wrote:
>> On 1/22/20 1:07 PM, Jaroslav Kysela wrote:
> 
>>> The code which checks the return value for snd_soc_add_dai_link() call
>>> in soc_tplg_fe_link_create() moved the snd_soc_add_dai_link() call before
>>> link->dobj members initialization.
> 
>>> While it does not affect the latest kernels, the old soc-core.c code
>>> in the stable kernels is affected. The snd_soc_add_dai_link() function uses
>>> the link->dobj.type member to check, if the link structure is valid.
> 
>>> Reorder the link->dobj initialization to make things work again.
>>> It's harmless for the recent code (and the structure should be properly
>>> initialized before other calls anyway).
> 
>>> The problem is in stable linux-5.4.y since version 5.4.11 when the
>>> upstream commit 76d270364932 was applied.
> 
>> I am not following. Is this a fix for linux-5.4-y only, or is it needed on
>> Mark's tree? In the latter case, what is broken? We've been using Mark's
>> tree without issues, wondering what we missed?
> 
> He's saying it's a fix for stable but it's just a cleanup and robustness
> improvement in current kernels - when the patch 76d270364932 (ASoC:
> topology: Check return value for snd_soc_add_dai_link()) was backported
> by the bot the bot missed some other context which triggered bugs.

Exactly. It's because the commit 237d19080cd37e1ccf5462e63d8577d713f6da46 
("ASoC: soc-core: remove topology specific operation") removed the link->dobj 
checks, but this commit was not picked to the stable kernels.

The initialization reordering is fine for all kernels (and makes sense), so I 
would like to apply it everywhere.

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
