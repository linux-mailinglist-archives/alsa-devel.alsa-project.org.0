Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF2782F66
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 19:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B16832;
	Mon, 21 Aug 2023 19:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B16832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692638972;
	bh=/OeoYkugHikEXBo3UPlpwpyhdjMMUxLjzSOtgPsd+zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m4ektVn+jPrggteK28rYvuU1H1rmVUvV+JuVLBKVMwRAWScJllPZV/f/97vy4b9sW
	 +WSqvlBBNBMmnwfkKOrVxVeQG20iirBxCJe8NWQWV5w2PRQpGJNGy6VPdfT2P2MGP6
	 fQWi6CHnu6LXbllL4svW2mK3enxPMyVMSBZDtjs8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D1AAF80508; Mon, 21 Aug 2023 19:28:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3EBF800F8;
	Mon, 21 Aug 2023 19:28:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 143EBF80199; Mon, 21 Aug 2023 19:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 653DCF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 19:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 653DCF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T5gKJNFk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 219CB60AC3
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 17:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDC7C433CA
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692638905;
	bh=/OeoYkugHikEXBo3UPlpwpyhdjMMUxLjzSOtgPsd+zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T5gKJNFko/fwhBG5KAYl6wuxIe0lvCu8rK+hZYcTjh9PxEm0L401M+SN6/cKlbPN4
	 ZvCndoharQ4JgSkghtGxx+Jz/fApp2E1IyXqQGO6PadYPQ25MKfW2MzSfb5Y7w4UYJ
	 kt1fDY1LLMYBR3yPTZb4UCaqE1VQknSE10z5P4bTdeY+mMgUNfz6cIHnb84QXbbMZK
	 Ye2KjI4f4/H7CTVcvbl5PBt5iSh86ZcigvXNGkMz+2lC8EjY00BbVBC2CPRnIuTHJt
	 9DA4PoFuK2qxWB3UcGZbKY9jhG+N9VfWfxI1jWcXP21rs5rbsdsaO9VukCGIhOWx6M
	 HP2h/pNXszUaw==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2b9db1de50cso56015531fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 21 Aug 2023 10:28:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YwbUBMO6Bz/rRWkw4F+Fl0NmDaWNgCeaJHlXMjtyK9vPQNx8hMV
	ER++lrIpBcBXvND0x9CYyPOKVydrvkmydlE0Gw==
X-Google-Smtp-Source: 
 AGHT+IE9WHY5/4ZLeXyRg8ekKTg9MDXk/M9DCc70jbzBrdfs7y40dPmzepVfUeIl0nhiPLCX0OQa41eCDrd9inLXXEA=
X-Received: by 2002:a05:651c:101:b0:2b6:d89e:74e2 with SMTP id
 a1-20020a05651c010100b002b6d89e74e2mr4645401ljb.7.1692638903558; Mon, 21 Aug
 2023 10:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230810224930.3216717-1-contact@jookia.org>
 <20230810224930.3216717-4-contact@jookia.org>
 <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk> <ZNZFB2-kBrpnMSn1@titan>
 <a7db4653-cb12-4f90-891c-5cf7270598bd@sirena.org.uk> <ZNqgKW3TZBVF8ggo@titan>
In-Reply-To: <ZNqgKW3TZBVF8ggo@titan>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 21 Aug 2023 12:28:11 -0500
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+S2p2DarZ=kzxvsb8EPPHHFCOJ9F79Wm-LAQP14=Y97A@mail.gmail.com>
Message-ID: 
 <CAL_Jsq+S2p2DarZ=kzxvsb8EPPHHFCOJ9F79Wm-LAQP14=Y97A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
To: John Watts <contact@jookia.org>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Q5PJDU6MXH5IQKLVRDPUGQPYXCU4KOSX
X-Message-ID-Hash: Q5PJDU6MXH5IQKLVRDPUGQPYXCU4KOSX
X-MailFrom: robh+dt@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5PJDU6MXH5IQKLVRDPUGQPYXCU4KOSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 4:45=E2=80=AFPM John Watts <contact@jookia.org> wro=
te:
>
> On Mon, Aug 14, 2023 at 07:27:04PM +0100, Mark Brown wrote:
> > You'd have to define an enum for that but it does still feel like it
> > might be easier to work with since it's more direct.
>
> Alright, I'll give it a go in the next version. Thanks for the feedback!

That property will need a vendor prefix as well which was missing here.

Rob
