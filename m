Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBD8D85ED
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 17:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D20491;
	Mon,  3 Jun 2024 17:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D20491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717428051;
	bh=ijFVnlnPe4zsomyhDg/uKsVKn4FbatsAOMaZJzU2c5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MDnzkRILEGiOuhId0OU2p1PW/zKQTZBz1lnFNLDHbBfpWBII+EfQjv84nzK2uITo0
	 Gxai0lHTtlOvLzT0atwHjPFlaL9pfAuVWW+0PHHOVxKW8qQOJsClRPVM28JHjgJoHg
	 6L/SRmsSHPjOIaOdNLPzV337GzxQ+b7i+ly3pUmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8735AF80589; Mon,  3 Jun 2024 17:20:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFA4F8058C;
	Mon,  3 Jun 2024 17:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C4D2F8025A; Mon,  3 Jun 2024 17:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6547CF800AC
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 17:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6547CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qKOEUN4P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85174CE0E05;
	Mon,  3 Jun 2024 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29012C32781;
	Mon,  3 Jun 2024 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717427991;
	bh=ijFVnlnPe4zsomyhDg/uKsVKn4FbatsAOMaZJzU2c5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKOEUN4Pu+QL0in2TzHhV83HuGS3DoXq+HWMG3I5DXalhiauPyPK9E3wWuESvxWY+
	 XR4s1HEk4jd5x9/VtXIJRWcDVuWalwN2U8WtgvaMrv/JHfFljpLK2s9a5RZT6YYjMg
	 1gFz+RoYtaHMGVHkWBAFLE1wa8Vz41dbSxCBsyAFBgXKMnV8D45G74dML9AMrHJ1X1
	 7CQY87wtvaH+uUJErkWK8qGhYjjdZo9T+Q3S9MyidigHGEgGRXwExz83GhMS8SiwHB
	 NUhgjxegNKsd69aGExvSw100T+BLCwixrFqZF54bzii+LQBPw483EOYd82DUuyAOuJ
	 AldrXeO0R5MuA==
Date: Mon, 3 Jun 2024 10:19:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: kernel@axis.com, Kevin Lu <kevin-lu@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: sound: tlv320adc3xxx: Fix incorrect GPIO
 description
Message-ID: <171742798573.458718.16069041554042584405.robh@kernel.org>
References: <20240528-tlv320adc3xxx-dt-gpio-fix-v1-1-209fb2c2f86f@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-tlv320adc3xxx-dt-gpio-fix-v1-1-209fb2c2f86f@axis.com>
Message-ID-Hash: R7SUH7GJRZN4ULONU6SUTOZYXANXFPTG
X-Message-ID-Hash: R7SUH7GJRZN4ULONU6SUTOZYXANXFPTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7SUH7GJRZN4ULONU6SUTOZYXANXFPTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 28 May 2024 17:40:04 +0200, Ricard Wanderlof wrote:
> Fix the description for the ti,dmdin-gpio1 and ti,dmclk-gpio2
> properties to correctly describe that when configured as general
> purpose outputs (ADC3XXX_GPIO_GPO), the pins are available via
> the GPIO framework.
> 
> Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

