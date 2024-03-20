Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58C8817C5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 20:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED8D2232;
	Wed, 20 Mar 2024 20:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED8D2232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710962297;
	bh=MBTDd4Sgm7GCekrahP/ZgnS0DUe6n6leXbtOc9gZQv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oYIVLlCoUMt6ALtGVm0GfFfXSCJZA38hgxYcM1NhfMYfGdqKal6up42bkOmQ9XIBQ
	 s7MsFdldsIFaUevNqmxC1aHeKOEylzUaS6bOWwGJcpasr0YGhuCLTMGs+IltWMSqy1
	 4YjOWNyvQn1X+AqN9n4yGdIbT5gJZSu7PxlLz0HU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D47AF8025F; Wed, 20 Mar 2024 20:17:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A0DF80587;
	Wed, 20 Mar 2024 20:17:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DF2F804E7; Wed, 20 Mar 2024 20:17:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F2A8F8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 20:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2A8F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=cqhwcWPl
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6e6ca2ac094so270054b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710962249; x=1711567049;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBTDd4Sgm7GCekrahP/ZgnS0DUe6n6leXbtOc9gZQv8=;
        b=cqhwcWPllbthNpQ9+hF2fc2VNmNJC/myv+bEdctVYmruZS0gF6BQ1X8YvYbpK56aXl
         a7T8RkOMxq16VjHSJBfDK155sZ+R6iJ+PLypElHeVZvgpanljC28QolOAmm611hdG0p9
         tVwbW2f5HLSEyjU7phgQQdLhuoEgM7oPBvl8G8VGekgwfReVeDsxRnQjeN+fo5IXhDo7
         ieW4+KfOYpUkfL+uFyU+jvdrBeGtoG2hG5Ol3xl2YyxEbtlpsVgWg1FsI1Jlc8r6nKXX
         fjVyCr5+XTMFJNfH/r7dkBK9WRlPPlk56l3NFuKZwz0MscQ1lOpIbVSJzd15SLhzqnF4
         q6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710962249; x=1711567049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBTDd4Sgm7GCekrahP/ZgnS0DUe6n6leXbtOc9gZQv8=;
        b=HAZ3YYWI0/zsjm5F5/EQfroK7zzwlqrnge2kKOUoEkbr87vd1xYLaA8Rs7MQgwinmy
         wcCspXHCJjHjSHLtxTp/8CkugBRmZkHYJ6qDiZxRRa6DjQUz/PFFfuyHqtJmsqQb80/x
         CKAzCkFnWMiPyrsHJv5pPAFn1ABziMPS5Pq6qqMvx3PL/KEu3QxOzcS4ZcV0o8G951nB
         Om9VBKn1sxwTZ+vHn3hgm3Qrh2bUXilCOpISW9Y0hyzgX00zlWrB9o0Rlj6KCE0bJQC6
         oBJ2eJG6r5SRtporVIgboj7mZwcuGtRtydCz0LOQk3/X/fQllCs5idyagim49UNe4b1i
         JxHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMiHHf1twLE2zpAEDb7+BgRdFNPBcFPFZfcXYUgCXkC5aaPo3zu4V2dPxB1Isjhnp11XDpsbNtm/m+m8SW/X7x9ajiEChucAY+Bfk=
X-Gm-Message-State: AOJu0Yz42SzQtjp0xmlfBcKTY6Wi/6MTkBXjmrqO83hs4PKNUs7CRYkl
	mam7PmoUS9q69zXDYFE6p4EN8uK3MOhyMnvbuO1dclPeiesUeO+lji8GUN9chmA2+xK/5XB+02k
	GMt5lXIY4J4jaPrLUdxmI8J1sZ8Csj7cWYIoc
X-Google-Smtp-Source: 
 AGHT+IFOJD/TzqtiiBn7zSi2/l9GNqwQ5E2P8Ulmai7Ji4BfQnTjDExKBUdAYc7CBD3ahNbpE6IQURuzlZ0taoYFBT8=
X-Received: by 2002:a05:6a20:7284:b0:1a3:7e72:316c with SMTP id
 o4-20020a056a20728400b001a37e72316cmr5629621pzk.31.1710962248945; Wed, 20 Mar
 2024 12:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240318183004.3976923-1-cujomalainey@chromium.org>
 <b1cc3856-fd06-4f3a-b7ff-4dabf249b68c@collabora.com>
 <CAOReqxgt5HFDFmW=mB0=hq04278McFVCeGuz08_G=v5Fs0NWHQ@mail.gmail.com>
 <6273f41a-1ab7-40d8-a9ae-262b7cab2981@collabora.com>
In-Reply-To: <6273f41a-1ab7-40d8-a9ae-262b7cab2981@collabora.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 20 Mar 2024 12:17:14 -0700
Message-ID: 
 <CAOReqxi+bws9b0m+x7xCKajcr-P78X9VCRyg-SAa0K0CitCSVg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Wojciech Macek <wmacek@google.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
 Rander Wang <rander.wang@intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: M5ZH427R5R72MC77W5EDMB4E2XGKTZX5
X-Message-ID-Hash: M5ZH427R5R72MC77W5EDMB4E2XGKTZX5
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5ZH427R5R72MC77W5EDMB4E2XGKTZX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 20, 2024 at 2:06=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/03/24 16:51, Curtis Malainey ha scritto:
> > On Tue, Mar 19, 2024 at 4:07=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 18/03/24 19:29, cujomalainey@chromium.org ha scritto:
> >>> From: Curtis Malainey <cujomalainey@chromium.org>
> >>>
> >>> Default firmware shipped in open source are not licensed for 3P
> >>> libraries, therefore topologies should not reference them.
> >>>
> >>> If a OS wants to use 3P (that they have licensed) then they should us=
e
> >>> the appropriate topology override mechanisms.
> >>
> >> That's ok, but still needs the sof-mt8195-mt6359-rt1019-rt5682.tplg fi=
rmware
> >> in linux-firmware, or this change breaks sound.
> >>
> >> Regards,
> >> Angelo
> >>
> >
> > Got any docs I can refer to? I have never contributed to
> > linux-firmware. If you are willing to send the update on my behalf
> > that would be fine by me as well.
>
> There you go:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/tree/README.md

Thanks, I have spotted some other issues with the MTK builds, so I
will be following up with them on this to get it updated.

>
> Anyway, can you please also describe what is the appropriate topology
> override mechanism in the description of this commit?

Yep, as I said to Mark it will be part of v2

Curtis

>
> Thanks,
> Angelo
