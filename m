Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39605971C65
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 16:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49789857;
	Mon,  9 Sep 2024 16:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49789857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725891790;
	bh=Hezfj/kPm64KvITcfkt3URf9tx9rvGYy7rBd9swWi4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e8uDv6Mk4C24k6qGD9D6fxlWKzPUUfHl2LF0xWGDQGa+jFyUSmMmT2eUlnas6b9dk
	 upOwby7Rh9njqpOlZyfWOb/6i/avKCSenVNN+6hJ1IvWUBnTQMYhpxaFu2ZVa85VSn
	 C4+P2oLBsgbLbemqc1UB1ARfqVflE7SAShw6O6NE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E529F805B4; Mon,  9 Sep 2024 16:22:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C35A8F8019B;
	Mon,  9 Sep 2024 16:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6114DF801F5; Mon,  9 Sep 2024 16:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89A6BF8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 16:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A6BF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ubjIc8Wq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 877E55C014C;
	Mon,  9 Sep 2024 14:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6288EC4CEC5;
	Mon,  9 Sep 2024 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725891747;
	bh=Hezfj/kPm64KvITcfkt3URf9tx9rvGYy7rBd9swWi4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubjIc8WqYl0D6MnVk/IUOhrN6X2QqzKYlc5FTH8pdSO/YfWN0yFX4gJ3hbU1G4GSi
	 NZjpPwxu8KgusT4tWKdzHnJROjLVbYUmXVYq7ceCrbUArbYu7Mmbt0MCoLIoKRdePm
	 do/IRo1oLJcmreyNtzW5zmeGe+2iGwYIOFAO1+08E9g1fXK4EGbY1c8Ks9+lewR6Gu
	 TmWqdvo5jbDEr3gxKp8/7/IzPZrURXMisLPjYo/YgnsMfxaoTD0e1nVYf6o0tFM8oJ
	 ARDkhOYe/O8zoxShS2TVNVKG5CxTMS+FAPyIyaiJRUTLEmM/9x7U/pZL5HiWdo0Y8+
	 7T5Jyue9ltEYg==
Date: Mon, 9 Sep 2024 09:22:26 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: add
 post-init-providers property
Message-ID: <20240909142226.GA4185128-robh@kernel.org>
References: <871q1zkmrc.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q1zkmrc.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 26XGAKZQEMR4IKNXA3LHFI3D3Q446GUG
X-Message-ID-Hash: 26XGAKZQEMR4IKNXA3LHFI3D3Q446GUG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26XGAKZQEMR4IKNXA3LHFI3D3Q446GUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 11:44:08PM +0000, Kuninori Morimoto wrote:
> At least if rsnd is using DPCM connection with Audio-Graph-Card2,
> fw_devlink might doesn't have enough information to break the cycle
> (Same problem might occur with Multi-CPU/Codec or Codec2Codec).
> In such case, rsnd driver will not be probed.
> Add post-init-providers support to break the link cycle.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- remove basic description/type
> 	- add detail description
> 	- update git-log
> 
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 07ec6247d9def..458877ce4aa42 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -112,6 +112,13 @@ properties:
>      description: List of necessary clock names.
>      # details are defined below
>  
> +  post-init-providers:
> +    description: |

Don't need '|' if there's no formatting.

> +      At least if rsnd is using DPCM connection with Audio-Graph-Card2, fw_devlink might doesn't
> +      have enough information to break the cycle. rsnd driver will not be probed in such case.

Wrap lines at 80, not 100 unless there's good reason to extend them.

> +      Add post-init-providers property to indicate which link in the cycle to break.

That describes every use of post-init-providers. Drop.

> +      Same problem might occur with Multi-CPU/Codec or Codec2Codec.
> +
>    # ports is below
>    port:
>      $ref: audio-graph-port.yaml#/definitions/port-base
> -- 
> 2.43.0
> 
