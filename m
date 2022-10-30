Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1265612BCA
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 18:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD2515C2;
	Sun, 30 Oct 2022 18:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD2515C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667150321;
	bh=wu63C7bN/klvu7En3Q1q4OepbCYp9/JqSl+JMD8PGcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcZ/4VaKTBj4nJPcjsY1US/fDK9VNKcOAg3fVP+WACrtssESXoU6KUBdkq0aN1m5F
	 /G1tXRX/2z4YnzQtSRwuQCi+EudnWz+xXEEWrzO5kX6FqbQsMQrx770Qb3Zg1SKATt
	 Sm/5n0u+ROcb47OzU5nCpjBUOvSnY4sEADR6E/UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C604F8023B;
	Sun, 30 Oct 2022 18:17:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B4BDF80217; Sun, 30 Oct 2022 18:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 053DBF800E1
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 18:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053DBF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ACnpJ5mK"
Received: by mail-yb1-xb2a.google.com with SMTP id y72so11412308yby.13
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ7uJLBIhN6i85bshrC6bijT/YDWeXqFsg9Tc3UQLxY=;
 b=ACnpJ5mK07YWG7SrKB+AOsI1oo2Cp/w8OGk3mQBSzEp43U510vT9y1sDXj7kgfoR/k
 Lb4MTUfVAQEaNtlB9DUy/FlxCwzU6uoisLyvszi9/IZTu74T4T1pjpBLCKJ35QkIFf5r
 wROu3WZep4MOF23gRdXFUpcjC3JtSfFACYh6cGlCINAetusBTnY4S3JQ+e9IlaQJBuvE
 CFdYmyc3ue62bk8OO7fd8VH1MnAXnT1VDOQ0yjlkHJrjSiLIw5vCRtwsBo37nVqYlKjt
 PrbVOpy+7ZIgT6iedcx2c+Sc+x5eTA+0Fb5hLARVqt/vGk0aoTLeHXbKZEvc8TNQh/6i
 nIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQ7uJLBIhN6i85bshrC6bijT/YDWeXqFsg9Tc3UQLxY=;
 b=7YBmHFpO/YNRUNLVGmsaS2Rp1MliAUo6lXQRod3PiY2ot1Y98pNqjCf0LVZ586N/5p
 s3XvP0IIZSvRkCCFovl3rcKmusZHHxpf1UXPoTJ4nszBvtqxsTTHOFJqK/46yzjrORFk
 bFShv1PcYXKpda0L+M9mCvaF0wEaMcPYngS2RH91nhigiYQh/duYBcRulkfQf7i4IJSO
 pd9ODDEDfCU+nFHqGNqZTGI5bfjh9D9Z2dbC/ZNYq0vuBMmQMfV+qZ5O6JWFdXTNtTaQ
 /4MX6mGqh9aPls6yx5lwYC8RkMXrSrwHG7kGIE35vJV+XMR+7yqFGziM8FdY+9DH0CZh
 Gs2Q==
X-Gm-Message-State: ACrzQf0DOlNvpjvMZ1cTQT0ZsVRBlXf8jdPNCfcSBNqj84T6o1S94k24
 1nAD+NS85oqrus+vtodRy3w+bJZ7vUg83jJKtyuhHQ==
X-Google-Smtp-Source: AMsMyM42BGs2fhx99u/w9idGVeX58S0wuZSo8XELt8XRKWvIHOSt9iOpY08Tsg+YGY4VPcICFow8CroCW2E0+u21gME=
X-Received: by 2002:a5b:241:0:b0:6b0:90e:1d4d with SMTP id
 g1-20020a5b0241000000b006b0090e1d4dmr8985854ybp.648.1667150257212; 
 Sun, 30 Oct 2022 10:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
 <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
 <166713668618.965877.11108951663566363754.robh@kernel.org>
In-Reply-To: <166713668618.965877.11108951663566363754.robh@kernel.org>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 31 Oct 2022 01:17:26 +0800
Message-ID: <CALprXBYwi9SpgOSN9kx6JqyY9tnc0jWbZqWv-iJ6Sq079rSTnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Hi Rob Herring

On Sun, Oct 30, 2022 at 9:50 PM Rob Herring <robh@kernel.org> wrote:

> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dts:29.35-36 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2

Thank you for your review, and I will send the fixed patch again  thanks
