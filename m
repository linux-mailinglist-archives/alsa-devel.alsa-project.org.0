Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64855BC0B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A411E0;
	Mon, 27 Jun 2022 22:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A411E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656363262;
	bh=2us7eO56u9rJbCrrQSCvl8jLSiOlyrXL18kPskJgQ84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6qB+NK5sP9FabnzSmv+32b4+GeuVw2DxV6k24euilfbpjtvsHJ9FhHhScVJA7RgB
	 Hlc1A/MS/x5AWOBFvkFfs8OBbb02DTyI9U1UbJQ+Y/BMs5YR6gzeLD58guNMgZ579G
	 alu86GaXmD4eDpuuc4xhLICm1zt35c2qymfWEz1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 974DCF8028D;
	Mon, 27 Jun 2022 22:53:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF563F8028B; Mon, 27 Jun 2022 22:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A45F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A45F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TUVg0HsI"
Received: by mail-ed1-x534.google.com with SMTP id r18so6904122edb.9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IA+0VfcVBkch2BU2eYjCNzBquhqaGbstP7Dzuv9Lqo=;
 b=TUVg0HsIqLw4sApAkHjqnkpFHrds7l7w0mQZVXGCjUxtRg9tT/C0Sbb8yO+tjzsYSY
 kj6NfSMrW3R9plL5lGlW+mcCCb7SdvQBZo1fRAPrxIlm3LY8ws+enJl7Q2gFbOvlbY/A
 CZc3kQz7BKYdmhONPxVB8QxIoCs9TLFW1ezxIvteEDCrpx6Y5jE4M5IYLfzQ4p1LFTFB
 pIMAstdeQ8N7xmpOKec/0SxjfkcK6F2erW4jmyBQv9T/L1OtyWymKO5tOG38e17cUtt4
 kX7XcNInyC+5oa262lczEiqFMnYEi/YggipKpwgcx6zUS4dmWa4w/09RAh56/EjB9lzv
 VWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IA+0VfcVBkch2BU2eYjCNzBquhqaGbstP7Dzuv9Lqo=;
 b=GRyIywDScR3JHe7NDAmuy+IcVDMW0ZZtWhOf8R8en89SBYMr/uDPlhmMSMezvQRV62
 O5WvaYIFHIHU6T3mhh2VXf65meeQrADYN/OHmJd/mMtJI9MzVxloMTxWVkpYTtYYAHuL
 TiEZLIvXNiWS9H8ecadPut6mnNU2m8AkinbUKHu8gEvxLy655oZefOmnEHx/Wv1hrio3
 LOfU5FqE5a2FGL4ndR5TBGHVcdM7wG9k89+ED6Vc4MuQ5JBS0nHRzUjboapl51dyb8Jg
 pn+jrNwUPE1r5FjNfK9T1XsSHlqx1uXY/daSTuLltp++wQEtFbfOCpE19wILSiwzs4/j
 ZLhw==
X-Gm-Message-State: AJIora8mKWbstsoGh+ISi84IBxol+epPV/i4M0/qX2m//RppkZ0b47Zn
 PGk/bGEEYk4yxLe8DJVcALU=
X-Google-Smtp-Source: AGRyM1sOleAAXiC2Z84z7E23pKGNaf1YN5XBERpRmtfSGUqMPsciG8VWq+vn/Gj8YZVQHS579GHYiA==
X-Received: by 2002:a05:6402:14c4:b0:435:717a:fd63 with SMTP id
 f4-20020a05640214c400b00435717afd63mr18902564edx.395.1656363188396; 
 Mon, 27 Jun 2022 13:53:08 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm5447202ejd.196.2022.06.27.13.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:53:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Enable internal
 HMIC bias
Date: Mon, 27 Jun 2022 22:53:05 +0200
Message-ID: <13043007.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20220621035452.60272-4-samuel@sholland.org>
References: <20220621035452.60272-1-samuel@sholland.org>
 <20220621035452.60272-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Dne torek, 21. junij 2022 ob 05:54:52 CEST je Samuel Holland napisal(a):
> Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
> resistor connecting HBIAS to MIC2P. Enable the internal resistor to
> provide the necessary headeset microphone bias.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


