Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28928B5DF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 15:18:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D751695;
	Mon, 12 Oct 2020 15:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D751695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602508693;
	bh=MrcDp47KFWUWPphA4rkfAjNWmdgHM8FOAAMTK4j4t7c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A0Q16BFf0n6QePyN5IC5F1fpEdDSeVkg0I9oEH6fHD/tqBKXCMfDpMJKAO3JNxdp3
	 tcAg9Ct4/w2NRhxmMb2sJN4YZnw7eFjLbnab4vPxtQT5/FXQeKDr4MProBX7a4GFVh
	 RrOzV3NTEerxw+uSYrKjfgWwPUq5+HMMauw38/RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA22F8021D;
	Mon, 12 Oct 2020 15:16:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 717EFF80217; Mon, 12 Oct 2020 15:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EB1CF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 15:16:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 07383A0040;
 Mon, 12 Oct 2020 15:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 07383A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602508583; bh=37mxYxfVdWbcwcqfvn7xdYRHOnhsEtJYO7t8VhbyFgE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oLEvtTlUpH4yDq6EN/q9nREzHu9bymzu4Nb2/Hw4Z1Av0wrcp7bUbnyv5vx2s4lzw
 I0jmUfh8Ca84ImgfUPBUMvuG1B4Ht9z0NJYWIQWVON2ybisrEIEMicSK4bSPota9mG
 xd+YGnYfxNfF9URUEaxxJn1Q9s0HCgY1lz6ob4ks=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Oct 2020 15:16:18 +0200 (CEST)
Subject: Re: [GIT PULL] ASoC updates for v5.10
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20201012130845.816462076C@mail.kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
Date: Mon, 12 Oct 2020 15:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201012130845.816462076C@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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

Dne 12. 10. 20 v 15:08 Mark Brown napsal(a):
> The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:
> 
>   Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.10
> 
> for you to fetch changes up to c890e30b069a2792a5a34e8510a7a437dd6f5b3d:
> 
>   Merge remote-tracking branch 'asoc/for-5.10' into asoc-next (2020-10-09 15:42:31 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v5.10

I miss the SOF cleanups here:

https://lore.kernel.org/alsa-devel/20200930152026.3902186-1-kai.vehmanen@linux.intel.com/

					Thanks,
						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
