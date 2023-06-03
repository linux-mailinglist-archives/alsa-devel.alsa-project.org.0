Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAC972118F
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Jun 2023 20:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7E6206;
	Sat,  3 Jun 2023 20:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7E6206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685817056;
	bh=hsX7q9+cVjzdo/foEa34n0ylZFDMI49d1mBkQt9HjoE=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jv5d8e2+75kwRyq7YGaFaLjTPYDPnfdgwExVh7G9KSZarT0zIJLgqv7L/KRlv+APr
	 T6KAQ2GzRuN0FnhvW4XcTPjDRh45SxaHypUhSBm8IOQ/gYmI8lUpNQgrW6pvMsSQFR
	 ThwE3ln2NXSvl8KJiZE0ciQ0enR/R7RRJ0IFxp5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B6EF800BD; Sat,  3 Jun 2023 20:29:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68EF1F800BD;
	Sat,  3 Jun 2023 20:29:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F82F8016B; Sat,  3 Jun 2023 20:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07E35F800BD
	for <alsa-devel@alsa-project.org>; Sat,  3 Jun 2023 20:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E35F800BD
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 555a7ff2-023c-11ee-abf4-005056bdd08f;
	Sat, 03 Jun 2023 21:27:45 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Sat, 3 Jun 2023 21:27:44 +0300
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 9/9] ASoC: simple-card: Handle additional devices
Message-ID: <ZHuGIGDsyGWPTvKi@surfacebook>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
 <20230523151223.109551-10-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523151223.109551-10-herve.codina@bootlin.com>
Message-ID-Hash: PXZ4GWBEFGE27ORA5YWYY2YEB7RSHRK6
X-Message-ID-Hash: PXZ4GWBEFGE27ORA5YWYY2YEB7RSHRK6
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXZ4GWBEFGE27ORA5YWYY2YEB7RSHRK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Tue, May 23, 2023 at 05:12:23PM +0200, Herve Codina kirjoitti:
> An additional-devs subnode can be present in the simple-card top node.
> This subnode is used to declared some "virtual" additional devices.
> 
> Create related devices from this subnode and avoid this subnode presence
> to interfere with the already supported subnodes analysis.

...

> +static int simple_populate_aux(struct asoc_simple_priv *priv)
> +{
> +	struct device *dev = simple_priv_to_dev(priv);
> +	struct device_node *node;
> +	struct device **ptr;
> +	int ret;
> +
> +	node = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
> +	if (!node)
> +		return 0;
> +
> +	ptr = devres_alloc(simple_populate_aux_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = of_platform_populate(node, NULL, NULL, dev);
> +	if (ret) {
> +		devres_free(ptr);
> +	} else {
> +		*ptr = dev;
> +		devres_add(dev, ptr);
> +	}
> +	return ret;

This can be well simplified by using devm_add_action_or_reset().

> +}

-- 
With Best Regards,
Andy Shevchenko


