Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A69F5E48
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 10:48:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AAD1695;
	Sat,  9 Nov 2019 10:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AAD1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573292892;
	bh=plBY+8wdas3wqj/4j7S0NJsTV+zqyYgjWuEjrhSn01c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CENHkehz85Kk6+5tb9J6nug4VX/X8HmkerK8NrJRQLNLs2krQBjVovV0aF/EFJ7UK
	 qsfx/ZjiwtjAiDWnVTzeqaogSNY7E3l3qo9pUPEin1x6eho15qzBNPrqTzLgMwHjg5
	 3KLdo6Wjkx1uN8H1QGe0x5bD0CNcbKxnyvbg8hzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95CD1F80637;
	Sat,  9 Nov 2019 10:44:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6C7F80321; Fri,  8 Nov 2019 18:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8565EF800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 18:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8565EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="SG0S6InD"
Received: by mail-wr1-x444.google.com with SMTP id z10so2638382wrs.12
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/8UyvVL1TadwdrmkVedPiTCMHWR77TjGMtAnaHnzWw=;
 b=SG0S6InDi3XMOgtN/cKfRVcc1YWkzAPfO/PWioodJWYpYlaokandwQgJs7SrGidB2/
 7fnkR3YXE7SEn2KlukQujy4Gvjc10ABCZurH/PiVYVXF6hMuNpUtxM2IkuIsFr/loFo7
 Z9cataKFSHOm5SLU3HChuAw8YLIXYZWRciyal40+sjIrL0P6L725wDBJS1TErc6djfiD
 PLhKbLfR5yEpnQ8hmfagcCAlF5hR2aRvFHVVrM9TR4ZFj3abyJjKtKzrReU9Hr4GYNP8
 +JP882CDJljabjU0WPeRiMrygp5skP7jp2J7gqpOpRgGZeEj0uT+Mhgty3UYylcnGfjU
 ARHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/8UyvVL1TadwdrmkVedPiTCMHWR77TjGMtAnaHnzWw=;
 b=c8epi5+OImcfLYAUqYXwt7AOjrKyfP6XpdNP8FBGWxxlerdBaHgJaik0ngS47RXZWa
 n81ix2bQUUYERIqrDE7UFXIH8fPEypFECci6l4LbCes7Oi5gZTEDmsjx9ayLjpYmUcFc
 U+KZU8zlx8oVTCYWHuEuHEs0OIyfVf6O+YD41L4dbFqksA+xwcjFis6Yd5W6RRxTey9D
 aNFCNyG7lSOX518oZ1ViMdXnITrHkWxbz8ND35dYJce05S+wJ2Bz+3vTcFYYTgcFFQa2
 lzsOEnJh6h09dV5WQfb95j17YJqkzGaU9kM3LtnhnJYhAdUkSmRW+VOEdvuxYWGNR1Tj
 rdfA==
X-Gm-Message-State: APjAAAWluBNxzJ5PdoDaz1Hv83pqBVMvHG9YQgY7OrP+QaXbrzEn2JOv
 VS5vY78rmQnygndoda4sLcW6Nxd46i25+SfMF89LnQ==
X-Google-Smtp-Source: APXvYqz5X3MmvLg+hJ8kp9xbvf6zGEKLJRy3ghbIhyZqHlM5Fly2jiY1TCz13mh6qVTHbOG+QJZtl5/jwGi2Tjaha5g=
X-Received: by 2002:adf:dd12:: with SMTP id a18mr9506026wrm.123.1573234093381; 
 Fri, 08 Nov 2019 09:28:13 -0800 (PST)
MIME-Version: 1.0
References: <CAGRrVHz0LZOXWprAqR+_e59k+NQwiax7je4dSHf85yeHepHV+g@mail.gmail.com>
 <093f1caf-dbb7-2d6f-9a1f-af19f4bee53d@redhat.com>
In-Reply-To: <093f1caf-dbb7-2d6f-9a1f-af19f4bee53d@redhat.com>
From: Jacob Rasmussen <jacobraz@google.com>
Date: Fri, 8 Nov 2019 10:28:02 -0700
Message-ID: <CAPZ+yNKmA4HDjAqNjkrA-AApmUOwpLE9THv=JTbqD8d_KSV=rg@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Sat, 09 Nov 2019 10:43:39 +0100
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Ross Zwisler <zwisler@google.com>, Curtis Malainey <cujomalainey@google.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@google.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] issue with jack detect using rt5645
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

Hello Hans,

On Fri, Nov 8, 2019 at 6:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ross,
>
> On 11/7/19 11:31 PM, Ross Zwisler wrote:
> > We are trying to get a piece of Google hardware which uses the rt5645
> > driver working correctly with newer kernels (currently one based on
> > the latest v4.14 stable), and noticed that the following commit:
> >
> > commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd detection")
> >
> > broke jack support for our device.  Basically with that patch we never
> > correctly see a jack insertion event, and audio is never routed to the
> > headphones.
> >
> > With just that one patch reverted, things work correctly on our
> > system.  The revert applies cleanly to linus/master.
> >
> > Here is the series where that patch was originally upstreamed:
> >
> > https://www.spinics.net/lists/alsa-devel/msg64331.html
> >
> > If we reverted that patch upstream, would it break other devices (the
> > "GDP Win" device?) that use the rt5645 driver?
>
> Yes likely it will, the commit in question was added to fix jd
> issue in the GDP win and other Cherry Trail devices using
> standard Intel reference designs.
>
> > If so, how would you
> > recommend proceeding?
> >
> > Does anyone have one of the "GDP Win" devices so we can test that and
> > our device and make sure whatever solution we end up coming up with
> > works for everyone?
>
> I have acccess to the following devices with a rt5645 codec:
>
>
> rt5645:         Spk     Mic     JDmod   UCM
> -Acer One S1003 stereo  ana     3       chtrt5645
> -Asus T100HA    stereo  dmic1   3 inv   custom
> -GPD Pocket     mono    diff    3 inv   chtrt5645-mono-speaker-analog-mic
> -GPD win        mono    ana     3 inv   chtrt5645-mono-speaker-analog-mic
> -Kazam Vision   stereo  ana     3       chtrt5645
> -Lenovo Miix310 stereo  diff    3       chtrt5645
> -Lenovo Miix320 stereo  dmic2   3       custom
> -Teclast X80Pro mono    ana     3       chtrt5645-mono-speaker-analog-mic
>
> Which all work fine with the current code, have you tried all the
> different jdmode values through the quirk moodule param?

I've tried setting jdmode to 0-7 through the quirk module param but
none of them fixed the problem.

> If Playing with the quirk settings does not help, then I believe that
> the best approach to fix this is to figure out which bit of the
> pre 6b5da66322c5 behavior you need and to activate this behind a new
> quirk option and set that quirk for the system in question.
>

The part of pre 6b5da66322c5 behavior we need is which register is
being read from to set val in jack_detect_work(). It looks like all
the other devices that use this codec have jd_mode = 3, so I was
thinking we could set buddy's jd_mode to something else and read from
the old register if jd_mode is that something else. Does that seem
reasonable?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
