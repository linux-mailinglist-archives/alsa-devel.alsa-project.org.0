Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B9E783101
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 21:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93EB391;
	Mon, 21 Aug 2023 21:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93EB391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692646929;
	bh=FUQx9TyKqHG33MB6C6Nk6beM/jCqOVRrZrugXYnTOLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ps13e9DhgDWuJPbfr1/beslaq+L3RRYOlatK5f3OU1J5bQxLkS6KJw0Q1VH2547n+
	 oAPWBQaTuk1PtDKPhGFPPR26/3nZnxEgZqOqGFv+cpw28lkRd6T29Km+g3HN9KdNDe
	 baZe/0QUVqkQR1eJPRUMsEt+Uo8rLmL16mLb+oOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F317BF8025F; Mon, 21 Aug 2023 21:41:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA8FF8016C;
	Mon, 21 Aug 2023 21:41:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A35F80199; Mon, 21 Aug 2023 21:41:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0749FF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 21:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0749FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cJGJz2S+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FFDF64393;
	Mon, 21 Aug 2023 19:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3E0C433C7;
	Mon, 21 Aug 2023 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692646864;
	bh=FUQx9TyKqHG33MB6C6Nk6beM/jCqOVRrZrugXYnTOLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJGJz2S+W9aNYDNl/lV1jkalwVIz+alVULA4flzq1FlEJeKXLBGNNdrAzV0Kz2oy6
	 exAAI6oJLVbP67PFSnsBW0FLu03K6IZDbjydkfl5QI1OILLbG1cR1i10GpyCuVmGT4
	 tcP/JDAM9hw1QYllyRPW/oL1iyXLo9ipROTMqFveK84ETGKqpsZSL5MbL6sBQeeDVM
	 aqNZDHPCrxqMZYXLqu0e87jkkRkjkEDmbY/UawLIr//pOGmFnDHObyDh1KzyU0RyK5
	 ty0ymNBVH+ObtUcVsORHOHjsUm+xZj+00Kuq3Lbb8KNWC3dUZbx7Q4YT8gjIksDU4w
	 4nygFjEKH1n4g==
Received: (nullmailer pid 2173935 invoked by uid 1000);
	Mon, 21 Aug 2023 19:41:01 -0000
Date: Mon, 21 Aug 2023 14:41:01 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, broonie@kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
 supercraig0719@gmail.com, scott6986@gmail.com, alsa-devel@alsa-project.org,
 KCHSU0@nuvoton.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 dardar923@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add single-ended input
 feature
Message-ID: <169264686097.2173895.14562323557073774140.robh@kernel.org>
References: <20230816080006.1624342-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816080006.1624342-1-wtli@nuvoton.com>
Message-ID-Hash: V3QN6YWWFWZHV7RNRFOKNP32EUKORAPI
X-Message-ID-Hash: V3QN6YWWFWZHV7RNRFOKNP32EUKORAPI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3QN6YWWFWZHV7RNRFOKNP32EUKORAPI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 16 Aug 2023 16:00:05 +0800, Seven Lee wrote:
> Add input with single-ended control.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

