Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC44ED754
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 11:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093A718CD;
	Thu, 31 Mar 2022 11:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093A718CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648720341;
	bh=XVfxl+k5CLsLvMCRcdeXoMbJF6QaBL0JCc4HLI0bfsY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWVtd9ukzNEcKxfM0oZxdAoyGcwq3Noo3nFcsu0j46GiNrpTdDGCgTQn3d/kTz9Tk
	 l/4TEUMBXq/d5RNRVSj6XeyaNg0MCaG8TIFkIRZamTRyWKlkBS3TzLQgHz5m9MKUzG
	 GQadWo7m2xDbYusKeyHbPdER0UAOPbK/J4AGMyI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBC1F80238;
	Thu, 31 Mar 2022 11:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0BBF800B8; Thu, 31 Mar 2022 11:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 622E9F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 11:51:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6772BA003F;
 Thu, 31 Mar 2022 11:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6772BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1648720265; bh=cmwAeO4RmSnKMTddC78WtkxWgQoQB8koPJ87BY9glRQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=cBsHhvFt6c4KaQIfekMtCMZh5zA36jJzSL5h8a8vn5unLc9nitCTjPPrmORMLlbjW
 0hBO3iTmn10QrSALkOWK1fc+zyewUEaz70GWaPGINBfOok7N5ivhhwDP5OJiYpxxf4
 PH9s8liKXG3/709KZHA/wM687xOb8htJLyCWdTrg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 31 Mar 2022 11:51:03 +0200 (CEST)
Message-ID: <ea87f863-5839-57c4-80a9-4259cc362974@perex.cz>
Date: Thu, 31 Mar 2022 11:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and
 mmap_lock
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220330120903.4738-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220330120903.4738-1-tiwai@suse.de>
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

On 30. 03. 22 14:09, Takashi Iwai wrote:
> syzbot caught a potential deadlock between the PCM
> runtime->buffer_mutex and the mm->mmap_lock.  It was brought by the
> recent fix to cover the racy read/write and other ioctls, and in that
> commit, I overlooked a (hopefully only) corner case that may take the
> revert lock, namely, the OSS mmap.  The OSS mmap operation
> exceptionally allows to re-configure the parameters inside the OSS
> mmap syscall, where mm->mmap_mutex is already held.  Meanwhile, the
> copy_from/to_user calls at read/write operations also take the
> mm->mmap_lock internally, hence it may lead to a AB/BA deadlock.
> 
> A similar problem was already seen in the past and we fixed it with a
> refcount (in commit b248371628aa).  The former fix covered only the
> call paths with OSS read/write and OSS ioctls, while we need to cover
> the concurrent access via both ALSA and OSS APIs now.
> 
> This patch addresses the problem above by replacing the buffer_mutex
> lock in the read/write operations with a refcount similar as we've
> used for OSS.  The new field, runtime->buffer_accessing, keeps the
> number of concurrent read/write operations.  Unlike the former
> buffer_mutex protection, this protects only around the
> copy_from/to_user() calls; the other codes are basically protected by
> the PCM stream lock.  The refcount can be a negative, meaning blocked
> by the ioctls.  If a negative value is seen, the read/write aborts
> with -EBUSY.  In the ioctl side, OTOH, they check this refcount, too,
> and set to a negative value for blocking unless it's already being
> accessed.
> 
> Reported-by: syzbot+6e5c88838328e99c7e1c@syzkaller.appspotmail.com
> Fixes: dca947d4d26d ("ALSA: pcm: Fix races among concurrent read/write and buffer changes")
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/000000000000381a0d05db622a81@google.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

The change looks good.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
