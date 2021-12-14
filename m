Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1E4744C7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 15:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F0A1FB8;
	Tue, 14 Dec 2021 15:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F0A1FB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639491836;
	bh=CXUPb7AQ71j8BdVQroRhNxv6UTpCSncaFALslK08KXQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RLGuFHGvYJ3yhCnpqdFYHrCywXczG7i1uV3HGsc3djlR7+nkIp2TGsi48y6CDjGgV
	 7QduS2tOpjBl8/pQcHVWeeTItaq19NfGcPtlLGbfyzWC+uQ0lWRtgxuOfRU9v0gZYX
	 AugUxFLBYgmUuBksdnhqXfqzy7oeuXxLdopbDqZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5355EF8025E;
	Tue, 14 Dec 2021 15:22:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DA1F800FE; Tue, 14 Dec 2021 15:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B243CF8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 15:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B243CF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="YhzjZZ+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491754;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=av2Qq+J6PbfFPBH/diii4rDrGbpUSmagYYOyWFKE/74=;
 b=YhzjZZ+gWbTGnypGjUd6vNQku9LSEHDjS5PPDI8T9/md/Z+xKOSdwiO3meQXQkNOsb
 bgHJaHdM5MsJBdU9eNbV53m6bIlGfgsmCHi3gV9qX03sd8GzR43tXNS8qtdNl6Jy81ib
 k9btp3sZ4CkPnh0fV2sTD4VCjjkxsWWyxrn31OgQd3j6/iqWsL6yf04Zc6p8Rfadvvgv
 nxeEUsd/+lufYpbv55aLAR1V2hJa1hfEImoHZoQmoi+0/nvamY1KxBW3LuSFKCSzlStq
 a1tofc/PJdZRrpxFvxv3/q31GuJyCjpWK16rQjtwei4sRMg1iIm96msuCfucx3UfRTke
 IjYw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.35.3 AUTH)
 with ESMTPSA id x08baexBEEMX8rV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Dec 2021 15:22:33 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: qcom: Parse "pin-switches" and "widgets" from DT
Date: Tue, 14 Dec 2021 15:20:45 +0100
Message-Id: <20211214142049.20422-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

Some sound card setups might require extra pin switches to allow 
turning off certain audio components. simple-card supports this
already using the "pin-switches" and "widgets" device tree property. 
This series makes it possible to use the same properties for the Qcom 
sound cards.

To implement that, the function that parses the "pin-switches" property 
in simple-card-utils.c is first moved into the ASoC core. Then two 
simple function calls are added to the common Qcom sound card DT parser.
Finally there is a small patch for the msm8916-wcd-analog codec to make
it possible to model sound card setups used in some MSM8916 smartphones.
(See PATCH 2/4 for an explanation of some real example use cases.)

Using pin switches rather than patching codec drivers with switches was
originally suggested by Mark Brown on a patch for the tfa989x codec:
https://lore.kernel.org/alsa-devel/YXaMVHo9drCIuD3u@sirena.org.uk/

Stephan Gerhold (4):
  ASoC: core: Add snd_soc_of_parse_pin_switches() from simple-card-utils
  ASoC: dt-bindings: qcom: sm8250: Document "pin-switches" and "widgets"
  ASoC: qcom: common: Parse "pin-switches" and "widgets" from DT
  ASoC: msm8916-wcd-analog: Use separate outputs for HPH_L/HPH_R

 .../bindings/sound/qcom,sm8250.yaml           | 16 ++++++
 include/sound/soc.h                           |  1 +
 sound/soc/codecs/msm8916-wcd-analog.c         |  7 +--
 sound/soc/generic/simple-card-utils.c         | 45 +----------------
 sound/soc/qcom/common.c                       | 10 ++++
 sound/soc/soc-core.c                          | 50 +++++++++++++++++++
 6 files changed, 82 insertions(+), 47 deletions(-)

-- 
2.34.1

