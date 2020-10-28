Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3F29CF73
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 11:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FB71674;
	Wed, 28 Oct 2020 11:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FB71674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603880411;
	bh=oyPjZfkw2bAQa4asQy4y5m52zTi3eSbWISDc1NRBIB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBlXb0KViGKmwALBJ6TxqFTUvKvbye/b0Imr/+b+vJ1uRYP/t9Y0Gac8YPZQvslTX
	 v2PveT89EFe6K+ZgbH5R8v4iRxIPmJXfmgICuI3XQK4kBrw27Jn8NX18MoXV1/rMk7
	 WEna34u67/W7IqW+mrWosHwIHLtcMGQZUPTt12IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96FCEF80249;
	Wed, 28 Oct 2020 11:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0684AF800E1; Wed, 28 Oct 2020 11:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 402FEF800E1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 11:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 402FEF800E1
Received: by mail-lj1-f194.google.com with SMTP id m16so5444349ljo.6
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 03:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oyPjZfkw2bAQa4asQy4y5m52zTi3eSbWISDc1NRBIB0=;
 b=Zp5fcXr7ikfRwHApiPJjacMUi0R0vm6yqrFlQLeHCZ3Hc/MlfD9e9R2f7ziv78h1rx
 SsqlGrUpjWMFQDOOh01svp8frG/seIVF1Y8mac8VS2MN/ztIqpqLFO3jPXcEGySEjq2p
 xNOTyD5TDEbb7HyHJb1jcigk8Xl1G2hSkVzuIWhY6iM4a1KZeUyDLBe02j1TZ4mPwF9+
 g80vdg+5DIVgMbvhKd0a1be9AZznSsXwykhsohrLkU5VwNa75Hu+xU1RrqyBrp+w3EBl
 bJlarw3DjF7AyyrV7F9ddn32nD1r58sRYkVuMImZp5FH00QbCLArbvoDmTw7W4RT4jDM
 nB/w==
X-Gm-Message-State: AOAM530EB7ZFJDY8X+dCmIYm6UEePDnb9qr1HZTkCSZeXLfpayg3K/u6
 KzTA3dDHYky47gAzZn9Ra2jt6wWb8uoBqw==
X-Google-Smtp-Source: ABdhPJxBDVZDGDv2ODrLkFSKMcSEmG3rVGtHPN0lOzJJgMVnuIASpKRDwLdMTkTVlFkXfE05P8XEXg==
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr2828023ljj.321.1603880309734; 
 Wed, 28 Oct 2020 03:18:29 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id n3sm481754lfi.37.2020.10.28.03.18.29
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 03:18:29 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id f9so5661699lfq.2
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 03:18:29 -0700 (PDT)
X-Received: by 2002:ac2:4c10:: with SMTP id t16mr2279614lfq.193.1603880308979; 
 Wed, 28 Oct 2020 03:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201027183149.145165-1-peron.clem@gmail.com>
 <20201027183149.145165-13-peron.clem@gmail.com>
In-Reply-To: <20201027183149.145165-13-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 28 Oct 2020 18:18:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dFMNjc4r1Lcyk396h=GqVivPJ64N-wy4AvjDABdVVhw@mail.gmail.com>
Message-ID: <CAGb2v67dFMNjc4r1Lcyk396h=GqVivPJ64N-wy4AvjDABdVVhw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v9 12/14] arm64: defconfig: Enable Allwinner
 i2s driver
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

On Wed, Oct 28, 2020 at 2:32 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Enable Allwinner I2S driver for arm64 defconfig.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
