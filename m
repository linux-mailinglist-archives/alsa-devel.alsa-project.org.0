Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887622E968
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEA21697;
	Mon, 27 Jul 2020 11:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEA21697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843224;
	bh=WLgPK3c/Ncx6nQxdUBqDgJjaGI/KVUFBPUs5vNIwnf4=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uC96PXc785ubJZiiktMjl1ndF4uP616jjKjIwoi9UOO7mX871eAUnuqAay5vDS4Ap
	 4QHIIargtxAVktIvV/0QUFWIioxVp8YO3qLpTk8C80LQiv7RiADHYERETBqdvMZRO6
	 Y7h2wRxQRd8BymJzPebYYPJaGEUxa9+4iRVzHc+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECD4F8027B;
	Mon, 27 Jul 2020 11:42:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E228FF80246; Mon, 27 Jul 2020 11:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED38EF801F7
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED38EF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="D5F0nyyZ"
Received: by mail-wm1-x341.google.com with SMTP id f18so14085946wml.3
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=2lPhyVZbu7UmONo1SxFBX3wNeG48DWy80lpL+hbOwgM=;
 b=D5F0nyyZfykEyv34iqgJsosFwmDt3ZfgMo9TnSwwq/SW6cQlugZQdOidt17Hw/Oi/t
 ABZe6fjU9qxufe76dUfYM+I1jo2tl4Q3ItRECe0NRcLnupAQUZNOuKmQLmNGqLY9QXMJ
 U2m8wyzMBVGAOjI161UHVsi7pitEdT2nZori/Da1DARVYOGr3hHZoNaL+QjB8m4evjRT
 hnyoAL6uNcXKipWTqAKPyc9IhASpaKO7SNwzd6CKMurAfBHGKWp9zso2wdOR6Ndj2jmh
 zZdhYtUSrT8KGxTHym6bvOx9TIOi/e/7Y4sQnGgq+8a/m150QavYljhA1jdyl3sPeF0X
 xOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=2lPhyVZbu7UmONo1SxFBX3wNeG48DWy80lpL+hbOwgM=;
 b=K0NuE2SAyWeu8oYX6e7aPvGBQa2D8GT5hoFfGKmM8MIWkDaMmX8JLSMrTdnXBc05fy
 lqTM0Qa2O/GnWe9tbzddAelLav6NBLqVSSAM50+Ji+1T88Wj+gg+qIC9LK/mMltp4SNt
 8M0viR9oK/siPnYVCA8LbjcITRoLQVTjXbeTmeaxz3Yurh5WCwmaAKadpU4ctU/o6tUt
 vLA+sYoOyJtTcvtsJwnF6HB/rg3tU23NjpXxFHe/SUaSRVAp6QoIt6cSbt+dFFk/NIjq
 3mDnGolyrp1nWU6bZp7G42YB4NpUBX5fqZxVZueP1O5SAuhJcOedzfk+stVnhduCDIF9
 DFKA==
X-Gm-Message-State: AOAM5323tTz/SNtKwanW6GWYji0putIPEoia1lPIY6fE7yeZxbsRRICo
 53RhhDtVTOYE7aoG3rKZ0F4aIg==
X-Google-Smtp-Source: ABdhPJzis2hFpFHV9PZc1Ilbg4G2mBGSkbbFn7IWd1iXFWog3Q7xd3JmXNGQPV/td6SRRgHEFDWdwQ==
X-Received: by 2002:a7b:cb51:: with SMTP id v17mr19646184wmj.146.1595842942049; 
 Mon, 27 Jul 2020 02:42:22 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w2sm12759763wre.5.2020.07.27.02.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:42:21 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <1jlfj98gb4.fsf@starbuckisacylon.baylibre.com>
 <576823fb-a8a8-1f74-b7e2-d33b734022a7@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: core: use less strict tests for dailink capabilities
In-reply-to: <576823fb-a8a8-1f74-b7e2-d33b734022a7@linux.intel.com>
Date: Mon, 27 Jul 2020 11:42:20 +0200
Message-ID: <1jk0yp8fb7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tiwai@suse.de, broonie@kernel.org
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


On Fri 24 Jul 2020 at 21:05, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

>> Again, this is changing the original meaning of the flag from "playback
>> allowed" to "playback required".
>>
>> This patch (or the orignal) does not explain why this change of meaning
>> is necessary ? The point I was making here [0] still stands.
>>
>> If your evil plan is to get rid of 2 of the 4 flags, why go through the
>> trouble of the changing the meaning and effect of one them ?
>
> My intent was to have a non-ambiguous definition.

I still fail to understand how it was ambiguous and how throwing an
error for something that used to work well so far is making things better.

Maybe there could be have been a better name for it, but what it did was
clear.

The flag is even (briefly) documented:
	/* DPCM capture and Playback support */
	unsigned int dpcm_capture:1;
	unsigned int dpcm_playback:1;

"Support" means the dai_link supports it, not that it is required for it
work. This is what was implemented.

>
> I don't know 'playback allowed' means. What is the point of using this flag
> if it may or may not accurately describe what is actually implemented? And
> how can we converge the use of flags since in the contrary 'playback_only'
> is actually a clear indication of what the link does. We've got to align on
> the semantics, and I really don't see the point of watering-down
> definitions. When things are optional or poorly defined, the confusion
> continues.

The problem is that commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix
playback/capture checks") has changed the semantic:
* without actually warning that it was doing so in the commit description
* breaking things for other who relied on the previous semantics

Previous semantics of the flag allowed to disable a stream direction on
a link which could have otherwise had it working, if the stream had it.
It added information/control on the link at least.

New flag semantics forces the flag and stream capabilities to be somehow
aligned. This is not clearing the confusion, this is redundant
information. How is this helping the framework or the users ?

>
> WFIW, my 'evil' plan was to rename 'dpcm_playback' as 'can_playback' (same
> for capture) and replace 'playback_only' by 'can_playback = 1; can_capture
> = 0'. So this first step was really to align them on the expected behavior
> and minimal requirements.

IMO the previous flag semantics was inverted yes, but aligned:

playback_only = 1 was the same as dpcm_capture = 0
capture_only = 1 was the same as dpcm_playback = 0

Having both *_only set does not make sense for a stream, same as having
none of dpcm_*

Having none of *_only flag means there is no restriction on the stream,
same as having both dpcm_* set.

This seems aligned to me.
