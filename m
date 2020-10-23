Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C584C296FD8
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 15:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE1B182E;
	Fri, 23 Oct 2020 15:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE1B182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603458262;
	bh=MHy1S8R67IU+HGzQqNgW8tqDG03NzrLMtFjD1BNvFrg=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShUBrVmBY+ewdeXT55+N1Ne++qhAGaEK0B/q/4UpJIf8cP8VOmGkK15DN/Y31vaFP
	 bGo4jjvkWVcYecXBWBKcJUS4NdzfmgYFwSAAcJtjX9HXPK7JrTsmqwa/MLG3Qbeejp
	 XlxOB3931NgG7gRs/vUzbHb9fR5xfH0XtbnzUZ3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BB1F800BD;
	Fri, 23 Oct 2020 15:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59F2AF800BD; Fri, 23 Oct 2020 15:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96689F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 15:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96689F800BD
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kVwiP-00042N-GA
 for alsa-devel@alsa-project.org; Fri, 23 Oct 2020 13:02:41 +0000
Received: by mail-pg1-f197.google.com with SMTP id b17so1111905pgd.16
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 06:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BC7zuAF/NnofAdEYaPZZnotmNh+X8UYz50UWmTChF4E=;
 b=XU83enwRqxGyfW4vGiFa6QvM8av4vmdRAoARZheYQykDl1GeJ5hXQCjqySoYHPAwBu
 ytWFgAi2W/5v/dmKEHn/gcMDMeCUnKfc/eTxV9AegQweg9m3uqkm5HXZuSRaiCGBEf+E
 BASZFy4bQJIjqnnZ/HHI7m/L+YmIKAb787qF8EKBS1uTuXyNXaDYnjVdqMvZg+fF2t2g
 vvGhpdEuuejtCImedv9baqYMn0lIYpvmzQuWGdVCLQNIO/Zp0ef8N4zUnY0xm9/sP0pE
 EOGD5U9ORuhC88IzkaqgPpqhJw4Jn46dTZkC8Zcbg0XR2bu9Ev21CDuO1Gp8nC/Q16mu
 kMZA==
X-Gm-Message-State: AOAM532dM0l86SmoWiX8kSZLe/MJ70naHdInqtQFRYpwJtrd6LNjbT27
 ka36QZFAe6WeT26bZf93JcNHEQ2rRn6xq3uGrKxFg/C6gG18YmMl/cMG5JIqEuiCvJPp2aM2mGN
 xT/ADmBcjikEhDxHJzyaXCOHb8A5o3wFGH4ieI7oJ
X-Received: by 2002:a17:90a:b389:: with SMTP id
 e9mr2557895pjr.191.1603458160051; 
 Fri, 23 Oct 2020 06:02:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvEIAgPmABYBsijwFB/Gv0lqHcDeu3MV3SXDfFg4I9rrJJW6DNpSiF/GvDPDdMYJxc5gfw3g==
X-Received: by 2002:a17:90a:b389:: with SMTP id
 e9mr2557863pjr.191.1603458159758; 
 Fri, 23 Oct 2020 06:02:39 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id t13sm2232981pfc.1.2020.10.23.06.02.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 06:02:38 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 3/4] ALSA: hda: Refactor controller PM to use
 direct-complete optimization
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hh7ql898j.wl-tiwai@suse.de>
Date: Fri, 23 Oct 2020 21:02:35 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <98CFD5BD-3BA0-4A7A-8C24-D6004F019CDF@canonical.com>
References: <20201023102340.25494-1-kai.heng.feng@canonical.com>
 <20201023102340.25494-3-kai.heng.feng@canonical.com>
 <s5hh7ql898j.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Alex Deucher <alexander.deucher@amd.com>
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



> On Oct 23, 2020, at 19:36, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Fri, 23 Oct 2020 12:23:37 +0200,
> Kai-Heng Feng wrote:
>> @@ -1103,10 +1096,8 @@ static int azx_runtime_suspend(struct device =
*dev)
>> 	chip =3D card->private_data;
>>=20
>> 	/* enable controller wake up event */
>> -	if (snd_power_get_state(card) =3D=3D SNDRV_CTL_POWER_D0) {
>> -		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>> -			   STATESTS_INT_MASK);
>> -	}
>> +	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
>> +		   STATESTS_INT_MASK);
>=20
> Hrm, this doesn't look safe.  Applying WAKEEN unconditionally means
> that the machine may get woken up from the system suspend, and we
> don't want that.

Yes, WAKEEN should be enabled for runtime suspend and disabled for =
system suspend.
In principle we should always do runtime-resume -> suspend flow when =
runtime and system PM requires different wakeup settings.

That also means HDA controllers can't use direct-complete at all.

However, I did some testing on keeping WAKEEN enabled for graphics =
card's audio controller, and they didn't wake system up.
But yes, in principle they are not safe, I'll change it in v2.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi

