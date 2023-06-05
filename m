Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A5722D94
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 19:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0BA6C1;
	Mon,  5 Jun 2023 19:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0BA6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685985827;
	bh=iksAL1nPzHckm7+3rUlyb9XTjfgicZlIf5CNH8kZVfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D4BEyStClguuJgZGbYhKy8FlRjIzf8ir/IFoL14pDqJrOBD7RLC33K1uCVwreXlVw
	 vUtmG/on62ufPHvfDTrTM1MWHoiRwrK3PvX1IlXYMJAHC6ok8ToqSvxEut2iBGfzvY
	 9OVLGm5lkJ11qPDoOh1Sdz6WwXlJTUV1Ux+C3HCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D206F804DA; Mon,  5 Jun 2023 19:22:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE1EF8016C;
	Mon,  5 Jun 2023 19:22:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF91FF80199; Mon,  5 Jun 2023 19:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86DA0F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 19:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86DA0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J7ev+niT
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685985768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Berwdtb2uXHQbSksaaVPK3mZrvObJ1lWrE4UzrcIf8M=;
	b=J7ev+niTsg1xzPdC/Z0LVxKv4Z42cGvd9zc2KeBD1xxv+tqyeHe/4J8ImQTFJ1AoRgwgFN
	6ojrllCzR4ja6qcd8Etya0M3KkgPxP7cdNUzzM1mBqdz0+9jfeouUaa6+qH29biRkSjfrN
	DEIv/KSc/UuFrVmO58z9vm5utSERq6eCX49QApf1GYrUKVvHRTAtTYXX/eis3QNiXJMu6m
	unP5K6zs/HR9ux7R15lM8AbrvRMKbugnYtaMO8wRVXXYMabKWLmZaZTrLy4l+nDei2D3CH
	yOnw8Ft+VslMGLTB3zGn7OVLUIwcfgiqpz9hy1ufyO1B+48vf2k025F3lQLDcw==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30441240009;
	Mon,  5 Jun 2023 17:22:46 +0000 (UTC)
Date: Mon, 5 Jun 2023 19:22:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 7/9] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
Message-ID: <20230605192245.4132e0ae@bootlin.com>
In-Reply-To: <20230528183855.0c95d308@jic23-huawei>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
 <20230523151223.109551-8-herve.codina@bootlin.com>
 <20230528183855.0c95d308@jic23-huawei>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZKCDKSHFTAGNZPP4K7WHBH35O4YL5JEP
X-Message-ID-Hash: ZKCDKSHFTAGNZPP4K7WHBH35O4YL5JEP
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKCDKSHFTAGNZPP4K7WHBH35O4YL5JEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jonathan,

On Sun, 28 May 2023 18:38:55 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 23 May 2023 17:12:21 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > Industrial I/O devices can be present in the audio path.
> > These devices needs to be used as audio components in order to be fully
> > integrated in the audio path.
> > 
> > This support allows to consider these Industrial I/O devices as auxliary
> > audio devices and allows to control them using mixer controls.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---  
> 
> > diff --git a/sound/soc/codecs/audio-iio-aux.c b/sound/soc/codecs/audio-iio-aux.c
> > new file mode 100644
> > index 000000000000..21575c4b35fd
> > --- /dev/null
> > +++ b/sound/soc/codecs/audio-iio-aux.c
> > @@ -0,0 +1,302 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// audio-iio-aux.c  --  ALSA SoC glue to use IIO devices as audio components
> > +//
> > +// Copyright 2023 CS GROUP France
> > +//
> > +// Author: Herve Codina <herve.codina@bootlin.com>
> > +
> > +#include <linux/iio/consumer.h>
> > +#include <linux/module.h>  
> 
> #include <linux/mod_devicetable.h> ideally to pick up
> the of_device_id definition without bouncing through some non 
> obvious header path.

Right, <linux/module.h> will be replaced by <linux/mod_devicetable.h> in the
next iteration.

Thanks for the review,
Hervé

> 
> 
> > +#include <linux/slab.h>
> > +#include <sound/soc.h>
> > +#include <sound/tlv.h>  
> 
> Otherwise, the IIO elements of this look good.  So for those at least
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> I don't have enough knowledge of the snd stuff to review those
> parts.
> 
> Jonathan
> 
> 
