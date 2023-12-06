Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91880781B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 19:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90796112;
	Wed,  6 Dec 2023 19:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90796112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701888745;
	bh=57pYdkZXxNTl69tyM1R3kitwXfbiBPwpHu+Y+2er8Qc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qJsONnbWoeahAXLXqMThEBAgzkxIHO5/4WDdTpAFKSEEYJtA7B8Bdlm6ve10oaRVG
	 ZG0v5f84FImnSwKDbpYUclxHMXkvPZxH8X6MbrIocPeGXuz3iTTLokAsmvVTapLmOu
	 Te/8QitMjF4sElWEpeR+kLsY41aFhPHaG43JuWUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 419FDF80494; Wed,  6 Dec 2023 19:51:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64653F80571;
	Wed,  6 Dec 2023 19:51:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B9CF8024E; Wed,  6 Dec 2023 19:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AEE7F800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 19:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEE7F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=hjQqpetU
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c230c79c0bso49306a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Dec 2023 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701888696; x=1702493496;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57pYdkZXxNTl69tyM1R3kitwXfbiBPwpHu+Y+2er8Qc=;
        b=hjQqpetUUWiFUluz9etbvDiu92BoMir4qC+w4v88o5uCf1YiCrjvPHjPAcwY742iST
         3gxnUm3cH5I7ftnhHlyVqi31eJwIuoP8uf9fLwIFEF3g6wi6ag9tdEkc1oBthDSVueFF
         h88sLGQK31hnPMpOThpaCxgUsu/y3GluU4YfzIwdBz6t89Af0Xoa/XfbmO/h+3FokUZI
         ho6JhTwxG9kf0lHzq2ZP59DTWGC7hiqX+7BIMD2xN55Be+BeRmiCB5hfL++WiXAJfH93
         KwnaMBycDfyyq5pmyich8fB1lwxQ46cGtyZdGgEi2ew6mfxHx8RLxk/9Q7Dqy8k0tant
         OrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888696; x=1702493496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57pYdkZXxNTl69tyM1R3kitwXfbiBPwpHu+Y+2er8Qc=;
        b=jTZs3a9VdKdNc1j+CiKQJweliVPmOAlMWFrlRTUDH25cMniYJyKJT96JVZY2GWPEFs
         cdL7iCIZ1VN7b79sSEx2jvVICoxAaikEFattB3sgZC2GWAqvxHcDUOn1pbsvhnKJzdLv
         Upn8NXqG+KsnnJe/gx3tFr2oH8i4Tt34Hf9aFyA0MrAdEd/5C8QQKTz0r+J11ZudnPFa
         C+3TZI9vVHmwW0OAhHrjctDqQPdwDywdQu66AjMDGJt6r86p+V1h9txYlJaOT/Sh26Vv
         YbeReHyiDh+PxhoLEPNGpG08XEkuIPSq3ULv8hOHKnrdYYRCpL6h9+3BGt9UONpC7sCw
         qmcA==
X-Gm-Message-State: AOJu0YyxvIsxgqWqvC8/pPiz+a+zTK1iMveHWn1/+FefAfhdcshBmXiT
	8pMTI3mnuDHhTiKwjdB46c0nV/RyI163QGqR281A8g==
X-Google-Smtp-Source: 
 AGHT+IG2V+c4yPbtg8CkZMu5mPm8BSLC+B3BbUclMeKK8ZiBURUd6CkZQMU8hGXj4uX38pE0InbevT7DaJu4OamIwg4=
X-Received: by 2002:a05:6a21:3704:b0:18f:97c:ba13 with SMTP id
 yl4-20020a056a21370400b0018f097cba13mr1063415pzb.109.1701888696008; Wed, 06
 Dec 2023 10:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20231205220131.2585913-1-cujomalainey@chromium.org>
 <51d05129-837a-434c-af65-08e9ea9fb7a4@sirena.org.uk>
In-Reply-To: <51d05129-837a-434c-af65-08e9ea9fb7a4@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 6 Dec 2023 10:51:24 -0800
Message-ID: 
 <CAOReqxiqobODtcoHRc6h810hbQmTeGpnNgVWf=nJjB_UffqRRQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
To: Mark Brown <broonie@kernel.org>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: X25JBDJG5SDKOUBLJGIER4HTZEITZ3LE
X-Message-ID-Hash: X25JBDJG5SDKOUBLJGIER4HTZEITZ3LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X25JBDJG5SDKOUBLJGIER4HTZEITZ3LE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 6, 2023 at 6:21=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Dec 05, 2023 at 02:01:18PM -0800, cujomalainey@chromium.org wrote=
:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Apologies, here is a user friendly summary

ASoC: SOF: mediatek: mt8186: Revert "ASoC: SOF: mediatek: mt8186: Add
Google Steelix topology compatible"
