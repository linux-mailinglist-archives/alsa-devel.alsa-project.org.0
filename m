Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C914776268
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 16:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898D682A;
	Wed,  9 Aug 2023 16:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898D682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691591164;
	bh=8oSKjbx+3oLBrMS5n3KJ962So7WecGc39xQyws6r31w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o23Wn6XPU9cdevhLQ2Ki0ef/zFntMrlCuHtQ32T4eFrnLDHcdj+cV2lrkUcv4lc2q
	 nGmSuac8ZZcqY3KkiMWHmfK06nrU4IM8lWB8wwnaREPNMFhlM2K2Ul0BmdZF8YeVlo
	 610+IM5vOCF9pbMr3+6gK8BX1LV6Jo2lVN90W8HM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFDABF80116; Wed,  9 Aug 2023 16:25:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F20F800FB;
	Wed,  9 Aug 2023 16:25:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DDDF80134; Wed,  9 Aug 2023 16:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7F33F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 16:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F33F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qx9jDdZ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cOZqaDWc3HsuU0Akcti+SHi//L0WYRljfoUAHEI5Mb4=; b=Qx9jDdZ8kaM/1t4qA31vsj3BF8
	dJrmsjumeBsxCmbnQgrD4l+9TqTVj2NoRpg930BVIM4FPiFnDXrK3r0dE3c7aPB8z8i2YwInO7to9
	ZmY4RWGF/oukSyMfAB3BtIUJ5a59AUfejt8ckDyqzRpvMTkoqIEH7NE4zEEW7++7Cy/EMtLYo9Pc3
	4TUM8vxLJ1uHstQSOGAsS+ENaeA40kGzBDMDUeYTV9XnYR0ocbLYfozGNsP9hztOYLMxnVn/4L8Wh
	sQORp47ZvgqIrwz5RNsjIYIqnbmiaXa5J9wWUmy6+XkP4b/3HWQ5XJyCA1lPZE1KEy5BCuRV63jGu
	y4IOZS2w==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk72-0059dS-2X;
	Wed, 09 Aug 2023 14:24:36 +0000
Message-ID: <cc9417a3-ef86-bb46-9519-cf65b03b5f08@infradead.org>
Date: Wed, 9 Aug 2023 07:24:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 21/28] net: wan: Add framer framework support
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
 <20230809132757.2470544-22-herve.codina@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230809132757.2470544-22-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DP3JABV3JU7Y3CTFLD5EXCLOURRWGR4F
X-Message-ID-Hash: DP3JABV3JU7Y3CTFLD5EXCLOURRWGR4F
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP3JABV3JU7Y3CTFLD5EXCLOURRWGR4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 8/9/23 06:27, Herve Codina wrote:
> diff --git a/drivers/net/wan/framer/Kconfig b/drivers/net/wan/framer/Kconfig
> new file mode 100644
> index 000000000000..96ef1e7ba8eb
> --- /dev/null
> +++ b/drivers/net/wan/framer/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# FRAMER
> +#
> +
> +menu "Framer Subsystem"
> +
> +config GENERIC_FRAMER
> +	bool "Framer Core"

Just curious: any reason that this cannot be tristate (i.e., a loadable module)?
Thanks.

> +	help
> +	  Generic Framer support.
> +
> +	  This framework is designed to provide a generic interface for framer
> +	  devices present in the kernel. This layer will have the generic
> +	  API by which framer drivers can create framer using the framer
> +	  framework and framer users can obtain reference to the framer.
> +	  All the users of this framework should select this config.
> +
> +endmenu

-- 
~Randy
