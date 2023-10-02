Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AB7B5B27
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 21:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CC186E;
	Mon,  2 Oct 2023 21:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CC186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696274479;
	bh=VQ45G7PYlL0FP/UIakxyWuwF9DPXgSI52rIbqA5VkiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kucAft0tuoOU5sSglnX6WfVc3j8cL9FXE7YwJiYvZ6YvCXx8z0dxD4d536q+M30dY
	 Bn5GNt1O22Ckb+KZVEAneU0GDFk+1ZExG3jrBsIWcjXyBJfC9U1XT7nOpdDaLXrYaq
	 ydZ+TNUIrRfKRmUvLe2ApS4e3Pd4KzzEZF7Wx9zE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8B8BF802E8; Mon,  2 Oct 2023 21:20:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F925F802E8;
	Mon,  2 Oct 2023 21:20:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF7C5F80310; Mon,  2 Oct 2023 21:20:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7201F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 21:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7201F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P/3zTldm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 70301B81250;
	Mon,  2 Oct 2023 19:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA7AC433C8;
	Mon,  2 Oct 2023 19:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696274419;
	bh=VQ45G7PYlL0FP/UIakxyWuwF9DPXgSI52rIbqA5VkiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/3zTldmAvtvA6Dupg185llQZT3c+BZdhuLzSBPvA25QSnATf5zk+lekQjHRBPDIA
	 pnzVH3mh1kd+fcYfcWAr+5s9JLiTe6h3JTUjHgyUdInFfLaMiPKZ0USzW6pNj+Q1Wo
	 Cy2xLkTKOYN3ZHWWTXMX1afdQz+BpFv1/ZGfNUIc9YqRYeoBFNsJrGMBKnkzkh9r24
	 uMZpHIYXPy4QZM+VaZvTNcj5NK7f1FzBee49Ai5qs49NO4C4Q2p5CiB2u9aUz5YvYF
	 KKHGSFmiJ0YJcSdtxZKKexR8BdhI+TheZHS67r+ekHkbo053RgixC+IlUSpCi1Ih2I
	 tg8zJGpdhC4cQ==
Received: (nullmailer pid 2379910 invoked by uid 1000);
	Mon, 02 Oct 2023 19:20:18 -0000
Date: Mon, 2 Oct 2023 14:20:18 -0500
From: Rob Herring <robh@kernel.org>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: rt5616: Convert to dtschema
Message-ID: <169627441749.2379855.17500143382668612525.robh@kernel.org>
References: <20230930165050.7793-1-bragathemanick0908@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930165050.7793-1-bragathemanick0908@gmail.com>
Message-ID-Hash: 37AXR3QUP57GVWM5PX4OXTXV6MOCQNXB
X-Message-ID-Hash: 37AXR3QUP57GVWM5PX4OXTXV6MOCQNXB
X-MailFrom: SRS0=McIo=FQ=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37AXR3QUP57GVWM5PX4OXTXV6MOCQNXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sat, 30 Sep 2023 22:20:50 +0530, Bragatheswaran Manickavel wrote:
> Convert the rt5616 audio CODEC bindings to DT schema
> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
> V1 -> V2: Changes codec to audio-codec and added spacing above
> 
>  .../bindings/sound/realtek,rt5616.yaml        | 49 +++++++++++++++++++
>  .../devicetree/bindings/sound/rt5616.txt      | 32 ------------
>  2 files changed, 49 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

