Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3201C2651
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 16:54:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08C116AD;
	Sat,  2 May 2020 16:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08C116AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588431257;
	bh=e3CLWZFr3hROFPrFKZhniu0jpeHK1UXKZfuoZ2bWAUA=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEwQYcyTxg8qa6pAN0FMsXQqqvsHpDjHunsLXRk8OV34GQC0JZSHfnko1apWSiLTO
	 mbU0SUBHvZBruqLssrr7K7kb64ea1dZOrUC9x0Ut6N/W+Vm5R+FM0+MPmFXhkGAaIz
	 sw5Yf5KfMjCJ3FB8I6Iw4BqfQY4WQl4jdjjGxz2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B81F801EB;
	Sat,  2 May 2020 16:52:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D39DF801F7; Sat,  2 May 2020 16:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58DB8F800E5
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 16:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58DB8F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJr5Y8af"
Received: by mail-wm1-x342.google.com with SMTP id k12so3218722wmj.3
 for <alsa-devel@alsa-project.org>; Sat, 02 May 2020 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=eUmO9lFyYnSEUotvSkDdW7nX84l9YUGsDR7MyoCN3CU=;
 b=YJr5Y8afBHWlluBWUgx/5EYN6hyE6dcLw2z1n9vRkLHzQbpSGBhpcOfqygIy3U0gu3
 ZU0X0/T6IEfb9apK8ibAiOkQJB8QlmXhpHVMRe9jOCvalPLCRrcDaDdUz7BHVGmDsBdG
 u0quqzJnaF5I8H1s35iZ55qzUq6QYCjn4YnQcYk32wqe6fgKXVJnpcLkiex+yTPHan9n
 mVgx3/aJ99LjjauFWmgwTQallkMJgpWyd89bUQVy+MrLy5YJ3z9ta+ZgPG+Kt5yzEzD+
 h/CVwqzTMwVfGsIiYzVW3V/WuilTmu0Zdf20RW+WSqc2FJpiUV/KjciIkYOVE8Y0RaLJ
 nMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eUmO9lFyYnSEUotvSkDdW7nX84l9YUGsDR7MyoCN3CU=;
 b=hr7QmvWP93Ku7OwhFPuyHtswza/twZB29OkZmVmrS1ne5pd2HfjRNphPD/KGLGyJ/v
 plMa/d1J5LN3xLsGNtWXtd+cdIJsSC8rbhmw2lGKIn0gNXDqPK8rFiByv9JZGa91w7ar
 WjoeRZ4QgwVmxVdFBzYDQTEVTt6ixZUdPuA4kaIkgnqBMd07RLY9ez3eWwFSGokRqXNz
 IfLton1jTkCH45nxgtGIUG4y00i9+MapDqpOHxRws/JHUzQTRtU43Ca90+g4b2lqnSwR
 lOG8I3SNRoP4KfjpMvyWbZGsjM65iOZkCV8ylqdAEBECVLRuTrOj8aX6W3qtBVw0vPEc
 quVA==
X-Gm-Message-State: AGi0PuYHEwXaa/X3quRKM967umUEsmFBkPVvH+oRVw1wYVMBzC68ldCf
 K4nN6wohTYPNUmhBSf9lR1vczA==
X-Google-Smtp-Source: APiQypLQZrhbbLoB4l9/FVLUeKO9DpS30JZtXUoebbOs+GhYQzJCdHKM8cIDEnbn665XnkBqaQKeSA==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr5212531wmb.155.1588431136061; 
 Sat, 02 May 2020 07:52:16 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id 92sm10023040wrm.71.2020.05.02.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 07:52:15 -0700 (PDT)
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk> <20200502134721.GH13035@sasha-vm>
 <20200502140908.GA10998@kroah.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
In-reply-to: <20200502140908.GA10998@kroah.com>
Date: Sat, 02 May 2020 16:52:14 +0200
Message-ID: <1jd07mie3l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, kernelci@groups.io, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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


On Sat 02 May 2020 at 16:09, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:
>> On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>> > On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>> > 
>> > > The call stack is not the same as in the commit message found by
>> > > the bisection, so maybe it only fixed part of the problem:
>> > 
>> > No, it is a backport which was fixing an issue that wasn't present in
>> > v5.4.
>> > 
>> > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>> > 
>> > As I said in reply to the AUTOSEL mail:
>> > 
>> > | > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>> > | > playback/capture if supported"), meson-axg cards which have codec-to-codec
>> > | > links fail to init and Oops:
>> > 
>> > | This clearly describes the issue as only being present after the above
>> > | commit which is not in v5.6.
>> > 
>> > Probably best that this not be backported.
>> 
>> Hrm... But I never queued that commit... I wonder what's up.
>
> I saw the Fixes: tag, but missed the changelog text.  My fault.
>
> I'll go drop it from everywhere, sorry about that.
>
> greg k-h

Hi everyone,

Sorry for the mess this seems to have triggered.

Indeed, with the Fixes tag, I understand why the patch has been picked
up. Even I thought that a backport would be OK, since the mistake was
quite old.

If I had wrote it correctly from the start, I would have found the
problem that was waiting for us in ASoC ... but the 2 errors cancelled
each other out.

It is only now that ASoC has been fixed that we found my mistake.

Again, sorry for the mess.
Thanks a lot for your time and effort on this
