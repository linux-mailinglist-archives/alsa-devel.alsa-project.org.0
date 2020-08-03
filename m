Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AD239F30
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 07:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB631667;
	Mon,  3 Aug 2020 07:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB631667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596433365;
	bh=ASwIW8Y65N21eQHyWXKJPpkl/HLpoVkJnsfB0pxQHnU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8wV06VGGbro1s9M0Zu8kY6FUKNKz3SM8q0nRmpdislJklzqXSfuwJwfdCW2eFU4K
	 r6P2qXOob7JL2VESU/PQXCvSIRGOiAEEigjQal+fA+76r3Kybk7eff0MixrE005kbX
	 2XjhLLBn8hRwh6VhlDYu+9Vuo9wA9T2ae5bQfyPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA9CF80148;
	Mon,  3 Aug 2020 07:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF07F80218; Mon,  3 Aug 2020 07:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A69C1F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 07:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A69C1F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K186TuiU"
Received: by mail-pf1-x444.google.com with SMTP id j20so17575458pfe.5
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 22:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FhbpD1GOOiuI1h2KLYGhIc+Q4nrSHyP4h81W7KBJFqA=;
 b=K186TuiUMKQPdqAxCXhqtmALF9pZVrrem7PSJKHN2TVp6X/DGU7ghf9/BJMgBlUhh9
 jS5/KukDzLHwp2Tdh4NSv/i8naoGe9A3lUIZtoYE8DaWtRKIWGLC17qgWRsBuZ3JbkXD
 oI8zW7cC4xb3BZI+vs/9AmJvJY9r0ii6/sp00L/jDAKIi60G5674s+5a07y3LVR+IYv+
 deXVnc3aHNRNX7yQY4FFTNiSAUxBcTIDHNsWd3W3SkG+OiQQgnX8qlAqr3PJu9juma9t
 ZOSyPHOQaDxAdPbVnDMa/p63b0pwNeNG3aWsDaeHmhNXIVHXLUvlwT1LaFoiZtLXcwQy
 s+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FhbpD1GOOiuI1h2KLYGhIc+Q4nrSHyP4h81W7KBJFqA=;
 b=fB2dd3eT7vpmA+4GjGKCJQyhcf+vzGJ2b5Vlstdy8O/GfuFrAsGs4mrz/49cukcNtf
 f0voE+uHDHok09VUh4OComLkwfTN6JOGrHzSjWKPPLPp1j2+QpjwCbNhU1c6OcFZ3NNY
 CwowBuFWHRoCVYWJ2yKTmypoSiaJ4bMh2AEwqkbkpKXQSlyAu97XAI4tTfr4mroLqtqc
 YFHWzBrCHzI7t6dzvP5k/ScNLRJBbFMD85lDDPdmHy5CMmyrg+I4bbbEwsQep08tzy1f
 KS1ZNypjUR9+O64c3G5eDLkPKlJuuvRH4jCjIeU0tx8xxbjoZe+8aUf6+P+Mg4Y6jOhb
 mBHw==
X-Gm-Message-State: AOAM533YJCDIOlZjyAwDGOk16bR+83qutY8z4mt3HGrmYUPz5BANazfF
 /9lv0GSZ18Zs574xeOM8p8g=
X-Google-Smtp-Source: ABdhPJwtNZAtl8+czzRAcH8w3sZ9OYQlR+w7v7GG79nlmxqjy27pa7NblOV/FHvTJ6hTl+lyzxlnOg==
X-Received: by 2002:a63:444b:: with SMTP id t11mr13955435pgk.134.1596433249969; 
 Sun, 02 Aug 2020 22:40:49 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id m190sm16926096pfm.89.2020.08.02.22.40.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Aug 2020 22:40:49 -0700 (PDT)
Date: Sun, 2 Aug 2020 22:40:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200803054037.GA1056@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Aug 03, 2020 at 11:17:54AM +0800, Shengjiu Wang wrote:
> TX synchronous with RX: The RMR is no need to be changed when
> Tx is enabled, the other configuration in hw_params() is enough for

Probably you should explain why RMR can be removed, like what
it really does so as to make it clear that there's no such a
relationship between RMR and clock generating.

Anyway, this is against the warning comments in the driver:
	/*
	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
	 * RCR5(TCR5) and RMR(TMR) for playback(capture), or there will be sync
	 * error.
	 */

So would need to update it.

> clock generation. The TCSR.TE is no need to enabled when only RX
> is enabled.

You are correct if there's only RX running without TX joining.
However, that's something we can't guarantee. Then we'd enable
TE after RE is enabled, which is against what RM recommends:

# From 54.3.3.1 Synchronous mode in IMX6SXRM
# If the receiver bit clock and frame sync are to be used by
# both the transmitter and receiver, it is recommended that
# the receiver is the last enabled and the first disabled.

I remember I did this "ugly" design by strictly following what
RM says. If hardware team has updated the RM or removed this
limitation, please quote in the commit logs.

> +		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> +			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> +					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> +		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> +			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> +					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);

Two identical regmap_update_bits calls -- both on !tx (RX?)
