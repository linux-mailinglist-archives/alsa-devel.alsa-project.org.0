Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9F8262A3
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 02:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05CA9EAD;
	Sun,  7 Jan 2024 02:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05CA9EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704592779;
	bh=aBvDfmk7UL5CxwDm0dMMGCtYELyB57zy5hPRgRSYJXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=scPqq1pPHEo3KK2+OCHiEDb4rmiNx90mhnhuiydRa3jwHLgq1TRvoXWUMoBDMp6oB
	 CiXa5z0gfEsq41Dyegn6qim5qT0T9Fl/Upb1KKrxewSO533TXAmce+6p0roJUY0Q3/
	 4uaUqJKfE+ATMXWXZ2GBsIuxy7PB3izgEoTByF5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD694F8059F; Sun,  7 Jan 2024 02:59:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 187C4F802DB;
	Sun,  7 Jan 2024 02:59:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B93F1F80246; Sun,  7 Jan 2024 02:59:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E832AF80086
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 02:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E832AF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XgP1yPqs
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-28beb1d946fso723301a91.0
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Jan 2024 17:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704592727; x=1705197527;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpRuTEKvJx0gbLJtVqj6qMf/1yr9BSLwA5oR8rW2Q5k=;
        b=XgP1yPqs7hZKtIhyHO1hCM6/dtfNgJldadNuC/50zn0vjOpdemywthaqdN1jvnCEpK
         5nHdZUBWJwEN/nSCwyNdp4bwnSpRtMMO17r8pj9nDHVbb4Q3mfqcxUihrvL92nQmlw2P
         +glWnfXIHOkNG3zzSTHeCWMvfChE8ILA5D9q69Fxd7x4q5jgoW/ozv6ZaOO/nGbUiZVD
         K+DZNCcJW/KcRH9JKhT6JSGIWbuUn/YkMR8nRABE0q+dLWJzSPpb+DvDyJsDNtHxcrqH
         EIXhw42dB+BR4odApt/G4zjUD76NnCsON1eV99Btv2BoRIYWl7fIC2rYIqoiN7hbNpTt
         fD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704592727; x=1705197527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpRuTEKvJx0gbLJtVqj6qMf/1yr9BSLwA5oR8rW2Q5k=;
        b=CwyN5s2zQPaCeAwSFC7cDFYGa2G6cZyrouSjixlfNyer8z7FQvbuhxqTRU6ThKiHZE
         0Xdzf50Q1oTw5nsBYp21OQsOfGRCWN0tDpcuADuuNl6I7zyepDvErt73GA/yBQTXI7ir
         KxgfGoGSKIrrQHfFp6jQNrnk/WtIoIHW8YihNICSugr7fjKlSvrPF1LeQ6ngaBsvuaDD
         3dqr65d7ItsPEuzL+UsA/xIXG01wVSL8o2794qYv1nHx31TsoWAO0XdGiwrZwzd/zGTX
         QXcp/4TGnJp/4qVtUsqsMiJc+0dUSosQyyxIIIsHibJPNRYHYsce0ZL+SibCFHGY6L/j
         pzzw==
X-Gm-Message-State: AOJu0YztZyAN3ZokSZoEnb4Hlvhfclnl4qhWM4nbCTTQxZlEigHaWYES
	qqbvIeQbKhbyAv06BtIZIz4=
X-Google-Smtp-Source: 
 AGHT+IFwORjAQ3+/kya08SFVo6+/B9XcraiA91XJgeooU5o0Nl3IQyfEos3VyTbZ8/ZPHugbwZV8Qw==
X-Received: by 2002:a17:902:d4d2:b0:1d5:830:19bf with SMTP id
 o18-20020a170902d4d200b001d5083019bfmr1825830plg.113.1704592727314;
        Sat, 06 Jan 2024 17:58:47 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e05d:9c84:c3e5:2daf])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a170902d3c500b001d3e44faf1asm3671567plb.272.2024.01.06.17.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 17:58:46 -0800 (PST)
Date: Sat, 6 Jan 2024 17:58:43 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: James Ogletree <james.ogletree@cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Shuming Fan <shumingf@realtek.com>,
	Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	"moderated list:CIRRUS LOGIC AUDIO CODEC DRIVERS"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v5 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <ZZoFUwOEF6NByIp2@google.com>
References: <20240104223643.876292-1-jogletre@opensource.cirrus.com>
 <20240104223643.876292-5-jogletre@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104223643.876292-5-jogletre@opensource.cirrus.com>
Message-ID-Hash: O5X3TQZPOIO2LUMFEGDMWKD4MONUW4DM
X-Message-ID-Hash: O5X3TQZPOIO2LUMFEGDMWKD4MONUW4DM
X-MailFrom: dmitry.torokhov@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5X3TQZPOIO2LUMFEGDMWKD4MONUW4DM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi James,

On Thu, Jan 04, 2024 at 10:36:37PM +0000, James Ogletree wrote:
> +static int vibra_add(struct input_dev *dev, struct ff_effect *effect,
> +		     struct ff_effect *old)
> +{
> +	struct vibra_info *info = input_get_drvdata(dev);
> +	u32 len = effect->u.periodic.custom_len;
> +
> +	if (effect->type != FF_PERIODIC || effect->u.periodic.waveform != FF_CUSTOM) {
> +		dev_err(info->dev, "Type (%#X) or waveform (%#X) unsupported\n",
> +			effect->type, effect->u.periodic.waveform);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(&info->add_effect, effect, sizeof(struct ff_effect));

structures can be assigned, no need for memcpy.

> +
> +	info->add_effect.u.periodic.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
> +	if (!info->add_effect.u.periodic.custom_data)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(info->add_effect.u.periodic.custom_data,
> +			   effect->u.periodic.custom_data, sizeof(s16) * len)) {
> +		info->add_error = -EFAULT;
> +		goto out_free;
> +	}
> +
> +	queue_work(info->vibe_wq, &info->add_work);
> +	flush_work(&info->add_work);

I do not understand the need of scheduling a work here. You are
obviously in a sleeping context (otherwise you would not be able to
execute flush_work()) so you should be able to upload the effect right
here.

...

> +
> +static int vibra_playback(struct input_dev *dev, int effect_id, int val)
> +{
> +	struct vibra_info *info = input_get_drvdata(dev);
> +
> +	if (val > 0) {

value is supposed to signal how many times an effect should be repeated.
It looks like you are not handling this at all.

> +		info->start_effect = &dev->ff->effects[effect_id];
> +		queue_work(info->vibe_wq, &info->vibe_start_work);

The API allows playback of several effects at once, the way you have it
done here if multiple requests come at same time only one will be
handled.

> +	} else {
> +		queue_work(info->vibe_wq, &info->vibe_stop_work);

Which effect are you stopping? All of them? You need to stop a
particular one.

> +	}

Essentially you need a queue of requests and a single work handling all
of them...

...

> +
> +static int cs40l50_vibra_probe(struct platform_device *pdev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
> +	struct vibra_info *info;
> +	int error;
> +
> +	info = devm_kzalloc(pdev->dev.parent, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->dev = cs40l50->dev;
> +	info->regmap = cs40l50->regmap;
> +
> +	info->input = devm_input_allocate_device(info->dev);
> +	if (!info->input)
> +		return -ENOMEM;
> +
> +	info->input->id.product = cs40l50->devid & 0xFFFF;
> +	info->input->id.version = cs40l50->revid;
> +	info->input->name = "cs40l50_vibra";
> +
> +	input_set_drvdata(info->input, info);
> +	input_set_capability(info->input, EV_FF, FF_PERIODIC);
> +	input_set_capability(info->input, EV_FF, FF_CUSTOM);
> +
> +	error = input_ff_create(info->input, FF_MAX_EFFECTS);
> +	if (error) {
> +		dev_err(info->dev, "Failed to create input device\n");
> +		return error;
> +	}
> +
> +	info->input->ff->upload = vibra_add;
> +	info->input->ff->playback = vibra_playback;
> +	info->input->ff->erase = vibra_erase;
> +
> +	INIT_LIST_HEAD(&info->effect_head);
> +
> +	info->dsp = cs40l50_dsp;
> +
> +	info->vibe_wq = alloc_ordered_workqueue("vibe_wq", 0);
> +	if (!info->vibe_wq)
> +		return -ENOMEM;
> +
> +	error = devm_add_action_or_reset(info->dev, vibra_remove_wq, info);
> +	if (error)
> +		return error;

Why do you need a dedicated workqueue? So you can flush works?

> +
> +	mutex_init(&info->lock);
> +
> +	INIT_WORK(&info->vibe_start_work, vibra_start_worker);
> +	INIT_WORK(&info->vibe_stop_work, vibra_stop_worker);
> +	INIT_WORK(&info->erase_work, vibra_erase_worker);
> +	INIT_WORK(&info->add_work, vibra_add_worker);
> +
> +	error = input_register_device(info->input);
> +	if (error) {
> +		dev_err(info->dev, "Failed to register input device\n");
> +		input_free_device(info->input);

Not needed, you are using devm_input_allocate_device().

> +		return error;
> +	}
> +
> +	return devm_add_action_or_reset(info->dev, vibra_input_unregister,
> +					info->input);

Not needed, managed input devices will be unregistered automatically by
devm.

Thanks.

-- 
Dmitry
