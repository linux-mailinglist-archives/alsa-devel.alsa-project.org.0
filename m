Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC774B3DD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 17:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC805210;
	Fri,  7 Jul 2023 17:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC805210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688742716;
	bh=c/6GsVA45vCVygJLHm9uSIuA4a9N3IEvCjiocGfjIdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gusenx0gWla+f6SwhpTf5URq62Ko8K0ecq9h7RZxGGUNbX5WyNO15QeWfWiOIZp/Q
	 53na2o8BbkdebgYiVk5iWrofQ+11zF8kmx1TBLJuQasIWZTZDPTT0sLLhc7w/TOJJm
	 GbU5zxOaressQ5Vc3TFvwAWCFyfo5wf4Ndno8VQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2870AF80124; Fri,  7 Jul 2023 17:11:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA12F80124;
	Fri,  7 Jul 2023 17:11:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048ACF80125; Fri,  7 Jul 2023 17:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6539EF80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 17:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6539EF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=nsGQI8CW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42A02616EB;
	Fri,  7 Jul 2023 15:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AF9C433C8;
	Fri,  7 Jul 2023 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688742657;
	bh=c/6GsVA45vCVygJLHm9uSIuA4a9N3IEvCjiocGfjIdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsGQI8CW3xiUFF77osUHi1yahuZMl82hnPwImUllGETvW6ErXH1jsqgDeagGPootK
	 AZo7gQRG9yzKAEeBVyYov+MR0Xx2rH1Iakck7CKhRRLIiiFeqeQltV/pPgZkdroFLq
	 7ySLxAaahGG1UTwZEPHMqHuul77gWGMcYFzKkYQQ=
Date: Fri, 7 Jul 2023 17:10:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mchehab@kernel.org, fabrice.gasnier@foss.st.com,
	andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
	lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	arnd@kernel.org, richardcochran@gmail.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Message-ID: <2023070744-superjet-slum-1772@gregkh>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <2023070748-false-enroll-e5dc@gregkh>
 <febd65e1-68c7-f9d8-c8a4-3c3e88f15f3e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <febd65e1-68c7-f9d8-c8a4-3c3e88f15f3e@foss.st.com>
Message-ID-Hash: 5UMJ6ZCLMIJ2SJD4TG3OB4DVJA5H7DKE
X-Message-ID-Hash: 5UMJ6ZCLMIJ2SJD4TG3OB4DVJA5H7DKE
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UMJ6ZCLMIJ2SJD4TG3OB4DVJA5H7DKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 07, 2023 at 04:00:23PM +0200, Gatien CHEVALLIER wrote:
> I'll change to (GPL-2.0-only OR BSD-3-Clause) :)

If you do that, I'll require a lawyer to sign off on it to verify that
you all know EXACTLY the work involved in dealing with dual-licensed
kernel code.  Sorry, licenses aren't jokes.

thanks,

greg k-h
