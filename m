Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A3751946
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 09:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A219D1E7;
	Thu, 13 Jul 2023 09:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A219D1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689231827;
	bh=ZKzT2kI7SIV/QlPNIp1G2EP8hGYRMtFnfbahsaDWDUE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k4VB8rl0c3njGc3m9P6jXXQ9ZdgwtHzu+dWpR/maIMGJvRSUQ7ufhnr59ZQmqrmQT
	 SF99MClzzkOo70/3SeLJAss6fcatzRyXp0pfJ1wYLC+/UFQlUUIr9xTPYUCGLV6OF2
	 aGdQ37TVJX9wglpQxzgVaZdKnD2jl0HtpaRmUFow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2865AF8053B; Thu, 13 Jul 2023 09:02:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8B3F80236;
	Thu, 13 Jul 2023 09:02:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 117EFF80249; Thu, 13 Jul 2023 09:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 610E3F80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 09:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 610E3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XzJxCDPe
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso2662505e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689231764; x=1691823764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZKzT2kI7SIV/QlPNIp1G2EP8hGYRMtFnfbahsaDWDUE=;
        b=XzJxCDPeCBeNU9TtYRp94TiYADkV2OYaCse3bYTJBpV0rkv79PK3On7EmYetF9Xvme
         3Ywr1pclyxAVxL2vF77/EVwhIWsFXJoJSYDY1Cj1FLmNSaf+1QXOAJffUOpR+VjFl16+
         ZQg2kLNnbHOf64w2fJAsDJTHmCQvfpe7d5fpiEx8UugPHk89wD7Oru6u8ouHF0KpQ7ln
         BwqLXAxawY8FvA44xQ+21UXVzFK8I79DCdUyw2ZnfF8fHFE1Lh6pFqW8ykTIWbsLFlr4
         pS1xHSyjGi/ckVX5bM3obZ+kvBfSmb1R8iL8qwVjihKLBCfrLBubIkMBaIh9dVzPlhGD
         OQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689231764; x=1691823764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKzT2kI7SIV/QlPNIp1G2EP8hGYRMtFnfbahsaDWDUE=;
        b=YrL1h4e/zTmjycwe5+emBos9uKV3p+illHhqm6fuGTU4odZvjUl7f+F7iW6Mib5v51
         9pc/RzU6xdZlfYwYPhxWd/2l+Be34K8HEVPzYjvPGbyDLUED49dX3S75AB3hHTqTSfqU
         z4/r2w3iDD2q9rSdLvubfSkZZTFnopytMWlhCPoPUO4QiW0PGB7rhLKqqHEbU4Yk4ADi
         /aJj1QXbuDbk5Vq76K4FkIkuW62oVCu4OmtTcEsHzQkqdoJ1yZ4sc4EM/WGGFfVJU94j
         CX5II5e9QEFDc3cr/XJ/CmYSThUM8hn3CDinK4WLAcbBNf1mRKwIIPFCLMBI8HtvNX9r
         6Qgg==
X-Gm-Message-State: ABy/qLYOGzNOxPMtbuKvn5L4STnao2tz1xqN5zSmlM3Sc1bvgdKcvU/q
	aczXhchZYxyFcnBVDg+H8YIGHrXyuEQ+4A==
X-Google-Smtp-Source: 
 APBJJlFI1CKO7moqPVrN3fPhKLcSmvKXDNhUtwhEE+dv5Xyb7RMfYTV6PVqcY+FuWkj/ClgDutsTow==
X-Received: by 2002:a7b:cc8c:0:b0:3f7:2a1d:1b05 with SMTP id
 p12-20020a7bcc8c000000b003f72a1d1b05mr595990wma.14.1689231763664;
        Thu, 13 Jul 2023 00:02:43 -0700 (PDT)
Received: from ?IPv6:2001:a61:35be:1401:2331:c532:1717:d48c?
 ([2001:a61:35be:1401:2331:c532:1717:d48c])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b00313de682eb3sm6998459wrt.65.2023.07.13.00.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:02:43 -0700 (PDT)
Message-ID: <4d04ca21b4c9768a59be1341ac62fcae54027b8f.camel@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: ad: Update Analog Devices drivers to maple
 tree register cache
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lars-Peter Clausen
	 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Date: Thu, 13 Jul 2023 09:02:42 +0200
In-Reply-To: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
References: <20230713-asoc-ad-maple-v1-0-7d2f35d42b5f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Message-ID-Hash: VPR64O6XGOQ344WRQ6AGXQJR6IG7VVMK
X-Message-ID-Hash: VPR64O6XGOQ344WRQ6AGXQJR6IG7VVMK
X-MailFrom: noname.nuno@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPR64O6XGOQ344WRQ6AGXQJR6IG7VVMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 2023-07-13 at 00:13 +0100, Mark Brown wrote:
> The maple tree register cache has now got to feature parity with the
> rbtree cache, there are some different tradeoffs made and it should be a
> better choice for most modern systems.=C2=A0 Convert the Analog Devices
> drivers to use the more modern data structure.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

> Mark Brown (10):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: ad1836: Update to use maple tree reg=
ister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: ad1980: Update to use maple tree reg=
ister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1372: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1373: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1701: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1761: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1781: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau1977: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adau7118: Update to use maple tree r=
egister cache
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASoC: adav80x: Update to use maple tree re=
gister cache
>=20
> =C2=A0sound/soc/codecs/ad1836.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0sound/soc/codecs/ad1980.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0sound/soc/codecs/adau1372.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau1373.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau1701.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau1761.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau1781.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau1977.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0sound/soc/codecs/adau7118-i2c.c | 2 +-
> =C2=A0sound/soc/codecs/adav80x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A010 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230701-asoc-ad-maple-170068cf0c39
>=20
> Best regards,

