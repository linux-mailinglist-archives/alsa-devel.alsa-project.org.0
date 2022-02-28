Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BF4C9FA9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3577C1EE7;
	Wed,  2 Mar 2022 09:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3577C1EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210746;
	bh=mHHh973hMePN9wmM/jcpBb22Q6OGomp4QlydWc1Dh6w=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kJhaMSsZ9ja3K45FYySotkej8tDr/Z8j9vqmx2v64zngpnxzB0YYjjchrINkp0j19
	 sPSHH4FJ4g2Zgy7CImV4Iza663yecWOHV35Q+4dXzPsqSqpUf+30gn95y4BQRgU3pt
	 QnwHlnGQlh2ZrftRsPRBGbPvzwy/7ZGiIb/W1vx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B71F8060E;
	Wed,  2 Mar 2022 09:34:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B798F80125; Mon, 28 Feb 2022 21:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 286F5F80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 21:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286F5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aCeGMO5x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CAF360B12;
 Mon, 28 Feb 2022 20:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D75C340F2;
 Mon, 28 Feb 2022 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646078608;
 bh=mHHh973hMePN9wmM/jcpBb22Q6OGomp4QlydWc1Dh6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aCeGMO5xD8fsEhRGr4+eOr9z8MstaRRDVGhQ2JFOj5VttTy3IwU/54lJ+oouIG28u
 z81XCgIJowof9B0hR7N3AT4EL/cp1tR3vbL6RuXPasvJp4dShvWkyCbSLiUvoOUiy9
 Ch40bfT8hyQmBKmOBWB/wdlu+kbLkxch8hnE1YJuMD+DqGmnrqOp1buDYyiFRg9zyZ
 nZTjzG+1MPqyPE0xBXIt+SPfFuZFdVwk0yBkI7QA+0xdPnGZ8DjYwz0x7qT3uUHRRq
 N8JYHkY9orf+PL5YgJkzP9kJWMETh9P7vFNG2d7Sp1HIFzdd8vaKYbZBnn3S5kUq8h
 a4Caw+KYsuQwg==
Date: Mon, 28 Feb 2022 14:03:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 01/11] driver: platform: Add helper for safer setting
 of driver_override
Message-ID: <20220228200326.GA516164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227135214.145599-2-krzysztof.kozlowski@canonical.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Feb 27, 2022 at 02:52:04PM +0100, Krzysztof Kozlowski wrote:
> Several core drivers and buses expect that driver_override is a
> dynamically allocated memory thus later they can kfree() it.

> +int driver_set_override(struct device *dev, const char **override,
> +			const char *s, size_t len)
> +{
> +	const char *new, *old;
> +	char *cp;
> +
> +	if (!dev || !override || !s)
> +		return -EINVAL;
> +
> +	/* We need to keep extra room for a newline */

It would help a lot to extend this comment with a hint about where the
room for a newline is needed.  It was confusing even before, but it's
much more so now that the check is in a completely different file than
the "show" functions that need the space.

> +	if (len >= (PAGE_SIZE - 1))
> +		return -EINVAL;
