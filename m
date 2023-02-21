Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6A69E83F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 20:28:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59604EA1;
	Tue, 21 Feb 2023 20:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59604EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677007727;
	bh=CW0TrnVYPmqzjtnakRU/aIYasnOG7MQ3x8BrFO+nk5E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dY/HgC5CQR1h+4Ns7Nb9CQ6iY27z6iDjhn3tAQOwdVZd/se5SygQojPXTpmy9ys1G
	 T5whGoXLD9eXYYm7sEs1+enJRWxL92DkClIDwwqW5uN8l2Z+CBIQwFChAgRSgFDouH
	 nPKu03QrjZMAvUZNIOFhj6EEkvtFshNTxAUpBLqM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77243F8025A;
	Tue, 21 Feb 2023 20:27:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31436F80266; Tue, 21 Feb 2023 20:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7F7FF80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 20:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F7FF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=q7O14rMg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 707F061024;
	Tue, 21 Feb 2023 19:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD5BC433EF;
	Tue, 21 Feb 2023 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677007666;
	bh=CW0TrnVYPmqzjtnakRU/aIYasnOG7MQ3x8BrFO+nk5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7O14rMgHPWK3ZL38sH6QN80+YfXUDY2bDXIlMYF0KJDtmtgzZg8jBegZT0X1wjc2
	 WPmb+F3Hn/55y/CyX/z+nSiTTXc+bjOjWjvGE422HatRrB1X93br7LSuJeGW7kGsqC
	 z6DsevUunCbLnOIrR7W2jMDDz8w8Maex76wL2SKo=
Date: Tue, 21 Feb 2023 20:27:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/UbMH5tXDgsvSbD@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-10-clamor95@gmail.com>
Message-ID-Hash: HDSCQDGGF2MEOQEHJIQVBN7QEPJA5MMZ
X-Message-ID-Hash: HDSCQDGGF2MEOQEHJIQVBN7QEPJA5MMZ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDSCQDGGF2MEOQEHJIQVBN7QEPJA5MMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> FM34NE is digital sound processing chip used for active
> noise suppression mainly on ASUS Transformers.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/Kconfig          |   2 +
>  drivers/staging/Makefile         |   1 +
>  drivers/staging/dsp/Kconfig      |   7 +
>  drivers/staging/dsp/Makefile     |   2 +
>  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
>  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
>  6 files changed, 1221 insertions(+)
>  create mode 100644 drivers/staging/dsp/Kconfig
>  create mode 100644 drivers/staging/dsp/Makefile
>  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
>  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h


Sorry, but why is this going into drivers/staging/ at all?  What is
needed to be done to get this out of staging?  Why not do that work
right now?  At the least, we need a TODO file in the directory that
lists what needs to be done and who is responsible for it.

But again, just do the work now, it's faster and simpler to do it before
you submit it instead of waiting until after it is merged.

Also, no need for a .h file when you only have one .c file.  Just put
them all together into one file please.

thanks,

greg k-h
