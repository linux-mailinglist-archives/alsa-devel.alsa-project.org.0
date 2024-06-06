Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F898FDB8C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 02:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADD8DF6;
	Thu,  6 Jun 2024 02:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADD8DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717634403;
	bh=yA8JXQglBvejFF7jK/DqobhKHQBVwv7RECc+KLN/htY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IZx3H/9UdT4+SaYbCq/+QRqDLjrRr8WB+5sCIdofulRMKJIjq6h+1GMh3vGpxc3bY
	 on0oYAqYcjg0nPSjYHVzXqTCQS8ELMViNSGyeN7g9KZDLFgskvr3m9FNcLjMW5+jYN
	 HLmp1VXUzBcg1jzLwWb2CSTb7hqqJUXUPqp4EStw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6478F805AF; Thu,  6 Jun 2024 02:39:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E40F805A0;
	Thu,  6 Jun 2024 02:39:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1709F802DB; Thu,  6 Jun 2024 02:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B29EBF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 02:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B29EBF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Of9q0GTy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64446CE1393;
	Thu,  6 Jun 2024 00:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BCDC2BD11;
	Thu,  6 Jun 2024 00:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717634323;
	bh=yA8JXQglBvejFF7jK/DqobhKHQBVwv7RECc+KLN/htY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Of9q0GTyzdfSeB7VBeSq4FxJgjsiwPFN9APFFe2lVDkOufkqJG/Pwp3SG6zAuCsnn
	 SqT6ADFmfH+ufRELcCX4QFFQhnDj2SHuZEAyq8mTrcl2D/URsJlxUqpLiO1Hxs8eUC
	 V9QTFu+mvQNqd8BFCYWlpGR9bE/AZTxkqw+fBmUV8Az2DooU6bX0dKktdz0+GOIbvw
	 ENMfY37oK+2A8XISbu18OrNZ+95TR5lgLPBPhk/3uCHl0WHo6N7MW7yGJAESPL7NP5
	 Zqe2YAkCEfZChWVwOzKTn0FemSzNc5IIt0U8fQZXwouvuOaxvHnqr+hOiLQ1G031Dw
	 TOSFVur1ig6Ng==
Date: Wed, 5 Jun 2024 18:38:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems
 for audio-widgets
Message-ID: <171763431818.3524953.6773726954560624360.robh@kernel.org>
References: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
Message-ID-Hash: GKDHKVLXKM5IM52O6NF32QWK4SI4W2MH
X-Message-ID-Hash: GKDHKVLXKM5IM52O6NF32QWK4SI4W2MH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKDHKVLXKM5IM52O6NF32QWK4SI4W2MH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 05 Jun 2024 11:40:51 +0200, Neil Armstrong wrote:
> Like "audio-routing" drop the minItems: 2 from the "audio-widgets", because
> any limit here - lower or upper- is rather meaningless.
> 
> This will also fix `dtbs_check` warnings like:
> sound: audio-widgets: ['Speaker', '7J4-14 LEFT', 'Speaker', '7J4-11 RIGHT'] is too long
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

