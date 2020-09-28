Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D118927A7E9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 08:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360A21E91;
	Mon, 28 Sep 2020 08:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360A21E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601275908;
	bh=0sGL25OAFSU0NyKSRPgNVNAwmqv5+p5DkVqXN1iipGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAb7YQ08witYGSFvwDpWISgTCGPUko7V3DXyE+WTVuL/LH9scNlR3SQ/dEzLUILWU
	 giD0CfvR4DghYYyS8eWVawqULhjhkWYIqB7QPmPCGX6zYG9Rhi9Vm/U3jDFfVGDJRb
	 DuYlYdiN8oiBepB2wrH/KWBFqu+JE9N2rlqTIIQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 131C3F800FD;
	Mon, 28 Sep 2020 08:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02DB6F801F9; Mon, 28 Sep 2020 08:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C5FF800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C5FF800FD
Received: by mail-lj1-f193.google.com with SMTP id n25so110307ljj.4
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0sGL25OAFSU0NyKSRPgNVNAwmqv5+p5DkVqXN1iipGQ=;
 b=MQuk3NgdRH5X5iAiqUNfabqV4AD0WDbckysMy0BvnssCUm9m/UwBZRHtM1eZSdGup1
 K3eGiCATxwLx5JJyiG5W9afXSYLppb5+5XiFdAPvYFFRTY2wRE42Pi9R7XMOFQoRvcQe
 fUJzZyb/5gt0HJQrRp9lkxQSpNXBdFPesUmU8rcFdXlVDzGSmyxPZfGFIAwFvB+AXS5W
 EuzSOHXsF4TfIZG+kQxeOA+buSyKO383DSRbqh177dHbuU011oQwLob5yaqGgAIv/242
 cZsxax9drfhGX0K2F/RGE6GgvaS6PDU9dFww6DiwAdE037nPdic/GIKP6c6GMqFNG+HO
 JJMQ==
X-Gm-Message-State: AOAM530j4ZkUqB6cQHWcE7T+mj66E/LL2Xk0nS9qRFVQ06WrC2A0foNT
 ugH/GCUqHf8MNYOgCs0c+RHWnsEHkJ1nPA==
X-Google-Smtp-Source: ABdhPJzxMdiB1Z5Fxu4sH5m5L+t2dElBcobnJjiCIyHWxKdCn6IMmpMqPbRrAVkPvl6HUz8anzZ0wg==
X-Received: by 2002:a2e:8607:: with SMTP id a7mr2110lji.122.1601275792765;
 Sun, 27 Sep 2020 23:49:52 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id t12sm2741323lfk.26.2020.09.27.23.49.52
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:49:52 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id s205so103376lja.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:49:52 -0700 (PDT)
X-Received: by 2002:a2e:a550:: with SMTP id e16mr4737780ljn.125.1601275792241; 
 Sun, 27 Sep 2020 23:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-8-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-8-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 14:49:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FOois4RXZWZBu1x1TGy4Kb6Orw_FyHBu=yz_dXJ7HWw@mail.gmail.com>
Message-ID: <CAGb2v65FOois4RXZWZBu1x1TGy4Kb6Orw_FyHBu=yz_dXJ7HWw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 07/20] ASoC: sun4i-i2s: Fix sun8i
 volatile regs
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
> The FIFO TX reg is volatile and sun8i i2s register
> mapping is different from sun4i.
>
> Even if in this case it's doesn't create an issue,
> Avoid setting some regs that are undefined in sun8i.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
