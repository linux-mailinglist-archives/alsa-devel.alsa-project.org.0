Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB5669AD7
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 15:46:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06840AB45;
	Fri, 13 Jan 2023 15:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06840AB45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673621201;
	bh=OOpO7rcmHDE5eJICc86n274kB9+T6ASNfsQPC6exYYc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s0+x4LrjofDXxd6jwuY5XynYpm7rHnq//24johSDBPSA0Uuy7+riOepyiEIY7yh5Z
	 MHR8dIyKq+XAhENvxguUWJu7LUKbLv5e1Uhlm2NkFPR4d9zaeiyNYKAMt4LE9FRiWY
	 05twnSM4U7IMXdGGWmZgjUv6jlPp4YX6Ed7TdjPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6FCF8016D;
	Fri, 13 Jan 2023 15:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFB3F802E8; Fri, 13 Jan 2023 15:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F583F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 15:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F583F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=oxH4hwuc
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DFB59A003F;
 Fri, 13 Jan 2023 15:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DFB59A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673621133; bh=MW4KMXeombVYSD+Suet8+ydrU5cpb02IsctRgeT+eMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oxH4hwuc4P4vB1QHOPlx0Symvo9vUeVn2Zed7vI37rm2lL7CL/HD369fKXjHIgMWr
 yVA4MViHGOVut/XK6y9GVLfPontWlCgUgyjsTk2nV3jWZcCla7HuhFsdBwkBVkLepW
 KfgvYm7JmculfAW4owmsjYLE2wq1KVBGY1O5zLok=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 13 Jan 2023 15:45:27 +0100 (CET)
Message-ID: <e0dae3a0-4176-0bc7-42e4-65cf58f265ad@perex.cz>
Date: Fri, 13 Jan 2023 15:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5.10.y] ALSA: pcm: Properly take rwsem lock in
 ctl_elem_read_user/ctl_elem_write_user to prevent UAF
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>
References: <20230113142639.4420-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230113142639.4420-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Clement Lecigne <clecigne@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13. 01. 23 15:26, Takashi Iwai wrote:
> From: Clement Lecigne <clecigne@google.com>
> 
> [ Note: this is a fix that works around the bug equivalently as the
>    two upstream commits:
>     1fa4445f9adf ("ALSA: control - introduce snd_ctl_notify_one() helper")
>     56b88b50565c ("ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF")
>    but in a simpler way to fit with older stable trees -- tiwai ]
> 
> Add missing locking in ctl_elem_read_user/ctl_elem_write_user which can be
> easily triggered and turned into an use-after-free.
> 
> Example code paths with SNDRV_CTL_IOCTL_ELEM_READ:
> 
> 64-bits:
> snd_ctl_ioctl
>    snd_ctl_elem_read_user
>      [takes controls_rwsem]
>      snd_ctl_elem_read [lock properly held, all good]
>      [drops controls_rwsem]
> 
> 32-bits (compat):
> snd_ctl_ioctl_compat
>    snd_ctl_elem_write_read_compat
>      ctl_elem_write_read
>        snd_ctl_elem_read [missing lock, not good]
> 
> CVE-2023-0266 was assigned for this issue.
> 
> Signed-off-by: Clement Lecigne <clecigne@google.com>
> Cc: stable@kernel.org # 5.12 and older
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
