Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D67A6C6C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 22:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 955C8823;
	Tue, 19 Sep 2023 22:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 955C8823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695156345;
	bh=6BDc2KHQ21MS7N40VVpebYYccPV/cN0/RrqJzTMf8ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TI4rqFLbqPaP745u6vo+tASvp36pKvn3/D0MR48/C3vj5MvQVZO0WjYjk782wGbGS
	 Mxqf1Tt8msFCXXHf27K9o6UD79eMHGc87ZVjytoGSk5nORhCqs818r6Yw41MGyNals
	 oOr2DBN2csTOMldI82YLwom8rDB5e2N8FDRt25XA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51A1F80494; Tue, 19 Sep 2023 22:44:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8464DF80124;
	Tue, 19 Sep 2023 22:44:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C940CF8025A; Tue, 19 Sep 2023 22:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 070C4F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 22:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 070C4F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=DnmUEii4
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68fc9e0e22eso4824196b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695156273; x=1695761073;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExQKscZ59NQl4S7+S0POdlY5kq9zgEA2mOHUrQX5Svc=;
        b=DnmUEii4a2nRiqOm4XT5WlJS3HaB2XPJ20zcbPepvNWKu5WqODtwLLXe2ip44Zw9rh
         i0RxQgAsf34ev9lz8kd7GLHchWAT+sVLb2qGuY+kg6//WmFDkhLz9RQM5+6vBKmCgtgs
         1n+SBtxRyHyTkof081IM+/cItix2QzISOQua6giaHwpiX6DhgknA9WOvrZ2nYwyq77iS
         DJr387zqetdrjGVFUefRNuRnOdGvPe3vKXEInYReTIFGuGp5HSiOVxjqhxuGlCXXzr7M
         /8eqiMfQokoX5zwZB6ZxYaSRGIBQUIcyOZ9p0nZKRiqn9H1SHr8TXiMvKUhTMEFhD0zi
         pMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695156273; x=1695761073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExQKscZ59NQl4S7+S0POdlY5kq9zgEA2mOHUrQX5Svc=;
        b=FAVTJla9J7nOARG88cdXW1MbNwgP1GFI/TNQQf5GGgBX1iXqSMuHIwdSNF9BHp0Pot
         HIyrvpENtu1Wg3ott9SI/RWXHVfubh+GZI/UULZEmm9dpTFqBopH9dBnlssrvnYAYURm
         9KQugdzQJoU7eoTzMKPzs/yW3F7IG9AIFOoIYcfUFEwPnd1tMnIhvNhssNhnE3OHzjVV
         gk98QHDms8z8AzDObOeF1iAzd5VUaeGCnYr0Rue752CI/qctQ9VAN+Vnz3WzZ4LB3NBb
         aolaVWA1MtQSuvief6j9sh8lFQXkj2Y7+y6jkg5mE1Jk53+aozb3tSwN3Koox6AuSW5J
         O64Q==
X-Gm-Message-State: AOJu0YwaRbsSdY5nAHWklf6rjYZq9AEH2FNJl/qO6HfCX/Mo5AYz+NwX
	g1x5bXUS0iUAas9h6gddkJozNA==
X-Google-Smtp-Source: 
 AGHT+IFuf7+6BfL5h7f/TjFDpIdv3+O9FNZBxVLCouZ/e6lb6fHYnrZ/aEdNoEvBdFXbE4nwPUAqww==
X-Received: by 2002:a05:6a00:c91:b0:68f:b8ca:b11 with SMTP id
 a17-20020a056a000c9100b0068fb8ca0b11mr794020pfv.11.1695156272812;
        Tue, 19 Sep 2023 13:44:32 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:118e:eaf2:1433:f9fe])
        by smtp.gmail.com with ESMTPSA id
 b5-20020aa78705000000b0067b643b814csm9037810pfo.6.2023.09.19.13.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 13:44:32 -0700 (PDT)
Date: Tue, 19 Sep 2023 13:44:28 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] ALSA: hda: cirrus_scodec: Add KUnit test
Message-ID: <ZQoILN6QCjzosCOs@google.com>
References: <20230918095129.440-1-rf@opensource.cirrus.com>
 <20230918095129.440-3-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918095129.440-3-rf@opensource.cirrus.com>
Message-ID-Hash: HTJ3FRJHREVAXVAUSAGWNQH6QQBGC2T7
X-Message-ID-Hash: HTJ3FRJHREVAXVAUSAGWNQH6QQBGC2T7
X-MailFrom: ndesaulniers@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTJ3FRJHREVAXVAUSAGWNQH6QQBGC2T7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 10:51:29AM +0100, Richard Fitzgerald wrote:
> Add a KUnit test for cirrus_scodec_get_speaker_id(). It is impractical
> to have enough hardware with every possible permutation of speaker id.
> So use a test harness to test all theoretically supported options.
> 
> The test harness consists of:
> - a mock GPIO controller.
> - a mock struct device to represent the scodec driver
> - software nodes to provide the fwnode info that would normally come
>   from ACPI.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  sound/pci/hda/Kconfig              |  12 +
>  sound/pci/hda/Makefile             |   2 +
>  sound/pci/hda/cirrus_scodec_test.c | 370 +++++++++++++++++++++++++++++
>  sound/pci/hda/cs35l56_hda.c        |  10 +
>  4 files changed, 394 insertions(+)
>  create mode 100644 sound/pci/hda/cirrus_scodec_test.c
> 
> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index 2980bfef0a4c..706cdc589e6f 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -94,6 +94,18 @@ config SND_HDA_PATCH_LOADER
>  config SND_HDA_CIRRUS_SCODEC
>  	tristate
>  
> +config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
> +	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
> +	select SND_HDA_CIRRUS_SCODEC
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds KUnit tests for the cirrus side-codec library.
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +	  If in doubt, say "N".
> +
>  config SND_HDA_SCODEC_CS35L41
>  	tristate
>  	select SND_HDA_GENERIC
> diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
> index aa445af0cf9a..793e296c3f64 100644
> --- a/sound/pci/hda/Makefile
> +++ b/sound/pci/hda/Makefile
> @@ -29,6 +29,7 @@ snd-hda-codec-hdmi-objs :=	patch_hdmi.o hda_eld.o
>  
>  # side codecs
>  snd-hda-cirrus-scodec-objs :=		cirrus_scodec.o
> +snd-hda-cirrus-scodec-test-objs :=	cirrus_scodec_test.o
>  snd-hda-scodec-cs35l41-objs :=		cs35l41_hda.o cs35l41_hda_property.o
>  snd-hda-scodec-cs35l41-i2c-objs :=	cs35l41_hda_i2c.o
>  snd-hda-scodec-cs35l41-spi-objs :=	cs35l41_hda_spi.o
> @@ -58,6 +59,7 @@ obj-$(CONFIG_SND_HDA_CODEC_HDMI) += snd-hda-codec-hdmi.o
>  
>  # side codecs
>  obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC) += snd-hda-cirrus-scodec.o
> +obj-$(CONFIG_SND_HDA_CIRRUS_SCODEC_KUNIT_TEST) += snd-hda-cirrus-scodec-test.o
>  obj-$(CONFIG_SND_HDA_SCODEC_CS35L41) += snd-hda-scodec-cs35l41.o
>  obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_I2C) += snd-hda-scodec-cs35l41-i2c.o
>  obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_SPI) += snd-hda-scodec-cs35l41-spi.o
> diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
> new file mode 100644
> index 000000000000..5eb590cd4fe2
> --- /dev/null
> +++ b/sound/pci/hda/cirrus_scodec_test.c
> @@ -0,0 +1,370 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// KUnit test for the Cirrus side-codec library.
> +//
> +// Copyright (C) 2023 Cirrus Logic, Inc. and
> +//                    Cirrus Logic International Semiconductor Ltd.
> +
> +#include <kunit/test.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "cirrus_scodec.h"
> +
> +struct cirrus_scodec_test_gpio {
> +	unsigned int pin_state;
> +	struct gpio_chip chip;
> +};
> +
> +struct cirrus_scodec_test_priv {
> +	struct platform_device amp_pdev;
> +	struct platform_device *gpio_pdev;
> +	struct cirrus_scodec_test_gpio *gpio_priv;
> +};
> +
> +static int cirrus_scodec_test_gpio_get_direction(struct gpio_chip *chip,
> +						 unsigned int offset)
> +{
> +	return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int cirrus_scodec_test_gpio_direction_in(struct gpio_chip *chip,
> +						unsigned int offset)
> +{
> +	return 0;
> +}
> +
> +static int cirrus_scodec_test_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct cirrus_scodec_test_gpio *gpio_priv = gpiochip_get_data(chip);
> +
> +	return !!(gpio_priv->pin_state & BIT(offset));
> +}
> +
> +static int cirrus_scodec_test_gpio_direction_out(struct gpio_chip *chip,
> +						 unsigned int offset, int value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static void cirrus_scodec_test_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +					int value)
> +{
> +}
> +
> +static int cirrus_scodec_test_gpio_set_config(struct gpio_chip *gc,
> +					      unsigned int offset,
> +					      unsigned long config)
> +{
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_OUTPUT:
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		return -EOPNOTSUPP;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct gpio_chip cirrus_scodec_test_gpio_chip = {
> +	.label			= "cirrus_scodec_test_gpio",
> +	.owner			= THIS_MODULE,
> +	.request		= gpiochip_generic_request,
> +	.free			= gpiochip_generic_free,
> +	.get_direction		= cirrus_scodec_test_gpio_get_direction,
> +	.direction_input	= cirrus_scodec_test_gpio_direction_in,
> +	.get			= cirrus_scodec_test_gpio_get,
> +	.direction_output	= cirrus_scodec_test_gpio_direction_out,
> +	.set			= cirrus_scodec_test_gpio_set,
> +	.set_config		= cirrus_scodec_test_gpio_set_config,
> +	.base			= -1,
> +	.ngpio			= 32,
> +};
> +
> +static int cirrus_scodec_test_gpio_probe(struct platform_device *pdev)
> +{
> +	struct cirrus_scodec_test_gpio *gpio_priv;
> +	int ret;
> +
> +	gpio_priv = devm_kzalloc(&pdev->dev, sizeof(*gpio_priv), GFP_KERNEL);
> +	if (!gpio_priv)
> +		return -ENOMEM;
> +
> +	/* GPIO core modifies our struct gpio_chip so use a copy */
> +	gpio_priv->chip = cirrus_scodec_test_gpio_chip;
> +	ret = devm_gpiochip_add_data(&pdev->dev, &gpio_priv->chip, gpio_priv);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to add gpiochip\n");
> +
> +	dev_set_drvdata(&pdev->dev, gpio_priv);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver cirrus_scodec_test_gpio_driver = {
> +	.driver.name	= "cirrus_scodec_test_gpio_drv",
> +	.probe		= cirrus_scodec_test_gpio_probe,
> +};
> +
> +/* software_node referencing the gpio driver */
> +static const struct software_node cirrus_scodec_test_gpio_swnode = {
> +	.name = "cirrus_scodec_test_gpio",
> +};
> +
> +static int cirrus_scodec_test_create_gpio(struct kunit *test)
> +{
> +	struct cirrus_scodec_test_priv *priv = test->priv;
> +	int ret;
> +
> +	priv->gpio_pdev = platform_device_alloc(cirrus_scodec_test_gpio_driver.driver.name, -1);
> +	if (!priv->gpio_pdev)
> +		return -ENOMEM;
> +
> +	ret = device_add_software_node(&priv->gpio_pdev->dev, &cirrus_scodec_test_gpio_swnode);
> +	if (ret) {
> +		platform_device_put(priv->gpio_pdev);
> +		KUNIT_FAIL(test, "Failed to add swnode to gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = platform_device_add(priv->gpio_pdev);
> +	if (ret) {
> +		platform_device_put(priv->gpio_pdev);
> +		KUNIT_FAIL(test, "Failed to add gpio platform device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
> +	if (!priv->gpio_priv) {
> +		platform_device_put(priv->gpio_pdev);
> +		KUNIT_FAIL(test, "Failed to get gpio private data: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
> +						int gpio_num)
> +{
> +	struct software_node_ref_args template =
> +		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);

I'm observing the following error when building with:

$ make LLVM=1 -j128 allmodconfig sound/pci/hda/cirrus_scodec_test.o

sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not a compile-time constant
  151 |                 SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
      |                                                                          ^~~~~~~~
/builds/linux/include/linux/property.h:291:37: note: expanded from macro 'SOFTWARE_NODE_REFERENCE'
  291 |         .nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
      |                                            ^~~~~~~~~~~
/builds/linux/include/linux/kernel.h:57:75: note: expanded from macro 'ARRAY_SIZE'
   57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
      |                                                                           ^~~
/builds/linux/include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
  228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
      |                                                                ^
/builds/linux/include/linux/compiler_types.h:366:63: note: expanded from macro '__same_type'
  366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                                                               ^
/builds/linux/include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
      |                                                              ^

This needs to be fixed before being sent to mainline else it will break
our builds; our CI is already red in -next over this.

> +
> +	*arg = template;
> +}
> +
> +static int cirrus_scodec_test_set_spkid_swnode(struct kunit *test,
> +					       struct device *dev,
> +					       struct software_node_ref_args *args,
> +					       int num_args)
> +{
> +	const struct property_entry props_template[] = {
> +		PROPERTY_ENTRY_REF_ARRAY_LEN("spk-id-gpios", args, num_args),
> +		{ }
> +	};
> +	struct property_entry *props;
> +	struct software_node *node;
> +
> +	node = kunit_kzalloc(test, sizeof(*node), GFP_KERNEL);
> +	if (!node)
> +		return -ENOMEM;
> +
> +	props = kunit_kzalloc(test, sizeof(props_template), GFP_KERNEL);
> +	if (!props)
> +		return -ENOMEM;
> +
> +	memcpy(props, props_template, sizeof(props_template));
> +	node->properties = props;
> +
> +	return device_add_software_node(dev, node);
> +}
> +
> +struct cirrus_scodec_test_spkid_param {
> +	int num_amps;
> +	int gpios_per_amp;
> +	int num_amps_sharing;
> +};
> +
> +static void cirrus_scodec_test_spkid_parse(struct kunit *test)
> +{
> +	struct cirrus_scodec_test_priv *priv = test->priv;
> +	const struct cirrus_scodec_test_spkid_param *param = test->param_value;
> +	int num_spk_id_refs = param->num_amps * param->gpios_per_amp;
> +	struct software_node_ref_args *refs;
> +	struct device *dev = &priv->amp_pdev.dev;
> +	unsigned int v;
> +	int i, ret;
> +
> +	refs = kunit_kcalloc(test, num_spk_id_refs, sizeof(*refs), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, refs);
> +
> +	for (i = 0, v = 0; i < num_spk_id_refs; ) {
> +		cirrus_scodec_test_set_gpio_ref_arg(&refs[i++], v++);
> +
> +		/*
> +		 * If amps are sharing GPIOs repeat the last set of
> +		 * GPIOs until we've done that number of amps.
> +		 * We have done all GPIOs for an amp when i is a multiple
> +		 * of gpios_per_amp.
> +		 * We have done all amps sharing the same GPIOs when i is
> +		 * a multiple of (gpios_per_amp * num_amps_sharing).
> +		 */
> +		if (!(i % param->gpios_per_amp) &&
> +		    (i % (param->gpios_per_amp * param->num_amps_sharing)))
> +			v -= param->gpios_per_amp;
> +	}
> +
> +	ret = cirrus_scodec_test_set_spkid_swnode(test, dev, refs, num_spk_id_refs);
> +	KUNIT_EXPECT_EQ_MSG(test, ret, 0, "Failed to add swnode\n");
> +
> +	for (i = 0; i < param->num_amps; ++i) {
> +		for (v = 0; v < (1 << param->gpios_per_amp); ++v) {
> +			/* Set only the GPIO bits used by this amp */
> +			priv->gpio_priv->pin_state =
> +				v << (param->gpios_per_amp * (i / param->num_amps_sharing));
> +
> +			ret = cirrus_scodec_get_speaker_id(dev, i, param->num_amps, -1);
> +			KUNIT_EXPECT_EQ_MSG(test, ret, v,
> +					    "get_speaker_id failed amp:%d pin_state:%#x\n",
> +					    i, priv->gpio_priv->pin_state);
> +		}
> +	}
> +}
> +
> +static void cirrus_scodec_test_no_spkid(struct kunit *test)
> +{
> +	struct cirrus_scodec_test_priv *priv = test->priv;
> +	struct device *dev = &priv->amp_pdev.dev;
> +	int ret;
> +
> +	ret = cirrus_scodec_get_speaker_id(dev, 0, 4, -1);
> +	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
> +}
> +
> +static void cirrus_scodec_test_dev_release(struct device *dev)
> +{
> +}
> +
> +static int cirrus_scodec_test_case_init(struct kunit *test)
> +{
> +	struct cirrus_scodec_test_priv *priv;
> +	int ret;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	test->priv = priv;
> +
> +	/* Create dummy GPIO */
> +	ret = cirrus_scodec_test_create_gpio(test);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Create dummy amp driver dev */
> +	priv->amp_pdev.name = "cirrus_scodec_test_amp_drv";
> +	priv->amp_pdev.id = -1;
> +	priv->amp_pdev.dev.release = cirrus_scodec_test_dev_release;
> +	ret = platform_device_register(&priv->amp_pdev);
> +	KUNIT_ASSERT_GE_MSG(test, ret, 0, "Failed to register amp platform device\n");
> +
> +	return 0;
> +}
> +
> +static void cirrus_scodec_test_case_exit(struct kunit *test)
> +{
> +	struct cirrus_scodec_test_priv *priv = test->priv;
> +
> +	if (priv->amp_pdev.name)
> +		platform_device_unregister(&priv->amp_pdev);
> +
> +	if (priv->gpio_pdev) {
> +		device_remove_software_node(&priv->gpio_pdev->dev);
> +		platform_device_unregister(priv->gpio_pdev);
> +	}
> +}
> +
> +static int cirrus_scodec_test_suite_init(struct kunit_suite *suite)
> +{
> +	int ret;
> +
> +	/* Register mock GPIO driver */
> +	ret = platform_driver_register(&cirrus_scodec_test_gpio_driver);
> +	if (ret < 0) {
> +		kunit_err(suite, "Failed to register gpio platform driver, %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void cirrus_scodec_test_suite_exit(struct kunit_suite *suite)
> +{
> +	platform_driver_unregister(&cirrus_scodec_test_gpio_driver);
> +}
> +
> +static const struct cirrus_scodec_test_spkid_param cirrus_scodec_test_spkid_param_cases[] = {
> +	{ .num_amps = 2, .gpios_per_amp = 1, .num_amps_sharing = 1 },
> +	{ .num_amps = 2, .gpios_per_amp = 2, .num_amps_sharing = 1 },
> +	{ .num_amps = 2, .gpios_per_amp = 3, .num_amps_sharing = 1 },
> +	{ .num_amps = 2, .gpios_per_amp = 4, .num_amps_sharing = 1 },
> +	{ .num_amps = 3, .gpios_per_amp = 1, .num_amps_sharing = 1 },
> +	{ .num_amps = 3, .gpios_per_amp = 2, .num_amps_sharing = 1 },
> +	{ .num_amps = 3, .gpios_per_amp = 3, .num_amps_sharing = 1 },
> +	{ .num_amps = 3, .gpios_per_amp = 4, .num_amps_sharing = 1 },
> +	{ .num_amps = 4, .gpios_per_amp = 1, .num_amps_sharing = 1 },
> +	{ .num_amps = 4, .gpios_per_amp = 2, .num_amps_sharing = 1 },
> +	{ .num_amps = 4, .gpios_per_amp = 3, .num_amps_sharing = 1 },
> +	{ .num_amps = 4, .gpios_per_amp = 4, .num_amps_sharing = 1 },
> +
> +	/* Same GPIO shared by all amps */
> +	{ .num_amps = 2, .gpios_per_amp = 1, .num_amps_sharing = 2 },
> +	{ .num_amps = 2, .gpios_per_amp = 2, .num_amps_sharing = 2 },
> +	{ .num_amps = 2, .gpios_per_amp = 3, .num_amps_sharing = 2 },
> +	{ .num_amps = 2, .gpios_per_amp = 4, .num_amps_sharing = 2 },
> +	{ .num_amps = 3, .gpios_per_amp = 1, .num_amps_sharing = 3 },
> +	{ .num_amps = 3, .gpios_per_amp = 2, .num_amps_sharing = 3 },
> +	{ .num_amps = 3, .gpios_per_amp = 3, .num_amps_sharing = 3 },
> +	{ .num_amps = 3, .gpios_per_amp = 4, .num_amps_sharing = 3 },
> +	{ .num_amps = 4, .gpios_per_amp = 1, .num_amps_sharing = 4 },
> +	{ .num_amps = 4, .gpios_per_amp = 2, .num_amps_sharing = 4 },
> +	{ .num_amps = 4, .gpios_per_amp = 3, .num_amps_sharing = 4 },
> +	{ .num_amps = 4, .gpios_per_amp = 4, .num_amps_sharing = 4 },
> +
> +	/* Two sets of shared GPIOs */
> +	{ .num_amps = 4, .gpios_per_amp = 1, .num_amps_sharing = 2 },
> +	{ .num_amps = 4, .gpios_per_amp = 2, .num_amps_sharing = 2 },
> +	{ .num_amps = 4, .gpios_per_amp = 3, .num_amps_sharing = 2 },
> +	{ .num_amps = 4, .gpios_per_amp = 4, .num_amps_sharing = 2 },
> +};
> +
> +static void cirrus_scodec_test_spkid_param_desc(const struct cirrus_scodec_test_spkid_param *param,
> +						char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "amps:%d gpios_per_amp:%d num_amps_sharing:%d",
> +		 param->num_amps, param->gpios_per_amp, param->num_amps_sharing);
> +}
> +
> +KUNIT_ARRAY_PARAM(cirrus_scodec_test_spkid, cirrus_scodec_test_spkid_param_cases,
> +		  cirrus_scodec_test_spkid_param_desc);
> +
> +static struct kunit_case cirrus_scodec_test_cases[] = {
> +	KUNIT_CASE_PARAM(cirrus_scodec_test_spkid_parse, cirrus_scodec_test_spkid_gen_params),
> +	KUNIT_CASE(cirrus_scodec_test_no_spkid),
> +	{ } /* terminator */
> +};
> +
> +static struct kunit_suite cirrus_scodec_test_suite = {
> +	.name = "snd-hda-scodec-cs35l56-test",
> +	.suite_init = cirrus_scodec_test_suite_init,
> +	.suite_exit = cirrus_scodec_test_suite_exit,
> +	.init = cirrus_scodec_test_case_init,
> +	.exit = cirrus_scodec_test_case_exit,
> +	.test_cases = cirrus_scodec_test_cases,
> +};
> +
> +kunit_test_suite(cirrus_scodec_test_suite);
> +
> +MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
> +MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 44f5ca0e73e3..d3cfdad7dd76 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -1035,6 +1035,16 @@ const struct dev_pm_ops cs35l56_hda_pm_ops = {
>  };
>  EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, SND_HDA_SCODEC_CS35L56);
>  
> +#if IS_ENABLED(CONFIG_SND_HDA_SCODEC_CS35L56_KUNIT_TEST)
> +/* Hooks to export static function to KUnit test */
> +
> +int cs35l56_hda_test_hook_get_speaker_id(struct device *dev, int amp_index, int num_amps)
> +{
> +	return cs35l56_hda_get_speaker_id(dev, amp_index, num_amps);
> +}
> +EXPORT_SYMBOL_NS_GPL(cs35l56_hda_test_hook_get_speaker_id, SND_HDA_SCODEC_CS35L56);
> +#endif
> +
>  MODULE_DESCRIPTION("CS35L56 HDA Driver");
>  MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
>  MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
> -- 
> 2.30.2
> 
