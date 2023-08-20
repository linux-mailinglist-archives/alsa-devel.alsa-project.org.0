Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D47827B0
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5EA0847;
	Mon, 21 Aug 2023 13:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5EA0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616546;
	bh=Zkfqr6SI88EBqD7f2xXuMdFWLsYnT+jNapbN+UhZwXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hN4jo4K7Y4deDzABGCy5iJEokgrN+7g3F5ojr390W53k/HCjiyqLhIvXKzl5zdaAi
	 lMtQI1xgLq2u4znh5SpxA+Gc0KyD5v24FgZkD27NOG9vt44NMVnt1EhXA1Ma2qvold
	 4PAJaYmWwQYPOIJvFtkFiDecQfLaIP2XUZbrwN5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589B5F8055A; Mon, 21 Aug 2023 13:12:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F85F80608;
	Mon, 21 Aug 2023 13:12:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7D5F80199; Sun, 20 Aug 2023 19:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4851F80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4851F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qcYbvMBs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66D866196F;
	Sun, 20 Aug 2023 17:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD4FC433C8;
	Sun, 20 Aug 2023 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692551718;
	bh=Zkfqr6SI88EBqD7f2xXuMdFWLsYnT+jNapbN+UhZwXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcYbvMBsLDLwA0p1ML9ed9neCvmJ7zBgkux6racwXUMZZVDiaH6DY9dKrCsPxqXmm
	 jDmoSSrcwPzwxcuWvZw8JCmaPiP4+CkWMr63Gbzs6NFLNMjuT3uykobNYXv/bk+lqc
	 PvRARadbFhoxXh7t6NUX5W+JSv3/q9DN7V9zNkrWs4p2FyyMFFyaNRPelyeRE0svQF
	 CjdUagjVJdChTfi0yau4sv+w7+4JN7aqsDX/VBmzisOeEGKLhcOnDs2bPj09ocok7N
	 m+/l7EwNYsxKIpPD/Aj+fi236KH5xRkpGKO95YhLHsvvTIxsLtU7ugi4QHPX0OrFaU
	 pKtT9hUh4Mn2Q==
Date: Sun, 20 Aug 2023 19:15:11 +0200
From: Simon Horman <horms@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Message-ID: <ZOJKH0xHpQc4HdUP@vergenet.net>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
X-MailFrom: horms@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2O56JNR3YXFMCMYJHQWOHL46M2SNIKQI
X-Message-ID-Hash: 2O56JNR3YXFMCMYJHQWOHL46M2SNIKQI
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2O56JNR3YXFMCMYJHQWOHL46M2SNIKQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 18, 2023 at 06:39:15PM +0200, Christophe Leroy wrote:
> From: Herve Codina <herve.codina@bootlin.com>
> 
> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
> 
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.
> 
> This basic implementation provides a framer abstraction for:
>  - power on/off the framer
>  - get the framer status (line state)
>  - be notified on framer status changes
>  - get/set the framer configuration
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Christophe and Herve,

some minor feedback from my side.

...

> diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/framer-core.c

...

> +/**
> + * framer_create() - create a new framer
> + * @dev: device that is creating the new framer
> + * @node: device node of the framer. default to dev->of_node.
> + * @ops: function pointers for performing framer operations
> + *
> + * Called to create a framer using framer framework.
> + */
> +struct framer *framer_create(struct device *dev, struct device_node *node,
> +			     const struct framer_ops *ops)
> +{
> +	int ret;
> +	int id;
> +	struct framer *framer;

Please arrange local variable declarations for Networking code
using reverse xmas tree order - longest line to shortest.

https://github.com/ecree-solarflare/xmastree is helpful here.

...

> diff --git a/include/linux/framer/framer-provider.h b/include/linux/framer/framer-provider.h

...

> +/**
> + * struct framer_ops - set of function pointers for performing framer operations
> + * @init: operation to be performed for initializing the framer
> + * @exit: operation to be performed while exiting
> + * @power_on: powering on the framer
> + * @power_off: powering off the framer
> + * @flags: OR-ed flags (FRAMER_FLAG_*) to ask for core functionality
> + *          - @FRAMER_FLAG_POLL_STATUS:
> + *            Ask the core to perfom a polling to get the framer status and

nit: perfom -> perform

     checkpatch.pl --codespell is your friend here

> + *            notify consumers on change.
> + *            The framer should call @framer_notify_status_change() when it
> + *            detects a status change. This is usally done using interrutps.

nit: usally -> usually
     interrutps -> interrupts

...

> diff --git a/include/linux/framer/framer.h b/include/linux/framer/framer.h
> new file mode 100644
> index 000000000000..0bee7135142f
> --- /dev/null
> +++ b/include/linux/framer/framer.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Generic framer header file
> + *
> + * Copyright 2023 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#ifndef __DRIVERS_FRAMER_H
> +#define __DRIVERS_FRAMER_H
> +
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
> +
> +/**
> + * enum framer_iface - Framer interface

As this is a kernel-doc, please include documentation for
the defined constants: FRAMER_IFACE_E1 and FRAMER_IFACE_T1.

As flagged by: ./scripts/kernel-doc -none

> + */
> +enum framer_iface {
> +	FRAMER_IFACE_E1,      /* E1 interface */
> +	FRAMER_IFACE_T1,      /* T1 interface */
> +};
> +
> +/**
> + * enum framer_clock_mode - Framer clock mode

Likewise here too.

Also, nit: framer_clock_mode -> framer_clock_type

> + */
> +enum framer_clock_type {
> +	FRAMER_CLOCK_EXT, /* External clock */
> +	FRAMER_CLOCK_INT, /* Internal clock */
> +};
> +
> +/**
> + * struct framer_configuration - Framer configuration

nit: framer_configuration -> framer_config

> + * @line_iface: Framer line interface
> + * @clock_mode: Framer clock type
> + * @clock_rate: Framer clock rate
> + */
> +struct framer_config {
> +	enum framer_iface iface;
> +	enum framer_clock_type clock_type;
> +	unsigned long line_clock_rate;
> +};
> +
> +/**
> + * struct framer_status - Framer status
> + * @link_is_on: Framer link state. true, the link is on, false, the link is off.
> + */
> +struct framer_status {
> +	bool link_is_on;
> +};
> +
> +/**
> + * framer_event - event available for notification

nit: framer_event -> enum framer_event

A~d please document FRAMER_EVENT_STATUS in the kernel doc too.

> + */
> +enum framer_event {
> +	FRAMER_EVENT_STATUS,	/* Event notified on framer_status changes */
> +};

...
