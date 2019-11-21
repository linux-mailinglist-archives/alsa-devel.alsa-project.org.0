Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB2104AA4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 07:19:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA15172F;
	Thu, 21 Nov 2019 07:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA15172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574317163;
	bh=sIoZX7bURnFweKpnm6k65tiLFNAfBfS1Rw0pqFTOBc8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRDzTF+mMHqR+0wJE+V97oS1/3YkGpSD3XTDiFFiQcnergyUuFjYqYrLNJfZO9kjQ
	 y2XjJJXPHmwocQsdVsKWVALWawfLwAQPbKbJo0JBUGwOqPMancJWtx0rV5+hOBzvtc
	 s7B5y/jwm30Hgx10l8t1VTpvh4ecvAJdM6x0aDUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D447F80146;
	Thu, 21 Nov 2019 07:17:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F15FAF80146; Thu, 21 Nov 2019 07:17:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E43C7F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 07:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43C7F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="txtH/50k"
Received: by mail-io1-xd41.google.com with SMTP id b26so177910ion.7
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 22:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EPalLpyV3JBTPCtX+HOh/VghiKwKlUW+4LaduaLxYoI=;
 b=txtH/50kJydOcA8v6t/b9gxCKnAGWHx9iROR14lGyqNY+jDadJS1UYqRrTs09/tkha
 K9zahyArUb7vXDzW915XXXe+KuEZXkS2hhERbtvd8ZudTsfe1kx+ipy6EV5h65nx2Jwo
 0/Pb9lM8Zr2qZtxqRjIdR+afRWKDPEi5Go0mCUqo84y3v+AalZ8dRa2unB2UX0n4W++R
 HAOfb/mG1FccORdPWCp/WSd25HOYz2zsXFRSuHJtcfH75FHHimUUhBHrKtuRTq3MCagt
 FJuyqP+IUcNqaxXR+g0PpCgpGCdNIlwg/dGGLrsqkDc+pU4aM8fUPtd5QypaMGWm3AHP
 1YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EPalLpyV3JBTPCtX+HOh/VghiKwKlUW+4LaduaLxYoI=;
 b=pcBMWQ3MlNchLdMUaeFW5fO9kjRj+Cbs+uunt9x6091ikRLB9n8iLT1AYYgX5o9/WB
 7B1GiL6CVEQhLtGJoKcnajuuyO7FkTPYTokXa9kGdUYyocIpqJfQPupayTxIlfIkDgNc
 0NW2TTzk8fMBT6vsmRn+Tn42XdN7xHwYK52hY0OYGIRWWgnVvFH9+qdRnO0UZUZMkhoL
 iOHnhe5TpMoV0atqHFAedrkiXEjyO2uuGZMEBwMI6Ve/wMjxhMFPW2ToQPpDoscwy+b6
 LS3fFRPawxxVok6U0IP4+FpMOM2he7So7GSsfirsgRwJAarnz5hp8BPOTYzDPYATHlSZ
 Qe8Q==
X-Gm-Message-State: APjAAAUTqWDErL4ttr5IuvryUtNOiYcsRMO3WZ9UfCGKLezzsqjTIxso
 JDJVXCLHHglE50V889zDMZnXivZEpAGf+LsrDs2jvw==
X-Google-Smtp-Source: APXvYqyLUujy3PczsM/JDEv2zRPpm6Zcgl13KUWHe0dXBpPOmFYEz/KzlZ9gsnmVSA65lFGrJ1lQnlWO2CipLCvQpGA=
X-Received: by 2002:a02:7f93:: with SMTP id r141mr6844853jac.68.1574317049107; 
 Wed, 20 Nov 2019 22:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
 <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
 <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
In-Reply-To: <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 21 Nov 2019 14:17:17 +0800
Message-ID: <CA+Px+wX2UtU3As-3Bf4rWn1kzqDMPw60xk508gDDaOPk6Q5dgw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
	conditions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Nov 21, 2019 at 11:20 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> Still you may want to clarify your second point and the commit message.
> The first race condition was clear, the second one not so much.
>
> what did you mean with 'assert ULK == 0' and what does this map to in
> pll_work

The case (2) race condition is based on the previous patch:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158852.html

After applying the patch, the code would be something like: (in the
case, two threads read 0x01.)
static void max98090_pll_work(struct work_struct *work)
{
[snip]
        snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
                            M98090_SHDNN_MASK, 0);
        snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
                            M98090_SHDNN_MASK, M98090_SHDNN_MASK);

        for (i = 0; i < 10; ++i) {
                /* Check lock status */
                pll = snd_soc_component_read32(
                                component, M98090_REG_DEVICE_STATUS);
                if (!(pll & M98090_ULK_MASK))
                        break;

                /* Give PLL time to lock */
                usleep_range(1000, 1200);
        }
}

I guess we have 2 choices:
i. stick to the original plan: option B, remove the second thread of execution.
In the case, we would be punished by at most 10~12ms delay in the
interrupt handler thread.  I browsed the max98090_interrupt() and tend
to think it should be fine if we delay jack detection for extra 10ms.

ii. adopt option A, play with the masks; and drop the previous patch
to avoid multiple threads access 0x01
We would be forced to wait >10ms before re-enabling ULK interrupt.
Notably, Documentation/timers/timers-howto.txt states "msleep(1~20)
may not do what the caller intends, and will often sleep
longer".Documentation/timers/timers-howto.txt".

Either way should be fine.  Which one would you suggest?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
