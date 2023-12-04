Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690E803593
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 14:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E687686E;
	Mon,  4 Dec 2023 14:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E687686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701698053;
	bh=esHuCLsnYzWLmm5Oa6L+Kmza70Ps3RCO18AT+iUJYoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iV/7qKwe0Prkv0SNFC6OZ7pRhJq/ZQ9RptZJGAfKmMgQGT/lHn4jBjqT5j1QQ3AM3
	 YNXhVWg5mjTMNql2Fr/3a8cK07vYxhlMRHn3BEHMCLwQfil81p3xCPgJVYFCKNzBmg
	 B2gjjr0QrlQENkQeVM35lUzLKaPB7U/tkvTZ9l50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8A5EF805A9; Mon,  4 Dec 2023 14:53:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79CC3F805B2;
	Mon,  4 Dec 2023 14:53:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A039F8024E; Mon,  4 Dec 2023 14:53:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6562CF800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 14:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6562CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S7jPfNYo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6DA03B80EF5;
	Mon,  4 Dec 2023 13:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81ACC433C8;
	Mon,  4 Dec 2023 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701697999;
	bh=esHuCLsnYzWLmm5Oa6L+Kmza70Ps3RCO18AT+iUJYoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7jPfNYoSehiFCVmvkeB3YWHBnjgSiFuETLq9dY1RH90k0MXl6dSB376aJQmxz/SJ
	 QRqiBrCPDEv1NNNLFRdNyVkjtcdqEqUL/zpg/AxF++c9EonLkx58tZ+UvojQSP6YXE
	 62SIy3Jbw8gCBjUohCYs20csnvEtT+ev3iQwuumVREZmjFQv/HL4+Z6/ikawOUcHaD
	 JW0zXl6b3XoZFkJE+nF3JlC2xpaEMk9MhOOQFq4Dz0q2tgyz7G4hyemrsz9elc7pyY
	 lVqrA/RCi1ut+Rh8FCFmoevezMjQhYb7V/4hj5lL35IcaU/LhMTlMSJYbRWuEnne3T
	 MMAeJQzpMoK1A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA9Ob-0003VA-1F;
	Mon, 04 Dec 2023 14:54:01 +0100
Date: Mon, 4 Dec 2023 14:54:01 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
Message-ID: <ZW3Z-bQwlEoubDU2@hovoldconsulting.com>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
 <20231204124736.132185-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204124736.132185-3-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 4TI2HKZT2SN3RD7BHCWFVZVWCPA47TI5
X-Message-ID-Hash: 4TI2HKZT2SN3RD7BHCWFVZVWCPA47TI5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TI2HKZT2SN3RD7BHCWFVZVWCPA47TI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 04, 2023 at 12:47:36PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Limit the speaker digital gains to 0dB so that the users will not damage them.
> Currently there is a limit in UCM, but this does not stop the user form
> changing the digital gains from command line. So limit this in driver
> which makes the speakers more safer without active speaker protection in
> place.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Works as intended:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Given the reason for why you are adding this, it seems you should have
added:

Cc: stable@vger.kernel.org	# 6.5

as well.

Johan
