Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD379336DDF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 09:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC3016ED;
	Thu, 11 Mar 2021 09:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC3016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615451646;
	bh=VXje3Ynde0rpXsXV/uAEfp8KisMBZojogvmrKAdFq20=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJd1tbAWx0lnuqrSaXvmM5sAa8EkzubAlvfspuYnJoAziB1A7zvApVlMqBImzsx0j
	 UnbdWUNBaa/AzQsRF6zDzYycF66HyxWBG+xH306vyiYLDVGYqNfi+Cu8iB5fqw7RwD
	 pL2Qqurin02+c6neZ4jM9diKT07ZS4kNK7083cu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7B6AF8015B;
	Thu, 11 Mar 2021 09:32:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC72FF80227; Thu, 11 Mar 2021 09:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0010FF8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:32:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6270EA003F;
 Thu, 11 Mar 2021 09:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6270EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615451538; bh=j6aPagKn1KtDkydfP0jn3rBE/TugeU8dJm+9TAVNSbI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3SuBe5Duz/lipUIwDgJGbVxqo7GF1lKN+Ex1Nc8B54oyNnvI4Xe1p7MxcmRQ9aPbu
 SRIFu9Iz7jbYSgtHzhfdJdW5ZwGnCVE6ebCrrhkEcBxSVw1fa0W5SCIGpG61nzJayr
 7ypNW+8FXqu+/qWtGIRRMx2+l+kjbm0fg2nfI65U=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Mar 2021 09:32:15 +0100 (CET)
Subject: Re: [alsa-utils][PATCH 00/14] axfer: reduce test time
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <32f69063-4402-8734-715c-108cff0eb67b@perex.cz>
Date: Thu, 11 Mar 2021 09:32:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 11. 03. 21 v 6:21 Takashi Sakamoto napsal(a):
> Hi,
> 
> The axfer in alsa-utils has test programs for internal modules and
> overall time to execute them takes much. The issue is filing in
> github repository[1]. It comes from three causes:
> 
> 1. file I/O operations are done in file system for actual storage
> 2. Some cases operate much audio data frames (over 4MB, approx.)
> 3. much test iteration count (so simple...)
> 
> This patchset uses shm by memfd_create(2) for the cause 1. In addition,
> the number of maximum audio data frame to test is reduced as well as the
> number of samples per frame.
> 
> I got benchmark with berow machine environment.
> 
>  * AMD Ryzen 5 2400G
>  * memory total 30823852 KB
>  * linux-image-5.8.0-44-generic on Ubuntu 20.04 amd64
>  * ext4 on SATA SSD
> 
> As a result:
>                    |container|  mapper |
>                    |   test  |   test  |
> ================== | ======= | ======= |
> Current            | 112 min |   5 min |
> +shm               |  58 min |  50 sec |
> +maximum reduction |  38 min |    -    |
> +iter reduction    |   4 min |    -    |
> 
> In my opinion, the issue comes from package build server in each
> distribution. 5 min for test execution is not so worse time.
> 
> Finally, test programs run on shm and commit c3f2344b7209 is reverted[1]
> since it's useless now.

Applied all patches except the double revert. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
