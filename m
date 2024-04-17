Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C5C8A8AC1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 20:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A23E9F6;
	Wed, 17 Apr 2024 20:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A23E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713377184;
	bh=wWg0evY70j7O2ptDiIFqWXBFa8YgVMN0uY+QB1WSV3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bY6xHvojQz/tRdj6jEP5DYqbpkAfgrq6EDfVoe3N6aHf5E7mZSXptIK8g/0Ur//H6
	 mJs9YwU4GJfvPuZbZ0VeCFGLas2FXu3D97QB9LLSXO+NLRaEsJpXvLCqI9nwkApAZ1
	 9j+Urtnxm1R68NslfcqtFDwzvKh85HaTiSvauskg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C55D2F80570; Wed, 17 Apr 2024 20:05:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9BDF805A0;
	Wed, 17 Apr 2024 20:05:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2411F8025A; Wed, 17 Apr 2024 20:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 024EFF801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 20:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 024EFF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DKAUBtKX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24396CE01F7;
	Wed, 17 Apr 2024 18:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19319C072AA;
	Wed, 17 Apr 2024 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713377131;
	bh=wWg0evY70j7O2ptDiIFqWXBFa8YgVMN0uY+QB1WSV3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKAUBtKXRILetMDDwlvRHJlMqgoFwzizrz2MSgdnkBQlA5ZVvXfo1ZOpir29lTQ0E
	 cu+FtsLF7QiSnBQqCCVYSq/mdzPzJcY6kQwe2QnrXmOiom/F1h54f3CxMRaJmn5hGS
	 dOb7I8XpPqhaNXSxK2g//5WSE/tQ1vfNDmiajSoHo4v+rguXwux7r8oTi11QJsmA9t
	 NlOG9Hyx+7XvWbZBrWVnUTtKJlvEmvynw/nBkyhF3mwznaPhpU4g9NJkOLhhG09Ing
	 Pi+9VaNqJZdcvDm4ldUjvgKr5lj9E0Z+Bse9fQ/U/zzX9rRRoBRrGNrOHTg4ppww1N
	 0S3JI7ASdoeCg==
Date: Wed, 17 Apr 2024 13:05:29 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org,
	u.kleine-koenig@pengutronix.de, KCHSU0@nuvoton.com,
	broonie@kernel.org, dardar923@gmail.com, edson.drosdeck@gmail.com,
	CTLIN0@nuvoton.com, perex@perex.cz, lgirdwood@gmail.com,
	YHCHuang@nuvoton.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, supercraig0719@gmail.com,
	scott6986@gmail.com, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
	linux-sound@vger.kernel.org, SJLIN0@nuvoton.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: nau8821: Add delay control for
 ADC
Message-ID: <171337709700.2869242.15474131281609320459.robh@kernel.org>
References: <20240415070649.3496487-1-wtli@nuvoton.com>
 <20240415070649.3496487-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415070649.3496487-2-wtli@nuvoton.com>
Message-ID-Hash: U2AFH36EV6IZWGYK4HPTGOELGOMNEX7U
X-Message-ID-Hash: U2AFH36EV6IZWGYK4HPTGOELGOMNEX7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2AFH36EV6IZWGYK4HPTGOELGOMNEX7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 15 Apr 2024 15:06:47 +0800, Seven Lee wrote:
> Change the original fixed delay to the assignment from the property. It
> will make it more flexible to different platforms to avoid pop noise at
> the beginning of recording.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

