Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8187847E11
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 02:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B199584C;
	Sat,  3 Feb 2024 02:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B199584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706922882;
	bh=Mki4G/PAWSDHRLxwPPWCIKxidm5+6SE37JqhA10oRt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+q8LgoRkNr9gWvcLuAmImd9PMC3+wPi5jvAK6frhyB3GMLAcRpzbD6hLXw6hNHX8
	 vzFrXcP7ouD9y/OcCaiXGxHR59cE42jazWZfeFl5cTGFxxFCFJf7zqyS57ndblyRb/
	 LXgKQouMO5W1ZunthXq1b2PM3t6zbMPL6AJGEIjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C7C3F8059F; Sat,  3 Feb 2024 02:14:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA819F8056F;
	Sat,  3 Feb 2024 02:14:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3806F8055C; Sat,  3 Feb 2024 02:14:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBDA4F804E7
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 02:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDA4F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xHdRFkvA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F58ECE2E8D;
	Sat,  3 Feb 2024 01:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC9BC433F1;
	Sat,  3 Feb 2024 01:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706922831;
	bh=Mki4G/PAWSDHRLxwPPWCIKxidm5+6SE37JqhA10oRt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xHdRFkvALtklBzwDpKYAuY9ZrQ9J5QHzb3UQy25GSUmTVycjAOJLmt2V6tWFoaq+k
	 nZPfGZnEKbVSfuImC+mFY5NURYLZVFQRVLaWbOwfTFT09HaEFh4ytR607V2wdv2xAO
	 iYd04AbNIA64BFNP9BynIJ7msWxSR3lDOQxQHKAs=
Date: Fri, 2 Feb 2024 17:13:50 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: kovalev@altlinux.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com, sashal@kernel.org, zhuning0077@gmail.com,
	tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
	lgirdwood@gmail.com
Subject: Re: [PATCH 6.1.y 0/7] ASoC: codecs: es8326: fix support
Message-ID: <2024020205-suffering-paparazzi-8a49@gregkh>
References: <20240130094708.290485-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130094708.290485-1-kovalev@altlinux.org>
Message-ID-Hash: ZXEKIHZQDZFYLEVRIOHUWR3ZLJMHTNUL
X-Message-ID-Hash: ZXEKIHZQDZFYLEVRIOHUWR3ZLJMHTNUL
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXEKIHZQDZFYLEVRIOHUWR3ZLJMHTNUL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 30, 2024 at 12:47:01PM +0300, kovalev@altlinux.org wrote:
> These patches were backported from v6.6 upstream and
> are intended for 6.1.y stable kernel.
> 
> Patches have been successfully tested on the latest 6.1.75 kernel.
> 
> [PATCH 6.1.y 1/7] ASoC: codecs: es8326: Convert to i2c's .probe_new()
> [PATCH 6.1.y 2/7] ASoC: codecs: ES8326: Add es8326_mute function
> [PATCH 6.1.y 3/7] ASoC: codecs: ES8326: Change Hp_detect register names
> [PATCH 6.1.y 4/7] ASoC: codecs: ES8326: Change Volatile Reg function
> [PATCH 6.1.y 5/7] ASoC: codecs: ES8326: Fix power-up sequence
> [PATCH 6.1.y 6/7] ASOC: codecs: ES8326: Add calibration support for
> [PATCH 6.1.y 7/7] ASoC: codecs: ES8326: Update jact detection function
> 
> 

What exactly is being "fixed" here?  Was the driver not working properly
in 5.15?  What broke in 6.1?  Or has this hardware just never worked?

These all don't seem to be fixes, so what is the need for these?

confused,

greg k-h
