Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997011CDEAE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 17:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FD31607;
	Mon, 11 May 2020 17:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FD31607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589210194;
	bh=AKPEcqaJyRc4JLDn+cF5csPB2yBP+vu85fB25gz/4WY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIQejGN8Ny1w2JMtwbGZYdcG0y7La8t9AlCF7rJA3jQmNREEXrD+r9Omn02J2S/G/
	 skRiiLuI4+uYXuv6tRRvWNfjCR1NjZHl5a67S2bgE7d9NWUhyzakdTPdNP/iS3O5kI
	 k7PvYQwm5lDCronSolbEGrBrAGv82i9ZJST1+WyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A1FF800B7;
	Mon, 11 May 2020 17:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B07F80157; Mon, 11 May 2020 17:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 422E2F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 17:14:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0A8D1A003F;
 Mon, 11 May 2020 17:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0A8D1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1589210080; bh=F5AUyOG+cVLGez7zNrM9ZPfuM8l02bJP8DgD9Rd2KJU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=tRwgCQ2dKzQ1F1EZALrUDs+y7stR79VlY9LINTAhcIgQN8AwmY6bqsSc2G5g4cDtY
 JiLEGqccFKKh1UEcy+ouApxc7EtaJzn/EjbXa6z7qr4WrxBBnkdrRkarI4dpc3a48q
 heIjniK5KXKLb58JVShevBe3vrDtdum0SxskObnA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 May 2020 17:14:37 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 0/3] Trivial compile warning fixes
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200511143931.31528-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8b913035-aac5-e728-5d7f-e31ca6591cc4@perex.cz>
Date: Mon, 11 May 2020 17:14:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511143931.31528-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Dne 11. 05. 20 v 16:39 Takashi Iwai napsal(a):
> Hi,
> 
> here is a few patches to shut up trivial compile warnings that have
> been introduced recently.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

			Thank you,
				Jaroslav

> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>    pcm: rate: Fix compile warning wrt bit ops and comparison
>    pcm: rate: Fix uninitialized variable warning
>    topology: Add missing ATTRIBUTE_UNUSED
> 
>   src/pcm/pcm_rate.c |  4 ++--
>   src/topology/pcm.c | 18 ++++++++++--------
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
