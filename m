Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F128237F54A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 12:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC8F17DB;
	Thu, 13 May 2021 12:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC8F17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620900265;
	bh=m+jStw39gE0mjRDT/TCkRGMgRbPOBurV0oUU7A+4FLs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRt3ql4j4SaXdVzvvmk/zvWS/E+cSwcvpeY55ivbKN3U1xiJ5xcpQT4itVZ+zFo1U
	 MutD1rmBvz5KDWWepWJJVPK5LTQ0N3FyaG5Xi7I4mqacizW6caAxIb3JReTM7EtLsd
	 fxafJl2B9lVDyHQuWKvgj8kIMlJXvTxz4jjOQUHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD443F8016B;
	Thu, 13 May 2021 12:02:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C1C0F80163; Thu, 13 May 2021 12:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47D2AF800E3
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 12:02:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2AE1CA003F;
 Thu, 13 May 2021 12:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2AE1CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1620900166; bh=u9gERW8xOCil6uNFk+nL7vBUUjFb2UoqZotHtNEnlJ0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UtbeV2Frol118Tad5VPiRtkwWoP8jxm7vlBMonGvgPWt7vzRdGnGUdpQpVNYY5L8h
 xo1TLwyQ3q/FBtmzlNZrILctNEnMS64ZzNFM1NjY3fRdRtNW2AnhoZl0H/zGHXlOxm
 UR1ESx4ISnRoxIilOc98hDhXugaSgNQew6dFFvQU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 May 2021 12:02:43 +0200 (CEST)
Subject: Re: alsa-lib dmix segfault; latest Git
To: Mark Hills <mark@xwax.org>
References: <2105131051530.22897@stax.localdomain>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <11774ef2-ec87-b005-6b2b-7338801bc0d9@perex.cz>
Date: Thu, 13 May 2021 12:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2105131051530.22897@stax.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Dne 13. 05. 21 v 11:55 Mark Hills napsal(a):
> The current Git master looks very broken, segfaulting immediately.
> 
> It seems to be caused by commit 27f4a85a95 ("pcm: direct - move the direct 
> struct init to _snd_pcm_direct_new()")
> 
> Here's the trace:
> 
> $ aplay -D plug:master testing.wav

Yes, I noted this today, too. It's fixed in
da33eda632c86b5c2d71e0aedf3037a67053ebd9 . Sorry about that.

							Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
