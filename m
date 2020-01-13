Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042413AAC3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:23:25 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE752288;
	Mon, 13 Jan 2020 18:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE752288
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E1A8F801EB;
	Mon, 13 Jan 2020 18:48:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02FADF80122; Mon, 13 Jan 2020 18:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC7C0F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 18:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC7C0F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HZAEDsdh"
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C3EB207FF
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578937671;
 bh=420Be14jKaTH32OurZrKPNIQub47Hpo3uK0ctqQ8RIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HZAEDsdhMVkPgxk6sb7TF2ekZG229gzq4+PBS2A/m3G2TCWXNzC39KnHeSACk7336
 CQX0GWK2slaqnHbGILb1N878XJMWsU20XFD9mUIUOsu7QsrJI0reGoCOrQB7env8N6
 9QX59R4Q7fiJ3w/Ms3WKIyGmRjpoePslWtcw1fjk=
Received: by mail-qt1-f171.google.com with SMTP id g1so9801209qtr.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:47:51 -0800 (PST)
X-Gm-Message-State: APjAAAVQ01x9rY62jJ5fEbml6yqGYYbd8Mwb+s/WUsD5RQ6ghaFHiQej
 e2jaL/SONAuNOWsxoRTTzXXTbj7ZWdsJDda0LA==
X-Google-Smtp-Source: APXvYqyOP02EFeQzZVGOkKcmkWThEByr7yBqlkAW9V7YQ/fRph85ZPueN+tEQJW0P3g/2yrWKgBl4HogT1hbWsd2r8c=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr15250352qtq.143.1578937670237; 
 Mon, 13 Jan 2020 09:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20200107135929.3267-1-srinivas.kandagatla@linaro.org>
 <20200107135929.3267-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200107135929.3267-2-srinivas.kandagatla@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jan 2020 11:47:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+a5idL=R88u=iHfiK_M9wCUn7MLcOJC1v0QXzYV7A-Lw@mail.gmail.com>
Message-ID: <CAL_Jsq+a5idL=R88u=iHfiK_M9wCUn7MLcOJC1v0QXzYV7A-Lw@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v11 1/2] dt-bindings: ASoC: Add WSA881x
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

On Tue, Jan 7, 2020 at 7:59 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier. This Amplifier also has a simple thermal sensor for
> over temperature and speaker protection.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/sound/qcom,wsa881x.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

This schema now is applied to the soundwire-controller.yaml example and fails:

Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
speaker@0,1: '#sound-dai-cells' is a required property
Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
speaker@0,2: '#sound-dai-cells' is a required property

Please fix.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
