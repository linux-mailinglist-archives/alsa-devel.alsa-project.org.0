Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22E35B008
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 21:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D4E166B;
	Sat, 10 Apr 2021 21:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D4E166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618081989;
	bh=MdLjz8cq8x7vkV1Ogqf4StjNrzVgNkSAO3mU4kmT/OM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtkaMYlMJ3dh8raGwtgHw8u5HEsrA+3vFdEIsRI6tSE+JJBOu/Cka4CO3GoBHBL98
	 41EjVBS2fYbiyOfbHacCi2au3QNaMxlfRPTvpbUMzB2+Uki5LUudZnrGj5t6jqJGfd
	 Hr7NyigDdGJixjPfrym7JQq9x/8VfKp6oWqBJgbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B3ABF800EE;
	Sat, 10 Apr 2021 21:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49EF7F8020B; Sat, 10 Apr 2021 21:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AE26F800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 21:11:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 64D09A003F;
 Sat, 10 Apr 2021 21:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 64D09A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618081891; bh=1kuiM71k/TrgC3zpcld38xi3USoTW8tLs/CwqkSpvNM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=4waNonvL7DW8bs/NiRAIq8XKOfdV5GxR1dBpjvJhCvbSzFcxujnvVHyNQ8KV68VN3
 wwIjic4m7oTj9YO0g97ExWuxgRfoUjRr0vC43Huq/bpV5bKUlRyxHf7XfYU+NSqFag
 XJhUQ1O5Lsd5qMhE7ShocTYmdFQVLytpMXh+xVoQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 10 Apr 2021 21:11:22 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: ALSA development <alsa-devel@alsa-project.org>
References: <20210408094314.1322802-1-perex@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f465d2a0-dc01-9e66-7e38-8419842d993b@perex.cz>
Date: Sat, 10 Apr 2021 21:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408094314.1322802-1-perex@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 08. 04. 21 v 11:43 Jaroslav Kysela napsal(a):
> There are several strings which are describing the card. As time goes,
> we have new universal drivers which probe components in a way, which
> is disassociated from the card structure (ASoC). Also, some drivers
> may require to select another firmware depending on the specific
> platform using udev. The new firmware may change the sound card behaviour.
> 
> This patch allows flexible modifications of the card description
> from the user space to handle the specific boot / plug-in settings.

The original discussion went to different forks, but I'd like summarize some
points:

1) those runtime changes may be intrusive
2) even if we allow to change those strings, we should preserve the original
3) generate change events

I hope that we all see the flexibility to change those strings via udev. The
nice thing is that we can write to those sysfs attributes before the _control
device file_ is created by udev (thus we are pretty sure, that no applications
are using this information (if I omit the additional proc and sysfs resources).

It seems to me, that we may just add a policy how to handle those card
identification changes. This policy may be controlled using a module parameter
(runtime), kernel configuration option (compiled default). The policies will
be 'allow changes' and 'disallow changes' so distributions or users may be
forced to explicitly enable this behaviour. When all sysfs changes are
finished, the udev rules may just set "do not allow other changes" via an
additional sysfs sound card attribute (write once) to prevent user errors. Or
we may apply the 'write once' mechanism for all strings separately. We should
disallow to change the card identification after this point.

Regarding the original value preservation - the udev can save the original
strings to it's device environment variables for the later usage. We may
handle this in the kernel. but I see the code reduction with this idea and the
use will be rate (alsa-info script may be extended to extract this info from
the udev database).

The change events are not necessary with this policy. The card identification
is supposed to be changed only via udev before any application is active.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
