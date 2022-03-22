Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8094E451B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 18:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABF2174C;
	Tue, 22 Mar 2022 18:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABF2174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647969998;
	bh=Phg1PAOYHSK72usNjVk6f6jQe9VWkgPG6bHRd8MkuQg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmYjhDfeuc/JKJdeUYPbbEeL3mzH3b2LJ7R+YQBzfQK/Gu+UHk0rIK8ladg4x/jKm
	 gcsNjyPzB1tzAloTcIB40NjRojqGBSJBJeJsGA2qiJwdzICXpJ3Id5YyC1Cy5+rzZa
	 DhRHR65ZU1Cmer0vzGtrtZRftF5WZfverTe5QFv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C37F800FD;
	Tue, 22 Mar 2022 18:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF8FF8016C; Tue, 22 Mar 2022 18:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 519C3F800FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 18:25:23 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 49727A003F;
 Tue, 22 Mar 2022 18:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 49727A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1647969923; bh=RBpnsYg7T7e6HVa/fAvij0CiEIFhpSnI+m8q4ia0igk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=sXqD2FkHUfGBC7IbFZKan5d4Cw9Fopalhc0l1dUWKRBpHQWxsvTk10/Ub/K/CNx/Q
 mf8MeywrL2zxNFMQNWWxmIxyUAp/j2Z1LDVVxkCJAK5S6dAxAUyrpMa72XSuYPpx1P
 zh281dMqlNTQB47ptSWvg87/zHvtV7M65au8XKII=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 22 Mar 2022 18:25:21 +0100 (CET)
Message-ID: <d8df02af-9260-00e9-a5a5-3aa2db372457@perex.cz>
Date: Tue, 22 Mar 2022 18:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: pcm: Add stream lock during PCM reset ioctl
 operations
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220322171325.4355-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220322171325.4355-1-tiwai@suse.de>
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

On 22. 03. 22 18:13, Takashi Iwai wrote:
> snd_pcm_reset() is a non-atomic operation, and it's allowed to run
> during the PCM stream running.  It implies that the manipulation of
> hw_ptr and other parameters might be racy.
> 
> This patch adds the PCM stream lock at appropriate places in
> snd_pcm_*_reset() actions for covering that.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
