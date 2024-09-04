Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1F96B31C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 09:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E219A4D;
	Wed,  4 Sep 2024 09:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E219A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725435841;
	bh=7Z63bOR1fY9qwqSNIp920ir5fJ8AiMMISMSGccEKkt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k6JPQRndpiYFahewBjXOBPfFzaN9PImCus2sW8LVCsciYdmnxYMIBI+GzpJ2jK1hW
	 KwGVZDzNKPmZgjysQZBhZbKA23kChFfKtJrqBAkzCLtzwHAdOnt1veW4QZOLRQsdxa
	 Deu3yP66VQgmtibVFg8hrO/Aef/xlsp2NVV4UO9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 165C6F805B5; Wed,  4 Sep 2024 09:43:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0ED4F805B2;
	Wed,  4 Sep 2024 09:43:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA614F80199; Wed,  4 Sep 2024 09:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1534F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 09:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1534F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hTwHTsKm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0048C5C562A;
	Wed,  4 Sep 2024 07:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4CEC4CEC2;
	Wed,  4 Sep 2024 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725435800;
	bh=7Z63bOR1fY9qwqSNIp920ir5fJ8AiMMISMSGccEKkt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTwHTsKmjWJjApHg0lMnhr8lI0VPWdP1grV6CczeinyyraCuQSp1aSmQvkUqjw6kF
	 ytP/hnYf8e/UiJglJznOMAP7NLMCl85ROv/1Ew3kl+Dflare6wiXrOdT8vRjNXBs6v
	 ksKsk0zSEeRbHrWMkzsC7Js8/BN3uYZgQHGeGBEGOTTAfOvIR7MONe8l0mFRZP81l4
	 fK+udSjPEDA66PtjqqFeSON+8LXbwmHsC3KTTylWosIDUT3lv/3N58QAprLOCU/O+E
	 5K89V6PIUsb4bzBTxR+OeyEf1S6RhKDQGQTuuk/cMGZ6s+dD84qDNc4Oix2J0RujTI
	 CGnZTGq9ee9uA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkfw-000000001r2-1PXm;
	Wed, 04 Sep 2024 09:43:37 +0200
Date: Wed, 4 Sep 2024 09:43:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	andersson@kernel.org, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: apr: Fix some parenthesis alignment coding
 style issues
Message-ID: <ZtgPqJHnQYd7Jm_z@hovoldconsulting.com>
References: <20240904054735.7952-1-riyandhiman14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904054735.7952-1-riyandhiman14@gmail.com>
Message-ID-Hash: YGKGEELYZRTVTQDUWE5VZR2PE2JMIKSI
X-Message-ID-Hash: YGKGEELYZRTVTQDUWE5VZR2PE2JMIKSI
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGKGEELYZRTVTQDUWE5VZR2PE2JMIKSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 11:17:35AM +0530, Riyan Dhiman wrote:
> Adhere to Linux kernel coding style.
> 
> Issue reported by checkpatch:
> - CHECK: Alignment should match open parenthesis

This is not something that is part of the coding style and just an
excessive warning that that checkpatch issues when run with the
--pedantic (a.k.a. --strict) flag.

You can use that flag on your own code if you prefer, but don't send
"cleanups" like this for code that is already in the kernel. It's just
noise.

If you want to practise on how to create and submit a patch, these kind
of patches are accepted for code under drivers/staging however.

Johan
