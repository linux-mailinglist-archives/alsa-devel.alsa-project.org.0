Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A96D9FD4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 20:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C096F71;
	Thu,  6 Apr 2023 20:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C096F71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680805788;
	bh=6ik5bJD1nPzYRyb0IpKsydleSy1Kux9GLcZ9LeBoElc=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=VUtv573O7w0glUR3U2+/KhHWJAcXokQfaonK6hmM5WmZSlvlopcgbtmN3FnOUqlK6
	 jJ3fq933Ptd9jKk6avXHZClxlW+dLR8DNu+vW5g/nVfNTauhcZDFtQQ0lEINYT0P5X
	 xcFKaxQjxxOhIlsxNpK8pRnFy/KfHFQTzLDYdU5c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC84EF80171;
	Thu,  6 Apr 2023 20:28:57 +0200 (CEST)
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
 <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
 <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
In-Reply-To: <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
Date: Thu, 6 Apr 2023 11:28:31 -0700
Subject: Re: [PATCH 2/2] ASoC: SOF: Use no_reply calls for TX
To: Mark Brown <broonie@kernel.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HCGWEO37GFGHR5DWV5S3OXCKIZMGVS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168080573652.26.3251337021560568078@mailman-core.alsa-project.org>
From: Curtis Malainey via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Curtis Malainey <cujomalainey@google.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE986F80246; Thu,  6 Apr 2023 20:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41E5BF8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 20:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41E5BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pM5ZRRIk
Received: by mail-pj1-x1033.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso43733774pjb.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680805722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEzf2i3FlPC4ue7aO7pKT7jzZn21kj4HZudCO/+1sk0=;
        b=pM5ZRRIk7R3LsCd4NvwpxuUVoU/XBTQ4xaJiw0EpJTnWD9sB7Z89NgOjTRfM6WiZLl
         iWWMCkYDUsP4Do3dymKSN5Y/vv1t4F6Jn7P7UVdHDSUWj4BHoquGGz2fTQhd3/2g635V
         fg+hoV+iI72DDRL1D2bt47t6n/vuH7DJwVGa34WClfGDeY04tXrL4tO4sbJaqRg/ZFG2
         Mo/lo+ZZ21QuPslwI1NL2C27A7EgwclKFi3hc2wd6+y0JN+kLrxkYv8mJCvBLJHF6fgO
         ypsNxb7+yTXlnqj0vjU21IzEyACf/rcVJu0TUaDMC4bUy3F4rwCHsDu5j6VW1JT1Uxr6
         ke9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEzf2i3FlPC4ue7aO7pKT7jzZn21kj4HZudCO/+1sk0=;
        b=6IhP76muPoiwIaxTgfUlHO+vPXaokll42c9V66RMyHul0VF5AW0KC4aZqWJeQp9+71
         KDDmBcayz61hTIDkj6H0ktaAreEHvkWCwgvwB943o9eMj2QTTFh+sbZseUwyqSILM7Nf
         wYFlSXCTT8Di0Py2U5JzmAXZq84j2U05CVL6uYLM4aBC2tDBWAGHrfg9r1u7wiVcjABM
         fLFi96rRBSgus/HEdIB9R6jv/JxbkJ2JNysh9oa9xQp0NSIQGBKN3Qp31vLUJyZN51vk
         zhjhI3Slyv38G2MROk9Kx6X0+0+aNmKNr5T2vmgQIBF4T0F4NYlKjbttkXKunRk+5wSq
         IqBw==
X-Gm-Message-State: AAQBX9c6REWNyRsQP/BSR6RDU884sC0DL+LR4HHYC6tFIZx7uOrAjfQ/
	YMjLUtTgvNwSIswrbzDeIJ4t10qglLhoNHHbWluiMg==
X-Google-Smtp-Source: 
 AKy350aSp+LmN4PdDzuArNmgaccx8SQdRskKhK41/B/xjwU+yVPNF/gMgT2XX8jFJ+LSCnKfHlWgdlCjYkKMIMNuo+8=
X-Received: by 2002:a17:902:7c13:b0:1a0:51f6:a252 with SMTP id
 x19-20020a1709027c1300b001a051f6a252mr63970pll.3.1680805722245; Thu, 06 Apr
 2023 11:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
 <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
 <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
In-Reply-To: <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 6 Apr 2023 11:28:31 -0700
Message-ID: 
 <CAOReqxjnBXP+e4i_kh8FwtKQJjJU-MdAU8c-P44LNMkNs-O6tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Use no_reply calls for TX
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6HCGWEO37GFGHR5DWV5S3OXCKIZMGVS4
X-Message-ID-Hash: 6HCGWEO37GFGHR5DWV5S3OXCKIZMGVS4
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HCGWEO37GFGHR5DWV5S3OXCKIZMGVS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 6, 2023 at 10:19=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Apr 06, 2023 at 10:50:26AM -0500, Pierre-Louis Bossart wrote:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > Convert all existing calls that pass "NULL, 0" for reply data to the ne=
w
> > no_reply calls. Also convert any calls that pass in data but don't
> > actually parse the result.
>
> This breaks an x86 allmodconfig build:
>

This is because a9737808b3e4 ("ASoC: SOF: compress: Set compress data
offset") was sent first. Pierre, how do you want to resolve this?

> /build/stage/linux/sound/soc/sof/compress.c: In function =E2=80=98sof_com=
pr_set_params=E2=80=99:
> /build/stage/linux/sound/soc/sof/compress.c:238:46: error: =E2=80=98ipc_p=
arams_reply=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98sof_ipc_pcm_params_reply=E2=80=99?
>   238 |                                              ipc_params_reply.pos=
n_offset);
>       |                                              ^~~~~~~~~~~~~~~~
>       |                                              sof_ipc_pcm_params_r=
eply
> /build/stage/linux/sound/soc/sof/compress.c:238:46: note: each undeclared=
 identifier is reported only once for each function it appears in
