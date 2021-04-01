Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B093350C8D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 04:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49B941;
	Thu,  1 Apr 2021 04:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49B941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617243673;
	bh=eAPZfKt9BEcYexxBFO3pBJrrMJ0c03TuMGjyPYFzh7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDoWh4HpmbplVrB5ed9ZsxvCIIFJWp8oCZ6sNrE8SYr4DkGWnRKWgku42sH0yDGJF
	 hQzYV2w7HBhPRD3FwGcfqPzAI9ZvgbrZP0WF5WqUdV3tY/hykMGj6zoOWViN48XR0a
	 iyffRdAx7w+xJKqng9HGizw0exP4agImMpKdcFzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23ABBF8026F;
	Thu,  1 Apr 2021 04:19:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E955F80240; Thu,  1 Apr 2021 04:19:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62B50F8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 04:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B50F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HBFB71+q"
Received: by mail-ed1-x52b.google.com with SMTP id o19so185503edc.3
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v417xFyLo4CDkoNWlJKuZlaEzNutDqjoxgV5bz5MXzE=;
 b=HBFB71+qEo839ympB+itZ5yUBbRo8LFVjOD/dffoQ0cm5ato2mwT+jVo9jmZlo+Ocw
 n963EGKOnAWTf+6+0f0zqsz/DCYZBkmD+K/1bX73LoBJdemGcsxZoDGfC2fFB78c7Yef
 bIzYX8ymwl4dmxq4u+yIikekklwcjCqGybx2S0KE8wPU+xwL2GmTct0IR6vmRK9To15o
 4ZDDu3guWo3EDNjc45spT2lsR7io1Pp6mJdB2XslMQB6Z5sI9Zzdyz1HV7bJVBhTmpx8
 2TffzXjI0d8j0aSZD05GvL02xNwJocw9RQu3nl4eiXvEKl/4T3ESISME6XE2ulpMxWv0
 5xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v417xFyLo4CDkoNWlJKuZlaEzNutDqjoxgV5bz5MXzE=;
 b=GKn3YfAbI7J2vmdMo4efQwH77gBlEae339svIkwuetOAe+bYU/WgIW6gvbE75zinWI
 nsYNlTdskhZuoS3z+23U1i4j3FeODZtHs3B+aSOs9QmuAS2grdLc0bbxGgO0TbBVMeMV
 mgEweN2umcHCCxyNbfEOwkHEvmyXRWnPwewlM57w8LezJ49rtXXfqUf+pNgUuK1UKVRn
 JFRWltEUXHvoDBtn7JJ+mHEKIrxZ3NmPRxXJwwCrkyDiUk7vR6CLUGwh/gg6Yh25cZY5
 kNgVXfYvMTPDtcmROgD5EXCiy6FcHknlDSminsqMmIKu1IC7bmhDhBTgoyXCZoKagSmu
 rK6w==
X-Gm-Message-State: AOAM531+SdgHGHx6cUSjJVD248ApNB3Y1mdeoFaLtdhPTkqQ42YS4gYi
 AHnI5AHAZvyUYSF34FES8H57mkWKtpIhQ3JMKTw=
X-Google-Smtp-Source: ABdhPJwrw9gKMMOc0fhVMp0v/pHpWH5WttLOJJ+fO1FHe/OvwRDPDul0G+RDfkJ/q/cWAsQMQlZKffhVhjGO/uHzOik=
X-Received: by 2002:aa7:d416:: with SMTP id z22mr7168620edq.239.1617243575616; 
 Wed, 31 Mar 2021 19:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
 <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
 <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
 <CAEsQvcvjf-o7x8t06cCB3hwMNXZYf=xJWsbnGdTmt=CXP2HJQA@mail.gmail.com>
In-Reply-To: <CAEsQvcvjf-o7x8t06cCB3hwMNXZYf=xJWsbnGdTmt=CXP2HJQA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 31 Mar 2021 21:19:23 -0500
Message-ID: <CAOsVg8qTwqFwnmWZwu02rMqwkpbNZFV4COL8yB-BAJDNuT2gug@mail.gmail.com>
Subject: Re: [PATCH] Fixing most Roland-related devices' USB audio
To: Geraldo <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks for the encouragement and wisdom.  I hope your additions, and mine,
work out in the end.  A real hurdle with tasking everyone with patching for
their devices, aside from having probably long since given up hope for use
of the device on GNU/Linux, is the amount of disparate forums they voiced
their issues on.  There's also the daunting likelihood that select few
music creators actually would decide to compile their own kernels to see if
a problem is fixed, let alone feel comfortable enough applying a patch.

I hadn't realized this was a list to drum up testers, or that every change
needs to be tested fully.  I thought it was a direct path to possible
acceptance for inclusion in the kernel, if reasonable doubts are considered.

I hope they'll let me sidestep that huge, unreasonable, undertaking, as my
test implicit feedback "fix" for the UA-4FX (which doesn't need it) proved
it still functions as perfectly as without it.  That should mean that for
the devices that don't require this patch, but which had been accidentally
added, no harm is done.  I can't really see myself as owner of all these
devices someday... ;)

Thanks again, Geraldo!,

  Lucas Endres
