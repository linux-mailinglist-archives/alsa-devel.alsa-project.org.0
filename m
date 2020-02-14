Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5215D844
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93C801684;
	Fri, 14 Feb 2020 14:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93C801684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686352;
	bh=eUM8sYe/QxmD99v59sAg8abKfOdFu52J7t2nt0WPGFQ=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YddQYzVoHXFsPvPdamIDL3Q/vAHzS/2sPO2+Ob2+KQ7wKfUCRLNQW/GIcrTtvDZIu
	 F0W406UuQA7vsFGYjWprhhuIOaAwridXb3InjVzLQ8ZMtq7X+PsvhN+jdEsoxjDmDx
	 PdS2RLGFXJbz/pl3r5D66JzF5+6lwPC9nBXIZyCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B13F8019B;
	Fri, 14 Feb 2020 14:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F131BF80158; Fri, 14 Feb 2020 14:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BA36F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA36F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="n4dLxQPN"
Received: by mail-wr1-x441.google.com with SMTP id c9so10874753wrw.8
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=dttGVPvYe+0DFSlsyRJJUIcITjzQToEc+jk1zM06Pt4=;
 b=n4dLxQPN0JhQQXTz6SAWnhIsES9PG/QVSp0Dyca5BW5cpCWum4eN99uqSXNHYL7Enn
 +dQ6hjLXyzNN+qRU6P8ZQ3bymeC05amrV2ZQs/Oru8U9C/TTUrBI0e7s1j31+6c0lBlB
 X50KMfhdpCPfu63obK7Sgb6H6mVprmx1vYdIUpn1TSeCMXVI0PiitAaY/f+5+fHwDg3V
 l5+gFxyYCqkIhi+K84UgNZ5lyLXjnNjI2x6z7PmmTgecaZchzZWhTuT761DMKg4ESnYa
 AxfmDuOlpYhvctS4KcMy0He5uS0OxyE9fDBB+PVucONar1gJtmNqOQJANF+zrODomHHX
 SOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=dttGVPvYe+0DFSlsyRJJUIcITjzQToEc+jk1zM06Pt4=;
 b=Fg01TG5uJ8cc8aeUFffAvxtpdQ/ik0TLpId7pH/Qw3n2HNyoYLLb5fiaODFkrkLEcG
 h3ItjbG6KIpxJNTeL9CdmNx8BRNL6ho+j8WUu/L+RMPvC90qYYaKEr/f0t4sh6/e6xzc
 cYZ5JZe7xu3tZv7SdWLo8Q/xxvT4o15VKBngC7xd8nlk8RjJ/TmzxhHHQjdHzAiouCLj
 Vo/HTPrP1d6qMiTGsfmHQQ4EdLkZfd9WNU1bgtwQMOWzqPsnP7EC0drzY4FQFXvE9u9v
 eHa5wJw9nV4F1I2FKSayAYsiWfUkys3P30I3etgOwaCQiLkyaEmB3Bx/rNSh38zQ/GpZ
 v7wg==
X-Gm-Message-State: APjAAAXq1mt5f0NlEbCZKdBJxXS1TCTIh+0UAx0E8YZFTvap+xTO7JIA
 Ev2UsRMSjHxagxM3FgXHV3yZVw==
X-Google-Smtp-Source: APXvYqwJkUMkAB0wiz7MQgXQAaFjzRStc5erCu+G50eOFaOD6CBvB6S541TCYfW4sox+swqm82Pg5A==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr3995329wra.8.1581686171959;
 Fri, 14 Feb 2020 05:16:11 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s23sm7147787wra.15.2020.02.14.05.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:16:11 -0800 (PST)
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
 <20200213182157.GJ4333@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-reply-to: <20200213182157.GJ4333@sirena.org.uk>
Date: Fri, 14 Feb 2020 14:16:10 +0100
Message-ID: <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: meson: aiu: add hdmi codec
	control support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu 13 Feb 2020 at 19:21, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 13, 2020 at 04:51:55PM +0100, Jerome Brunet wrote:
>
>> +int aiu_add_component(struct device *dev,
>> +		      const struct snd_soc_component_driver *component_driver,
>> +		      struct snd_soc_dai_driver *dai_drv,
>> +		      int num_dai,
>> +		      const char *debugfs_prefix)
>> +{
>> +	struct snd_soc_component *component;
>> +
>> +	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
>> +	if (!component)
>> +		return -ENOMEM;
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	component->debugfs_prefix = debugfs_prefix;
>> +#endif
>
> You really shouldn't be doing this as it could conflict with something
> the machine driver wants to do however it's probably not going to be an
> issue in practice as it's not like there's going to be multiple SoCs in
> the card at once and if there were there'd doubltess be other issues.

I'm not sure I understand (and I'd prefer to :) )

As you said before, initially the there was supposed to be a 1:1 mapping
between device and component. The component name is directly derived
from the device name, and the debugfs directory is created from component name.

I would have preferred to use snd_soc_register_component() directly, but
with multiple components from the same device I got:

debugfs: Directory 'c1105400.audio-controller' with parent 'AWESOME-CARD' already present!
debugfs: Directory 'c1105400.audio-controller' with parent 'AWESOME-CARD' already present!

I copied the code above from other direct users of
snd_soc_add_component() (soc-generic-dmaengine-pcm.c and
stm32_adfsdm.c). I suppose they had the same name collision issue.

Instead of addressing the debugfs side effect, maybe  we could just make
sure that each component name is unique within ASoC ? I'd be happy submit
something if you think this can helpful.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
