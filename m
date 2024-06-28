Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9491C86F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 23:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC848231B;
	Fri, 28 Jun 2024 23:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC848231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719611313;
	bh=IBc0CYPamY7pDeJJ43X8GTYDFhvoT6MaIAE1S29b2d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Btp2Z3qXzJNMxm7AxczG6S3r6I3Xic3K0zm63iV0scFs03NTIz79xu9XJhE/yMbS4
	 Z0plbMkUb+Q79pcLQ+PGSghMWMOkfegF6govOilwmi8zac+b8rNefY/wPcA/nIr0dc
	 7Zr4q322Qy9r8VgMJ8cVEacQ9Qx9aQjeTZaJ75ZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8219BF8049C; Fri, 28 Jun 2024 23:48:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA680F805AF;
	Fri, 28 Jun 2024 23:48:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 876B2F80423; Fri, 28 Jun 2024 23:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1660AF80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 23:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1660AF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AORxbsxP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3F5C621E6;
	Fri, 28 Jun 2024 21:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03868C116B1;
	Fri, 28 Jun 2024 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719611270;
	bh=IBc0CYPamY7pDeJJ43X8GTYDFhvoT6MaIAE1S29b2d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AORxbsxPRWbzJug5vWfZZCe/qUA0/8exXctT+IVd9tbVaBss0yDcTFeLyO0Fv5jYV
	 RDuvgRHHtd+j5ETzBseezP80GYrHGtYivvyfS3XISCd8krIMQA9djIA/MTvYWbWCnP
	 zYu5/EOf60wwQL9y1KKLTFC3xNH1tuEeHnNeXcDVSyPa6J2UxoH4KUQGNNTbu4UkBK
	 a8xE5Y8gx5uqaCAK2gr7xeE+XJxfWvUM/xQGprmKn3uu9McHNzBRg/zR06SUJv8lHU
	 1M0sGMcGjEVxrKYQAHXNYHOjSwlfi99Qszj0KZYnzO9v5pGQq5CkgcUJqaQ4HgsDDK
	 nTUjlvGs6vDnw==
Date: Fri, 28 Jun 2024 15:47:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
	broonie@kernel.org, shengjiu.wang@gmail.com, festevam@gmail.com,
	tiwai@suse.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string
 for i.MX95
Message-ID: <171961126622.265750.10175458936157332851.robh@kernel.org>
References: <20240626071202.7149-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626071202.7149-1-chancel.liu@nxp.com>
Message-ID-Hash: NVWSHCR4ZIUYPUDENNZUJZLXVB2G6ODX
X-Message-ID-Hash: NVWSHCR4ZIUYPUDENNZUJZLXVB2G6ODX
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVWSHCR4ZIUYPUDENNZUJZLXVB2G6ODX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 26 Jun 2024 16:12:01 +0900, Chancel Liu wrote:
> Add compatible string for i.MX95 platform which supports audio
> function through rpmsg channel between Cortex-A and Cortex-M core.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

