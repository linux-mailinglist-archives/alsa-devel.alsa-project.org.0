Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B3916BB4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 17:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2DA986F;
	Tue, 25 Jun 2024 17:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2DA986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719327902;
	bh=v3xu1DyFwNeeSa36sjEB5FbyVITtkfo92n3t1SkftD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ixk9YDAZaZHrEGia3ZWxyxDbV6Z7NiftxJgCRG8rdZC7OhaOca5ljfu9OISKLdmfJ
	 FdkVqsVK9blrTDAkt4tjOXqy8e/qH2xF2ulvTw0bgAfq9qPlk4KI4428GwN0uwQNFl
	 JATPTtMUEOfhIcWX21Si+leTLs5MjHiiXW0ddJnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0BE0F805B0; Tue, 25 Jun 2024 17:04:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A74B5F805AF;
	Tue, 25 Jun 2024 17:04:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEFD4F80495; Tue, 25 Jun 2024 16:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86124F800ED
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86124F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WTjejh/P
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2c722e54db8so4336045a91.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719326891; x=1719931691;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NOLeFvsL8kaSRtWwF8htq+fPtKSdafeifT9BbsLcc+c=;
        b=WTjejh/P3pVuQ6qonlwUuwiJdSpVoD0rkI2PsssdFrmavwCLJ5WGodSTWe8zoX4OCq
         9mzuTYB+T/Z4x4HH5DxqNN8q1kvX/pZ8FPkO/90s8eQ76CrA81jskWrfhWN9Bb7SMZL1
         jf1dbiI0+/FXOsoS8291BbnyMCM9hYFsw15cAqiLwKElP2X2gzvFltBvNTBiLZvOiLWC
         RC93H8DhHGVNH5r3nYScz9xXzwJbiMyL+84rKd4zPzvZb2Qen5y4yUaF/C7vqdGubwBS
         e1OdIWqe+o7fx/IRwP07IqfpN9w2d+dxe+msZ9BkdXodU2o313s19s8UDFKAowUS/f8H
         eerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326891; x=1719931691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOLeFvsL8kaSRtWwF8htq+fPtKSdafeifT9BbsLcc+c=;
        b=Agit9houdOkM7zUUTbL7vE4YIS1SMOq9qwh51ytSm5clZdtKcE6HqCV9xgq8Y99y33
         Ba68JXOla4vq8Snjb5/63ewabGTdXVz+CJ5npb+cusKgNlfH9nda4l7uxJjZSscItvjq
         17Q9OzCU/nomhno6RHISbkjBAfD5/UTt/i1i0VhOJyA7kdlNuDcvNu/b6lDl4OAJLGSz
         Py/RZBfcis2TXVpAUbcqAMb9GBGMVh2YoYJVgfnlODJBEj/90nfRW/Bry6QSwYScThdp
         /CbKAHsXiFdBZzdSkqC6epFLAI5ObHIE/aY8Sv/3Gl6Z4i3lTDaG5vlh1vB6B+H/I9Td
         G6HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkUGXJhThxtsI13i2mdEwymmKQQLftY1a0uQ/aHxtomRJcjBcjj8yPW26PP56vYGCMg0zcxBuhIjLYDQB2kqwMtMIsQGT36cPd6ZE=
X-Gm-Message-State: AOJu0YxbiwRoDPhhEn1FYqPyoW2b5IdM3KHu8EhOjo6n4xRlxkTEzAWt
	MX2IJDmTYkd5ajl3fb8iFspnbuqq63xAXFaXKTeDxT0cE25AoYDckT8Nvv4ihedfM62JW9AXE9O
	ricIXjPNHgDjuwjGs+x6uM5FO69k=
X-Google-Smtp-Source: 
 AGHT+IHax0feeXZDhhj1vgHv8F+uvxmxFaFY3EcB0Z+QwjASVPOeq3SNfifA3ETfuRKkRYInUfBM0vmfIqxQTzvpnUs=
X-Received: by 2002:a17:90a:df08:b0:2c8:431e:4105 with SMTP id
 98e67ed59e1d1-2c86140975dmr6924152a91.26.1719326891318; Tue, 25 Jun 2024
 07:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240615125457.167844-1-rauty@altlinux.org>
 <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
 <CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
 <CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
 <c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
 <871q4lm9dp.wl-tiwai@suse.de>
 <CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
 <87tthhktdz.wl-tiwai@suse.de> <87sex1kt6t.wl-tiwai@suse.de>
 <CAGpJQTGR5WKuHUFGFUC286TUkOXYgcqigZRDb4K5deyE9uuz8w@mail.gmail.com>
 <87msn9ksj6.wl-tiwai@suse.de>
In-Reply-To: <87msn9ksj6.wl-tiwai@suse.de>
From: Rauty <rautyrauty@gmail.com>
Date: Tue, 25 Jun 2024 17:47:34 +0300
Message-ID: 
 <CAGpJQTHajQnOr7Tr8cmMyjBqGw1sg_-SwSuAhnz-yFHZdPukGw@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
To: Takashi Iwai <tiwai@suse.de>
Cc: wzhd@ustc.edu, Gergo Koteles <soyer@irl.hu>, alsa-devel@alsa-project.org,
	tiwai@suse.com, perex@perex.cz, kailang@realtek.com,
	sbinding@opensource.cirrus.com, luke@ljones.dev, shenghao-ding@ti.com,
	simont@opensource.cirrus.com, foss@athaariq.my.id, rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: K7AIW7PXX2J2AGCQA5CUCJ5JDDI3R62Y
X-Message-ID-Hash: K7AIW7PXX2J2AGCQA5CUCJ5JDDI3R62Y
X-MailFrom: rautyrauty@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7AIW7PXX2J2AGCQA5CUCJ5JDDI3R62Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 at 17:25, Takashi Iwai <tiwai@suse.de> wrote:
> Great.  Could you also give the one for IdeaPad 330?

http://alsa-project.org/db/?f=cb04b699a8aaa07e0bd992dfc92accb993dc0a97
