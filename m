Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32664785CC3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 17:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D91F83A;
	Wed, 23 Aug 2023 17:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D91F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692806264;
	bh=D5pfJtYALrOy10ugSYtWsWCb+1mVFN7xrMWbS1+dIm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1L7kEqnnOHzxmYVnKmthp8HgMl1/noA/ETU97bzWVy0MkbPI0fdrKual/7Dr7ijM
	 yb3XVBMnvUBPvy60N44wcs6kjBNWkgMYPke/XakPYE/xR7/u/8bqOtGgx8K2UgtRZ1
	 DxNop3YtiLQan4viAActkst+I0D6TPwC4H4MWc1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 977B6F80158; Wed, 23 Aug 2023 17:56:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3A2F80022;
	Wed, 23 Aug 2023 17:56:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9446AF80158; Wed, 23 Aug 2023 17:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0D48F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 17:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D48F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=jTx2Xoca
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-58d70c441d5so62771697b3.2
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692806108; x=1693410908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5pfJtYALrOy10ugSYtWsWCb+1mVFN7xrMWbS1+dIm4=;
        b=jTx2Xoca2FNIefIIdk2CZzjW+bIp4mr/uyVEEXrvtSC417hepEwvHBm8tboVAb8D4s
         nvAQavxRZyjuEgGB0uX1maRV3bpfT699xM2sC4tEPIGgoTO9f/fgk/PSUJrv7a9gnHAc
         b/628CUCMFZPE9YQdcMfV4kn9JgJxOT23rIGI8MYv2XQh7jwq8GMG6xGodcrDNBP2uI8
         Z2FCAi2A1nIzCbSpJP/R8kXV4C7lrx2vxmvYJ1GoKz+q6JyDOMUGB0YQMLvz7HPsHc65
         X6KNrMzsvPxPhfzamcdHG/f2yt068mUzvo6VIw/Il2j2xn7HsA+QmV3sQO4OZmJUSwel
         fJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692806108; x=1693410908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5pfJtYALrOy10ugSYtWsWCb+1mVFN7xrMWbS1+dIm4=;
        b=HktBL0/sBrDu3cTnVBwjrVxIQYz7G5Ptzpo4tlCdSW0jQfn2VHuK0Md+W0fWBJ80N7
         sPCKisNLIVhIPEDu3GNyBMDiTLpoOkR+4Or9E1i8ggXLo6O/ufn4G2+NCGlB/TDDgr4T
         e34cSRDrZSw0eIT8PWfHvge3GoZAfgeHNNdpfg650JH5tEmYSnAKL2kB5vyS9XcgQnxp
         X8vL6tXlZX9NXrnoSqNYG8eddhfG+g6LPLfQjocYe2Or4T4vMZTAR4qM/jTZwEVkUJ3d
         y5GkUTQ10Yh4YLouoA5ua1TmMMsZaowmFXBIpgqx0HEr/C0GxfNv33VSyY1cFW7gM/ta
         cTpw==
X-Gm-Message-State: AOJu0YzqKbIOrmfY0dZmfuZjK/9tXlxa4ZCZkfkEML5fw7KWtf6qkt6k
	6B4d23Ivj/SC6rQX6XI2Er3kazywjd01cigH7IfhOg==
X-Google-Smtp-Source: 
 AGHT+IHPwTFcG8Rs5xra2L8n7+FakwWLs/CKLvB8qkq4zWmOeDPeZ0NHII3jC8pM+SwB+djmNeGRuRx60ihwEoaOA+Q=
X-Received: by 2002:a81:c211:0:b0:579:9cae:e0ee with SMTP id
 z17-20020a81c211000000b005799caee0eemr13494444ywc.20.1692806108154; Wed, 23
 Aug 2023 08:55:08 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
 <dd6d51b0-cc60-4fb7-932d-1117143d1715@sirena.org.uk>
 <CALprXBYxrwBW6HLP5MwYhFh1_Skei+pLbXd7yNAEuhLTQJLVPg@mail.gmail.com>
 <2ebbcb7a-bc0d-4f62-9f4b-706f0270b71a@sirena.org.uk>
In-Reply-To: <2ebbcb7a-bc0d-4f62-9f4b-706f0270b71a@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Wed, 23 Aug 2023 23:54:56 +0800
Message-ID: 
 <CALprXBYEqAoj5H3n+wszocmhRQ96vLq5d2tYhBOdJnCbs_YY-w@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "ASoC: Intel: Add rpl_nau8318_8825 driver"
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
 Libin Yang <libin.yang@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>, David Lin <CTLIN0@nuvoton.com>,
	Brent Lu <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.com>,
	Terry Cheong <htcheong@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, apoorv <apoorv@intel.com>,
 alsa-devel@alsa-project.org,
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SNEAHRYINM44FPELL6SVTJXXVYN7ILJ5
X-Message-ID-Hash: SNEAHRYINM44FPELL6SVTJXXVYN7ILJ5
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNEAHRYINM44FPELL6SVTJXXVYN7ILJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 11:51=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> That's my CI tree, things in there aren't going anywhere unless they
> pass testing.

Hi, Mark,

Thank you for your explanation.
