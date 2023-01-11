Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E107667A33
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85AC92C7;
	Thu, 12 Jan 2023 17:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85AC92C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539287;
	bh=DJzxulyVKtTUohRS+QIHTGQPfrIKfOEeA/pyMeT2Lbs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r1jBc8jaPFuUPl4kRQHmolIRmRmBoSh4oP8N0EJn1Il7Mc9kBs++u5BzdnG62E70O
	 FiiU4NOfL3BiGZc8hbITwdsLYewEoQH2Xum1mYGH6Z0ZAouyABsR9rX8UH9xDSSr2L
	 dxgioOPaHqV8gOYS5cEPWAOE0X4k/32FLrZSaGK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12511F8053A;
	Thu, 12 Jan 2023 16:59:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEB73F80549; Wed, 11 Jan 2023 10:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D13AF8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D13AF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DY/rryyN
Received: by mail-ej1-x631.google.com with SMTP id fy8so35060531ejc.13
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 01:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DJzxulyVKtTUohRS+QIHTGQPfrIKfOEeA/pyMeT2Lbs=;
 b=DY/rryyNK39lZK5j+YItCP3oSVCtzQjhwSqF3HO0q/oe6FH82woyqoU25NGEq8X/rq
 XfunZPk8zVRnmlZb1rmsjnBDg5s08a0KGuWotaJ5f6vET6cde5mvKMMV9h8NQajDgp9z
 q+BJKjsekiTpL6IdgDG3eRrjqad0G7vpdsKF1YG7tKoLjK5l4gWWTtnidGD2kbmEOi/B
 g41asBoarHpRy2wH6XGAwVVkOjhDsWE7+w0RsKUHtBA16Jnvcres+lUfXY916J9dSMY3
 VcHTXHb7MVJj79D1WOdqUy7MRbvGoMmym1q3KXcuaou0YlvumemC5qdqNztOhoC8Nq2T
 j2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJzxulyVKtTUohRS+QIHTGQPfrIKfOEeA/pyMeT2Lbs=;
 b=BFmw5xkDcvZP1U4/SP8mlhs2R29XrZA3uguKF827LkPB1yeaFbMbgTbaNulQUpQhJZ
 F0TCu4NCWyGnUCVmVvYlgU3OBQqRrDSalmJGcRCO9tm7Av3sVEnzrigS0ovC3ueoVadq
 1YELyzmjnHgokAcBzinK/1hULSpwqNc8TJwEz5Piuo4pzfT4YcNQUZtIzUB92IdxTyLy
 cEkCcD8i9T4pRC72Xf3ghUfTU5NCtZbZ5n5ppzqOM5Hq/OvhiRysZp/oVO0RAPoIg4kw
 oY+JL0vIQWMqlLa6V8UBoeJCUVFFrYVZo5za/am3SBcZAo5d62SJQV4wnv6GdZs42RDa
 l+VQ==
X-Gm-Message-State: AFqh2kpDXpYFi6WkxLirA1vka0DKEOJckL4nUrS7OiH47afXtLHxhiA7
 6ifspg4/Odi3zQ2ubahO6paEdm0LwKiaQeF3gQ4=
X-Google-Smtp-Source: AMrXdXtXfmpdqGWNq6eUwbTgzMofXSFIKvUyk2JZof2j6k3abTmT7jfFV2CTFTewagAaJZluSZCQpXSdSy9YWMKWn8g=
X-Received: by 2002:a17:906:855:b0:7c1:5874:1d13 with SMTP id
 f21-20020a170906085500b007c158741d13mr4536440ejd.152.1673427929801; Wed, 11
 Jan 2023 01:05:29 -0800 (PST)
MIME-Version: 1.0
References: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 11 Jan 2023 11:05:17 +0200
Message-ID: <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 12 Jan 2023 16:59:42 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "Markus.Niebel@ew.tq-group.com" <Markus.Niebel@ew.tq-group.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tommaso.merciai@amarulasolutions.com" <tommaso.merciai@amarulasolutions.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "ryan.lee.analog@gmail.com" <ryan.lee.analog@gmail.com>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Hardevsinh,

Does your imx8mm-evk have a max98090 codec? That's very strange
because I thought that EVK has wm8524?


On Wed, Jan 11, 2023 at 9:31 AM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Date: Sat, 7 Jan 2023 17:08:28 +0530
> Subject: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
>
> - Adding node for MAX98090/91 in dts imx8mm-evk.dtsi
> - Adding tristate option in <sound/soc/codecs/Kconfig>

This should come as a separate patch.
