Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B791B061
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 22:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186B9211C;
	Thu, 27 Jun 2024 22:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186B9211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719520205;
	bh=b/0aNRPKXl+pJqUGj/VmecpemqeGNH4lJFUTEQRPRiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NeM5ztHbtVDWLx/LyRdbGr5dWJkkgbRS/UxWOalTdKTHSVpw38IxG+IpaSKaut0cD
	 jrOCU58Tg2I0v0qszig9iT2kM9iR6anA9wBzC2bYjUXIZqTQ2P/QVtjIN4T77lSMQ1
	 Y6JlHG/okOG2YNbup707kd/JUHWFfqyiHPmWTWCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63952F805AD; Thu, 27 Jun 2024 22:29:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CA2F805B0;
	Thu, 27 Jun 2024 22:29:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CCD3F80423; Thu, 27 Jun 2024 22:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE056F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 22:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE056F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HW62N1IA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59E21CE2E48;
	Thu, 27 Jun 2024 20:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D203C2BBFC;
	Thu, 27 Jun 2024 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719520149;
	bh=b/0aNRPKXl+pJqUGj/VmecpemqeGNH4lJFUTEQRPRiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW62N1IA8g8PIp+7o+yoQhE0hOXTHkRgKocLCbgHI0RLPk+UFoPuCaGY2ZZGjri4b
	 fc8VwD+KoLHMAljmElaUY793rAo3nXm7W6885i4xvIIDYbgd//GXTGjZNGa5fzTDYY
	 bQHJuN2Rp390mMzefwCVUAmXZgYSzTee40UsNb9F0f4wtzm9WeMyST27nj+PUeoDbF
	 CZTc2whCBRq9aLn3irP6dW1/OZVjr+Lj5AOe/+T/dwWBsFNEHhUdSt+7ih4cgYmJn9
	 vmdxZ2n5L4WAwVCDrT0NIu/zae3YK+41Ft3dyPCAoUGxk7XbGtQYcbzx2drU9jRq5S
	 EZjuAOv1T8s1w==
Date: Thu, 27 Jun 2024 14:29:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] dt-bindings: iio: stm32: dfsdm: fix dtbs warnings on
 dfsdm audio port
Message-ID: <171952014620.474983.15354726969773132715.robh@kernel.org>
References: <20240618115912.706912-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618115912.706912-1-olivier.moysan@foss.st.com>
Message-ID-Hash: U542FWJVB5XV55WNQPR4WQBXPRQT6IV3
X-Message-ID-Hash: U542FWJVB5XV55WNQPR4WQBXPRQT6IV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U542FWJVB5XV55WNQPR4WQBXPRQT6IV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 18 Jun 2024 13:59:12 +0200, Olivier Moysan wrote:
> Fix warnings on DFSDM dtbs check
> Unevaluated properties are not allowed ('dfsdm-dai' was unexpected)
> 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: 11183ac07a74 ("dt-bindings: stm32: convert dfsdm to json-schema")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

