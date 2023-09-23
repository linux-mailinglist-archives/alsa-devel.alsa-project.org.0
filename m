Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A767AC30E
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 17:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2008A4D;
	Sat, 23 Sep 2023 17:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2008A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695481445;
	bh=+H+abSaDbBChdPoj9wIM9Oq09zhR9bO2gT2uGE2rThE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QSSv2FCdQQjWbZg067L6UrLNWPdmFEkf2em3GQqXSxNwXKXRm1TVlvmoJwxe1b8Wz
	 XK9lEp5vKDyy+KGjruKCO1HIpEoohtQ1DQRsWcHKcoC8GQow/rn5gfgQEaFlauuCaO
	 g/bwKS5z35gcqNmND/EiPrYjUNfGwgzXZCjy3tjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52EA4F80494; Sat, 23 Sep 2023 17:03:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AFCF80125;
	Sat, 23 Sep 2023 17:03:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40C2AF801F5; Sat, 23 Sep 2023 17:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A725F80124
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 17:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A725F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T0e5utT6
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so11569271a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 23 Sep 2023 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695481385; x=1696086185;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf35qT3wdmI9FAWcSv+LLoKLH4mSf1lcVMZuMPVU6oU=;
        b=T0e5utT67mwXruhLPWuClhld1ZcSMMOeb2yVYKndW/hvIuMz+vTzMB5vlkFRJiz7Qj
         JoyOSEOxmWO8W1/BW9iPVmIVKRlRGgrKh+cEVagTsmkeOnW1jfiwHBn/x8QWCGDXsol7
         Pa+01vAzyvHYPxSmfSGTgdDBUgWoEIkLDCbYHShPxcENMwtGjSiyLmXzpCsYDDynEJT6
         I7kkQavYGq80ZPIVUOvENHmfgggrQsIy7xcPEQgH/gNg783wG6lgzn1WHmpfdUItsJVl
         n9m9vSSd4orq8Y77cBUcMV1QHtJmDsPrFtjU+oDiAuKF7g99ksmzdrFmp/Pg23eN6Pf5
         WUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695481385; x=1696086185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mf35qT3wdmI9FAWcSv+LLoKLH4mSf1lcVMZuMPVU6oU=;
        b=whn3/B6k0DSKdooTf40u9Tio2mgHpilnlJE+uxFQtPgJrzwGm/EbCnn1L3tpq6JX8r
         F04r/7yceyl+9rLNGGq5oHW1x5JtCwDNtXH8xPF5EW9caPwjiLevbv8HUSymR9vcNlOo
         HFQEDE/7eG0tk2U3CrxoHekaBXdFfP5o4/fR92Pi3ZGQhHXH42cdnlVhMyRCGQOlPQby
         GkiujIJP4ywps8ZUSgObhNMRpf9eHvL9A+Z45aaI/cTbxmt5dR3eCDGHjmY8AP1Yv3HP
         JwQ/yNsAwdvVDH6H0nh+TzFFaVIv7L5K4UMGMKilt1NdOuMHspGgCII12xckHcNHi2i3
         YDZQ==
X-Gm-Message-State: AOJu0Yy6kYZnmB/F8zD3WuFUI3x0zJQUaUJyh3uiuLbn3xCtzpB5224A
	kjTxhyRJdcfx/UyOfvcSlDAUKKxgytH0MvRhVHo=
X-Google-Smtp-Source: 
 AGHT+IFTXCZmW7UzyuZf1BuVac1rOqZQiIlUVcsQFdbBPX4v4s9HlTCZMWamY4v7PtF6t8H1zObaw34V4PtUnHSsCTU=
X-Received: by 2002:a05:6402:270d:b0:530:bfb6:66cd with SMTP id
 y13-20020a056402270d00b00530bfb666cdmr7966668edd.7.1695481379778; Sat, 23 Sep
 2023 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <ZO8oNb2hpegB6BbE@debian>
In-Reply-To: <ZO8oNb2hpegB6BbE@debian>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 23 Sep 2023 16:02:23 +0100
Message-ID: 
 <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JOB3IM6HVBJYVUGVJZFS2NYEAFOCC2O5
X-Message-ID-Hash: JOB3IM6HVBJYVUGVJZFS2NYEAFOCC2O5
X-MailFrom: sudipm.mukherjee@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOB3IM6HVBJYVUGVJZFS2NYEAFOCC2O5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

On Wed, 30 Aug 2023 at 12:29, Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The latest mainline kernel branch fails to build alpha, csky and s390
> allmodconfig with the error:
>
> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~
>
> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

Since its almost time for v6.6-rc3, so just a quick reminder that this
build failure is still not fixed.


-- 
Regards
Sudip
