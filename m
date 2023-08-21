Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC26782D85
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 17:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1ED283B;
	Mon, 21 Aug 2023 17:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1ED283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692632948;
	bh=OdLn/5VwnPYcOVsCm+SxsCuQhbrbLAaRF11wH0pSOb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=syt4gDpcyNN7FbOETc0Gmn8Cvwc9WH5X0Msos34ZXEPqAKbXbjDyt3mlFVISN9Lch
	 r+bQAT87DCSdA6EoPSB3ZskGWKoaPsmdj6pX8YqxQhQFQGbp1VEuAN22FMlYYzyGDS
	 pbI/PZGG1gZQvGVvjjsHy026YVGlbFE22byc7sqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD78DF80536; Mon, 21 Aug 2023 17:47:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D777F8014C;
	Mon, 21 Aug 2023 17:47:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A848F8025E; Mon, 21 Aug 2023 17:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D53F8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 17:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D53F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s8fNMQA1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DE11615DB;
	Mon, 21 Aug 2023 15:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232DEC433C7;
	Mon, 21 Aug 2023 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692632861;
	bh=OdLn/5VwnPYcOVsCm+SxsCuQhbrbLAaRF11wH0pSOb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8fNMQA1Zn7WVe+BgPARVdchTxIZUalr5+U+um1aPXWS+g2QJrjG/cSgcnKkH6nad
	 Ao1kq5R5JP3ezKEMdOXe26B+4Mc3xUPExkE43BUDSPa0KlY4mGJDjdwiJ4MypcCQqe
	 pVel4Pm45bgEf+jrZy+zlJklXuvseyMMR6nthiYRiQZRcVZFXf3zEAmFHH592Z4b/3
	 YSlpmd8X9eM57Bn93I7P6j8rzwKt287aP8GJ96LZp9IM8s75CXQtN2kIemw+K5m5eB
	 SVLNvWi7r4Y6JpJjj+O4u2d6cIFfhyuorRdJWxDxzy3iM3Gyq7EnNrDQzeuN1gqygi
	 HTXykkslXktjA==
Received: (nullmailer pid 1722819 invoked by uid 1000);
	Mon, 21 Aug 2023 15:47:39 -0000
Date: Mon, 21 Aug 2023 10:47:39 -0500
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
Message-ID: <20230821154739.GA1720453-robh@kernel.org>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230805180506.718364-3-bigunclemax@gmail.com>
Message-ID-Hash: HM4IDR7UFH3ZKHVJFF5GFBI6BLFNIKHX
X-Message-ID-Hash: HM4IDR7UFH3ZKHVJFF5GFBI6BLFNIKHX
X-MailFrom: SRS0=A38r=EG=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HM4IDR7UFH3ZKHVJFF5GFBI6BLFNIKHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 05, 2023 at 09:05:02PM +0300, Maksim Kiselev wrote:
> Add a DT schema to describe the analog part of the Allwinner D1/T113s
> internal audio codec.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml

Looks the same as allwinner,sun8i-a23-codec-analog.yaml. Why can't you 
use that?

Rob
