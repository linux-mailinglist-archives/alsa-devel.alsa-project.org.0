Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1D5F4448
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 15:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC8516FF;
	Tue,  4 Oct 2022 15:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC8516FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664890330;
	bh=3UvvTkgwpomp4F4OciJ46UGv3/ubLe21l9HG06t89WM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mcoJT/Som1ETeUrUvdrLWozA0b5CXb8RHnXct0LZANwvAA1LqPpl/Bq3395IRyETU
	 k74fzdN8DV8SWT6NbJug+ZBwaYSA592VZiNcENQSnJJ3ERfsI4mU+37wNnTO7x36FY
	 pwptP3Ap1BOxtXTHfQkOulq37vHVJkVRMrVIAyE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E47F801F5;
	Tue,  4 Oct 2022 15:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A57F801EC; Tue,  4 Oct 2022 15:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C56FDF8012A
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 15:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56FDF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oCbmAy/h"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54EB761411;
 Tue,  4 Oct 2022 13:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81A0C433C1;
 Tue,  4 Oct 2022 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664890262;
 bh=3UvvTkgwpomp4F4OciJ46UGv3/ubLe21l9HG06t89WM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oCbmAy/hN/9Snhh9iFb6H0rvj53lRlbm8cUiHmHoCWs8cghKYwZbzF8yAIcjJvfTE
 YPs0wkBrFF3byxaTH+ubNIAums3gBKjnjR1aeirGXFYZvY8vW27EjapJz68CWQQpGi
 EDF1NmzVvpCV4qOCFMsqpDXNdfue4lvVDYlGMOcnk2qF/UlBxUFz/VAdbCxRWrsWE5
 0oWIoW7rWA9zJESBOunoC/fX2Jk25p0JjfVCZxQjzZP7ReHydXuVmfye4uzoE+WFGQ
 xRlAuTJeWkP6FlA/q9gPmc94PfPfrxQj2E8XekgwG0Hr/DO1PNpmcufN6QIPtAPSjI
 ReD0zFQvA+afg==
Date: Tue, 4 Oct 2022 19:00:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA Compress API - system suspend/resume
Message-ID: <Yzw1kXpW7ZiH5vQU@matsya>
References: <CAEnQRZALsr3Cf20K103ax9kvk-opAfWMW5XBE6pgu0KKq2Xaxw@mail.gmail.com>
 <2d31661e-0542-69b0-4a97-ff1e277c3351@linux.intel.com>
 <CAEnQRZCkJGe8OQdFDAhB_p-xLcb+S=6g6JG0jdBhNEUVzuP1ow@mail.gmail.com>
 <87fsg3pzpg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsg3pzpg.wl-tiwai@suse.de>
Cc: Paul Olaru <paul.olaru@nxp.com>, Daniel Baluta <daniel.baluta@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

On 04-10-22, 13:58, Takashi Iwai wrote:
> On Tue, 04 Oct 2022 13:18:15 +0200,
> Daniel Baluta wrote:
> > 
> > On Tue, Oct 4, 2022 at 12:46 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> > >
> > > On 10/4/22 11:07 AM, Daniel Baluta wrote:
> > > > Hello all,
> > > >
> > > > It looks like system suspend is not implemented for Compress streams.
> > > >
> > > > Any story behind this? Were there any attempts on implementing this?
> > >
> > > It depends on the definition of 'system suspend'.
> > >
> > > What we had in mind back in the early 2010s was to allow for 'active
> > > suspend' aka S0ix or low-power playback. That was the main reason for
> > > introducing the API.
> > >
> > > For suspend to S3/D3, the plan was to just completely stop any
> > > playback/capture and restart on resume. I am not sure if this was ever
> > > implemented, that may be a miss.
> > 
> > I see. Yes, we are looking at S3/D3 suspend and this doesn't look to
> > be implemented.
> > 
> > >
> > > There is a corner case we may have overlooked. I am not sure what
> > > happens if the S3/D3 suspend while playing. This is supported with e.g.
> > > aplay but for the compressed case it's a bit more complicated. Not all
> > > formats support rendering for a random position.
> > 
> > True. We want to implement the same behavior as for aplay. Stop
> > any playback/capture and restart on resume.

There has been discussion in the past for this and as Pierre commented
above it is really hard to resume a compressed stream. There is a big
DSP dependency here..

> For PCM, basically the ALSA core doesn't fully "resume" unless the
> driver explicitly implements it.  It merely stops (drops) the stream,
> sets the stream state to SNDRV_PCM_STATE_SUSPENDED, and lest the
> user-space re-prepare and restart.  Each driver is supposed to call
> snd_pcm_suspend*() in the suspend callback, and basically that's all.
> 
> I guess the same mechanism should be implemented for the compress
> stream, too.

Agree, based on DSP support a driver can opt in. Userspace should send
the data as expected after resume. I dont think we can ever continue but
it should be possible to restore at next frame or previous frame ...

-- 
~Vinod
