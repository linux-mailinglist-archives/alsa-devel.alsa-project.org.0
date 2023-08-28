Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74078B6E8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 20:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C289E825;
	Mon, 28 Aug 2023 20:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C289E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693245668;
	bh=n0IFqnXf/VUWsYITAErkbGNOq6yGhNZPkdLcgUuiwGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BdKRrHX7QuLVl6auiRaojfPBYBeecAzJ7yL9ab6SqHrz9mVp3T/Ikk+y0fxdW4uQ4
	 NfYREhHO+Teg1P14rDBeghAYTMYdByYFDy3o8CyIxGb9AQ1ZxOcw3dfKDPNCLIemZM
	 1ooDsk88TZuLtoeVtuUgecQFovqo0sI6Z8TzK7XM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77F57F804DA; Mon, 28 Aug 2023 19:59:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E22E3F80155;
	Mon, 28 Aug 2023 19:59:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06CF2F80158; Mon, 28 Aug 2023 19:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82937F80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82937F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=KVoiVUbV
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a85b9deeb3so2539503b6e.1
        for <alsa-devel@alsa-project.org>;
 Mon, 28 Aug 2023 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693245588; x=1693850388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSSauVb2wZ841qY9y1hcmC2/NnHP5T7xzlFnBhfLMXw=;
        b=KVoiVUbVVr1a7Dpn7G9TzNWAl6e7W9EDNq4xpJAzSRJRSzjbcj5mA0H66ySDWKVKDn
         92RzswlVcdg8KLtZ6d3wZ9MpfrrenKATjxadfpFxChdSyvEhS08mnvFjEvsvT01zKq7q
         tzhHnf3YtScJMq8qbBm818dkYeoez5DkhA/vldA4ctaSmgTI4dHOKU+SLhhxxLs27fQR
         mqjM3eAZKoYkgycsdErmJVMCdXiLmN5Hp64+GG2OYxKWnTBHklNQYQnZIB3M4raibPeK
         q/vw69qI8a3a74YndxVOK4JvOtAVAweblAi6NMRa4m+8HKwfbBCTacBqMrphU/+ECoSG
         nj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693245588; x=1693850388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSSauVb2wZ841qY9y1hcmC2/NnHP5T7xzlFnBhfLMXw=;
        b=Ppwwa1HWGxlMQbtXF4pTMOUnOmbAs+urhrMrnNJ4kGoUO2kMwZrHnXxjwEmfdlbiF6
         EyOi5A9DDkHJpLiUfc/OfxJt70IzhQtCf4TC5oZEuO4DyiVsFUsdhawY1U4zOyIWVA30
         GFOvFSO944rGnyLNd8ugAHOk3cEQBMyYAVwHm94FuelVaMH2GV9MQSdpIRNYAuHGdf/t
         y0Pxi5K/KzwZepoplBblkykKmxyPkcZQUrm+BSt0IAGO+eMl5Kry5Ft+k43w3KIXohRT
         +oJ+RzaiKj0jQlYniKbwx5QpA3diuG4qs4g8NrmID1Xyy5AIiqaorDjBzpUtJrjqkxHw
         SyJw==
X-Gm-Message-State: AOJu0YzBoCUQxLEGpl6MmrCLP2HUoDJ3tCYrKU8h3ppszBFUb0Fmrkua
	rZWsAelylE6HZwqC/fApguxckkddIBD1IKWRBqk5uQ==
X-Google-Smtp-Source: 
 AGHT+IF2MZTPXoklH3lJljOmfNLhqbBCFe5BnShW5swiv8F0lZqzOGNALoAPFC2nJnPUEKm2jSm2W9TvlhCt7pfrO0g=
X-Received: by 2002:a05:6808:d4e:b0:3a7:44da:d5e6 with SMTP id
 w14-20020a0568080d4e00b003a744dad5e6mr13966662oik.38.1693245588053; Mon, 28
 Aug 2023 10:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
In-Reply-To: <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 28 Aug 2023 10:59:37 -0700
Message-ID: 
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
To: Jaroslav Kysela <perex@perex.cz>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
	ethan.geller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6B6I5NDERRH7SHFCOLFVBWYRRVQ7F2Y7
X-Message-ID-Hash: 6B6I5NDERRH7SHFCOLFVBWYRRVQ7F2Y7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6B6I5NDERRH7SHFCOLFVBWYRRVQ7F2Y7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 26, 2023 at 4:28=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > Sometimes userspace may want to use a reference channel to cancel echos
> > when using video chat, this value identifies the device which carries
> > that channel.
>
> The UCM modifier should be used for this - see "Echo Reference" comments =
in
> use-case.h.
>
> Note that this allows additional setup (in Sequences) for this stream.
>
>                                                 Jaroslav

I was under the impression modifiers were state manipulators that
acted upon existing devices/pcms and did not designate their own PCM.
That is at least how we use them in CRAS.

Are there any examples of how to designate a PCM? I don't see any
modifiers at all in ucm-conf repo.

Curtis

>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
