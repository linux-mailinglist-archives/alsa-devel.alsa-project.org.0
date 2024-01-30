Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9984288B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 16:59:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103E2E94;
	Tue, 30 Jan 2024 16:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103E2E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706630371;
	bh=igZZcV/zWtQctF2QKGyC6Gn9cB3ebUyhI2KC+rnG7SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g8Zxf4SzXpXWHlxQkfMTElhnqCmkxhhL5pHjZ+gQLGiLdTK7IzG/yz/atdnG9yvbI
	 Tks+8kLoTcfEUVQD4CneDP2vLxD/yLe1FmcTRKOJpfNfCElD69NeTvKA9gill4l1zR
	 dmHKQIXnm0wqbTqEiQs9aKXXgQ05iYRqHRLz7ebA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77301F805AF; Tue, 30 Jan 2024 16:58:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70929F8056F;
	Tue, 30 Jan 2024 16:58:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D9FF8055C; Tue, 30 Jan 2024 16:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEC7DF80149
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 16:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC7DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=myibXwsh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4597660DF4;
	Tue, 30 Jan 2024 15:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3E8C43394;
	Tue, 30 Jan 2024 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630325;
	bh=igZZcV/zWtQctF2QKGyC6Gn9cB3ebUyhI2KC+rnG7SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myibXwshLj1afq3Gsz9VBx1m/Gwuvd80L1wMgOGnJFiGBH3fh5pHt07L7gIbQVAUF
	 IZxpvXjm2QcuSDBU7uj9nhHYLIgpsBz0qfegJoWrnefhWGUIwZL4tylg850ieisaex
	 Jr0gs19ebJf1fkiH7Gn99mxMxJjzT/D9FSLxJnN6JoOMai4qIZGFKZAJbLeTxF/TvM
	 a5umkR43R+BjzziFyquL5NUuJ6Cjkzi5HkMdwVzA7TK92Xa2KCkdzVPzTukTTL0f4w
	 UcpG7fr4xGMUNl5kdaWvCni1a+5V6FGxfy0jGbuf5RIXnNjUBF3tXkU7ZOERdi1Ooj
	 uSNATDh50VGwQ==
Date: Tue, 30 Jan 2024 21:28:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 02/13] soundwire: amd: update license
Message-ID: <ZbkcsYHBVYnxSe9e@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <20240129055147.1493853-3-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-3-Vijendar.Mukunda@amd.com>
Message-ID-Hash: B4PSETEOVXCPRXCHABDI37H2RX7GVZXA
X-Message-ID-Hash: B4PSETEOVXCPRXCHABDI37H2RX7GVZXA
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4PSETEOVXCPRXCHABDI37H2RX7GVZXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-01-24, 11:21, Vijendar Mukunda wrote:
> Update license to dual license to align with Sound Open Firmware (SOF)
> driver as SOF uses dual license.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
