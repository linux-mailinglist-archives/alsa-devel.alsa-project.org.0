Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755567C2EB
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 03:52:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05DDE83D;
	Thu, 26 Jan 2023 03:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05DDE83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674701550;
	bh=b3RJWkHcYIi6H28qkY/VPuWeD98hCPd708oG/BvjDkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vOKW5CTPr1W9CoaDEd7hwySiZe09rMLJT+oLGVBKiQq2HK9gf3dYMNosMNoImG+I0
	 munjQy3VkEkLGEvpESbh/Ez2bqQep8HmOjyuw6xxL+sOn1RvWBX4MoyCvAF4WXM/wA
	 8HBkqbWrCDzOStblMnT3Ur0ZiDFLEmYUkmEUonB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80763F8016E;
	Thu, 26 Jan 2023 03:51:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A0D3F8027D; Thu, 26 Jan 2023 03:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC76F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 03:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC76F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S3ob3k2v
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso3382640pjs.4
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 18:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b3RJWkHcYIi6H28qkY/VPuWeD98hCPd708oG/BvjDkQ=;
 b=S3ob3k2v0EpwqTzm7/T4qUQrdeZOOqlZq//hKwTwwNgwqD+2hQCK2NVnCJTBr2GJZa
 PO1uQM13sSbUwl362CNVBk15h6jUKv6/5vN4DUqX7chXmSFupditz9oJjp/HoMYkejbW
 +xeq/BTzfU2S5RcpSgP4PeG0vDRKoKbfCQ7yzT7EYxHVtiLpf1V2ps+A+2sr9ua04kOh
 iUadyOgJE6NO/2rNaRiVij9Nz/a9YPplDuQrY6eMQx3HQ1g6qdyV+d2t+TSd8TuX6GO/
 cSlGbp9ktpKslBKbeC/76/ltPfw/SjZu36rQmjZmh7ljwbSxmibhMYafKHAdKa/eNjbh
 5KXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b3RJWkHcYIi6H28qkY/VPuWeD98hCPd708oG/BvjDkQ=;
 b=mN0ucMMTWBoMZfQOusZXrJafcv95b9lttwzhzIVl00IAeVEhB7BmW7irfDGtgCVkY3
 mdF0Pwrf3o62ZesMcw5VPcoQDGwteVutRe61PF5h28QdQXz48/PvTEJmws9TXM1D8b/z
 9II8K2IOHF2uRX/y8cs5jw247xVbIJa2+LI7PJUoYvsT02EF0WspIW72CcTg4YErLTTX
 7ofHO9MBsutEjETNyUxKjVLymt20g+siDrN3C7mdXCrfQyoF8jPWiqK4XSpK3uEVVT5P
 s9lf/EPotCNo0j1uthaI8u1+2bvh6lm5GS3qfp408D+oTp/ryiZFxEflBnr88TIsXm2l
 VG8A==
X-Gm-Message-State: AO0yUKVGmH6qgjVutjoXJC+aYHRVpodz/wIuDOiWgeLXzJ/1N6fvBZ4U
 w8KwR/Ue7aiZO3o+xyzy6pHxcQaQr421jcXUf1M=
X-Google-Smtp-Source: AK7set8pPhOKTIZ01rJQce1j9jPstD9Xcm0w5j4c4f5iXkCM9mYASf3BsBz1GtbzGTfU0G6GRR6dbpt0WbCj4kdrtg4=
X-Received: by 2002:a17:90a:ca0e:b0:22c:2401:a6f6 with SMTP id
 x14-20020a17090aca0e00b0022c2401a6f6mr125365pjt.29.1674701482305; Wed, 25 Jan
 2023 18:51:22 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5CVCm5bpVThYW7V379PyTfyVQLBrN03cUfOxLRyBXp0gw@mail.gmail.com>
 <CAEnQRZAUx0Xg_3J161VG=m9oCQFNBT3aFHwExFbWWOTK6xsSTA@mail.gmail.com>
In-Reply-To: <CAEnQRZAUx0Xg_3J161VG=m9oCQFNBT3aFHwExFbWWOTK6xsSTA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Jan 2023 23:51:08 -0300
Message-ID: <CAOMZO5DECuV17T+1u9WKXdZfGqQ84kMCm2Yt+b0cuOuFFUiBLw@mail.gmail.com>
Subject: Re: i.MX8MN: SAI: First playback failure, second succeeds
To: Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Daniel,

On Wed, Jan 25, 2023 at 5:43 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:

> Can you also dump SAI registers ?

They also match in the working and non-working cases.

I have also tried applying your patch:
https://lore.kernel.org/lkml/20190308173904.27298-1-daniel.baluta@nxp.com/

but it did not help.

Thanks
