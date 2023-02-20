Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE569C870
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 11:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8916ED8;
	Mon, 20 Feb 2023 11:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8916ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676888291;
	bh=+seYBP2yVSyeCrgNpHDnF+pLx1SNrGlHDXKYbzR8fdQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q32tNz1QBM5XqfDZV9sR+AIie1XxnRcKs9/Vg6MFEjg7n5MpaOpjmyp4dvGdZ7Z15
	 87V7dGd8t06CXhQCQDrriyABOb/zkyR9/ik6hSY+8WR6pgbk2h4XPW69+Ui6Z9NOHm
	 zFpG7sj8kBDVdWlvJjKQoa/VaPEMfFwAv1zqKDys=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29406F8025A;
	Mon, 20 Feb 2023 11:17:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E2AF80266; Mon, 20 Feb 2023 11:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B88D2F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 11:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88D2F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FKbRaf4/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K5bmhs025658;
	Mon, 20 Feb 2023 04:17:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=4t3QpaWWouFSiBxmF3fvCCsghAJG/UHx01EbLuY8ygI=;
 b=FKbRaf4/kLURFVrQnV4+RP67tz7EEPCVUm2824VVKmOhSq6kG/zIbPdyQskLYbyK5/jK
 TKyfIXCKwxryEDSKnIb5hyvqInLZ0DEOBVeiistBtnx+cnbAVXmhd5pHJ/BpgGm5VLg7
 NQuQgS8Uist+PcyN/YpIJBUr/aD0kCrSk++qALh1jkFUgarMvCUXyLtBZpiOoVHdhOk+
 nnes6mIAbUqvCW6sqRK+AGWJj8XTEWiilm75ZM8dbeZ3z0sP7KuA0IQHTyD4WmeCUq/w
 7pn1EzQWT4hi56vVRNOoLoktthz+ziLFpCtUXoz9m7I2nSux0cUiGkQElVJegVPwLuIq Pg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ntuyst25a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 04:17:05 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 20 Feb
 2023 04:17:03 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Mon, 20 Feb 2023 04:17:03 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D383011A8;
	Mon, 20 Feb 2023 10:17:03 +0000 (UTC)
Date: Mon, 20 Feb 2023 10:17:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wlf,wm8960: Convert to dtschema
Message-ID: <20230220101703.GL68926@ediswmail.ad.cirrus.com>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: vKwsPWc5Lsz0QnISxBTIqrwxYh6kG-RP
X-Proofpoint-ORIG-GUID: vKwsPWc5Lsz0QnISxBTIqrwxYh6kG-RP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: URWF5BX2WNQKNGBVIKDI7IXDMGTHOKEO
X-Message-ID-Hash: URWF5BX2WNQKNGBVIKDI7IXDMGTHOKEO
X-MailFrom: prvs=74155c8cea=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 - <patches@opensource.cirrus.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Randy Li <ayaka@soulik.info>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URWF5BX2WNQKNGBVIKDI7IXDMGTHOKEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 17, 2023 at 04:06:25PM +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM8960 audio codecs bindings to DT schema.
> 
> Changes against original binding:
> 1. Document clocks and clock-names - already present in DTS and used
>    by Linux driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
