Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3315E53FB03
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8281D18B8;
	Tue,  7 Jun 2022 12:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8281D18B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654597000;
	bh=lMj00cVjbs4sT32fCGQHHHf0Sys7o2w0854pzubMu0A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jolh/HU/DhGpzZdNE9ZLyjwL6Z+UWYahSe6MWcS15Qk7a5S3m0lRTOGHYutehyH1K
	 RV2avK7/lNdQ+pGtcTeF/TqNIxmS7otfANgvebYrRdk9k/95n3T2+uaStFkF+e/vh/
	 anWOHnSeU5K6DZC9/eHVZuzdAI8W7KNFdD6v+5LA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7B91F80248;
	Tue,  7 Jun 2022 12:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CFFBF80159; Tue,  7 Jun 2022 12:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76499F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:15:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E8DA4A0040;
 Tue,  7 Jun 2022 12:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E8DA4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1654596933; bh=OmSHhLaUUN8h6KyIyFi0speH+LAmCCQEjsLhA0muSEM=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=VcILpGSp8bHV+JoeBzkixDoGapMkDNgRBiXq7u+sPAZKUSfO6OoXohwbaC6MndgQ2
 6g6uQkHRT7IMQe4sQgMR+6YzVxHSxFVRdjQJhjPYT8KWRfhY1uLG/0E4E7ZHiwWn8M
 p/o/fKrTK8MUdgrQBfhlTSdFGMTXV40xLCQY1Np8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  7 Jun 2022 12:15:31 +0200 (CEST)
Message-ID: <4c4f1308-2d7d-8b66-29f4-12e2245f9132@perex.cz>
Date: Tue, 7 Jun 2022 12:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Combined wait for pcm_wait and ctl_wait
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>
References: <54d620be-08a9-c67c-5eac-56cae79def96@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <54d620be-08a9-c67c-5eac-56cae79def96@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 07. 06. 22 11:56, Pavel Hofman wrote:
> Hi,
> 
> Please is there any way to wait for nonblocking read/write at min_avail
> (like snd_pcm_wait) AND nonblocking subscribed ctl event (like
> snd_ctl_wait) in a single combined wait? The goal is to react as fast as
> possible to ctls in aloop and audio gadget devices which notify about
> stream stop and start (at new rate/format/channel count) on the other side.
> 
> I guess some wizardry with file descriptors and polling multiple fds
> could do.

Yes, use snd_ctl_poll_descriptors* and snd_pcm_poll_descriptors* functions to 
fetch descriptors and translate poll states returned from poll(). The alsaloop 
utility from alsa-utils may be used as an example.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
