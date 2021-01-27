Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9C3063F4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 20:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5472516D6;
	Wed, 27 Jan 2021 20:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5472516D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611775256;
	bh=WmTmSJyvMNMEsxUfXorZvamTtfHyuaHjFj26Pjyvxgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcJB6BxDKxcNWnSRj5mP4ZPJbg6AtEoJQ6EkLKbNwZSJ4D/6/+AoD8vwd+/5TQi1u
	 9C4HWtbLp/hFCQMBPx7PdJvszQ7MxOvoHA71Lo/pYwLr+ryKS52Qc0EzoOwHWmFHrU
	 AkTl6Gn1oMNlhigSFhYnIpiShaIaVKvuU9/d3Nj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DCEF8025F;
	Wed, 27 Jan 2021 20:19:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954F3F80259; Wed, 27 Jan 2021 20:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, PRX_BODY_76, PRX_BODY_84,
 SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50BA2F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 20:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BA2F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B7uVylQ4"
Received: by mail-wm1-x32a.google.com with SMTP id o10so3901970wmc.1
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WmTmSJyvMNMEsxUfXorZvamTtfHyuaHjFj26Pjyvxgg=;
 b=B7uVylQ4lWkmgSEe8GWJf1WCvdQR/UkeEDDPlC+SkfwO9jgFMoHL9DQ1Q4MvMkpBlV
 qdNXepVzwR1lj8z9hIAWbQdWYXDELgnVAvpvciskVcarC9cWy4W5Pii+eYZBBtRnWhox
 Vvc8T9Yf5br5KXAgnDTiu7xr4Qm1BIKjHyLtvS3hePk8RLMZem3ohq4U8oRce3XGIIkQ
 6a7y/kdk1YzLh/fe58BMrm9EuFOoXUR6UG45FqICGgfJqPL5mbwtRXPAAPnWPoCSnI7n
 FAbvsq4XdnxPCy8doFkQEXsdYPdX+RvEenPc/swndBYjiHLMLYlyA5OPPSrrgn2Dw1tK
 5p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WmTmSJyvMNMEsxUfXorZvamTtfHyuaHjFj26Pjyvxgg=;
 b=hIcevXbngMr6JS1sWw50hliPQNCt7v3LLXqWoV/iA6PNm0ZjF51CoECIVH8jn9MI6/
 ZnFNV+0tYGHKIxunAxtu8sn7JXaVi019hbArVKvcK+u2tIb3Vo7H0vv7hmE8ZGhuFtgD
 ueCZP6o7gzjkNLXLfC3X/LZJzfsJ7F9crs80kp/0aBtVFk6j6agUWE1SaPtPkLHqtkwp
 4OIJ9IjEY5V0u5ZGsrk/FaQ2TlxywMJ13x2GagteMdDXze1FlLRJEj1ZWtsibOh/VzpX
 2Rf2+HjVfA+jX60fvHz/vUYAyZhSTr3SvGOQJfkbx3ruYRHU/wJdJOQtCt2TMg7Vmlqw
 EgtQ==
X-Gm-Message-State: AOAM5306OL4+MoLQk5WusOb2uDj9b4eUrRBhbjYuaLgCY00o6yC7gZmU
 XaD8oibpkWxYZHMTHcDxROTOXrWwwbiLEae1R3c=
X-Google-Smtp-Source: ABdhPJwjVss4T/I/Wvjp4U+yLwODJcxV8/S0Q16ivTYKxPBelNOC8XdFXHFlIPDJtsRRyLJG/KAN8Tp6hizIIr+sLI8=
X-Received: by 2002:a1c:2905:: with SMTP id p5mr5413653wmp.156.1611775152973; 
 Wed, 27 Jan 2021 11:19:12 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
In-Reply-To: <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Wed, 27 Jan 2021 20:18:58 +0100
Message-ID: <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

=C5=9Br., 27 sty 2021 o 18:28 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> > Weird, I can't reproduce this problem with my self-compiled kernel :/
> > I don't even see soundwire modules loaded in. Manually loading them of =
course
> > doesn't do much.
> >
> > Previously I could boot into the "faulty" kernel by using "recovery mod=
e", but
> > I can't do that anymore - it crashes too.
> >
> > Maybe there's some kind of race and this bug depends on some specific
> > ordering of events?
>
> missing Kconfig?
> You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
> selected to enter this sdw_intel_acpi_scan() routine.

It was a PEBKAC, but a slightly different one. I won't bore you with
(embarrassing) details ;).

I reproduced the problem, tested both your and Rafael's patches
and the kernel still crashes, with the same stack trace.
(Yes, I'm sure I booted the right kernel :)

Why "recovery mode" stopped working (or worked previously) is still a myste=
ry.
