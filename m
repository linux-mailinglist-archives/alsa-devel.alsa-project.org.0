Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAB181086
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9E8166F;
	Wed, 11 Mar 2020 07:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9E8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583907476;
	bh=mYJdm4o8qKYhs7j4lktdhVenm4hpEUqNfN+ztgPE6bg=;
	h=From:References:In-Reply-To:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SOpeSP19QQGNL9sAi46R5JviElagL/MWAH83FRkfPTF7uW/XDZuqXACgfza2r/KRd
	 eFsVjVqDWdIjRXVUX9DPAscgeCxKwTLfLtvrZrby7mgYq9KNhnN8IHRst3tQJMw6/f
	 19QufWh+we5S6EYKz2sVC2KymJjstZe+7GIuaWF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45738F8029B;
	Wed, 11 Mar 2020 07:15:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4097CF801EB; Mon,  9 Mar 2020 18:33:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C5EF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C5EF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="DQxdAFgB"
Received: by mail-lf1-x129.google.com with SMTP id c20so8459295lfb.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:references:in-reply-to:mime-version:thread-index:date
 :message-id:subject:to:cc;
 bh=bgiHSLTQXM8E0mv0SF7G09UBPAaNCg/++oKU9IO6Jv0=;
 b=DQxdAFgBLzOAYx5M0Q2Fh/zkVoV6kRmCETSjJWCX2qfbDblPeSMRSyXVWiyOt5Ig3w
 gMJcpRqwnRBelmbxOy+sO0cchBZqoMdedCWSBBTnV3n3ng/yHVlq3GqcCNbjCr0OjUSN
 bIhthscycsWpgsCe1Hw6pRZIVFPhvr5K67Giw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:references:in-reply-to:mime-version
 :thread-index:date:message-id:subject:to:cc;
 bh=bgiHSLTQXM8E0mv0SF7G09UBPAaNCg/++oKU9IO6Jv0=;
 b=sYhFu5jxioEbbOWTr2JqKCpafXBwxkFmI6unGyv1cED8Kqo5cfdfr8GQDueQzz/3fx
 nXK6ECdhjxZuxp5dkdEJmRuzWI3uKxD904p9LgjIJahcb+3RrgSC3tOeIPDupiJTPngh
 Q5ZQOX3hzA07XhRfuPcPU59EBZHd+OVbpEr5NKDTbuETmpl0jTFyoHjvF6qeJdMo8mwo
 18NNNEjLySUWHNH3NjjsQyfQddVqmROMGC6fnYPPVIryG0RkZOdgoToGXfLGPxin4GDX
 Km8InJ/JR8UVIxZuhE4rsjq7/Pulr+uMB1b8MdA4salYEQv+OuqWC0Vl7hde5ZjqPsdb
 3fWA==
X-Gm-Message-State: ANhLgQ36Dc/9XMeyRBtDzG3WOkxQDhTtoqhoPpYKbZath8UPAzsOjlDK
 iRcPOtqjnrebTky7WKJDjlzS0VyLMOJKdE857nmVVw==
X-Google-Smtp-Source: ADFU+vuq3eH9wkuVNiO3iVGw7rhwXN2qPoAEtL/Vxw8RjRXO3sz1OPnFMpu3+6cw1VwM6E+14wRoY4uUL6ksq3D8aLA=
X-Received: by 2002:ac2:4834:: with SMTP id 20mr9943688lft.93.1583775213105;
 Mon, 09 Mar 2020 10:33:33 -0700 (PDT)
From: Kevin Li <kevin-ke.li@broadcom.com>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
 <20200309123307.GE4101@sirena.org.uk>
In-Reply-To: <20200309123307.GE4101@sirena.org.uk>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQK6AtPk+W1UvlC/8YJn5FlJAEq5hQGCyJpIpmw/bzA=
Date: Mon, 9 Mar 2020 10:33:30 -0700
Message-ID: <69138568e9c18afa57d5edba6be9887b@mail.gmail.com>
Subject: RE: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 11 Mar 2020 07:14:40 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi Mark,

The SoC I2S block we currently have shares one clock and frame sync signal
for both playback and capture stream, plus playback and capture can only
have one master at a time. If we set playback and capture master at same
time, it will have jitter on clock and FS.

Based on above, for playback and capture, whichever starts first, it will
be master, another stream will be slave if it starts before the first
stream shutting  down. So working as master or slave for a stream is
depending on another stream's status.

Same thing for shutting down a stream. A master stream shutting down will
have to set another stream to master if another stream is on working
status as a slave. A glitch/Jitter will happen at this moment. But we
minimize it.

That is why this master/slave mode handles in startup/shutdown functions.
Not sure how other company handles this kind of I2S block.

Let me know if it is still not clear.

Yes, set_fmt() is not needed. Will be addressed along with rest questions
you mentioned on the next patch, with a patch version.


Thanks!
Kevin


> +	struct bcm_i2s_priv *i2s_priv = snd_soc_dai_get_drvdata(dai);
> +	struct regmap *regmap_i2s = i2s_priv->regmap_i2s;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_update_bits(regmap_i2s, I2S_TX_CFG,
> +				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
> +				   I2S_TX_DATA_ENABLE |
I2S_TX_CLOCK_ENABLE,
> +				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
> +				   I2S_TX_DATA_ENABLE |
I2S_TX_CLOCK_ENABLE);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_CTL, 0);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_IFF_THLD, 0);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_OFF_THLD, 1);
> +
> +		regmap_read(regmap_i2s, I2S_RX_CFG_2, &slaveMode);
> +		if (slaveMode & I2S_RX_SLAVE_MODE_MASK)
> +			regmap_update_bits(regmap_i2s, I2S_TX_CFG_2,
> +					   I2S_TX_SLAVE_MODE_MASK,
> +					   I2S_TX_MASTER_MODE);
> +		else
> +			regmap_update_bits(regmap_i2s, I2S_TX_CFG_2,
> +					   I2S_TX_SLAVE_MODE_MASK,
> +					   I2S_TX_SLAVE_MODE);

Setting master or slave mode should be done with a set_fmt() operation but
your set_fmt() operation was empty.  How would this be configured?
