Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 150607A73F8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 09:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FC0DED;
	Wed, 20 Sep 2023 09:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FC0DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695194682;
	bh=jlbQOVg2nr4bYlvKf5OfMxfreRxJq/NlyUhKSInidO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tfKrS7+YstTSqxVO7WpRjKPh+jm7wsDcDmwh0pH438BNm1JabQ00f0WKEtu3rJrzC
	 aBja4jrIak74IQMEw8/K7ztpItIF6rMlNaPJYJGgvO+/awoCq7vK8NAL8kNJp2EGd2
	 YVriU1j/y0DgYdMcMn9cVUAof5LO7ELauDhEspGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D11F8055C; Wed, 20 Sep 2023 09:23:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5A3F8055A;
	Wed, 20 Sep 2023 09:23:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99032F8055C; Wed, 20 Sep 2023 09:23:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C17FFF80558
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 09:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17FFF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kIXXjc01
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D16B3619D9;
	Wed, 20 Sep 2023 07:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D3EC433C8;
	Wed, 20 Sep 2023 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695194581;
	bh=jlbQOVg2nr4bYlvKf5OfMxfreRxJq/NlyUhKSInidO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIXXjc01nG/yd2rfDOayJ/mS/ipC1cQLy8cuONOc3FJuhIZ2naDoX/B3eRTyRwBsv
	 K3EY9DSzlz0kpJXvfiDM57f2uz0iKLLNEodmasAIBfWxfYnlGqPooCkjE8vR4D2SLH
	 x9+6x46S3b0auwNAsjS36e+90ArNkHMZj9XWoiFhEd9U9sADYS7RYPjkdrQU1LB+wU
	 Bf7n6OMGTYZJWyXcekYIaIOh8SWQ3vxwn66b45MRoi4eYH+8ZUB7BftecVzcXdldnK
	 n8WReYiPiHZb3CMQvjUuI7T3UKpCnmw26cw6tFEHztbCC9G0QEHO8qRRS3E47Q0b53
	 xZZ7IWAxnJdUw==
Date: Wed, 20 Sep 2023 09:22:57 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 51/54] ASoC: soc-compress: convert not to use asoc_xxx()
Message-ID: <ZQqd0XdXdygCQtJd@matsya>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
 <87fs3kp8sz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs3kp8sz.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: O7BFK7ARSX55NNMYVVBU4TGQZBU5URGG
X-Message-ID-Hash: O7BFK7ARSX55NNMYVVBU4TGQZBU5URGG
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7BFK7ARSX55NNMYVVBU4TGQZBU5URGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11-09-23, 23:52, Kuninori Morimoto wrote:
> ASoC is now unified asoc_xxx() into snd_soc_xxx().
> This patch convert asoc_xxx() to snd_soc_xxx().

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
