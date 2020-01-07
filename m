Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DF1335BE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 23:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20F51835;
	Tue,  7 Jan 2020 23:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20F51835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578436216;
	bh=J4aZ/nXOkbLBis1ACdCjVuNFrZo/Jvbt9Wz9zUUFjVk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObCuj47IJRfnd504NLOlR/Ifox7Tj1toZaYNnkIOk3ekm6WmetTGDOtcou4Wi8VQD
	 3Q7Weh5Jdio2zzrMqxsq+vK3z74jiYKSes1iVqUSzK+/8krPZ9r242HjviurGgMHj+
	 gNzvs5i9uzrcf3jwSCJb3ZPyVPmYaKpoJDUyGIYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC5C7F8010B;
	Tue,  7 Jan 2020 23:28:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EA5F8014A; Tue,  7 Jan 2020 23:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18ED8F8010B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 23:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18ED8F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YmOBvRNw"
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 627A520715
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578436102;
 bh=Ng4X0689ET8txDYg+HTSgh4A/4430emIWmGDU7xejoo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YmOBvRNwxn2p4VVNlN1mtPMiHLf88IILl9CU5zsl8oDc2tEKa1JDkDCVyO4Wy/9qd
 Yw8vOC7S8QS09Rv6JU0fD4t8I+ojDUHRjDHedmMf3Oi43gBxQs2Q98Q6n0QgUy6HIQ
 OHTtvmHiGFEn6GyDZhW85HM98ibHSVCqqa6rv8CU=
Received: by mail-qk1-f175.google.com with SMTP id z14so918863qkg.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 14:28:22 -0800 (PST)
X-Gm-Message-State: APjAAAXvUp2uzsqyOESnbl9IoD4VHqtpBdn+6KS7jBOfsC0hRtxBqZ1U
 WLC6sy9NthFdv0Rkh/eRb5TVnnvHNllxFmuXnA==
X-Google-Smtp-Source: APXvYqxoOQxfocQW4kA6khk+aHJU2pwVfyqaD/KAMlGk5ufz1LIdR6mv3ZWKi1+rUBmcLJKspMa+7b9aCsoIRm4X5cM=
X-Received: by 2002:a05:620a:1eb:: with SMTP id
 x11mr1635519qkn.254.1578436101562; 
 Tue, 07 Jan 2020 14:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-kB4Kx690FnU=3CwnjFdQhdxofGguFAAs_j==C=nmQ@mail.gmail.com>
 <1a027d45-6082-1697-ccf2-4a5be9a3591a@linaro.org>
In-Reply-To: <1a027d45-6082-1697-ccf2-4a5be9a3591a@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jan 2020 16:28:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJksUGvLJeYbeP3zv_TtSe0NBWfrTmUsVes1KrwJW0Ahw@mail.gmail.com>
Message-ID: <CAL_JsqJksUGvLJeYbeP3zv_TtSe0NBWfrTmUsVes1KrwJW0Ahw@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Vinod Koul <vinod.koul@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add
	bindings for gpio
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

On Tue, Jan 7, 2020 at 4:17 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 07/01/2020 09:47, Linus Walleij wrote:
> > On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >
> >> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> >> gpio controller to control 5 gpios on the chip. This patch adds
> >> required device tree bindings for it.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Tell me if you want me to merge this patch through the GPIO tree.
> >
> Yes that would be great!. gpio bindings and gpio driver can go via gpio
> tree as there is no compile time dependency. Also Mark has already
> merged the audio codec side of it.

But there is a dependency because dt_binding_check is now broken as
the codec schema references this GPIO schema. Not much to do about
this now other than get the GPIO schema into -next.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
