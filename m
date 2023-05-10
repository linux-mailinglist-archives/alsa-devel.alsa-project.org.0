Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF106FD455
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 05:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFF0107A;
	Wed, 10 May 2023 05:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFF0107A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683689685;
	bh=8t42cr5n1If9fKRpXjqj7Xfu1c/Cwg0raJVTL1kZWRU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Df9oq2iXiblB2+VOH+JTyfWNqIdqowmE+I4xPdKDQcDzXwbE7Etx3B522ifh+0pcQ
	 DA1eI/6TqWo/2PPG0smwJqOduNNwA9RgVSmSAhPeAo6yPx+kEqIcKvy8Ydv55UzdHr
	 7cXtE8+HkNbBw/6po9alnw4EOmAnlCOy1hG7/JLM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B937CF80310;
	Wed, 10 May 2023 05:33:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94B9EF804B1; Wed, 10 May 2023 05:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93E41F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 05:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E41F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QT074gkn
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-76ee8f09692so2272574241.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 20:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683689594; x=1686281594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnzViHpo7Mw2TBS8GlhEGMCL/642v0MEhYD9vEp2ZNA=;
        b=QT074gknpUCIJ966UYCcOEPx4+zaX/Y83DOuxeHVW0Guwv9IJWTWykreO+9E8Y+YV0
         pI2mM8AHBHIDgV7h13Emj8YkOs8IGvSSo0lPHCbTTrgq9ou9HV7e7aTdndpCVVv0DORL
         FtoVZ7/to4aQ7M2EQUSMBgkzABshRyna7QVvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689594; x=1686281594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnzViHpo7Mw2TBS8GlhEGMCL/642v0MEhYD9vEp2ZNA=;
        b=ZbDDnYXGLjR15PWf6Mt1ZKoHVf0qpK1BYsL7+Y+89Sqla2NjonxlwqZE2VyqD+gxGr
         vRKehF9wzNSIonAGfQnPgD2VMfEW3+bJwLgoBgqDZmQCSXtHudQJTpNs72AGPq3JiZea
         QnV7NI/yAmHlf43rMl2C5qdx4NRcBDbTgl8xKJIdH9MpB7cYCyWzl0AFef9eIHabPXQd
         8JiRm3iB6FSLexUMlYdEFVxd625xR9tHzbp4iutDowIUPSsw/hUqYEpsIPzv9G17vxQG
         Q3kUtWX336rl5wZQk6OERhioSHf8lS/refACmbMyvV9WvjtDxwlRvsgD7g6IG6rOhI0q
         FvHw==
X-Gm-Message-State: AC+VfDxGcEliFSES+dkC24uPz7g6PNgY92z20oiI3ZvAzuiqDZtLfwPb
	dpPC7Jg5LK+9betLAXkxk0Lfcfy1/5iXt2WAjjo2fg==
X-Google-Smtp-Source: 
 ACHHUZ7sP54TZe/eolUJcTA3h/EZ1N2F4djlVoMc1OFGg7KgR2aIeonPNkMpnTTTQX4VPH6YuAuyYnHK2QXyQRpe+pE=
X-Received: by 2002:a1f:3dd1:0:b0:3e2:ecf4:9f82 with SMTP id
 k200-20020a1f3dd1000000b003e2ecf49f82mr4304407vka.11.1683689593730; Tue, 09
 May 2023 20:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de> <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
 <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
In-Reply-To: <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 May 2023 11:33:02 +0800
Message-ID: 
 <CAGXv+5ETajMKYi3q__-WVSywobjzzf92AM0wSFGCXzxr-qZJTg@mail.gmail.com>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KFYEZULP55BNJPCX7KGZED3DJU5L3LDV
X-Message-ID-Hash: KFYEZULP55BNJPCX7KGZED3DJU5L3LDV
X-MailFrom: wenst@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFYEZULP55BNJPCX7KGZED3DJU5L3LDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 10:08=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, May 09, 2023 at 08:03:39PM +0200, Jaroslav Kysela wrote:
> > On 09. 05. 23 16:35, Mark Brown wrote:
>
> > > It's not b4 that's the issue here except in that it causes me to fetc=
h
> > > copies of the message that went to the list instead of my inbox which
> > > didn't get mangled by the list.  git am just does not understand what=
's
>
> > b4 can detect, if the e-mail is wrapped and use only the wrapped messag=
e.
> > The wrapping is the correct semantics per mailman 3 not mangling (see [=
1]).
>
> > https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handle=
rs/docs/dmarc-mitigations.html
>
> As Konstantin pointed out this isn't entirely practical, especially with
> the message ID rewriting breaking things.  I suspect any mitigation here
> would have to be on the archive side with it trying to unpack and
> archive the enclosed message but that doesn't deal with all the issues.
>
> > > if I try to apply it the top of the commit message looks like:
>
> > > | commit 8f0e0ee514b189cf7b4e7fa09581e3f1d246fa09 (HEAD -> tmp)
> > > | Author: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.=
org>
> > > | Date:   Thu Apr 20 11:20:43 2023 +0100
>
> > > with all the headers dumped in there which is just completely mangled=
.
> > > Note the rewritten author.
>
> > You should apply the wrapped message not the capsule.
>
> That's just not how any of the tooling works here, it is *possible* to
> unpack things but it's really fighting against the tooling.
>
> > > mutt also represents this incredibly badly, it just shows the
> > > "attachment" as the body of the message with all the headers dumped i=
n
>
> > I think that you can configure the tool to process this attachment in m=
utt.
>
> I don't know off hand what that configuration would be, and in any case
> it'd have knock on effects with reordering messages in the mailboxes
> plus the overhead of having to open the mailbox to figure out if there's
> any mangled messages in there.
>
> > > The issue I'm seeing here is the rewriting which I'm not aware of any
> > > other lists having turned on, even infradead ones which are also mail=
man
> > > based.  Either they're just tolerating people having issues with gmai=
l
> > > (which seems reasonable TBH) or they're jumping through some addition=
al
> > > hoops to avoid issues.
>
> > I checked infradead and they're using mailman 2. Mailman 2 does not sup=
port
> > DMARC mitigation.
>
> AFAICT that "mitigation" is actively harmful...
>
> > > I believe vger does sometimes manage some backchannel which probably
> > > helps it somewhat.
>
> > Using a non-standard mechanism is not a big win.
>
> > DMARC is a internet standard - see RFC7489, RFC8616. It means that the
> > mailing lists cannot send e-mails with From from other domains which ha=
ve
> > restricted policies set by *their* administrators. So basically, all ma=
il
>
> I'm perfectly aware of what DMARC is, though I've not run a list server
> since it became a thing.  As far as I'm aware the backchannel stuff for
> vger is more on the policy front (eg, with stuff like rate limit based
> mitigations) and not anything to do with relaxing any standards based
> security.
>
> > servers violates this if they keep the From header. Mailman 3 implement=
ed
> > several types of mitigations and the message wrap is the best one in my
> > eyes. The mangling of the From header or reject e-mails from those send=
ers
> > is even worse (see [1]).
>
> AFAICT the only other option is munging the From without enclosing the
> message in a wrapper?  That's potentially marginally less harmful but
> it's still going to break things badly enough that I'm not sure it's a
> worthwhile improvement.
>
> > When I turn off the mitigation in mailman, my ALSA server will have bad
> > reputation for gmail users soon in an unpredictable manner. I also saw =
that
> > ATT incoming mail servers had similar issues. We can expect that the li=
st of
> > the ingress SMTP servers not accepting e-mails based on the DMARC polic=
y
> > will grow. It's something that we don't have under control.
>
> It's not quite that broken.
>
> > If we don't find that it's time to move forward and accept this policy,=
 I
> > can turn off the mitigation, but in a cost that gmail (and soon maybe o=
ther)
> > users will bomb me (they already did last years) that the ALSA mail ser=
ver
> > does not deliver e-mails for them. Are we a community on internet or no=
t?
>
> > Ideally, we should start upgrade and fix our tools...
>
> > Let me just know, if you (and Takashi) insist to turn the mitigation of=
f
> > after this discussion. I'll do so...
>
> I'd really like to see it turned off, in conjunction with the
> suggestions from Konstantin for passing DMARC.  As far as I can tell the
> standards are not so broken as to be unusable, though any list is going
> to have some issues with gmail due to things like people incorrectly
> reporting spam (eg, when they want to unsubscribe or didn't realise what
> sort of list they were signing up for),
>
> For the signatures thing IIRC even before this change to wrap things the
> list server was mangling incoming siguatures, they'd typically not
> verify if they came through the list - I never checked into it fully
> since it was just something I had to be aware of but that's been there
> since b4 had signature verification.  I *think* ideally existing
> signatures should be preserved, or a new one added if there is none.
> That may well be more of the issue than anything else.

Last time this topic was raised (on infradead), I talked to someone from
Gmail. The ask was that originating servers implement DKIM signing, and
intermediate servers, i.e. mailing lists, not mangle the signed fields.
The latter includes not adding footers, and not re-emitting headers, which
may alter the amount of whitespace, based on some of my experiments.

ChenYu
