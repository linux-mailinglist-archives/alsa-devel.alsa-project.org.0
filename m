Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7E4DBFC5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C4216FC;
	Thu, 17 Mar 2022 07:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C4216FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500299;
	bh=9EPLFc0pdiuZLGXfUBeoV2QJLlEOKY+cBVSdJpmJdi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDIgM7X0JESTd43EDKvS7snbPOxrEL6sRJI1Df0ZBHDkBD8BgQ3bMWoSaWfdxz58E
	 Xujnw1h7DVrmQaApG/fCBrqn+Qg+lmUaORYZ1qXKKYP/WC9+gM1wCu0PUiriYrHWc6
	 w9efsRcT0Kxp7JGoFwRf5+M2pKLOm6v1DH5NtqcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D303F8053E;
	Thu, 17 Mar 2022 07:55:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E6A5F80162; Tue, 15 Mar 2022 14:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38DE6F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38DE6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com
 header.b="Cezrbq+l"
Received: by mail-vs1-xe2f.google.com with SMTP id b190so20773236vsc.4
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9EPLFc0pdiuZLGXfUBeoV2QJLlEOKY+cBVSdJpmJdi4=;
 b=Cezrbq+lnRkFY0MX7mLsPbWtmtsVEYwFF0sXofNAVhJqqsedLgC8CeZk4WC4sVzpHm
 tvUN8w/6Yl3GJQBsuhQIKFUCthYzCBaw6fymHmE0OpKWrv7M367uk4bRhGGRpoVh+QSY
 +8plcP8lKntM5RNuAM20n+Dr404RQhdw/vCn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9EPLFc0pdiuZLGXfUBeoV2QJLlEOKY+cBVSdJpmJdi4=;
 b=VJTgZxcl4M/shqU59mV+egnFC0P0Z5YDHNGJBwosszoW4RKYnMRDd6OnVCnjbIP2K2
 lns4KSSqXisKTbSWL+HkTPsdSrK76DrzcxN5fIM0lh6xCJZe/eS7gdIQbJ0LFZXYNlaq
 ii4R+d5u0e/cBoUE8OKRRoGD6NmqqhT8fOPCKhrCUoP+JA3sae9ORJh5mHWGCOT4CF78
 8Ob0pG7bX5lKcHterGKwB8fPqOdKPlaQ32yOTWbYqob6bzGjFD7FAwcpctVSDUrT3E7W
 phYtYWfocWDJ44GJ1/RrRFJcpxvZoHrmRiFmHG7eBimVY9DgL9MOMJz7CuRCTvKYCYF1
 98sA==
X-Gm-Message-State: AOAM532FoudGxI5AZJVMDKII7cKkqnInmQa/7xq4Zx+nYhM6cMiepTF2
 xBeGEd62MbMH8nS/EjxdGSj8rv66Nn1VwTC+qorMiQ==
X-Google-Smtp-Source: ABdhPJxwjbIQYTYfnoZMHaBdjvlurSIvTJDn2QMMRqzQ9bJmaqZBacvvQyMn7vZEJQ7pL3Sgi+3M61OKTD+3EpMCktw=
X-Received: by 2002:a05:6102:c4d:b0:322:b188:3842 with SMTP id
 y13-20020a0561020c4d00b00322b1883842mr9866634vss.12.1647350812654; Tue, 15
 Mar 2022 06:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220315091319.3351522-1-daniel@0x0f.com>
 <s5h8rtba4to.wl-tiwai@suse.de>
 <PAXPR10MB47185B76D5F38482FB1125A5F1109@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PAXPR10MB47185B76D5F38482FB1125A5F1109@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 15 Mar 2022 22:26:41 +0900
Message-ID: <CAFr9PXn=vRV4Jvxc+w9XJiAB8eAzq9MUfu+frMkS1P83Vp2Ujw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sti: sti_uniperif: Remove driver
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Arnaud,

On Tue, 15 Mar 2022 at 22:15, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
> > Yeah, that looks dead.
> >
>
> The platform is still used for instance:
> https://lore.kernel.org/all/1d95209f-9cb4-47a3-2696-7a93df7cdc05@foss.st.com/
>
> So please do not remove the driver
>
> The issue has not been detected because it is related to an error that
> occurs only when we reach the limit of the platform, with application
> that stop the stream at same time.
> So almost no chance to occur.
>
> > OTOH, if anyone really wants to keep the stuff, please revert the
> > commit dc865fb9e7c2251c9585ff6a7bf185d499db13e4.
>
> Yes reverting the commit is one solution.
> The other is to clean-up the snd_pcm_stream_lock/ snd_pcm_stream_unlock in the
> Handler.
>
> I will try to address this in few weeks

Feel free to ignore my patch then. I couldn't find anything that used
it's DT compatible etc and assumed it was orphaned.

Cheers,

Daniel
