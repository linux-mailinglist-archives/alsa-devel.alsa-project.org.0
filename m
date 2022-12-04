Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E1644508
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8273A18B6;
	Tue,  6 Dec 2022 14:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8273A18B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670334936;
	bh=0WvJuUJhKthP4/Q7iudnPWqRYP2OW5Qqu9E7ZTJTi0k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cj6Q4o9J1EjESvoT2fG2R68mxyv9XatXcB+4F2Z0ciHv6TBBtmnRlwLjAWqcrA7Bc
	 oZhcl7A+UYyhC1pr8BS74tEZp8ltldLG2H7c9Paj4/I9TKoYMMKERaooT/NKe7GjyZ
	 Aq9QMLcjHM3My1coXY75PQAJJ9Kn6uqqZxeyc2jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB3B8F8056F;
	Tue,  6 Dec 2022 14:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 732FDF8025A; Sun,  4 Dec 2022 17:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CEEAF80154
 for <alsa-devel@alsa-project.org>; Sun,  4 Dec 2022 17:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEEAF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nmnnLHjQ"
Received: by mail-wr1-x434.google.com with SMTP id f18so15243069wrj.5
 for <alsa-devel@alsa-project.org>; Sun, 04 Dec 2022 08:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSY/soRdbw3l7VfX1MPIQXbuFJkETcDbjbzdvzg9U1E=;
 b=nmnnLHjQQPJyJNBEfVfdOPXpOYw99+Ew34YDKQSA7EUqQ1wRE7HB99k+5HnDEsFXs6
 s/Wti8lfe/gDF0GC8HfFWK6SarmOEHUEk9+mOcTopjhIelQOQdkwrwTaJ2Nuha5VsgW2
 2H6F26qSiuyp8Kq/ZSHMfpgdbHvQFcFP1JzgfnxoezYYiNxdqBEBTLKe4Lp5bAtojZvR
 8CRQD22BJyoRVHfXHYamci85e1A3cN4zPEaRD05DJf6yKSFDZhxfON8l9cCNMXaL7xNB
 p3PM7GEe2pPEVM3wrIgGfBatgwqg3XW8DZRAw5uxGi7GSWYN8djxxtisjrQ0JrQ2Emxp
 xjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSY/soRdbw3l7VfX1MPIQXbuFJkETcDbjbzdvzg9U1E=;
 b=zahhZeu9ZCKFF81sJrvXceUGYGTKFr6jiZx6xQEuCeVYsmBhnZKQZ/Kv8o0gMk8JjJ
 9ubd9crFsTyl1fRr5okdFmzXRxXxetmbgLTZPUiBKPFCqD491+OO+1mkxbDhy7Fw2uoa
 HPic817gjEpWH8dXdV/+TrNZmyvp9R4xh6CHOjbh5DdaKybCxUOJtb/ED8ezLQPCIqLE
 Ib0UDtycJv7S1wVMHieRmFASYUL9Oxk6OqyjVw2ikLvek0zUNe8NXEb6VHRu3SreO4Ip
 /+UY4oebMeFqUe2UZAoSirjuRAIlJqoGqL3hLSxYTp7l9StD1Hz7K9QjqaX1h5KAxCzE
 uCpg==
X-Gm-Message-State: ANoB5pmzcVJvLO/zwuySZpzSIKPXzKqRkxgE1qggP0QyMk/nqRE+ms2a
 ozaBU4kQ+12ICmvLAgg05To=
X-Google-Smtp-Source: AA0mqf5OXVS1lM5QoKtCTGOYBnrpmscrGHlaSSO7Jq8/Dc8cy0PB5VfXUZBhR9OrsdWfWopJ4DW8pw==
X-Received: by 2002:a5d:6dd1:0:b0:236:75a8:58d with SMTP id
 d17-20020a5d6dd1000000b0023675a8058dmr49641323wrz.295.1670170184810; 
 Sun, 04 Dec 2022 08:09:44 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b002421db5f279sm11847154wrx.78.2022.12.04.08.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 08:09:44 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, 
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Fabio Estevam <festevam@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.om>,
 Lars-Peter Clausen <lars@metafoo.de>, 
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>, 
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Matt Flax <flatmax@flatmax.com>, 
 Ricard Wanderlof <ricardw@axis.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
Date: Sun, 04 Dec 2022 17:09:41 +0100
Message-ID: <2251607.XGVbBG2WQu@archbook>
In-Reply-To: <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:23 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
> Reference in all sound components which have '#sound-dai-cells' the
> dai-common.yaml schema, which allows to use 'sound-name-prefix'
> property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is an output of discussion here:
> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
> 
> This patch supersedes previous WSA883x one.
> ---

Hello,

for rockchip,i2s-tdm, we get some (new?) warnings with W=1:

    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    DTC_CHK arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
    /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
            From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

Apparently we don't have separate resets for tx/rx on i2s2 on this
hardware. Should we add 'm' to the allowed reset-names for this
case?

Cheers,
Nicolas Frattaroli



