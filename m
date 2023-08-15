Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83077D338
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33F785D;
	Tue, 15 Aug 2023 21:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33F785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692127144;
	bh=yT+ibaQLIWCz8w7tHkW5NfaPrwF2Dh1AfWMPw+NLt+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XBc6v118AhCEQ5veNwjrj0cYpdKRlfn/yibx/poAFs8pdtgg1gKKireiB1FUNi60x
	 LpzwXN91qxflqGpk3BBM8XJZwsGncRUifRoAm7HNh9Xu83sIAVy8F9UnMxqmIR8X3v
	 qs/Df29EJtHq+4yvgr+ZVzNtCnAOPycxMDA8g8VA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 511C1F801EB; Tue, 15 Aug 2023 21:17:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06FE7F800EE;
	Tue, 15 Aug 2023 21:17:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B71CEF8016A; Tue, 15 Aug 2023 21:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B26DFF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B26DFF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=2O0zBWyY
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-688769faa09so434692b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692127054; x=1692731854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT+ibaQLIWCz8w7tHkW5NfaPrwF2Dh1AfWMPw+NLt+k=;
        b=2O0zBWyY7WqFZ7ubuizgne/lPWgW3xMd/00DGH+MyMXXIXb4nI3+Nmgz5ixRjmK4bJ
         2lrAJxa9KWlny5zW1ls/kwPAe4ziThzQAL4fBpY6m7IpT+q1PiajlttXw9wkgL+ehKMe
         SB8kw7mhElbcHYtoY/2JDcRmHCOwwQS4pxaycUR0Cxh//4UOdwkxlQ2vJybccOCUT+4i
         OgIoqGZ/xnzFFOznRYWpTlKq/tK/jZ6k2XYmuIaD/0bpSOl01umQ2KDzgsUVvgesafUx
         1lM2JPzZXgcuuOjuIhsFiM9SHt/ghPAknj7tFjztNG/uvwtJ/RL9zz3GMkqaksB9buOo
         MrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692127054; x=1692731854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yT+ibaQLIWCz8w7tHkW5NfaPrwF2Dh1AfWMPw+NLt+k=;
        b=XLyMRh8o87GUO2FknrJS2uUoSuzpo0XzM+zbF2h+HsF1Xn/eDSs4mdaJ72iJ0d8cqo
         DR05Xw8alqLsXOfn65omVzkRLM6ckb4eavljLjYluPz5HAQuzKSznF+QmULaTHjsUFTx
         26obnDg0doKwwmWap7v4Bb1pRn1OojT+KoOG+l7OWaoobW5oBsW+xkAmLLoF/wUDyGFR
         PMzv6P2MK/Ef5aAwKG69nsNexwQCs4hBRpAYWw7wU9L5iv5dkXjC0GGmVb54a6ReoUPY
         MYsDYYWsPofbk1Y4SlslGQR+ac6+/B0NsWTLlmbPyrHR559ZOB0xnl9EsMStqWMn/j88
         r98w==
X-Gm-Message-State: AOJu0YwATCkBQMmKaIWEPNC9hUpfWm1cuPNQYug1xwyhwLw6Fovveh33
	ye6lN30z2g5G+RXzc1cpEC2wY7QeV3OuqmMMq4alXg==
X-Google-Smtp-Source: 
 AGHT+IFKDzhSCZd90m02n5uigwN9ZIdVzwVftAWOR3pJD4PBQfD5J4TFHjevVIaFyB+y1F+b26ilsZoqCBKGydLnEX4=
X-Received: by 2002:a05:6a00:891:b0:679:bc89:e45 with SMTP id
 q17-20020a056a00089100b00679bc890e45mr13930352pfj.6.1692127053803; Tue, 15
 Aug 2023 12:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <ZNuDLk5hgmfKrZg6@arch>
 <850c5b2c-265e-a565-8a88-58a88f8fb4e8@linux.intel.com>
 <CAOReqxjbjkhkqfvTWs9i5NxK6QAsk42Daw1pA_1+b1zG5mbKmQ@mail.gmail.com>
 <ZNuyuerb0M6IGRKj@arch>
 <CAOReqxi_fkthH7SPdQ6ycyMx+2Mpi+JHHYhPJKi-u82SsfN9gA@mail.gmail.com>
 <0beda41e-8dfa-054e-4069-7298b4caa879@linux.intel.com>
In-Reply-To: <0beda41e-8dfa-054e-4069-7298b4caa879@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 15 Aug 2023 12:17:22 -0700
Message-ID: 
 <CAOReqxi+N6fMxjraq3XJjdagG6+Z5p0PC9NV6yDJmF2hAJKp-w@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Brady Norander <bradynorander@gmail.com>, alsa-devel@alsa-project.org,
	broonie@kernel.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	cujomalainey@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FMT27EQDIQPMLATGW27N37HVX2MV3RWR
X-Message-ID-Hash: FMT27EQDIQPMLATGW27N37HVX2MV3RWR
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMT27EQDIQPMLATGW27N37HVX2MV3RWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 11:28=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/15/23 13:00, Curtis Malainey wrote:
> > On Tue, Aug 15, 2023 at 10:15=E2=80=AFAM Brady Norander <bradynorander@=
gmail.com> wrote:
> >>
> >> On Tue, Aug 15, 2023 at 09:56:44AM -0700, Curtis Malainey wrote:
> >>> On Tue, Aug 15, 2023 at 8:56=E2=80=AFAM Pierre-Louis Bossart <
> >>> pierre-louis.bossart@linux.intel.com> wrote:
> >>>> On 8/15/23 08:52, Brady Norander wrote:
> >>>>> AlderLake and RaptorLake Chromebooks currently use the HDA driver b=
y
> >>>>> default. Add a quirk to use the SOF driver on these platforms, whic=
h is
> >>>>> needed for functional internal audio.
> >>>>>
> >>>>> Signed-off-by: Brady Norander <bradynorander@gmail.com>
> >>>>
> >>>> Thanks for the patch
> >>>>
> >>>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> >>>>
> >>>
> >>> Now that I am looking closer at the patch, I am very curious why we a=
re not
> >>> hitting the following case and using SOF
> >>
> >> The DMIC detection looks for DMIC endpoints in the NHLT, but these
> >> devices don't have NHLT.
> >
> > There would be the brokenness then. Is the DMIC not something that
> > shows up in coreboot? Or is it only defined in the topology? If the
> > latter we should probably extend this patch farther back to GLK.
>
> You don't need to expose mics in NHLT, the premise has always been that
> Chromebooks are assumed to expose 4 mics and userspace w/ UCM takes care
> of selecting which mics are actually used on what platform.
>
> Also there's a difference between NHLT (ACPI table) and NHLT blob in
> topology used for IPC4. not the same thing.

Thanks for the clarification

Acked-by Curtis Malainey <cujomalainey@chromium.org>
