Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9085188A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 16:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D768A4D;
	Mon, 12 Feb 2024 16:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D768A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707753402;
	bh=UEoUzI0eopOfpfMWL9+ubXLmnf6UPKl4bf+SH/FfhF8=;
	h=Subject:From:In-Reply-To:Date:CC:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u+jx31DCeTODJThaX3x5jqDmWqUUJ9uC+ycULasusc66X/wdqc25uwkzyNG6lqkfO
	 xJSKG9dqxwHFrAv+X1bINI/n3300LvPjKplosRtN4H8OBSzK60rOm4xb8MiOV8Y2f4
	 tpHGq6L239g63zQryrxZJoLk5w1iVD2jrpOBwiLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9727F80567; Mon, 12 Feb 2024 16:56:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 490B8F8057F;
	Mon, 12 Feb 2024 16:56:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1268EF80238; Mon, 12 Feb 2024 16:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA222F8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 16:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA222F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kHJS4noC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41C7wuOt021531;
	Mon, 12 Feb 2024 09:55:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=
	PODMain02222019; bh=UEoUzI0eopOfpfMWL9+ubXLmnf6UPKl4bf+SH/FfhF8=; b=
	kHJS4noCFaqhHA00df2Nyt5FmY+gB7OQUEEpeP6D0ExctWUJA3mYo5WEuWviyrsZ
	zHrY3ylV93fWTxp591elNivJTtdqJyFz84ghlZhNvVbLM/Li4w8cSVjED4gkx51C
	s4zl9UzYuYZNN7Cg86cNIsX6NftCxBvhN8UlXkMfAlPN4EYP+owuwTQYVAA60zpa
	gxzz2LJgSv2+w2XisaJbdqntbrL1ARM57umBDUA/n2AN0PAqEf/xCTXMjvqdanPN
	JbN6nYOJQL1XQf5Rhm61D1HnvGjI82/rS/IijKmAjCLoHhqhKYdTqliVB8S9UqRP
	vA+9bmzebhDR/jr8EXGHwQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e220gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 09:55:47 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 15:55:45 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 12 Feb 2024 15:55:45 +0000
Received: from smtpclient.apple (unknown [141.131.76.118])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 7CA6A820242;
	Mon, 12 Feb 2024 15:55:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH 1/7] dt-bindings: ASoC: cs35l45: Add interrupts
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <ac5cbfbf-45ea-4d34-ac3d-d3a0fc6ff061@linaro.org>
Date: Mon, 12 Feb 2024 09:55:29 -0600
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Sai Prakash Ranjan" <quic_saipraka@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kees Cook <keescook@chromium.org>, Tony Luck
	<tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-ID: <C8A97AB6-A3BB-4018-A8E3-CEEECFCBECE2@opensource.cirrus.com>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-1-fda0db38e29b@linaro.org>
 <ac5cbfbf-45ea-4d34-ac3d-d3a0fc6ff061@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-Proofpoint-ORIG-GUID: HVAAhL2KDvY-331du_lPmDeJ2OJzJ91Y
X-Proofpoint-GUID: HVAAhL2KDvY-331du_lPmDeJ2OJzJ91Y
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JP367KCYMN2L25P2IGRAF5TMDGHBKUCW
X-Message-ID-Hash: JP367KCYMN2L25P2IGRAF5TMDGHBKUCW
X-MailFrom: prvs=9772b08a70=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JP367KCYMN2L25P2IGRAF5TMDGHBKUCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Konrad,

> On Feb 12, 2024, at 7:25=E2=80=AFAM, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 12/02/2024 14:10, Konrad Dybcio wrote:
>> This chip seems to have an IRQ line, let us describe it.
>>=20
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>=20
> Subject: ASoC: dt-bindings: cs35l45=E2=80=A6=E2=80=A6
ditto
>=20
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com =
<mailto:rriveram@opensource.cirrus.com>>
>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Ricardo

