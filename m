Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0A27A7F6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 08:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0961E91;
	Mon, 28 Sep 2020 08:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0961E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601276055;
	bh=UZbj4LMYyjVRoxCdRd9T/EC3be0CLxiSYn5s16cWb78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGWfRuLsfTcAn7jnswOKvbGm0oznWbbLeZ+NhpkLwTqoci0gvWFLp0T6LxQ/zkZyJ
	 a6ir7dktiE9siIoKPRtgA55r552Gn0tpmocNHJlYzhgreOOlFL63vDzwMJJa+3G5Nd
	 QbGu7zzSjS1OyozYQzffpy4aLe5QMXoDx0Kc/vJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2033F8029A;
	Mon, 28 Sep 2020 08:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2BBDF80292; Mon, 28 Sep 2020 08:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED97F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED97F800DF
Received: by mail-lf1-f68.google.com with SMTP id y11so9816669lfl.5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ks9FfGEmMHZLEsPsJfUxgzn6i0sxrDqEyXegeg+9Gd4=;
 b=q141ZvMbvXY2LJUOnxzuGK9/qQg5ZoIEg6Wx9pGMmdssimrNNeOlcNf/H/Ur328+XN
 On2WfbT5WCS4ewRhCAhvZA9uuEdpHy16/QPVuyd6btpEu3h8eY33f3ux7TeFPyHMZCeF
 67eCDzTQpvdLM6oSrOT8ub5mnm58CvRjLFU1Pu52W1lUkfunhPD+Y/FLOUQC6+CZDD0t
 KgNpKyD/6Vu3/Kb4hfSeqmIfkLk+91OOsqzpjOJw4CcwNKh7n6Vl5I9sNFfDBTqtjnky
 G9Qm/zjyQZ35N8vs7+XZU/tI1HO9oxKFKN5XfOYgAe2TY5ItLd5u9HVwqOwwjsAyldIE
 qVpQ==
X-Gm-Message-State: AOAM5312crLggHMja/+3kfFy8x2gDn12rdQ/riaQhasK0zg98GjGKDg1
 F6ZNvqcL/5AZxuVCmdKcSp/FVHZtCHhSYA==
X-Google-Smtp-Source: ABdhPJzT5xHRShMtQNZIHek/9j8pVXvDVXEFVIKfbwmiyAQrFCu8BcXZ5uZpMIvnkuhrQ7ZUdzdx5A==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr3710906lfc.250.1601275983018; 
 Sun, 27 Sep 2020 23:53:03 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id v6sm7848ljd.134.2020.09.27.23.53.02
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:53:02 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id u8so9834493lff.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:53:02 -0700 (PDT)
X-Received: by 2002:a19:b97:: with SMTP id 145mr3130963lfl.193.1601275982109; 
 Sun, 27 Sep 2020 23:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 14:52:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v660m4U1XPXWc=9G7GSW5e515VVXq7vPLJwXmAfoqWpvhA@mail.gmail.com>
Message-ID: <CAGb2v660m4U1XPXWc=9G7GSW5e515VVXq7vPLJwXmAfoqWpvhA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 00/20] Add Allwinner H3/H5/H6/A64 HDMI
 audio
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
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

On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Hi,
>
> This is exactly the same as v4 but with more details in some commit log
> and also device-tree soundcard and DAI node have been merged.
>
> Regards,
> Clement
>
> Change since v4;
> - add more comment on get_wss() and set_channel_cfg() patch
> - merge soundcard and DAI HDMI patches
>
> Change since v3:
> - add Samuel Holland patch to reconfigure FIFO_TX_REG when suspend is ena=
bled
> - readd inversion to H6 LRCK sun50i_h6_i2s_set_soc_fmt()
> - Fix get_wss() for sun4i
> - Add a commit to fix checkpatch warning
>
> Change since v2:
> - rebase on next-20200918
> - drop revert LRCK polarity patch
> - readd simple-audio-card,frame-inversion in dts
> - Add patch for changing set_chan_cfg params
>
> Change since v1:
> - rebase on next-20200828
> - add revert LRCK polarity
> - remove all simple-audio-card,frame-inversion in dts
> - add Ondrej patches for Orange Pi board
> - Add arm64 defconfig patch
>
> Cl=C3=A9ment P=C3=A9ron (6):
>   ASoC: sun4i-i2s: Change set_chan_cfg() params
>   ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
>   ASoC: sun4i-i2s: Fix sun8i volatile regs
>   arm64: dts: allwinner: h6: Enable HDMI sound for Beelink GS1
>   arm64: defconfig: Enable Allwinner i2s driver
>   ASoC: sun4i-i2s: fix coding-style for callback definition
>
> Jernej Skrabec (3):
>   ASoC: sun4i-i2s: Add support for H6 I2S
>   dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
>   arm64: dts: allwinner: h6: Add DAI node and soundcard for HDMI
>
> Marcus Cooper (7):
>   ASoC: sun4i-i2s: Set sign extend sample
>   ASoc: sun4i-i2s: Add 20 and 24 bit support
>   arm: dts: sunxi: h3/h5: Add DAI node and soundcard for HDMI
>   arm64: dts: allwinner: a64: Add DAI node and soundcard for HDMI
>   arm: sun8i: h3: Add HDMI audio to Orange Pi 2
>   arm: sun8i: h3: Add HDMI audio to Beelink X2
>   arm64: dts: allwinner: a64: Add HDMI audio to Pine64
>
> Ondrej Jirman (3):
>   arm64: dts: allwinner: Enable HDMI audio on Orange Pi PC 2
>   ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi PC/One
>   arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio

Acked-by: Chen-Yu Tsai <wens@csie.org>

for all the board DTS file changes.
