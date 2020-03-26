Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3091945C1
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 18:46:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C69A166E;
	Thu, 26 Mar 2020 18:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C69A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585244809;
	bh=hz6G30AK3C1vcjdG7WRnU9VC+5xFDuRJxAHzQSWDbbQ=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3DzvgLzQbZJou5hs9P29koyDNNdKiphsffhnWZsVNNZ7yrtZjWcRg33LL5ipbk1F
	 EYbBmLUBlC/6h2sQruAe03HBcyMnbUcFBVuGL+8tQyEEley9KDaAQySo0qEuenjEqI
	 MFVbBUiz+f0pJnPE6Vk4ZCAb/6zl0fevtQCRYVek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B9BF80234;
	Thu, 26 Mar 2020 18:45:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A5CF80227; Thu, 26 Mar 2020 18:45:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A68D5F8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:45:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CF14FA003F;
 Thu, 26 Mar 2020 18:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CF14FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585244699; bh=N2DAkVtgeTSsHz7HxdR/oCWoUK589ZgJHDHGVQFgPt4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=wrvPSqj2ZhXmwt+oCit8yp+6Mv3rbR5KfveMdoAzd9ekw/79tssiqGvUl9quBpujS
 43dhkZ+In+l5HsdXPTgSov79Ayr+Qeg/BYgyWgMxhn0DKKTF9gu/7POtTAq33NgxU3
 k+ovp026ma8yrLHC+zFSbgwwklTWhxicSXPBIF/4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 26 Mar 2020 18:44:57 +0100 (CET)
Subject: Re: Functionality of pcm_notify in snd-aloop?
To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <61d837f1-de1a-7aa6-ca8f-d0cfaa36ea69@perex.cz>
Date: Thu, 26 Mar 2020 18:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
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

Dne 26. 03. 20 v 18:19 Pavel Hofman napsal(a):
> Hi,
> 
> Please how is the module params pcm_notify supposed to be used, to do
> what the documentation says: Break capture when PCM format/rate/channels
> changes?
> 
> Breaking capture side operation when the playback side changes the
> params is very useful, but I cannot find a way to use this param
> properly. When the capture side is open, the playback side cannot use a
> different parameter than the one currently used by the capture side (the
> configuration space is limited)

Really? Then it's a bug introduced by the last changes.

If you look to sources:

       if (get_notify(dpcm))
                 runtime->hw = loopback_pcm_hardware;
         else
                 runtime->hw = cable->hw;

And:

       if (!(cable->valid & ~(1 << substream->stream)) ||
             (get_setup(dpcm)->notify &&
              substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
                 params_change(substream);

So the functionality should be there.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
