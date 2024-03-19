Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BE88012F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 16:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA1D2BAB;
	Tue, 19 Mar 2024 16:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA1D2BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710863562;
	bh=awRYUBOdpu27RopfNSKP5TIzpnx607mBlyDHmt4YjxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhL7dRhdc2t5/oB1+SQAt2WIoJPFxVznNT/lTLXyxg+i/3WzHS5CgKlEisLWDx6+H
	 bbwYOs7xSJ0bYl9Ua1Mi2dOQ7ckx1EfLnOdq7QVTqR0mwTgmScMYZGXuBEiFpxp42t
	 J2MyUi1JqJVV4AEQmPjPPB40oGNKEtiVzjbpgU5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7293AF8059F; Tue, 19 Mar 2024 16:52:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E03F805A0;
	Tue, 19 Mar 2024 16:52:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26296F804E7; Tue, 19 Mar 2024 16:52:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80E2EF80093
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 16:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E2EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=AxFS8yKb
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso3448476a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710863516; x=1711468316;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awRYUBOdpu27RopfNSKP5TIzpnx607mBlyDHmt4YjxU=;
        b=AxFS8yKb2tsbAl/bpk2hW5sXeajadW81MFkbaa73/yE3TUpOoA8SkmEo/OAb6ArjNz
         VOuxsSIFCgN7/r3FrcFCvvpKAbXY+F2dzZ1iZstc63T3/cLlycy7fjCdzliU305Bfqjz
         gfANzKS/OST7fVKt30B7iOszFcELZu0s+IRAny209EsK5Pqb+8g/tz+xQKJAj7b0kuw5
         o0EVxGN4XanOQHd/CXfJ13F+2jPPtDcJQyZ81mLqgidlCj94yTxWoMIU26emSCkUOI5s
         V+8/HDogUjrSldbKXjtqMSpxxvdoXN2uky7Jyk/CsbzLPV0FOnpnz5w4IIDGllDkKxZZ
         tRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863516; x=1711468316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awRYUBOdpu27RopfNSKP5TIzpnx607mBlyDHmt4YjxU=;
        b=uRUp3wCRoVZe+d2tJx0hOXEPnL9AjHgRbXRyUttQ7hqCjrr1PedOzE5RtZrIF2n7wN
         96qLCS/vngw708DgRJ50GRqDXdZiqGJtKhR7jh/CVtjva+r3vJJFd00Pg+9reFcjbrHb
         fykIXuPhg7Y48gxxYrUBPvLc21c1sl91zArG15QVwOnoS+kSTSctCMckaixgQNOkE8uK
         7IglFP0OfOnt/rL1VxdoxBL0xXSXyTWsE8OVirYNqfsMd4+O+/XJkRJIy2JVh1jbYISe
         YovgdGl7SQGCi+rQWhCO1mAz5L8CsjARbeS/iCYSJiQ58F/IRrc+OHdYXN2oM+p/pjCT
         ujzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1c3OZGbkeCbk5c8a6DF3h8CwlEOCjLhJRe2cThNSxZVE2iPNtf6B5qWAutXXARpcUz03vpD/bfm3f7RPgVvZRvvVOz+57b43gneQ=
X-Gm-Message-State: AOJu0Yx4H5FJdEhNgpbjgIWdD6sgCFPdMLSdiWrEIns6Ns4IjlSSQHfW
	Rpga6Tbm2R6hvh8mNGhyxcow6EgVti/K5rrvCX0y4EQWFLo03o6JT+F0/HGDrda/SdcxPA3Ywpj
	G3nOyB+9RvoXDElyXeiaeYTAtCUU9S9Yv/9Jg
X-Google-Smtp-Source: 
 AGHT+IF7Z5M4SIvoa1R+e2eHqCmOjkt6NFiHrucLTneU8yD8OGHScoFySE9XpZpfQdqYjqUUTRoLeSk4i7e1Revpm+o=
X-Received: by 2002:a17:90b:3017:b0:29c:7908:b111 with SMTP id
 hg23-20020a17090b301700b0029c7908b111mr10322265pjb.30.1710863515966; Tue, 19
 Mar 2024 08:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240318183004.3976923-1-cujomalainey@chromium.org>
 <b1cc3856-fd06-4f3a-b7ff-4dabf249b68c@collabora.com>
In-Reply-To: <b1cc3856-fd06-4f3a-b7ff-4dabf249b68c@collabora.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 19 Mar 2024 08:51:40 -0700
Message-ID: 
 <CAOReqxgt5HFDFmW=mB0=hq04278McFVCeGuz08_G=v5Fs0NWHQ@mail.gmail.com>
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
Message-ID-Hash: GJPKSJKU353CQNJ2GJ5X4YGJ4F463IP3
X-Message-ID-Hash: GJPKSJKU353CQNJ2GJ5X4YGJ4F463IP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJPKSJKU353CQNJ2GJ5X4YGJ4F463IP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 19, 2024 at 4:07=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 18/03/24 19:29, cujomalainey@chromium.org ha scritto:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > Default firmware shipped in open source are not licensed for 3P
> > libraries, therefore topologies should not reference them.
> >
> > If a OS wants to use 3P (that they have licensed) then they should use
> > the appropriate topology override mechanisms.
>
> That's ok, but still needs the sof-mt8195-mt6359-rt1019-rt5682.tplg firmw=
are
> in linux-firmware, or this change breaks sound.
>
> Regards,
> Angelo
>

Got any docs I can refer to? I have never contributed to
linux-firmware. If you are willing to send the update on my behalf
that would be fine by me as well.
