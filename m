Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FA1C0B69
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 02:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56241688;
	Fri,  1 May 2020 02:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56241688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588294719;
	bh=qzVIbLzLR1waAT8wlVFyTN88f+j4YehVbaac6sHmrqg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9Nwh23pNh1utlWOH92GJktmwVfiiIDgxWYakci18ZLTEjtJ4WFhBwi0HEVPA8yXF
	 +WdYhjmIk7kaxZt+KMbxphMO2V3lcUCOWrQ36Y0JVqGAbWWiV00ZyjV0fk6XyN9YG1
	 J28ib00XYXUctWSdmuZwuhEbtdhvPWM8nuGkYUho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C637EF801DB;
	Fri,  1 May 2020 02:56:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5E9F801EB; Fri,  1 May 2020 02:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D57DF80123
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 02:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D57DF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2dpHcfa2"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F128206C0;
 Fri,  1 May 2020 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588294598;
 bh=qzVIbLzLR1waAT8wlVFyTN88f+j4YehVbaac6sHmrqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2dpHcfa2x6CWh90gpUjnXE6dUI69GmXxQwjq0IWsjL0YhUq3U2tGgrcuVqXjB90MX
 H1jQG+xAN+jdyLJz6GqCfPvJGD2K22GTYUadDRhGRGWqMWbJIY5rsXKUPZl5prEJAC
 7x7XxBnFtK5xqJvRl2tnkSTkDzCCjNwGm6TQfHhA=
Date: Thu, 30 Apr 2020 20:56:37 -0400
From: Sasha Levin <sashal@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH AUTOSEL 4.9 03/13] ALSA: hda: Keep the controller
 initialization even if no codecs found
Message-ID: <20200501005637.GD13035@sasha-vm>
References: <20200424122447.10882-1-sashal@kernel.org>
 <20200424122447.10882-3-sashal@kernel.org>
 <s5hh7x9rr0c.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5hh7x9rr0c.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Roy Spliet <nouveau@spliet.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Fri, Apr 24, 2020 at 02:45:55PM +0200, Takashi Iwai wrote:
>On Fri, 24 Apr 2020 14:24:36 +0200,
>Sasha Levin wrote:
>>
>> From: Takashi Iwai <tiwai@suse.de>
>>
>> [ Upstream commit 9479e75fca370a5220784f7596bf598c4dad0b9b ]
>>
>> Currently, when the HD-audio controller driver doesn't detect any
>> codecs, it tries to abort the probe.  But this abort happens at the
>> delayed probe, i.e. the primary probe call already returned success,
>> hence the driver is never unbound until user does so explicitly.
>> As a result, it may leave the HD-audio device in the running state
>> without the runtime PM.  More badly, if the device is a HD-audio bus
>> that is tied with a GPU, GPU cannot reach to the full power down and
>> consumes unnecessarily much power.
>>
>> This patch changes the logic after no-codec situation; it continues
>> probing without the further codec initialization but keep the
>> controller driver running normally.
>>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
>> Tested-by: Roy Spliet <nouveau@spliet.org>
>> Link: https://lore.kernel.org/r/20200413082034.25166-5-tiwai@suse.de
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Applying this without other commits isn't recommended, especially for
>the older branches.  Maybe OK up from 4.19, but I'd avoid applying for
>the older.

Okay, I've dropped it from branches older than 4.19. Thanks!

-- 
Thanks,
Sasha
