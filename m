Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45695975605
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 16:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6068851;
	Wed, 11 Sep 2024 16:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6068851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726066267;
	bh=UHhdL2TqAw1Ff5TNz/XDWwxl30Ma5iIQax0yjUj0lmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VU3Y1bYjv9yXCXYuYhy37FtQ6cP8bwuJoUFHZO1s6YRwK001+gauQt8A2cZM0F+Th
	 F4NuKqrJ8UNW7uMPt4I+OXTXwOGC69qNgdWJWlOjB71VWBuE71brA+KvKgTCRKCYE1
	 Lib6BOM06RZJftiwrcjh+Kb900yG2NDDI8DkTG+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BB8DF805B3; Wed, 11 Sep 2024 16:50:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85268F8026D;
	Wed, 11 Sep 2024 16:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 223A6F801F5; Wed, 11 Sep 2024 16:50:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 461B9F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 16:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 461B9F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YLvrkC4C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48D765C0774;
	Wed, 11 Sep 2024 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57624C4CEC0;
	Wed, 11 Sep 2024 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066225;
	bh=UHhdL2TqAw1Ff5TNz/XDWwxl30Ma5iIQax0yjUj0lmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLvrkC4C7QpdtolHzwFm9EZoDLVVgxoJNIlEb/hle9eboBRosxqqnEn8XgoT0xAPL
	 6CFgEoRLlY0ydYiqCKAWocpgHaytLhvt4YyMw9cjMAEc51RL8wEE/4eXL0C5GrbINn
	 v/HwMtTErl+pHoT3l49O/tHAr2KTRdgjaRD3WIJjff47b28RjxMYGoGidb8JsDbhk4
	 bylKt3DFUTQ2rgQGIt22xrTe96pMl8ZBBhoutcSnQn2+uTHL25eEHjLSRBHm+OWa7V
	 8JOmX2hjRAp/XH6LRrOiEj6ZErpxZtuJ2xObTZkRIlbMB8wcsbDkS3jSoYLBdGm1UG
	 8IFDk7E+6xhMw==
Date: Wed, 11 Sep 2024 09:50:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: add
 post-init-providers property
Message-ID: <172606622361.165356.4972843674773802358.robh@kernel.org>
References: <87wmjkifob.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjkifob.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 4J6LU4S5CAQUIVCXEVWZYJZ34MSV22YM
X-Message-ID-Hash: 4J6LU4S5CAQUIVCXEVWZYJZ34MSV22YM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4J6LU4S5CAQUIVCXEVWZYJZ34MSV22YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 09 Sep 2024 23:13:47 +0000, Kuninori Morimoto wrote:
> At least if rsnd is using DPCM connection on Audio-Graph-Card2,
> fw_devlink might doesn't have enough information to break the cycle
> (Same problem might occur with Multi-CPU/Codec or Codec2Codec).
> In such case, rsnd driver will not be probed.
> Add post-init-providers support to break the link cycle.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v2 -> v3
> 	- remove "|" from description
> 	- removed common post-init-providers description
> 	- 100 char to 80 char for 1 line
> 
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

