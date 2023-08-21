Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A2782365
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 08:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF2874C;
	Mon, 21 Aug 2023 08:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF2874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692597934;
	bh=PMXFq0GGCcN3Dp1LHnG3elpZhXoSjz7+AhPr/HRplqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fMutyuYLii8JPfMvDwB6isLk0LUjzfQPOu9tsS/mj9pT4gxgLfzx7bRwEphb5v3hi
	 bZ0VRiadeovWZBaq1Ufx+B+3Jf4LqBmRi7RvZdHueTVb0uLs5/MHh1pjTS9/hWf+ek
	 oYIuGsK+M44/OYvaAWsyRupLJlZ3ZWG61AO0RmdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 085EBF800F8; Mon, 21 Aug 2023 08:04:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 546E6F8016C;
	Mon, 21 Aug 2023 08:04:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A46DF80199; Mon, 21 Aug 2023 08:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 238D3F8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 08:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238D3F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=skuSMWgg
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id XxzOqfCA7kHhaXxzPqKRsh; Mon, 21 Aug 2023 08:02:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1692597738;
	bh=4jclUITBl2I0woVUAlLiABdGcbM1YRalF8t7jBmWRak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=skuSMWggGom9rpc6vnr/umRw99kEOjARwSRubdqmbXFu0wEIBBaqO1nKhY0+BnsDI
	 l7Khl/sHc3i1GaQxUPcO7dqNw4cfl1IFT11x3kNlCOn2rSv4BaZPVoleMgoriOzoBY
	 +hngr0rjj3do019kAEttonO51Ip35wnSa4vLQgvEumzcki1339Yqqtf45bmPzD4qSY
	 J+X8Pb9X0eqgHvRuLOQjFQ97DUENaMQJBCFZOZm533tpLxwpj2ChTipatR2ZmpTBSI
	 E8mBQxDldjtwREZtsLpz83MSf8JV07AITt/b5U8yGOEa612OpnubZdT8DEBHg1f5HC
	 8khKkdt5E7MWg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Aug 2023 08:02:18 +0200
X-ME-IP: 86.243.2.178
Message-ID: <fcc6fed6-4234-559d-f3fb-f3c86482e6b0@wanadoo.fr>
Date: Mon, 21 Aug 2023 08:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Content-Language: fr
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
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
 Nicolin Chen <nicoleotsuka@gmail.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CADROCWEMFXY6SY4WIEBZ7TSVKIAJFZV
X-Message-ID-Hash: CADROCWEMFXY6SY4WIEBZ7TSVKIAJFZV
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CADROCWEMFXY6SY4WIEBZ7TSVKIAJFZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 18/08/2023 à 18:39, Christophe Leroy a écrit :
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
>   - power on/off the framer
>   - get the framer status (line state)
>   - be notified on framer status changes
>   - get/set the framer configuration
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Hi,

should there be a V5, some nits below.

...

> +int framer_power_off(struct framer *framer)
> +{
> +	int ret;
> +
> +	mutex_lock(&framer->mutex);
> +	if (framer->power_count == 1 && framer->ops->power_off) {
> +		ret =  framer->ops->power_off(framer);

                      ~~
Useless extra space

> +		if (ret < 0) {
> +			dev_err(&framer->dev, "framer poweroff failed --> %d\n", ret);
> +			mutex_unlock(&framer->mutex);
> +			return ret;
> +		}
> +	}
> +	--framer->power_count;
> +	mutex_unlock(&framer->mutex);
> +	framer_pm_runtime_put(framer);
> +
> +	if (framer->pwr)
> +		regulator_disable(framer->pwr);
> +
> +	return 0;
> +}

...

> +struct framer *framer_create(struct device *dev, struct device_node *node,
> +			     const struct framer_ops *ops)
> +{
> +	int ret;
> +	int id;
> +	struct framer *framer;
> +
> +	if (WARN_ON(!dev))
> +		return ERR_PTR(-EINVAL);
> +
> +	/* get_status() is mandatory if the provider ask for polling status */
> +	if (WARN_ON((ops->flags & FRAMER_FLAG_POLL_STATUS) && !ops->get_status))
> +		return ERR_PTR(-EINVAL);
> +
> +	framer = kzalloc(sizeof(*framer), GFP_KERNEL);
> +	if (!framer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	id = ida_simple_get(&framer_ida, 0, 0, GFP_KERNEL);

ida_alloc()?
(ida_simple_get() is deprecated)

> +	if (id < 0) {
> +		dev_err(dev, "unable to get id\n");
> +		ret = id;
> +		goto free_framer;
> +	}
> +
> +	device_initialize(&framer->dev);
> +	mutex_init(&framer->mutex);
> +	INIT_WORK(&framer->notify_status_work, framer_notify_status_work);
> +	INIT_DELAYED_WORK(&framer->polling_work, framer_polling_work);
> +	BLOCKING_INIT_NOTIFIER_HEAD(&framer->notifier_list);
> +
> +	framer->dev.class = framer_class;
> +	framer->dev.parent = dev;
> +	framer->dev.of_node = node ? node : dev->of_node;
> +	framer->id = id;
> +	framer->ops = ops;
> +
> +	ret = dev_set_name(&framer->dev, "framer-%s.%d", dev_name(dev), id);
> +	if (ret)
> +		goto put_dev;
> +
> +	/* framer-supply */
> +	framer->pwr = regulator_get_optional(&framer->dev, "framer");
> +	if (IS_ERR(framer->pwr)) {
> +		ret = PTR_ERR(framer->pwr);
> +		if (ret == -EPROBE_DEFER)
> +			goto put_dev;
> +
> +		framer->pwr = NULL;
> +	}
> +
> +	ret = device_add(&framer->dev);
> +	if (ret)
> +		goto put_dev;
> +
> +	if (pm_runtime_enabled(dev)) {
> +		pm_runtime_enable(&framer->dev);
> +		pm_runtime_no_callbacks(&framer->dev);
> +	}
> +
> +	return framer;
> +
> +put_dev:
> +	put_device(&framer->dev);  /* calls framer_release() which frees resources */
> +	return ERR_PTR(ret);
> +
> +free_framer:
> +	kfree(framer);
> +	return ERR_PTR(ret);
> +}

...

> +void framer_provider_of_unregister(struct framer_provider *framer_provider)
> +{
> +	mutex_lock(&framer_provider_mutex);
> +	list_del(&framer_provider->list);
> +	of_node_put(framer_provider->dev->of_node);
> +	kfree(framer_provider);
> +	mutex_unlock(&framer_provider_mutex);

If it make sense, of_node_put() and kfree() could maybe be out of the 
mutex, in order to match how things are done in 
__framer_provider_of_register().

> +}

...

> +static void framer_release(struct device *dev)
> +{
> +	struct framer *framer;
> +
> +	framer = dev_to_framer(dev);
> +	regulator_put(framer->pwr);
> +	ida_simple_remove(&framer_ida, framer->id);

ida_free()?
(ida_simple_remove() is deprecated)

> +	kfree(framer);
> +}

...

