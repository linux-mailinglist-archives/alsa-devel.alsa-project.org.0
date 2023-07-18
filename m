Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252EF757ABF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E263BE7E;
	Tue, 18 Jul 2023 13:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E263BE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680609;
	bh=+WIU3b8CacsZhcQmAycbvXnFQd91r1QFPDw20Fdi0hA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jbNKx9Lx0AjlCbuQgTVuEJW6ERfOVpb98BT6P504QYEyN94d30iZyQzFIrJQ7eBxA
	 ZqLRSsX91haAgCt4dq25Xi0lOyyFgJeRQgrAP+NkXqCu5zsAEY/4wMuFNFl4kzGTPf
	 UgQfsLl7LPL8lVuMz3QMUIFgwvGWK8qI2Al/7YU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9497AF805B6; Tue, 18 Jul 2023 13:41:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0221FF805B0;
	Tue, 18 Jul 2023 13:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CB06F80563; Tue, 18 Jul 2023 13:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D426FF804DA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D426FF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=iUGNDL5j;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=ayBkrkME
ARC-Seal: i=1; a=rsa-sha256; t=1689680437; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XrUxc4tN3AEMjQ8WNc7/u/QDkgIlwO7XY/SN9uzZz0GcZi4Ql/hjzW4U1pbzq1j6UC
    ISggJq1ohkzxEbbB9nR4KC8drFsA+9AZP31gka0cEqUg8Ad+i5UCSlXBFoPGFfScgkJj
    6zOItKTyyjoO0EAVPDP4TaPV9h2/lwcc3kId4RvVBNBhm15nOILdeQ1vprvWCz51YdTv
    FP60ewdVvkYYKpAkF5f7e0xMFlIKF8dOaiYRrcf+LpX7ftw12o+valewEXVUwhwwpwsF
    VZN/yHbdh1cCO+pVoi+uE76ObAudf+iEGxsBF7ljkXK8adQVzMy2p7WLB9RKDdGN2Gkw
    0q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680437;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=sK/bMIayWR/eIaIWMCJ3yB3H0xpavoQPeZ0tqsYM7t4=;
    b=kiSsWTcl+xSOZA3gHS6/9lLk1PCHycnJjSR6Mf1Zx9aGqI7vTKSY9dgFo0RXiis0aB
    aABIwMn46OQlw+6rUlQsNAY2szCryBkrIv1hGsvIB/oaM3PgZSnB5salYFj6PT+c6A4k
    GrNdWd3RDnVdsWmHrKWu1SGCSN+qDP/XKWiVCeJovy2XUbBspjmKdsOlxi65y9hZcF1F
    RBJLlw2ESkN5EJFUhOKaA7J096pEBXBJuFsoVkXd5d4/zRAfbsaaiPkGVS/yMhiOAiiM
    xevOH+J/smxHKk7edk3cyWRbLKmzTLomXOmwaNoke9zwiJd8FRiVWhhARRcAyZEbEsll
    kzBw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680437;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=sK/bMIayWR/eIaIWMCJ3yB3H0xpavoQPeZ0tqsYM7t4=;
    b=iUGNDL5jC3ufjlCgm5k5SHWfzXysbyyr5344sKE0RbCvB5QLMhAAKn8iXBPVxc+u+j
    R/fc+Afn7liuJlq9Raq/03KuJN4Q0jjwwZqECVFzsOvMY28oa+xqvL1lkUBqaY+NZ4Qo
    79Glng8RqCrixPZV9JNkSr6ZFJE21Mi5YwWGno2bocWmmHxcbyCn/JczmhrO29KiAXNK
    dF4sKptnY5fbt5xmnnx7hU2PcW9qZnSwMPeGWFhIZAsOTgAMuIuCLNAYHbOI7suF3W3j
    ANEQKm63VKr1ZodQvuS52drqmSg4OhYFvQoQ47996h5IHFrToJzhA3sKi9/sRPSgPcRF
    2oRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689680437;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=sK/bMIayWR/eIaIWMCJ3yB3H0xpavoQPeZ0tqsYM7t4=;
    b=ayBkrkMEbt7KJWw2wvCkQci6INdWNF50gF/nefwYHc5cUFTI1EMPGiSEqBRnr910Kg
    nMO61MF8uzgMv7oWxHCg==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u45/mw=="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z6IBeabpI
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Jul 2023 13:40:36 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/6] ASoC: codecs: msm8916-wcd-analog: Cleanup DT bindings
Date: Tue, 18 Jul 2023 13:40:12 +0200
Message-Id: <20230718-pm8916-mclk-v1-0-4b4a58b4240a@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABx6tmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDc0Mj3YJcC0tDM93c5Jxs3ZSkZENzQzPLZFNLCyWgjoKi1LTMCrBp0bG
 1tQAFvBI4XQAAAA==
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.3
Message-ID-Hash: X54GKMS64LL2NEJFZDWSIAUPDF74RHCW
X-Message-ID-Hash: X54GKMS64LL2NEJFZDWSIAUPDF74RHCW
X-MailFrom: stephan@gerhold.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X54GKMS64LL2NEJFZDWSIAUPDF74RHCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the redundant reg-names and mclk from the PM8916 analog codec. 
Having the mclk on the analog codec is incorrect because only the 
digital codec consumes it directly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Stephan Gerhold (6):
      ASoC: dt-bindings: pm8916-analog-codec: Fix misleading example
      ASoC: dt-bindings: pm8916-analog-codec: Drop pointless reg-names
      ASoC: dt-bindings: pm8916-analog-codec: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Drop invalid mclk
      ASoC: codecs: msm8916-wcd-analog: Properly handle probe errors
      arm64: dts: qcom: pm8916: Drop codec reg-names and mclk

 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 101 ++++++++++-----------
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   2 -
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   3 -
 sound/soc/codecs/msm8916-wcd-analog.c              |  56 +++---------
 4 files changed, 62 insertions(+), 100 deletions(-)
---
base-commit: 78b31c16983bb9e540d5a14540417275e6f3f4a5
change-id: 20230712-pm8916-mclk-dbc17169c598

Best regards,
-- 
Stephan Gerhold <stephan@gerhold.net>

