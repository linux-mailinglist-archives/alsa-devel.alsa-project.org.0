Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6705FFDEB
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2471805E;
	Sun, 16 Oct 2022 09:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2471805E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905531;
	bh=DCpxOcxxtLXFVAXldYQdkH+hDN0wOdHsmDCPY7jp3kE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmQ3rSq4C02QO0XqdxMQWD3LvKGLBxHgn7T8x2tdpHYSyFh5uL73FgfSk46dm4A3F
	 7tBqIRGyxdseKr7H7rnEcnjw5KrPgvEx72OsANEnGQCOMS3HCv/tiz4XKquH4yXV/X
	 uxMeJTqhsY011igsxnAxNrZSj+PjX3u8qIV7X0Ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D621FF80579;
	Sun, 16 Oct 2022 09:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F33F80269; Fri, 14 Oct 2022 00:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_41,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC948F800A7
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 00:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC948F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l0CiGL8d"
Received: by mail-ed1-x531.google.com with SMTP id g27so4445500edf.11
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dShUQq+6E8bRbR3QS/MI9NepBM3UDbF7uFfMQV9Agjc=;
 b=l0CiGL8dfzZHRgncRuorm0R5igmfjXuAuKF7MyqVLtiGa3TdVMg7GI9IanLDDPnrTa
 OU51aOp2g8zZXNFFy6EXRfgJvMozqGdjqYab1DTq4BRcggLO+WLC/igxqep5mpfONYij
 IcTvExeoTb6OKpsrPYq7wquofIfK4MZq99B9B7nkrqNL+FmjpTlPWD/GBYp4CYStKPaZ
 nFV4xNbFqxiAMqfJdYl2VLoO1anBwYFT3TQf8JwoGDfrDtL0vFhtX/dcT376Ew/EuafF
 Z08bdVYHYsqhVVX9KPi1wECGc1ue0FigGZ8WhDLdJXy+P0krKuRXGFiY9nCQyRJ97E/S
 GOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dShUQq+6E8bRbR3QS/MI9NepBM3UDbF7uFfMQV9Agjc=;
 b=nY+8QNaAXQwMFwAkSZJTz+BMjP5Ut7s5uzqOwo72NBozOzEF1xeuY6FLFtDD+bVFgf
 m5f/d1OZmm/SuQKTzcK97aqyqQgJKm/0Qij9JoYjOa2/+ioEwYmrwtNgHtB2BiYC/9VV
 jmrFIFeZEguXunLtont0FXtLXefGei/x+eA05fRbCekqAsUsijWc35zzjQ0KFedXBaoy
 wyeRU9oBEHapSTNVDel42JQEkH0xQKS2Sor76wrpMT4ZxxzrRt+fLsrEujhnHYKUHtJU
 ug4Cw+myYraP/yIJweX62Ac1A/DfGa8qytpQovTmVMNu2fz9mAHNrqh8dFwltwMS7xvF
 kslg==
X-Gm-Message-State: ACrzQf0T48jICqAQ0MJeXJKwAO4uafIkKI6McQ5jAJBcGQRTRR1E3WjJ
 RmoMAkeyhU9kBJR/yzCwH3XtIOJ4L6uUKPU2IclLLCb0uKs=
X-Google-Smtp-Source: AMsMyM7N1RWvzweuV1eWjFtsDpg3kHfLW8g4Zx0CSZ9HZGAakvY6ZxbAdkQjDMGJ8Cw9JJDLlGanH4viFKyDkXfs0/o=
X-Received: by 2002:a05:6402:8cc:b0:45c:a5c9:c0a with SMTP id
 d12-20020a05640208cc00b0045ca5c90c0amr1576277edz.135.1665698833597; Thu, 13
 Oct 2022 15:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACGbgQVU8NvZdt-Jud7ybqZSpxFVd3K97KmwPNhUgw68ObTk4g@mail.gmail.com>
 <DS0PR11MB6375F69BCFD35EEF510F1E6AE3549@DS0PR11MB6375.namprd11.prod.outlook.com>
 <CACGbgQVM-5QpBT1otPmBQrvzBiT65aaZZGkQe0RmfnA6eHXqUQ@mail.gmail.com>
 <DS0PR11MB63758AA0C84F3A04D13469AFE3579@DS0PR11MB6375.namprd11.prod.outlook.com>
 <CACGbgQWEa0cEqRmPmhfeXBk_WUizTj6FJ7SaKScbwqqtqzcpUw@mail.gmail.com>
 <NDTavFl--F-2@tutanota.com>
In-Reply-To: <NDTavFl--F-2@tutanota.com>
From: CoolStar Organization <coolstarorganization@gmail.com>
Date: Thu, 13 Oct 2022 15:07:00 -0700
Message-ID: <CACGbgQXtUv-rGKnB9whXWvsA=ttV+NxWv2jz6FZVL63ToWJoHw@mail.gmail.com>
Subject: Re: Buffer overflow in AVS driver
To: alicja.michalska@tutanota.com
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Amadeuszx Slawinski <amadeuszx.slawinski@linux.intel.com>
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

Hi Cezary and  Alicja,

Just chiming in a bit regarding Geminilake since I figured it out on my
end. I have been able to get AVS (at least my port anyways) to run on a
Geminilake chromebook after re-signing + re-packing the DSP firmware with
the community keys and updating my driver's topology generation to look for
the correct SSP's on the NHLT.

I dug through the older SKL module in Linux and I noticed the topologies
for that specify a "mixer" module (I'm noting it creates an output and an
input mixer and binds them together in between the HDA and I2S copier
modules). Do these mixer modules do any volume adjustment / volume
limiting? as I didn't see any configuration for the mixers aside from the
audio format.

--CoolStar

On Mon, Oct 3, 2022 at 9:09 AM <alicja.michalska@tutanota.com> wrote:

> Hello Cezary, Amadeusz and CoolStar.
>
> I'm sure you're waiting for update from me, but unfortunately I got reall=
y
> sick with tonsillitis. Hopefully it clears up a bit tomorrow.
>
> I did some preliminary testing as CoolStar mentioned, but I would like to
> compare results with GeminiLake Refresh board (google/octopus) that shoul=
d
> be arriving tomorrow. It also uses DA7219 + 2x max98357a (max98357a is a
> mono amplifier, so there are two amplifiers on the board - one per channe=
l).
>
> Just from multimeter measurements there's nothing out of ordinary. 5.12v
> (so basically 5v) driving max98357a, resulting with 2.7v on speaker outpu=
t
> which is within spec. I'm still learning how to use an oscilloscope, but
> I've noticed that Vpp parameter goes up to 2.4v if you set the volume to
> 100% (I'm testing on google/reef baseboard which is ApolloLake N3350 with
> DA7219 + 2x max98357a). If you set volume to ~66% it stays around 2v and
> speakers don't heat up.
>
> Here you can see that even without any audio playing, left speaker is
> significantly warmer than right one. I began playback with volume set to
> 25%, then increased it to 65% and then 100%. Once speaker reaches 60*C,
> it's permanently damaged. Working speaker has 3.7Ohm resistance, while
> damaged one has 3.9Ohm.
> You can also see a pair of max98357a's heating up in the background while
> playing with volume set to 100% - they reach 40*C.
>
> https://elly.rocks/tmp/avs_fryingpan.mp4
> Speaking of which, reading trough the code I've noticed that you intend o=
n
> supporting GLK platform. We don't have firmware signed with community key=
s
> (GLK doesn't accept Intel-signed keys) so I've been wondering - would it =
be
> possible for you to provide such FW?
>
> It is really baffling to me, because as far as we both (CoolStar and me)
> see, max98357a is a very simple amplifier controlled by setting GPIO pin
> low or high. Conclusion would be that the problem lies in how AVS is
> driving ADAU7002 or DA7219, but I'm definitely not in shape right now to
> read trough AVS code once again.
>
>
> Best regards,
> Alicja Michalska
> --
> Sent from Tutanota Client for Linux x86_64
>
>
>
> Oct 2, 2022, 00:09 by coolstarorganization@gmail.com:
>
> > Hi  Cezary,
> >   I was able to get a capture streams working. Thanks for the guidance
> on the order of operations for that. For the final iteration of my driver
> port I'm going to be grabbing data from the NHLT to populate topologies i=
t
> generates so that should have less hardcoding.
> >
> >   Regarding the volume problem, Alicja here ran some tests with AVS on
> linux with a scope connected to the output pins of the max98357a (we're
> testing on various Skylake, Kaby Lake and Apollo Lake chromebooks -- I
> unfortunately blew the left speaker on pantheon here during testing (and
> Alicja blew a left speaker on snappy). We're using topology files grabbed
> from Chrome OS's Apollo Lake image (I edited the virtual bus id to get it
> working on Kaby Lake here), and it seems there's nothing referencing DSM
> inside either the alsa configs or topology.
> > --CoolStar
> >
> > On Thu, Sep 29, 2022 at 9:41 AM Rojewski, Cezary <>
> cezary.rojewski@intel.com> > wrote:
> >
> >>
> >> Hello,
> >>
> >>
> >>
> >>
> >>
> >> Indeed, there are means on dealing with volume problem you describe.
> Not all of them are free though and we cannot share such to the community
> without client=E2=80=99s ACK.
> >>
> >>
> >> Judging by the max98357a, platform of yours is a Chromebook device,
> perhaps AML-based, e.g.: Atlas. Said configuration contains the DSM modul=
e
> which addresses the problem. The DSM topology and the configuration shoul=
d
> be available to public, so filtering google=E2=80=99s public domain shoul=
d yield
> positive results.
> >>
> >>
> >>
> >>
> >>
> >> I advise against hardcoding anything within the driver. Within a week
> or two, tools for compiling the topology as well as several dozens of
> examples should be present on the upstream, that is on the >>
> github.com/thesofproject <http://github.com/thesofproject>>> .
> >>
> >>
> >> But yes, there is a requirement for certain ordering of operations. In
> general, you should be creating stuff from input to output (precisely in
> that direction). For capture, input stands at BE side while for playback
> it=E2=80=99s FE instead. There=E2=80=99s also part about configuring the =
actual hardware
> that is represented in ASoC as a BE. Files: avs/path.c and avs/pcm.c shou=
ld
> provide the pattern you seek.
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >> Kind regards,
> >>
> >>
> >> Czarek
> >>
> >>
> >>
> >>
> >>
> >> From:>>  CoolStar Organization <>> coolstarorganization@gmail.com>> >
> >>  >> Sent:>>  Wednesday, September 28, 2022 11:17 PM
> >>  >> To:>>  Rojewski, Cezary <>> cezary.rojewski@intel.com>> >
> >>  >> Cc:>>  >> amadeuszx.slawinski@linux.intel.com
> >>  >> Subject:>>  Re: Buffer overflow in AVS driver
> >>
> >>
> >>
> >>
> >> Hi Czarek,
> >>
> >>
> >> You can mention CoolStar in the Reported-by tag, as that=E2=80=99s the
> pseudonym I go by.
> >>
> >>
> >>
> >>
> >>
> >> Also I had 2 questions regarding AVS.
> >>
> >>
> >>
> >>
> >>
> >> A friend and I both noticed on max98357a that increasing the volume in
> the OS past 70% can destroy the speakers. Is there a module or something
> that could be bound on the speaker path to limit the volume as max98357a
> itself just has an on/off switch? (I noticed catpt has volume controls.
> Maybe AVS=E2=80=99s updown mix?).
> >>
> >>
> >>
> >>
> >>
> >> Also, I managed to get my AVS port to output sound on another OS (I=E2=
=80=99m
> not using topology files and am hard coding the path). However I noticed
> I=E2=80=99ve been unable to record sound. I noticed for output streams th=
e
> initialization sequence is:
> >>
> >>
> >>     1. Create pipeline 0
> >>
> >>
> >>     2. Create i2s link output path on pipeline 0
> >>
> >>
> >>     3. Grab HDA render stream & program BDL
> >>
> >>
> >>     4. Create pipeline 1
> >>
> >>
> >>     5. Create HDA output path on pipeline 1 with virtual link address
> (HDA stream tag - 1)
> >>
> >>
> >>     6. Bind pipeline 1 to 0
> >>
> >>
> >>     7. Set pipeline 0 and then 1 to reset & paused
> >>
> >>
> >>     8. Start HDA stream playback
> >>
> >>
> >>     9. Set pipelines 1 and then 0 to running
> >>
> >>
> >>
> >>
> >>
> >> I=E2=80=99ve been attempting to do a similar setup for input (except w=
ith i2s
> link input path, an HDA capture stream, and HDA input path) but I don=E2=
=80=99t see
> any input. Is there a particular order for input initialization for it to
> work? (Similar to how for the output I had to set up the HDA stream befor=
e
> creating the HDA pipeline before I could get any sound output?)
> >>
> >>
> >>
> >>
> >>
> >> =E2=80=94CoolStar
> >>
> >>
> >>
> >>
> >>
> >> On Wed, Sep 28, 2022 at 1:09 PM Rojewski, Cezary <>>
> cezary.rojewski@intel.com>> > wrote:
> >>
> >>
> >>>
> >>> Hello,
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> Please excuse my delay in response. We appreciate the input =E2=80=93=
 in
> future, please do not be afraid to email us with alsa-devel in CC. It=E2=
=80=99s
> easier to not have the mail missed that way.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> In regard to the actual bug, highly unlikely but indeed you=E2=80=99r=
e
> correct. While my response is delayed, patch fixing the problem in our
> internal tree was not. Said patch should soon appear on the alsa-devel
> mailing list. Are there any names that you would like us to mention in th=
e
> relevant commit message (through =E2=80=9CReported-by:=E2=80=9D tag)?.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> Kind regards,
> >>>
> >>>
> >>> Czarek
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> From:>>>  CoolStar Organization <>>> coolstarorganization@gmail.com>>=
>
> >
> >>>  >>> Sent:>>>  Saturday, September 10, 2022 10:00 PM
> >>>  >>> To:>>>  Rojewski, Cezary <>>> cezary.rojewski@intel.com>>> >;
> >>> amadeuszx.slawinski@linux.intel.com
> >>>  >>> Subject:>>>  Buffer overflow in AVS driver
> >>>
> >>>
> >>>
> >>>
> >>> Hi,
> >>>
> >>>
> >>>  I've been looking at porting the avs driver you've written to anothe=
r
> OS. During the process I noticed a potential buffer overflow issue in ipc=
.c.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> I noticed that ipc->rx.data is allocated a buffer of
> `AVS_MAILBOX_SIZE` (or 4096 bytes) in the init, and this buffer is not
> allocated anywhere else. In avs_dsp_receive_rx, if the msg type is set to=
 a
> large config get, it sets the size to the arbitrary value from the msg
> struct without any checks, and then immediately does a memcpy to the buff=
er.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> I'd highly suggest putting a check to ensure this doesn't go larger
> than AVS_MAILBOX_SIZE to avoid a buffer overflow as that could crash the
> system (or potentially be a vulnerability to take over the host system if
> an attacker somehow gets code execution on the DSP?)
> >>>
> >>>
> >>> --CoolStar
> >>>
> >>>
>
>
