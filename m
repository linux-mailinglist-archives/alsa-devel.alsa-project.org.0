Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45D79A1B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06116181A;
	Mon, 29 Jul 2019 22:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06116181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564432702;
	bh=49jv+C3aYfJVDh80ciVjPyD+d86VnlcQRxwWCmp6Wvw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2GyR233r5+w1GRn5dZgWU50qLLhu3RVeJ7PfjU1M48dQzVyPUA3r87GnQ0Q9SCfs
	 5cdFVt5Y3rBbdzMGzk1tyvsRhZ4R5yroIjO24PMHQG9YvBpecYYGaa+J+UCTUKIS+e
	 T6y2XhNaqMdPddYRNPlVQF9e3085RDs6U9DER/WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B64F80527;
	Mon, 29 Jul 2019 22:27:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59211F80508; Mon, 29 Jul 2019 22:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E183AF8048D
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 22:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E183AF8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IE5wQkOH"
Received: by mail-wm1-x343.google.com with SMTP id s3so54999174wms.2
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KBY1KbZOnMvZrZHmdH2FrpwIL93ExhkFfwDFt85kHsI=;
 b=IE5wQkOHnUoztkMpJoQ2nn1zzhDvX5O97XUsPLi2aDMdVW+n+layGvyv6MI3mNPOpp
 ZAJMazltzWyWYKegr6OGfe3uxyJmHEHpZ4E+9wJTnNxnB/UaCWJHPDmU7r8dUsxi9EE4
 n8ra8Z/eVyvZ4upnCQ+YSxREA5nB4Np1YDoUlVWuLsr2ZAwyZpDhuUKg9soY3VrtbYcY
 YfDx8oMBTIl2q/QzwFto3oNayCEXD4ib7J052e93WO3LCIntgBRZF7ZGNLU3a2imXmSi
 yj3LbFX7yXoGiSMT9MDTahHz7WBnGesQVGct1FzZtJ3dQlCDDFfPqsInFvTiQkzt6qBm
 4gdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBY1KbZOnMvZrZHmdH2FrpwIL93ExhkFfwDFt85kHsI=;
 b=DaMglSI7MK3Qe/FQIxvqe6UWJkt+OnBQwKjLLdBsnq5T5uigRB+kfuen6zUZ+mp6od
 Jx4MqzlQNBkopT4zPAynmunG4jccaqzjn0tsBzn22JpwM7D54ZVmgoAfPPBS8NyHGBxJ
 4rsgm4MOU0lYcE62EVtHspX6EK91yh5XzMlUc8yItJnOPAdsl6vBDUgTky8TmAnea4h+
 twYddMoQfEs3tZte3feO9OnDczqWf3+1D3AUeVZFoXZzOlAKD/omHbVWpZj3JNghY0UG
 8oxA4Za8eJUJyn5RY/02zyIPp9cpmCKVRKKUFnz25Eprkegs/dPl4Y9s65Zi8RYUz0an
 +VwQ==
X-Gm-Message-State: APjAAAV4xRDqjlyYmEEZunI0ZkUOqn3REbpViN+ZYq/FD+aSPhKvBOgu
 5EcohOYjEYRcv4g3Z3gz1z+caIwwNQ0Vs0WIUL8=
X-Google-Smtp-Source: APXvYqxXecdIIZhY5Beq3TXPDd+pnZWkNdeBaugff95dcv/OvRG57PB34sVze96jsSmVe3AVrs6vnWFMTEzHAb47VFA=
X-Received: by 2002:a1c:18d:: with SMTP id 135mr100779974wmb.171.1564432048929; 
 Mon, 29 Jul 2019 13:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-5-daniel.baluta@nxp.com>
 <20190729201508.GB20594@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190729201508.GB20594@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 29 Jul 2019 23:27:17 +0300
Message-ID: <CAEnQRZCxi9Jo_-MrHaLarX_6uiKaSmJuVgRSA23P+vE305jAuA@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mihai Serban <mihai.serban@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 4/7] ASoC: dt-bindings: Document dl-mask
	property
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

On Mon, Jul 29, 2019 at 11:15 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Jul 28, 2019 at 10:24:26PM +0300, Daniel Baluta wrote:
> > SAI supports up to 8 data lines. This property let the user
> > configure how many data lines should be used per transfer
> > direction (Tx/Rx).
>
> This sounds a bit less persuasive to me as we are adding a
> DT property that's used to describe a hardware connections
> and it would be probably better to mention that the mapping
> between the mask and the data lines could be more flexible
> than consecutive active data lines as you said previously.
>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 2e726b983845..2b38036a4883 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -49,6 +49,13 @@ Optional properties:
> >
> >    - big-endian               : Boolean property, required if all the SAI
> >                         registers are big-endian rather than little-endian.
> > +  - fsl,dl-mask              : list of two integers (bitmask, first for RX, second
>
> I am leaving this naming to DT maintainer.
>
> > +                       for TX) representing enabled datalines. Bit 0
> > +                       represents first data line, bit 1 represents second
> > +                       data line and so on. Data line is enabled if
> > +                       corresponding bit is set to 1. By default, if property
> > +                       not present, only dataline 0 is enabled for both
> > +                       directions.
>
> To make this patch more convincing, could we add an example
> as well in the Example section of this binding file? Like:
>         /* RX data lines 0/1 and TX data lines 0/2 are connected */
>         fsl,dl-mask = <0x3 0x5>;

Sure, will add an example.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
