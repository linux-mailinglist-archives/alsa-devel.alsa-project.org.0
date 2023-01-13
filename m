Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D805D6697A8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 13:45:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7346958AD;
	Fri, 13 Jan 2023 13:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7346958AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673613954;
	bh=BJsIpm0INHcd5+GXaJaQkw/NBbMvloNwWL+a7vEH4Pk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W3PhqaKKWIJpCaedfm5+xaMoDfNAcybBHwCy9S1JTtO0J/cH+FhwEHWywUKMkdElO
	 5a3pYlsbs4Hk+9KfFRhj9m0aR+hOnOjQrgjw+lyE8api4iVJz2nPeGpuK5JnqE7EW6
	 +61wLTpi4/n+3d8tSXlcN2jluFJvlu6methmJ+mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB87CF8019B;
	Fri, 13 Jan 2023 13:44:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA7CEF8030F; Fri, 13 Jan 2023 13:44:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B44F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B44F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=2EgLb8RA
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 78CCAA0040;
 Fri, 13 Jan 2023 13:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 78CCAA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673613890; bh=TzCYWekeVeO9uFmb65AitJ1O7hak5JCY5nBfZC0eV1Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2EgLb8RA/MNOulgcS+OV5eUJHrwhU9C2VKHd17CiF9fB4tkYFCq1Z5t1tj2S6fZOK
 tP/6usu8adIUGz/VmcFjD1ccQaNU/0a4bAKYIQaYOs+dJU7CqL9Qw7O7TcaxBiW4CW
 AnbN8H2RPZzlmNvF7su8SpNATtU2yJvByQzN4FBA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 13 Jan 2023 13:44:46 +0100 (CET)
Message-ID: <abe92f46-d4d7-4d9d-82b3-d8c9e7e26181@perex.cz>
Date: Fri, 13 Jan 2023 13:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to
 prevent UAF
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230113120745.25464-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230113120745.25464-1-tiwai@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Clement Lecigne <clecigne@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13. 01. 23 13:07, Takashi Iwai wrote:
> From: Clement Lecigne <clecigne@google.com>
> 
> Takes rwsem lock inside snd_ctl_elem_read instead of snd_ctl_elem_read_user
> like it was done for write in commit 1fa4445f9adf1 ("ALSA: control - introduce
> snd_ctl_notify_one() helper"). Doing this way we are also fixing the following
> locking issue happening in the compat path which can be easily triggered and
> turned into an use-after-free.
> 
> 64-bits:
> snd_ctl_ioctl
>    snd_ctl_elem_read_user
>      [takes controls_rwsem]
>      snd_ctl_elem_read [lock properly held, all good]
>      [drops controls_rwsem]
> 
> 32-bits:
> snd_ctl_ioctl_compat
>    snd_ctl_elem_write_read_compat
>      ctl_elem_write_read
>        snd_ctl_elem_read [missing lock, not good]
> 
> CVE-2023-0266 was assigned for this issue.
> 
> Cc: stable@kernel.org # 5.13+
> Signed-off-by: Clement Lecigne <clecigne@google.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
