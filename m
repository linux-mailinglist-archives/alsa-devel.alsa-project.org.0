Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D44FF87E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 16:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BA217CC;
	Wed, 13 Apr 2022 16:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BA217CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649858712;
	bh=1gWKXVrRswB60ox+28/jr46/hZexeO9zPFrDCOUZV7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ABH/cw+GpwMbskIn7bL7EJ2loh16aVKA0dAYXvuNykoqiz3dz8/go5/EqXtFPPvzV
	 5gMLM3yhwxVzSHKNGyw80qzbazKiEQ9uYheTIBVPfdr9OdJEDXSV5lf+4++E9mGjhM
	 Qjk1IgiNr5GbrLjBQP3Nx7X7xbFGWo7YxgOSrXE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A46BF8028B;
	Wed, 13 Apr 2022 16:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79856F80248; Wed, 13 Apr 2022 16:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CCBAF80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 16:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CCBAF80095
Received: by mail-qt1-f173.google.com with SMTP id r25so1401511qtp.8
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 07:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K7k2FVqabmscQZ4JxpUNIhsQJ2p2uLnZJ6vhHbip+cU=;
 b=nMDQNP3up1CxNoyXPE3qJnfDuYqP+I7Inkh8oxxbEQBnPx1naOotYg+XiMlIf8jgs4
 LQ6tje7NPSO4iaVRch4EMv9FgjdJzNXQfvGFm3C83MxKzwJkch7ehVFvoJOnGexfSBKG
 VEOSUTmbXrD6PXtmbqI8DFHAakBLoxrvvrFllXmhg46NcWMaLFvtQI4aDbqPay6MWbXo
 7ysTH2CplaylfjR15NQxhQXbNqLxlUFXOlyEGoWToeUKbmXPscL+pAtoHjw+elICGU7B
 n21fEJkS4KRv9j/g6zkagUpabbURqB67tpNmmRzqAD07/rj/44vifO9BdYGZD/CRMGE+
 8knQ==
X-Gm-Message-State: AOAM530rxFWF8wHxPQndUgD16k3tsg21ANACpnRA4vrI1P82xyaD/PeN
 4+D6/sVnn5mO7MdTBPGhR6pnxefKvTKY/A==
X-Google-Smtp-Source: ABdhPJz/aVotlCWNkGgMbmY53ZaLc9CwG57Pikub9BGOwoc9eTCC+HWiiWW55KYT+F/Rbnenyi0WrQ==
X-Received: by 2002:ac8:70da:0:b0:2f1:d195:cfaf with SMTP id
 g26-20020ac870da000000b002f1d195cfafmr2026113qtp.247.1649858642253; 
 Wed, 13 Apr 2022 07:04:02 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 h27-20020ac8777b000000b002eff87a2c42sm3949550qtu.4.2022.04.13.07.04.01
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 07:04:01 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id p65so3887868ybp.9
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 07:04:01 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr29615442ybq.342.1649858640966; Wed, 13
 Apr 2022 07:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220413140121.3132837-1-robh@kernel.org>
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Apr 2022 16:03:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQK9nQF==3Zg8ikwNfQc=F6gHXabvPCxaKprPMoMO+7A@mail.gmail.com>
Message-ID: <CAMuHMdUQK9nQF==3Zg8ikwNfQc=F6gHXabvPCxaKprPMoMO+7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-hwmon@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Agathe Porte <agathe.porte@nokia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Apr 13, 2022 at 4:01 PM Rob Herring <robh@kernel.org> wrote:
> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints under
> 'items' moved up a level.

> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
