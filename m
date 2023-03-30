Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B16D0AA1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 18:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0003A41;
	Thu, 30 Mar 2023 18:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0003A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680192378;
	bh=viaViRHbOUE2fhuaH9npts1s3lqVVfNzJID7p/qGxNE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OK50DQR/c3WSvQ4qAHXPD7xtV4BMA3lA9qbzsGIZSHTxYsTw4cEM6mJjJv6hMvZ4C
	 4Oswp0mEmkB4O4mNoU/EKCSS3sdmRHHiOV4icI0WeIUwb6ibZERTB+3wquedReEz2V
	 rpM7FYWY7iqJG4oDXpr541LIOoTfJ0asXa/UsbbA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 732D5F8024E;
	Thu, 30 Mar 2023 18:05:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 325CBF80272; Thu, 30 Mar 2023 18:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32D06F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 18:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D06F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m6OZfS5Z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F333CB82990;
	Thu, 30 Mar 2023 16:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26820C433D2;
	Thu, 30 Mar 2023 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680192316;
	bh=viaViRHbOUE2fhuaH9npts1s3lqVVfNzJID7p/qGxNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6OZfS5Z2VvyJAEylOF2nv/gh9VcA5FP+BQRkidlgpB/DisvueL3Sd/6WTynINVHl
	 +n7axNxIfrchWxNOAnb1Ej6EVtw4BaFq0Sdnqmopp1uO5TBTiiqE+l7OeYcJJCkxrr
	 MDCQUrjfXukhfzXX+LeDpypxjeMOUAs/lPFCBJ93hmMbD2L13rdvW2zawmYSLP5OQ6
	 wOdrM08QFaR3WJPoVfXxiUSLOVZO2b1ELtzeVPh+Y0bFea+2RQg6QIHuriF0h5WAME
	 61J3oK4B7sxLfoeMZIy9ssFDi3CEgSEnWEwN859ZDCv+fxpHc4SarvuLZZa1suYQVW
	 P36jrUUrMRJBQ==
Date: Thu, 30 Mar 2023 17:05:10 +0100
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230330160510.GB489249@google.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328092645.634375-3-herve.codina@bootlin.com>
Message-ID-Hash: H4RCPTNB35PHCKN7M7YYA2CE277HLYJ5
X-Message-ID-Hash: H4RCPTNB35PHCKN7M7YYA2CE277HLYJ5
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4RCPTNB35PHCKN7M7YYA2CE277HLYJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023, Herve Codina wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.

My goodness!

It's been a long time since I've seen anything quite like this.

My suggestion to you:

* Split this up into components that fit functional subsystems
* Run checkpatch.pl
* Remove all of the debug prints
* Move all of the defines out to a header file
* Be more verbose in your documentation / comments
* Consider using simple-mfd to probe child devices.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/mfd/Kconfig         |   17 +
>  drivers/mfd/Makefile        |    1 +
>  drivers/mfd/pef2256.c       | 1355 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/pef2256.h |   28 +
>  4 files changed, 1401 insertions(+)
>  create mode 100644 drivers/mfd/pef2256.c
>  create mode 100644 include/linux/mfd/pef2256.h

--
Lee Jones [李琼斯]
