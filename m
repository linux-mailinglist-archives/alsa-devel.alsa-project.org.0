Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E8429DFE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 08:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BD6168E;
	Tue, 12 Oct 2021 08:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BD6168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634021400;
	bh=a4APh837hN4Ot9mLvpm+3FQLkrJ0r2/nmsoNBmvlraA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6chRsTyLUgS5Y0hKEBDlFGEVghqXwoZIbgAhaWU1Q6tzXnYuQoa66SrWEB+5kHhk
	 DPkBauc+hC/lpbbhymHZVxPOeeVFmjdljdJIPbN/SrcKflQXgewJI7tPgJZbT2562L
	 nG/YsrzPZ9/MqLAa4auG4sdJiGX1gBMr2/AliViY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8057EF80245;
	Tue, 12 Oct 2021 08:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F33F80212; Tue, 12 Oct 2021 08:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF04F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 08:48:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 30E79A0040;
 Tue, 12 Oct 2021 08:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 30E79A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1634021313; bh=h6ujEwwvDiYMbBnNUjuI+9u0q/jInNzd+kMadeCXa6g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BeTtnU91vw18RI0pj44l7C/QQRshiZ82HqsNGv9s/fxOZ8ncCNRQuPv4iiVnhmtQw
 anhfqwDHULpA4Ik1kypBvnpbQ4Np3sOxe4zGHAId8htyciwBRz5puAurL/uPIzPaJD
 Tyvgn806mDGE8vU/eF32zWi8LF4XFV1hrQmtBL3U=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 12 Oct 2021 08:48:29 +0200 (CEST)
Message-ID: <b1055039-8ed7-6820-2a8d-a2fa16459110@perex.cz>
Date: Tue, 12 Oct 2021 08:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Add ALSA UCM support for Pinebook Pro's audio
Content-Language: en-US
To: Jian-Hong Pan <jhp@endlessos.org>, Dan Johansen <strit@manjaro.org>
References: <CAPpJ_ee4+Aer5z2qWr9xECoJOZTn80GKXxdTzzj08ADdXm5Uow@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <CAPpJ_ee4+Aer5z2qWr9xECoJOZTn80GKXxdTzzj08ADdXm5Uow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux@endlessos.org
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

On 12. 10. 21 8:08, Jian-Hong Pan wrote:
> Hi,
> 
> I prepared the pull request "ucm2: Add UCM support for rockchip_es8316 on 
> Pinebook Pro" [1] to enable Pinebook Pro's audio generically.
> Also, the corresponding validator pull request "ucm-validator: Upload 
> rockchip_es8316's dummy json and alsa-info" [2].
> 
> The original information comes from Manjaro ARM's pinebookpro-post-install's 
> asound.state [3] and pinebookpro-audio's audio_jack_plugged_in.sh [4].
> 
> To make it available on most distros, I transfer the asound.state and the 
> shell script into ALSA UCM conf.
> 
> It will be appreciated if someone can review the pull requests and give some 
> feedback.

Thank you for your ping. I made the first review.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
