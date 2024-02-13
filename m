Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F388533BC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 15:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E38A4A;
	Tue, 13 Feb 2024 15:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E38A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836134;
	bh=M/B+3yw64jbG6sFisbulB5VVpBChPxrc3SPUXNhkWiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NLjULYtx9ZFSUEmxGybTZXiaOtoe7SZ//zbiE51qUWrHs7BMY2bqPAHeGYmeSmcAT
	 w4ZurvlI7qgpKwKg92782UoJcHEH9Ww6VoPIHFpEtPzQ8h50x0b03rviP4mQNq6JjR
	 qEWEp+24Xru/oem1WV4zfLbd6Ey5cGz0RFKlIPGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F9CCF8016E; Tue, 13 Feb 2024 15:55:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D354F805A1;
	Tue, 13 Feb 2024 15:55:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF093F80238; Tue, 13 Feb 2024 15:54:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AD55F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD55F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rfyQAM/O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13E6FCE1C9C;
	Tue, 13 Feb 2024 14:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98077C433C7;
	Tue, 13 Feb 2024 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707836088;
	bh=M/B+3yw64jbG6sFisbulB5VVpBChPxrc3SPUXNhkWiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfyQAM/Oau8KINFZBl3gA4Bu4iUCvDZgr+F8N8k59QnUii4xQRcOW9C6XRUQAO6xf
	 WuLgQ3ZCto8hbVW9ciwakU3F3aITes1//fGc58/jomutcCwJFWgA/+sSyWmdpMPJBz
	 b1GIdanQsvvyTnhPIbVzJhZgXbQ/Vmpsgd44AoCE=
Date: Tue, 13 Feb 2024 15:54:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: kovalev@altlinux.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com, sashal@kernel.org, zhuning0077@gmail.com,
	tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
	lgirdwood@gmail.com
Subject: Re: [PATCH 6.1.y 0/7] ASoC: codecs: es8326: fix support
Message-ID: <2024021335-mourner-impurity-82bd@gregkh>
References: <20240130094708.290485-1-kovalev@altlinux.org>
 <2024020205-suffering-paparazzi-8a49@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024020205-suffering-paparazzi-8a49@gregkh>
Message-ID-Hash: W5DQOVMSALFVUJOKKAPF5YUDTDKDHQUX
X-Message-ID-Hash: W5DQOVMSALFVUJOKKAPF5YUDTDKDHQUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5DQOVMSALFVUJOKKAPF5YUDTDKDHQUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 02, 2024 at 05:13:50PM -0800, Greg KH wrote:
> On Tue, Jan 30, 2024 at 12:47:01PM +0300, kovalev@altlinux.org wrote:
> > These patches were backported from v6.6 upstream and
> > are intended for 6.1.y stable kernel.
> > 
> > Patches have been successfully tested on the latest 6.1.75 kernel.
> > 
> > [PATCH 6.1.y 1/7] ASoC: codecs: es8326: Convert to i2c's .probe_new()
> > [PATCH 6.1.y 2/7] ASoC: codecs: ES8326: Add es8326_mute function
> > [PATCH 6.1.y 3/7] ASoC: codecs: ES8326: Change Hp_detect register names
> > [PATCH 6.1.y 4/7] ASoC: codecs: ES8326: Change Volatile Reg function
> > [PATCH 6.1.y 5/7] ASoC: codecs: ES8326: Fix power-up sequence
> > [PATCH 6.1.y 6/7] ASOC: codecs: ES8326: Add calibration support for
> > [PATCH 6.1.y 7/7] ASoC: codecs: ES8326: Update jact detection function
> > 
> > 
> 
> What exactly is being "fixed" here?  Was the driver not working properly
> in 5.15?  What broke in 6.1?  Or has this hardware just never worked?
> 
> These all don't seem to be fixes, so what is the need for these?

Dropped from my queues due to lack of response :(
