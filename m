Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07774232E0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 23:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35662166D;
	Tue,  5 Oct 2021 23:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35662166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633469593;
	bh=DS5hpdNDg+9guBTzpyXJCVGLyFM1XQTHvFfTJP1Qsz4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFTj9pQ/ygORBEfiKdobhM4XjQ1D5CgUwIsiDjYGsg6tzzsvhc04784y+4iP0rJ/j
	 H2qtV7nXjwj4cU34D3n2zu0hoW7dH9AouZTvE+loHzqaPfFXtTKUKRV2lo9RNN3RsD
	 +u1zm1aYTADoI6WUcmlrRAp0SVW3NDSpp7ikhzRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9BBF8020D;
	Tue,  5 Oct 2021 23:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F32D9F8027D; Tue,  5 Oct 2021 23:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35563F8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 23:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35563F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="EFN/Evkc"
Received: by mail-ed1-x533.google.com with SMTP id p13so2114035edw.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Oct 2021 14:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyVXlnP2EO7sin30ak6UOPtTEL7Y82rXmT1HaZJEwO8=;
 b=EFN/EvkcYsa4w188RyqHCgrfIifhUY80k3vng6CANfrvzyfsDaVjfDtTPGoR518LhV
 GD5oDuzos+B9/T9xu3L51B88VpK7ug1wdWoYUKxCIx5iYryNBRqmOK3f1s0NVN3zNmSx
 ik2H8dDm4T9B6uiATyk6B/1DooH4Mqlz0oMcA15tRRXuCYjA43xQqokHbVsoWkx5638U
 JjpXaSt8duZuGSYl3aAv73jpt0xE3eIMEnCrfjLShz4nsq98JtPv0HCuTUjPusvYOHhS
 wqyE1xXpysKBlZ38l2YPGNjL6L1GamN+Nt8+bjyG/KZ7AgLrfLwbW2aQdn2pBfCWRgpX
 cngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyVXlnP2EO7sin30ak6UOPtTEL7Y82rXmT1HaZJEwO8=;
 b=bOuAOCSaUOdAA7peBHFfs/B4C883UwJl8re4I9lxfYjkEgMJ8QNrGKjMcbWIKwcHKh
 +V5lhagDPdaLC9gQbX9Qvp3MKkkBhoi0O0c2MW+YgeY1ST7w2nR4eRjom5jRmZNnFZG1
 7W6CRimX6mzAkQLPNM65Ci8Y8MV5492Puifygt9u/bk/7K0y8P73oe2IlRkE+Hehh+uu
 Vd9jjWviYyp+Teu1EiHuIGGwmC05hqbyToNv5qtETpPfC3lJ75CTSRVMmBbcytZvx5Pz
 qJPTb0/RdJMIQ1ykDQVE7yAdv/cin6AWVAoooauIEDZDzlqD51vckDSF4VVnLjx2fK9L
 JjtQ==
X-Gm-Message-State: AOAM533r6tsXgOXaBHS8Jg+I3vebKn2nEKecrfAc07F/FLbgT8OW6Y+N
 M+WxaddS6jZORspiqsdF72rZ22iGSiX3G+QiSxo=
X-Google-Smtp-Source: ABdhPJwKILTM9G/OOo7WWONLMHq2ef2R6ySw+NYb6dhPKjGQkfzxEG/W1fih0HC2WwHMp8T9yaPB74McG7c/6kHtQQ0=
X-Received: by 2002:a17:906:318f:: with SMTP id
 15mr27839463ejy.206.1633469502753; 
 Tue, 05 Oct 2021 14:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
 <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
In-Reply-To: <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Oct 2021 23:31:31 +0200
Message-ID: <CAFBinCBv0GWDUL+WYBU4JAgKgie07m+duxReh2tSopGOHwh4=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="00000000000076acda05cda1c165"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-amlogic@lists.infradead.org,
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

--00000000000076acda05cda1c165
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

On Mon, Oct 4, 2021 at 11:17 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > This bit could also be a remain of an older design, not really connected
> > to anything meaningful. It would not be the first time.
> >
> > The AIU looks like an IP that has evolved a lot over the years, not always
> > in a coordinated fashion. Some scenario are well supported and easy,
> > others seem to require a magic spell.
> >
> > Last (but not least), in AML vendor kernel, the only time this bit poked
> > is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.
> The 32-bit SoCs use SPDIF to feed 2-channel audio to the HDMI TX
> controller and I2S to feed 8-channel audio to the HDMI TX controller.
> It seems that Amlogic stopped this for (at least some) 64-bit SoCs.
>
> My testing results indicate that AIU_CLK_CTRL_MORE[6] is still relevant.
> I can do another round of testing with various combinations of
> AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL register values.
> If you want me to test any specific combinations then please let me know.
I have tested various combinations, see the attached result file
(which can be viewed with "column -t /path/to/results.txt").
The short summary is that...
...I2S output requires:
  AIU_HDMI_CLK_DATA_CTRL[1:0] = 0x2
  AIU_HDMI_CLK_DATA_CTRL[5:4] = 0x2
  AIU_CLK_CTRL_MORE[6] = 0x1

...SPDIF output requires:
  AIU_HDMI_CLK_DATA_CTRL[1:0] = 0x2
  AIU_HDMI_CLK_DATA_CTRL[5:4] = (any)
  AIU_CLK_CTRL_MORE[6] = 0x1

My test consisted of running speaker-test -c2 and playing an mp3 with
ffplay on an Odroid-C1.

In other words: this confirms what we have suspected before.
What is your suggestion on how to model these muxes in the driver?

In the meantime I finally understood what #sound-dai-cells = <1>; does
thanks to your previous hints.
With that I can wire up the I2S and SPDIF inputs to the HDMI TX
controller's "HDMI codec".
Many thanks again for this hint!


Best regards,
Martin

--00000000000076acda05cda1c165
Content-Type: text/plain; charset="US-ASCII"; name="results.txt"
Content-Disposition: attachment; filename="results.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kuekxzbb0>
X-Attachment-Id: f_kuekxzbb0

QUlVX0hETUlfQ0xLX0RBVEFfQ1RSTFsxOjBdIEFJVV9IRE1JX0NMS19EQVRBX0NUUkxbNTo0XSBB
SVVfQ0xLX0NUUkxfTU9SRVs2XSBJMlMgU1BESUYKKENUUkxfQ0xLX1NFTCkgKENUUkxfREFUQV9T
RUwpIChBTUNMSykgKEkyUykgKFNQRElGKQoweDAgMHgwIDB4MCBzaWxlbmNlIHNpbGVuY2UKMHgw
IDB4MCAweDEgc2lsZW5jZSBzaWxlbmNlCjB4MiAweDAgMHgwIHNpbGVuY2UgcGxheWJhY2sKMHgy
IDB4MCAweDEgc2lsZW5jZSBzaWxlbmNlCjB4MiAweDIgMHgxIHBsYXliYWNrIHNpbGVuY2UKMHgy
IDB4MiAweDAgc2lsZW5jZSBwbGF5YmFjawo=
--00000000000076acda05cda1c165--
