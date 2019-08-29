Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F9A2755
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 21:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235E7167C;
	Thu, 29 Aug 2019 21:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235E7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567107246;
	bh=8BDzo1PHdxtXOpYk+dNTLo3bx3vreWb0sVZBKf2yuhc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khJhwuxztRirgFto7dmJ1fKixVWzLZvIoSUEoa3f2ozJvN2KXuqeEOzZEIWkhVXA4
	 99HIMOaSxeIR8fvM9LZ9o6jARciHEOCmfY7H57xstOiE9jj6dyJ3mlr4m9tXq7kLiI
	 mfyMg7gD2OXd4eaL1z5LvxgWOdN5LgL78qnx2fww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57DF0F801ED;
	Thu, 29 Aug 2019 21:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62201F80148; Thu, 29 Aug 2019 21:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A923F800F1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 21:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A923F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z2o0/F/s"
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD7732189D
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567107187;
 bh=QoL4AhSk6PvmPyMU8+/hG69E+MpudT9gZ5Nmid7lJuo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z2o0/F/sGZLbGd/0eLkgaTXJvJzSm3VSynu7kNCNIS7Bpm63dx4+vCt/1bIClhu0E
 i2jDMS7FmGzOAGh1hPUnbixOnTFicCuJRQVVhtBW9Mbqjm52GkC6IYCB0lq2fJ1q8h
 dgQffumchUDT2W/d+oWVP8Mw800fEfvJufEZr/ZI=
Received: by mail-qt1-f171.google.com with SMTP id j15so4956619qtl.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 12:33:07 -0700 (PDT)
X-Gm-Message-State: APjAAAWOYb2HzUsw+ITn3HY1QmDQBKg+MvMHtpN8mIa6pJ96fSt3UUdQ
 65J+fwoDyIx7/j2A4ZcjUo8XTbHp8K6W3PHtfA==
X-Google-Smtp-Source: APXvYqwzMUwpK5mXNX8UIzE6GHqaVbELhdNykc41DBBvmTiFH2EnhhR64lsBglAOMBBEMcHhpwTjDb/5Y/mwd0COHQw=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr11577199qto.224.1567107187025; 
 Thu, 29 Aug 2019 12:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
 <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 14:32:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKq228oWZzSWykBtGSy8qwwn48q-nYfExhiKMTAzj+-+g@mail.gmail.com>
Message-ID: <CAL_JsqKq228oWZzSWykBtGSy8qwwn48q-nYfExhiKMTAzj+-+g@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v6 3/4] dt-bindings: ASoC: Add WSA881x
	bindings
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

On Thu, Aug 29, 2019 at 11:36 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier. This Amplifier also has a simple thermal sensor for
> over temperature and speaker protection.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa881x.yaml          | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
