Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB0C93E0E8
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 22:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823BC15FB;
	Sat, 27 Jul 2024 22:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823BC15FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722111886;
	bh=Ao75NPTLWqtX2T2FoWRa/rYvNt7Mt7u2U8fa7OkFN5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWa88S+nOP5V6/eCa53psL3VQRtzkR9ltJFiJ4vZr7HSW0Z42B15XGzFMD8HGclO3
	 gPoR3N6fwUOHN5QHPE+ZjaiTdJFWvgr0LY9ircZYlmQVNcRjc+XS72A74ambgZftzE
	 C5QRBs5/WTjD6u6BF5JDB0uM/Zba5NKBl4iGJ5jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3BEF805B0; Sat, 27 Jul 2024 22:24:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F862F801F5;
	Sat, 27 Jul 2024 22:24:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D071F8026D; Sat, 27 Jul 2024 22:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A5F8F800AE
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 22:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A5F8F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=SsCGeMqn;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=XZU3UdwO
ARC-Seal: i=1; a=rsa-sha256; t=1722111832; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Mqk+klkc+fxyVY32lJdxOxdZ1uiwbUY4Ew8/Ux98tLOqYdZTkQJk6EneWYnuhkV3Nk
    JWMJPbLHExMmHyFtp7zrtb00KUE5HAImn8sFaLerX29jhTkCmmo2UYjOcph7xdO2BXPw
    HpNJZUi2gbf59WlZBvBJ+Oo/a7bv8Zab0jd2VA4vW8qNDmc9ZXcCdBNgA2m8xmwaqV3t
    GjvRSA1uZYm2+/ycy+xWsEIKdHE7Tboi9Y+vVXE4C9UjgmcIvNv6z9i/6MdMWjQXh26o
    nJEyhEci61YpIjQFmatGOX+vXVVyRDuBMrsU90GhIiLax8WCIBNA87h5j5oint8HTsCG
    CAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=TqRTwhiLEa9QLU4MySj8hX/iq9R4IW/as2WOOfgm0ryMY9bam6AU7TJcBkWu9bjdzZ
    qGOYX5X4/RO5qA0Pi5EGPuKAK7FXxqOFUjOSYYMD+tEuA/epH7knXXNZAJTs6kWRS54a
    n/BzPbiuYL8mTmpuaL8I4kVSHVt/SyegdO0cI9MoxHNmGLZhCglLQn6MuIPE6hnMq39E
    sSC02EBG7Gy3oyjM68N6LOhv+58zJ//DHRYatIxH6IzRpt80oNM0pxySUggffHPfpeZ+
    4mykMtfz+Zk5iaorZ0f0pM1tFdzOJQpzo3UQ/wFbaA6JECOKnwdYw/1xJw/5kA4q7wUn
    V/Cg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=SsCGeMqnG/7ffQLBevxW43NjStrCDL3W7KddzGamWN4rTucrNKDWbbwN+gPs1/vfrK
    VECIdK8/EjiaJxn3Er2rvuw/nmwCpiXE5wsFj/lEgWtLWQS8gDoWC9bJ3nWjgokyapzF
    ddEIJtAtsx9f0Yfs40mgnseQ3a6j4xUmFHvkGe2v2w7+obgJeuSg6KoPqIhD4uumQ03m
    J4GvIpKudkI8AvP3ATEHOH8jGD2B4foEA1NFH7cBJXhx1aUxfO5cE15m7iya1SccscqM
    5eZYj1NQiM63JZaUAP3B+ajyyUrJnYz9sZZkpQ7okN7jqQcaHchjEqLF6pISskQ6QWGg
    s5qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1722111832;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YpxShBJRloUhGmeW7MprfQelhLb4bKBceOGSaOcp9pg=;
    b=XZU3UdwOclmz/PUJr6H71gSl7D/TxsWxqweKTXM1pSMY0o8uSMBZJB7VQOWkeNDQbu
    5h/Xfg2+Xh0iuwTESbBA==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr1eFeJ69I="
Received: from gerhold.net
    by smtp.strato.de (RZmta 51.1.0 DYNA|AUTH)
    with ESMTPSA id R5d98406RKNqV6u
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 27 Jul 2024 22:23:52 +0200 (CEST)
Date: Sat, 27 Jul 2024 22:23:44 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Skladowski <a39.skl@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <ZqVXUI37fNB5D0DM@gerhold.net>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2B667HDXOUJ3OMG4KCKFY3M226TEO54A
X-Message-ID-Hash: 2B667HDXOUJ3OMG4KCKFY3M226TEO54A
X-MailFrom: stephan@gerhold.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2B667HDXOUJ3OMG4KCKFY3M226TEO54A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 23, 2024 at 10:33:00AM +0200, Krzysztof Kozlowski wrote:
>The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
>others: they have additional IO muxing address space and pin control.
>Move them to separate schema, so the original qcom,sm8250.yaml will be
>easier to manage.  New schema is going to grow for other platforms
>having more of IO muxing address spaces.
>
>Cc: Adam Skladowski <a39.skl@gmail.com>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---
> .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
> .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
> 2 files changed, 205 insertions(+), 137 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
>
>diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
>new file mode 100644
>index 000000000000..6ad451549036
> [...]
>diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>index c9076dcd44c1..1d3acdc0c733 100644
>--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>@@ -27,9 +27,7 @@ properties:
>               - qcom,sm8650-sndcard
>           - const: qcom,sm8450-sndcard
>       - enum:
>-          - qcom,apq8016-sbc-sndcard
>           - qcom,apq8096-sndcard
>-          - qcom,msm8916-qdsp6-sndcard
>           - qcom,qcm6490-idp-sndcard
>           - qcom,qcs6490-rb3gen2-sndcard
>           - qcom,qrb5165-rb5-sndcard
>@@ -58,18 +56,6 @@ properties:
>     $ref: /schemas/types.yaml#/definitions/string
>     description: User visible long sound card name
>
>-  pin-switches:
>-    description: List of widget names for which pin switches should be created.
>-    $ref: /schemas/types.yaml#/definitions/string-array
>-
>-  widgets:
>-    description: User specified audio sound widgets.
>-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>-

These two properties are also valid and supported on all newer
platforms, please keep them here! There are certain use cases where
these are needed independent of the platform, e.g. to control an analog
switch or mux connected to speaker or headphone outputs.

I agree that it is cleaner to move the IO muxing to a new schema though.
Perhaps we could define something like a shared qcom,sndcard-common.yaml
schema to avoid duplication for these generic properties? In the Linux
driver, these are handled for all platforms in sound/soc/qcom/common.c.

Thanks,
Stephan
