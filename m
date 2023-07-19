Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C19759CFA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 20:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E111F3;
	Wed, 19 Jul 2023 19:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E111F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689789602;
	bh=Wi+LNMfR/Tz//DqwsS9WjOFzP/lTw2sLHYGwQYYciDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOCSSycuAVLFKAXZ04qbHI8X7cRGtWjM6IhtGuKThycKkeiqLvgKYR2pvG5Rza/Y8
	 dDUkQ0L3s42YkU7fsvixz6abKgxhQT6dPw1HI41iXnVpbMnaWiYjJSDAarWMASh7Jb
	 WCBS4nNCe9VUEYSBLT3tKrAA6Xw3mItzwJhGNnR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4748CF80544; Wed, 19 Jul 2023 19:59:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F08D4F8032D;
	Wed, 19 Jul 2023 19:59:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F0BF8047D; Wed, 19 Jul 2023 19:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B488F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 19:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B488F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lBj8+nwC
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-262d096149cso1317139a91.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689789542; x=1690394342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi+LNMfR/Tz//DqwsS9WjOFzP/lTw2sLHYGwQYYciDs=;
        b=lBj8+nwCuwo596pTyfKXaKrt8yhokPjU3bVcfwCcKcL3iROHxYhHCsmM/soc06CwW6
         BTq62R05+jBWHP8hDAG1coMUVVIqr2/XqxsLAubJyzhbV4q/OR80cns6jxg/J8XH0ooJ
         bxj4mMWhu7x1oBSTP3WGWRpy6Ay6pMqH4fx53iaxYP8OX5hNooeQMOudWEBSV8qlquCS
         iKK025wFAyieMuyayxhQ2AQISO16rdoeNSqewibItvGKfIYzNzEC3HyHqcAeoI8olFsy
         z3qCsZUbNgIE96F5JaY4mIe2nGMWqWX8+HgP/Yog/1TBhArv34r8hHEqk4BsokUIDlC6
         QV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789542; x=1690394342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi+LNMfR/Tz//DqwsS9WjOFzP/lTw2sLHYGwQYYciDs=;
        b=Z60W6pOrmOkwAm1MPvR7HXlIhrXEwA9ZBvWQHh3GOf8q9SJP69IYz6rYu5rkeUdxHs
         ILJVW7HMNBLsBEoW6xrNW4tuh1joUK6Nb0mawqhZFlJu9uCKpoDFpoNP2uq25XKU1rDk
         rW81wjAWs9kC9pOVlvXKmTpA3DZnHrmlhHt9X70eLqxDfR4cPEpsrqrZWKh4umV/hREV
         7I8Aq7k5RoXs4nJBTOas87lhwIdvP9lrpeToZpJMFOK22s4y0EdA3fwcd55Byzc0ypQf
         hs94YQKr0Z3Q4aD4x6rJ3KeY8ctDPo5lEf60voZGXPenbiTswnjc0TlJDrnPDq1RpoQ+
         xP0Q==
X-Gm-Message-State: ABy/qLZbUsxJLyfgtW43jXVTp3y4VaexkqgbPVlfYLRNkfSmsZTKkpZW
	Ox0FFxV1+LhkWXRsataD2HeQopJNgonXZXtVMhjkEaKmkmI=
X-Google-Smtp-Source: 
 APBJJlGqJI4W82lqYn39sz6kXvq00es8CQ163Oepw2UdWjqWLwEUM7xFGagEC7laHVQIwU79fsL2lAeMrml2BlMljKY=
X-Received: by 2002:a17:90a:46cf:b0:258:9621:913f with SMTP id
 x15-20020a17090a46cf00b002589621913fmr2794428pjg.3.1689789541792; Wed, 19 Jul
 2023 10:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230719164729.19969-1-matuszpd@gmail.com>
In-Reply-To: <20230719164729.19969-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 14:58:50 -0300
Message-ID: 
 <CAOMZO5DOAWWQoTRXbx5DaCx2Hr79YN4bx1DKBywKQOEp6GLARg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Silence output on stop
To: Matus Gajdos <matuszpd@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Stephen Warren <swarren@nvidia.com>, Mark Brown <broonie@linaro.org>,
 alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QRBMJMFRZQLTNWY3J6NDKP63X3WSAXPA
X-Message-ID-Hash: QRBMJMFRZQLTNWY3J6NDKP63X3WSAXPA
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRBMJMFRZQLTNWY3J6NDKP63X3WSAXPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 19, 2023 at 1:48=E2=80=AFPM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Clear TX registers on stop to prevent the SPDIF interface from sending
> last written word over and over again.
>
> Fixes: a2388a498ad2 ("ASoC: fsl: Add S/PDIF CPU DAI driver")
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
