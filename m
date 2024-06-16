Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479A909E81
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 18:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CF59F6;
	Sun, 16 Jun 2024 18:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CF59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718555092;
	bh=+3eKN6rwa93XJe6m7zUD58lUDjbYzISB9+7MIO6PQkI=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Folb0Ch1nVnh3UOu5N/Jq2hcDriSmdjYmv+nglmkIA9DOOpLe6MHjeHiQJTHpPCiE
	 U9SaJOe1ajLit+HBFV30cyHxDSH7y9lwd/jJoqVm3Y3wEM2VmxU87ppaqTaZZtgrCt
	 f5JZjnNvw4QSHodaqQV75AnbCHZYLffzKXjzFqso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44783F805B1; Sun, 16 Jun 2024 18:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3B7F805A0;
	Sun, 16 Jun 2024 18:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C901F8023A; Sun, 16 Jun 2024 18:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C627EF800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 18:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C627EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=bD9LHZb/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718555045; x=1719159845; i=markus.elfring@web.de;
	bh=+3eKN6rwa93XJe6m7zUD58lUDjbYzISB9+7MIO6PQkI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bD9LHZb/jXzlnbFe1kyTrUHjMGINmgFPq8/NJ7FopDSJLkuBfrx2eah7cLPZgxOI
	 rsx/XUHI1ZoKlfvpCEXdRPpyf+5ZYf2/TUx6BG3dKelWKsynURwSCAvJRnfsWRd4Q
	 1PVHg1lofDfZT3NIi/1l8mo6q8WOZ40L/k/udXNvBUNllWzahY7jc0PZkabhp/dem
	 GDgTkDshbDsB09Fznv40hJf8sMp02ySXHQp2yLqtfK9maruQZqeHHoT/VmBmmg3Em
	 MDQsSVkKcHa9kfaG4UrYjQlKwE8cdEzNQZVa+j3Gwdltv6arZhkBG0yUP0/4PbtSP
	 WTUW22ieG1YWrimHZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXXND-1rsrEY39pP-00N8Ks; Sun, 16
 Jun 2024 18:24:05 +0200
Message-ID: <24260b3c-fb0a-40b7-a88a-e2ff4897d085@web.de>
Date: Sun, 16 Jun 2024 18:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-3-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6TBVlJ9i5HBMK36G4jUvHsDGVuWICB2AUlHnyRXxxfNWJWLr4vb
 0Rf8fC5cbcaGtmSyKbQ8btm3s+jHAl9V+NBO5UsaUV0BM3+v2/eidWtox0eHbZb46ndck3r
 LQ/d8O62ag1fLKydU6BtgcIZkDuot9lQl6aVF/qEoU1yJ6DIKNDDswigJAXsrAL2BSjzNun
 6bd5U3CgpX43v72WCAjxQ==
UI-OutboundReport: notjunk:1;M01:P0:0JQCIjcD+oc=;AKWulCgs6tJ2+LteSqQxGxIOR/o
 OThAHDcZlr+HJJLfkYrtjPnAwACVAUeoJrzNP79FzN2yawhvBDhDPn3xKqGNjh0pGzpLk50m2
 f8XVZTJrLvPoRTUGv++ulKbBqI/wY8eqLzQMBQGDNdTQXat3Axx+k9BNzdESCneNq9MH/Vck0
 1BB5uvuUPvoIr3eIRDCN2GN1ZC/NKCCGmoThxDYoLJyeCcFlj6H+VYIKQgoHGzngt0RYAo2EY
 1zrvZZ+Vy063YulZKMEZ22ir7xTAcE1clkBnHAZ1GP59a1NHenC6e99ozX+0dTee4qwcjVf1q
 uW9z6uWh4kPbrHjuCyIP9sYUAM9xAJbzETRISuM533R+jJWAQRE7aJz7OpBwdwBJHpznNywc5
 /XiJkuZhfZbWspCxR4k7or7VTFwb7mwpgZpoNsxNbwCkFZ8dT8ND5FTybo2EOW3nZpwVIfQFu
 /MAKwZqZBryk5OcoD8g3brQwTytGO9dLPM1ao1e88YpF0KFM2xe7iW+dm0IKM9cPBQj3JdqH5
 zL0uOcdLQy6C0J/stdgfqwZJ7YkJfBc3cirt0uttnttjfhoABQmdBC/iW/VaDDJWmamXvOLM1
 CEAeuuZyfCiw4iJx10wnNnhqi/KoGBWT2MNVS36K2bEaFVuV4cTsPEfkQ69BoT2WqB0+Uhtg3
 neCSyPf8PxUBrzceyLQIV5IWA62XrUcuRsQYOZzT3HzfvV+Ww9g0nsu4vRFgCX3F4j2ta1NPj
 DadMTGqC8mDy9Utpseb1W7uWS3uXwP55fcw8+XYgc1NdB1f3sybS/G1Lx208oCVzIZjPCyUuw
 XgvGFRuS3zKuHk+uUc+U/wByTW+LE0JE3uCbKMpCcfdws=
Message-ID-Hash: OAKNVMLB633YNPIEKW3IOYWKVOYLSQQO
X-Message-ID-Hash: OAKNVMLB633YNPIEKW3IOYWKVOYLSQQO
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAKNVMLB633YNPIEKW3IOYWKVOYLSQQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> This patch adds support to SoundWire devices on WCD9370/WCD9375 Codec.
=E2=80=A6

Please improve such a change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94

Regards,
Markus
