Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3484EDAE4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8521A7C;
	Thu, 31 Mar 2022 15:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8521A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734576;
	bh=1FmWFtFPrGFw3jPfN32jgX8K91mK4Fw6kVZq2e3W06A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dLY3kjnZEfTOeuSkqU+bAcr/IbDQMWMzAf4dRBDy+JYQuKPz6IDew+jb27+ordEcV
	 eKIbd0v/liy7+QHxYoA6+klGP5/dHwBOrS3Y94/EzHurfUaFTgmnivSoo8enebF+Uq
	 Oj1tcjCQHB71hrXvit4M/D1PaRkX0o6PHf2RqLXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1560F80227;
	Thu, 31 Mar 2022 15:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B622F8020D; Thu, 31 Mar 2022 15:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E103DF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E103DF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GuBynw1b"
Received: by mail-ed1-x530.google.com with SMTP id w25so28218095edi.11
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FmWFtFPrGFw3jPfN32jgX8K91mK4Fw6kVZq2e3W06A=;
 b=GuBynw1bR30DfiMh5e8Nh5WD+dkT0noit+4UtYMJK3iKZ35qa0dPkAbev0Ox7RYOms
 3dBIoSRbPCMsJy1VhC68ogz6X3AZc3fGy3Bps2B4GzDsKbcccaO9aFOV7Xfrl/AJfwOL
 Lf54fxuRDFulTu4JdbLWUzLAhvd9LSrSizfBOGHs8NE+MDdhNX2w/W2kdJ4TdpWS9DBO
 KR/oQpoQRKLEiJYlThLZXpJ95lZRtKRA0zscywXTz9B7D+9HhuaCLPhf7O83sgaEeWH1
 AWbglg8K0D4RQ/zFbM2+L4koc/6hHCvbtiRVXLetfX+GXEtcDjosdBlNbdwGNCckPyhV
 Tkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FmWFtFPrGFw3jPfN32jgX8K91mK4Fw6kVZq2e3W06A=;
 b=fUF9TkqQrAz8wt2hEhQMMIR3fzKFhpDyF2lKIwmBlVZY/hgiZrMPId7C5LTwLCI8SM
 jmZfwHYj24ZDj/Q2kc1vXEfdUCbBaQXOoSWjMWK6pXiYOpGy3Qam33ZRxXHiawNNZd4h
 rTcS96p/YT1/wHdBnOsVueoDhsXriWkQcd3rRJ7D5DC9NjklrCkrgTf0BW+J+jdUm2Ma
 ogRb3GlXSIKcUTonDqEqRodG004u5ZDxiipBqa43Jru+G//Bia7DugpmesnWNyW7wvFy
 70ZmkQAemDshQ83sU6Ju6vv33eSd8251u9zjLWpiE8F0FHLf0eLDDR8B0Ukl8o+s3V+S
 5RIA==
X-Gm-Message-State: AOAM530SWLQH0RZ+7qm/AW05G4NPSOglJ7VrxAb9ZvxVkTsFwSIA5iHC
 aDl+gy1frbkBNhw7FATW3lz1SnFweju9wSJVG2M=
X-Google-Smtp-Source: ABdhPJzgmF3q9RuLnrcHquNydyMYB8kqL9v5TvHww44KBOahY3umU53CaQRZK2bfteXGp/QRBvjn0bir8PkTUp3+a1k=
X-Received: by 2002:a05:6402:27d4:b0:419:5105:f7e7 with SMTP id
 c20-20020a05640227d400b004195105f7e7mr16672565ede.356.1648734498411; Thu, 31
 Mar 2022 06:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220323135601.42435-1-ariel.dalessandro@collabora.com>
 <CAOMZO5D4_WboF4S0dgSLD1m15a13c2irK2yjDV4C77_Wb15=2w@mail.gmail.com>
 <d9f14221-b0ad-9853-e9c8-a35d9111549b@collabora.com>
 <3e3b223f-7d05-f439-625a-a15afb44b95f@collabora.com>
In-Reply-To: <3e3b223f-7d05-f439-625a-a15afb44b95f@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 31 Mar 2022 10:48:07 -0300
Message-ID: <CAOMZO5D8UHkkyJE9uJ4yBmf+ajjbzJOrLM57OHpyAiATvMNXcw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Hi Ariel,

On Thu, Mar 31, 2022 at 10:35 AM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Hi Fabio, Shawn,
>
> Can we merge this please?

Shawn will probably start picking the patches for the next cycle after
5.18-rc1 is released.
