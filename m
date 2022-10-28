Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0C6111FA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 14:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0B71FDE;
	Fri, 28 Oct 2022 14:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0B71FDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666961741;
	bh=YGmOul0+tPLxdbZmHvojeiVMuGaKVCqnu1drpy/b7f4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V10cw0CgtZDzmxCf8FVLm9FCVqJUG5w8lBBTidRVXlT6l7sxa+CfLG7GdcqfrwSNt
	 /5NhFE3LMPjz4qhgShYenbwvuvHMPHczI89RLlBSRpLarkke7F52YAcENbx2RWaDdy
	 t8aBImz7Il4BInhImXSD/0N5UOkWzIdeD26T+q+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89367F80095;
	Fri, 28 Oct 2022 14:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19452F8025A; Fri, 28 Oct 2022 14:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8A7F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 14:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8A7F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jEjV12Pk"
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3321c2a8d4cso46231687b3.5
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4Wa3zuGdPPlhF6BsX0vopA+9xtlRCdSj7XxNypRvgY=;
 b=jEjV12PkkhsxOk2320IMxk9cduAJECXQwpyb4R07XWi96fTyT/phvIrEx/uNX5djVf
 UDGN9rbfjUrXH6v0TDAlll0ZVY9nXNbm4ZwD8wKzo19tsD7f02QleEwfm4lHV29P2dn+
 7U5+eBjTnYHFY2k038NGOig4k9AuLcaW21bnCgHxfypB89aYLpyEo8zJJLbqrGYNdT6q
 rCaOrkoiHpOhwcV0isM3Dpt+AYe4k3IiRQy6JXBFBfZYRgXsg6WzyxGNMN9BDptB2r8G
 3/BzbWiyPOwuuFN+i08HYE9oC1flRzQiva8lOIfo3ZoS0K1O5//nQItTRDXcSnyGHhpd
 B6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4Wa3zuGdPPlhF6BsX0vopA+9xtlRCdSj7XxNypRvgY=;
 b=YcnAjuFB2K/PAcAHMJOp/rC5r9YCNwki+ZYJZMQZ+VhpTNbOP8WhZPgtfBzs/+AyM1
 5bIPD6D7eVF7sEkIpVAHGYZXt8RjsK+kzeXTVYBsCdNQAOE25FE/xyz48Q9IvkYGbXD8
 7s8NX885TeurZfKOfNioJpbGEprv1kv6Mxbp9yyO/o4dIVpjXDHTVJgDP2eb0ZYjqSp7
 Ln/wHMT0zDXtWH6JnyNkTwA3knxeeW7VgjCqfwpNB9xXaqddphoIkuc0RmYhITqCCoxH
 ZcCAJ/+/e6sDnDUMwuzAYrazjb8dqhh8sVuHlu1qKq3O6H46wZM83IQHf0j4rwJBW4UJ
 d2cw==
X-Gm-Message-State: ACrzQf09C7eZmSBbTheMbjvuJyOjvfCjzum7aIhI01Je5iWVawZ8b1hD
 ACfZvsM44GTsOOgo+KZQ4iqL7tORjp8vJ0t/UVV/GA==
X-Google-Smtp-Source: AMsMyM6/onXKmlmi48y+9Oj39tNtsrUcw88h4lmuDL7lgeCeAFf6rXMt+ipp9GLAJ1e6jJH90cSd+4st7GalIt3w450=
X-Received: by 2002:a81:4f89:0:b0:36a:f09f:73fc with SMTP id
 d131-20020a814f89000000b0036af09f73fcmr31265830ywb.487.1666961677715; Fri, 28
 Oct 2022 05:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
 <a7275ee4-c6ec-c0e8-c49d-dec9ca367d9f@linux.intel.com>
In-Reply-To: <a7275ee4-c6ec-c0e8-c49d-dec9ca367d9f@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 28 Oct 2022 20:54:31 +0800
Message-ID: <CALprXBavrYqWxKUgEJMWNXGCuBnKNjKk1n_4eFOeo+=6=juHYQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Hi Amadeusz,

Yes, the original version I tried the implementation on audio machine
driver, but one person gave me an idea for this dmic.c
Do you think it is appropriate on dmic.c?
 If it isn't, I will add kcontrol into audio machine driver.  thanks


On Fri, Oct 28, 2022 at 7:44 PM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 10/28/2022 12:24 PM, Ajye Huang wrote:
> > Having two DMICs, a front DMIC and a rear DMIC,
> > but only host audio input AUX port0 is used for these two Dmics.
> > A "dmic_sel-gpios" property is used for a mixer control to switch
> > the dmic signal source between the Front and Rear Dmic.
> >
> > usage: amixer -c0 cset name=3D'Dmic Mux' 'FrontMic'
> > usage: amixer -c0 cset name=3D'Dmic Mux' 'RearMic'
> >
> > Refer to this one as an example,
> > commit 3cfbf07c6d27
> > ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> > ---
>
>
> I'm very suspicious of this patchset. As it is you add kcontrol which
> won't take effect on most platforms making use of DMIC. It feels to me
> that it is something you want to handle on machine driver side instead.
>
