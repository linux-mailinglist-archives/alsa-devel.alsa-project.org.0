Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2FE2A8E5E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 05:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63CA950;
	Fri,  6 Nov 2020 05:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63CA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604637003;
	bh=cV2LHQeQgtnRFDahb0Hk+f4g94XsgXXpu5tgtosJB7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpKlL3DMVlqo4UVZSOn+GVh2XrPmozROX3yaNx43v2tF2hnE6opZ3jIl3Cs8rOKCq
	 F1YM4rqkcKd9gtvWACMiK3wfYTMjMQ8YvXONoDcODLjlLCBM5LPi+kjifrxwyiDOCk
	 UoIUfR6dRIxayDVjhfTr3lAAzouVkOT9BbvouJ10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3206EF8023E;
	Fri,  6 Nov 2020 05:28:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78416F80234; Fri,  6 Nov 2020 05:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B10F80232
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 05:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B10F80232
Received: by mail-lj1-f195.google.com with SMTP id l10so16013lji.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 20:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CERvrJlC+TQNJo6snGdkL35sMbOGXywHtBhjsrxgyFA=;
 b=TP2oEqtgMq7EnfETEmCBgFe4t97YtwUo9DELqUC1Fv+nJtH9NxeY/Q3i3i9Yu52Eb7
 VHNKcZMjHUrEhss0DyDG7JV0TZjiuEXcmFI/MXrfQOVKaWDOG3Ji67LSrL2wZWtWlqoM
 clD7C6J44HODsn+qlZd8tW3HMx7C2SFO6QT3V4xPhOEx/jO0S45QTL2YUrWCx15H0noP
 6yrPSAadGgkyW6lQrLiI59ObMjOTCdFAQ2zjkMmls4Ek1kQNOlvDS/MJ+Ckw6/SBurSw
 mlkkCVDunNGOhzU6dvgeJ7Tffl5TQ7rr2k/OTAtQrrgo8C922ky6B5aSM4VWZ+RybMnK
 7qeQ==
X-Gm-Message-State: AOAM5308Hk/JOpqpJyw6rrCUlbe3Go27dp+FarQ9iGUahcTBYOLVGRQy
 jPyWSYQ1edlNqulT2WDak5IzJmauH+UfRg==
X-Google-Smtp-Source: ABdhPJx8cQh2BZLnkRw9k4c80NfOa8YLrFIy1OSYm/MOm+ZnQSh8xXE0F2mkF5mLzYzQjcstwoEwHA==
X-Received: by 2002:a05:651c:39a:: with SMTP id
 e26mr56126ljp.170.1604636896321; 
 Thu, 05 Nov 2020 20:28:16 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id d15sm20697ljc.3.2020.11.05.20.28.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 20:28:16 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id p15so3476ljj.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 20:28:16 -0800 (PST)
X-Received: by 2002:a2e:9243:: with SMTP id v3mr48234ljg.47.1604636895947;
 Thu, 05 Nov 2020 20:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20201106041513.38481-1-samuel@sholland.org>
In-Reply-To: <20201106041513.38481-1-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 6 Nov 2020 12:28:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67c-ywkh_s77f4sm3fmL9DuxeYMrAJAgp=_jKHBd6GdHA@mail.gmail.com>
Message-ID: <CAGb2v67c-ywkh_s77f4sm3fmL9DuxeYMrAJAgp=_jKHBd6GdHA@mail.gmail.com>
Subject: Re: [PATCH 0/7] PinePhone BT audio bringup
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <mripard@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 phone-devel@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi,

On Fri, Nov 6, 2020 at 12:15 PM Samuel Holland <samuel@sholland.org> wrote:
>
> This series makes use of the additional DAIs recently added to the
> sun8i-codec driver to add hardware routing for BT SCO (headset) audio
> on the PinePhone.
>
> The BT audio connection is represented by the "dummy" bt-sco codec. The
> connection to the Quectel EG-25G modem via AIF2 works as well, but I do
> not include it here because there is no appropriate codec driver in
> tree. We have been using an out-of-tree "dummy" codec driver similar to
> bt-sco, and I'm not sure if such a driver would be desired upstream.
>
> The modem has a similar amount of configurability as the rtl8723cs BT
> chip. For the BT chip, the DAI format and PCM parameters are set in a
> configuration firmware file and loaded at driver load time. For the
> modem, the DAI format and PCM parameters are set by (and can be queried
> from) an AT command. However, this AT command requires a modem restart
> to take effect, so the parameters cannot feasibly be changed at runtime.
>
> With a dummy driver, we pick some "standard" set of PCM parameters, e.g.
> 16 bit mono at 8 or 16 kHz, and assume the hardware agrees. Similarly,
> we assume the DAI format pre-programmed in the remote hardware matches
> what is configured in the DAI link (in this case, in the device tree).
>
> Is that the right way to model this? Or does the modem (and maybe even
> the BT chip) deserve a more featureful driver that reads and/or programs
> the format and params at probe time?

FYI there's a "Bluetooth: Allow to use configure SCO socket codec parameters"
thread on the bluetooth mailing list which is still unresolved AFAICT.

You might want to take a look at it.

ChenYu

> Because of those unanswered questions, I'm sending BT SCO support
> first/only.
>
> Regards,
> Samuel
>
> Arnaud Ferraris (1):
>   arm64: dts: allwinner: pinephone: Set audio card name
>
> Samuel Holland (6):
>   ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
>   ARM: dts: sun8i-a33: Allow using multiple codec DAIs
>   arm64: dts: allwinner: a64: Allow using multiple codec DAIs
>   arm64: dts: allwinner: a64: Add pinmux nodes for AIF2/AIF3
>   arm64: dts: allwinner: a64: Allow multiple DAI links
>   arm64: dts: allwinner: pinephone: Add support for Bluetooth audio
>
>  .../sound/allwinner,sun8i-a33-codec.yaml      |  2 +-
>  arch/arm/boot/dts/sun8i-a33.dtsi              |  4 +-
>  .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 25 +++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 ++++++++++++++-----
>  4 files changed, 55 insertions(+), 13 deletions(-)
>
> --
> 2.26.2
>
