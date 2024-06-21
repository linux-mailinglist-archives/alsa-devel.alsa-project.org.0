Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88791DF29
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3E32971;
	Mon,  1 Jul 2024 14:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3E32971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836867;
	bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kwuxt/KCMYZ55e1d7MgQDG9BiXbwGbSE7XGVNAXCq0NBV0DWk6F+h5mX/HD+qpmPM
	 V8f2KpaaGNMxCGuHkuU77iWF16bBRtFdoMsBa6GpG7VneGbksyAZNuTgw6PDNiVLOw
	 iIthVGyJIv4sdg7W7b+AWlt3ckqBwY5Y1clFtn8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B23BBF80640; Mon,  1 Jul 2024 14:21:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A99EF897BD;
	Mon,  1 Jul 2024 14:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 154D0F8023A; Fri, 21 Jun 2024 14:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BDACF8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 14:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDACF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=chJzZgFE
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6f8d0a00a35so1810406a34.2
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jun 2024 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718973873;
 x=1719578673; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=chJzZgFEgOGyhrgYONhynb9sXBsHp9rGoLcED+dQMHXFPevHcILd86qiT2etOBQmk1
         tYcpVVWkq7s9o5tla4K+q5/BeDA6eaCYWYMhjhvkDNwzVo/9xIuiFEjFox0/2XuOVWHE
         dNqfCTztezwa8JEYKR+cwOhLUN5/9pU85kV8dYcsJ+BaFI+4RumVTniIuO+RLEUI7+BN
         p+1pA4jukKMJnb3pmn99gcOSZsYDfiimHFd1ICazS1Qdo1gXrW+L2sHej2qqZ7S8QPhg
         UhUKVsABcvioKS0Y/+crEyBnvwHomM5aHapQD9tbMTLJlNL28Q3KbSD8EGBcZMD2geyB
         UVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973873; x=1719578673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=cDrTfk4LFxqktVWp1OYIWYhPnlqAGUBDcP3KpTNFcQxp8RRVxKwIgCN+RJWmxRwAzY
         oCbSZdxRl7TiyRSqFFz9YJWv4IAAHRB7BfGCZukRbmHdm0dc/w763ZMV8Ea54l1gQufg
         GjOdkNMJCEPdH9lS/5BDxj2IMr7eh+m7+WHZrv0Shl47KFrdeqlnm3QX92DEEAIjHgeb
         zrw+XqwvnBg3XBzpH2k0QknRiY2dPTVlSnfFdJuFF2g7vHt6P9ZmtkeOeGhH/u5VxEYj
         6in2XUIzfMBjlo9m7ek//D7Z09xzKEckas193t6piPRRmTWySscCCvp1q1Zt4Ei6cImU
         HEQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5SC0PHqkG/UFUE78gW/GPeE46uJcNGCF7xUzo6s/Xbrez1AJGRZ1GoQzT6bMqfr67NYQQEe666RwuV46EXMBpqBugBTnxbVT98ZA=
X-Gm-Message-State: AOJu0YydevjsYb3R5uKHTdXhizTTbg5KRebENtIEu8q3CDwq+4wL7lHD
	bAGQNTMIDfi4hrBES1RbKjWQbA1lbutxfIe65ZF146TC4vjWPXqn60K6SxG//qZPQuJ6sGYdGun
	BkPcNSvheRCZfocUacR4iQHkIEN+PULcdvbcesw==
X-Google-Smtp-Source: 
 AGHT+IEOZNlyLp+OxVrBD22Lk7qV9DoUmsFRWzsrduGbMG3NGbu8paAH4Nzg2EEG9ozpibJTiN4vqzTSJCMR3pLWBf8=
X-Received: by 2002:a9d:76cd:0:b0:6f9:e6a5:dad2 with SMTP id
 46e09a7af769-70074dc525emr9327837a34.17.1718973872714; Fri, 21 Jun 2024
 05:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
 <20240621103019.783271f4@xps-13>
In-Reply-To: <20240621103019.783271f4@xps-13>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:44:21 +0200
Message-ID: 
 <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2MXROFYPISOMM3Z267KP7WOB6PJHVHYB
X-Message-ID-Hash: 2MXROFYPISOMM3Z267KP7WOB6PJHVHYB
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MXROFYPISOMM3Z267KP7WOB6PJHVHYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 21, 2024 at 10:30=E2=80=AFAM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Piotr,
>
> piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:
>
> > Move away from pl08x platform data towards device tree.
> >
> > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
>
> I don't see any change regarding the NAND controller node in the device
> tree, is there any dependency with other patches from the same patchset
> or may I apply this directly to nand/next?
>
> Thanks,
> Miqu=C3=A8l

Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
dma and i2s properties"
which will be splitted into two or more separate patches per request
in the comments.
I'd like to keep driver changes and corresponding changes in DTS in
the same patch
but I've made a separate patch for DTS per request from v2 of the patch set=
.

--
Piotr Wojtaszczyk
Timesys
