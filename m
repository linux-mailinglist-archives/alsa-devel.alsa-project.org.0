Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E435A347D44
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 17:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789E5168A;
	Wed, 24 Mar 2021 17:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789E5168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616602084;
	bh=913EpeeI2ShqFEPBtvOWe+jEMQ38toYFm5VbVQ+SGWU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=meYb3SZs+rjESZNOjTFGYTm3P4mdfZ0LZz12rUVmMSE/jmlxrrWuSyBiFiMENhqYq
	 8ln+nh+JgRQaKsnmouhtsSbkgwJAYm5dGFTCQUNmmmQ9Bg1rnSOVorTAvsgHJt3FeA
	 zz2OYuCgTrUSeWurAnD38dEYskEVsY5wqkwSMcw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC44F8012B;
	Wed, 24 Mar 2021 17:06:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE0B2F8016B; Wed, 24 Mar 2021 17:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 961C4F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 17:06:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C6270A0040;
 Wed, 24 Mar 2021 17:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C6270A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616601980; bh=3xHVyAFJHWAXp/frLxNB4TnsB1WrjnuKPXuG4Pz7+Mc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=08lqn4Iflj4Biz9SsDHADFBhu2zCmVInb/jHgYHiAnU84xSUK2cJ/iKqZD0jqIlxQ
 cX/wDjamFQLhaqr48ZOhjF5yZKIuzoyGdX09tXQi19sSzswg2J1J2dz1s6j08D9fBE
 OMI8hDlX0jgpX8aomZ8f6PWwnwQYczxcuHmzhxok=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Mar 2021 17:06:17 +0100 (CET)
Subject: Re: [PATCH 1/1] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210324053154.34107-1-coding@diwic.se>
 <20210324053154.34107-2-coding@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a0812386-d916-4cdb-a230-4c56e0b8952e@perex.cz>
Date: Wed, 24 Mar 2021 17:06:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324053154.34107-2-coding@diwic.se>
Content-Type: text/plain; charset=utf-8
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

Dne 24. 03. 21 v 6:31 David Henningsson napsal(a):
> This commit adds a new framing mode that frames all MIDI data into
> 16-byte frames with a timestamp from the monotonic_raw clock.

I would add support for monotonic timestamps, too. The NTP drifts are usually
small, so it may make sense to support those timestamps, too. It may be handy
for the synchronization among multiple machines (timing sources).

The timestamp mode should be selected separately than the framing mode.

> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 7
> +
> +struct snd_rawmidi_framing_tstamp {
> +	unsigned int tv_sec;	/* seconds */
> +	unsigned int tv_nsec;	/* nanoseconds */
> +	unsigned char length;
> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
> +};

Perhaps, we should consider to have a fixed header and variable data length
here. For MIDI, the standard messages have only few bytes usually. It would be
better to use this space for the seconds field:

header {
	unsigned long long tv_sec;
	unsigned int tv_nsec;
	unsigned int len;
	unsigned char data[0];
};

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
