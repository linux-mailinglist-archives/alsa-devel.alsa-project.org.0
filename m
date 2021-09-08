Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD16403D0A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 17:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB40C16C0;
	Wed,  8 Sep 2021 17:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB40C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631116587;
	bh=A6qyEsybXOllDI7uqXXKRbUqfdgYGHimBGKjnrTPaUY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GFcWO95/LHVnx/mDJCPE8Eydk9qBBCZx9/fGuQBmedqTNzApnIQMGno38hxcoEXlt
	 Q2no2nu5v41h+vpL3YobvvQ/wYJEDXh1d/4/N8qnZTqMWAmv6+tK5tFH2hTqWuAHQJ
	 0zwaHqKVP8qffwyYQ6kkVXr9DI/a6CPYtEYsJP0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36102F804B3;
	Wed,  8 Sep 2021 17:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2034F804A9; Wed,  8 Sep 2021 17:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6319EF800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 17:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6319EF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Rocm8JSE"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188FpQ8Y005816;
 Wed, 8 Sep 2021 17:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=7TLj7ZXyvA+kH3uJOs8jc9e81SnMhHsdELVRMPZwfY8=;
 b=Rocm8JSEPqLdyePXHzcUHU3azuoYxcXr/3KbWBFav05S/Kt44qmctxLmYkDVt+kzkmCH
 cHmYtzquNmB/T8CLVoL4ucou0DpNVo1Qu5K83Mpq3pv50q8lDxPdg0w5UnxIWNCDT3Cs
 /iKMpsaCBCg+Ldu9ZoVWGy8BGTzagDARczD3GKsBSNoN7TSbWfL14rQ2EtzKzUCWGR0s
 bisJ7JLPmDOIme1e3Kx0b4DpGP/33DFEmwdd4HwPPi9AREBEjJMOHoNS6iaJlrpYu0hz
 LBojazNBUZ+0l887Lp0ptpFAIiCmZjFLBsyxs2nE0dFhrP+83lf9iQpNIdvg+itXhpah kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3axtha2b7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 17:55:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DF7210002A;
 Wed,  8 Sep 2021 17:54:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D411F229A66;
 Wed,  8 Sep 2021 17:54:58 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep 2021 17:54:58
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/7] add internal channels support
Date: Wed, 8 Sep 2021 17:54:45 +0200
Message-ID: <20210908155452.25458-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

This patchset adds support of ADC2 internal channels VDDCORE, VREFINT and VBAT
on STM32MP15x SoCs. The generic IIO channel bindings is also introduced here
to provide this feature. The legacy channel binding is kept for backward compatibility.

Olivier Moysan (7):
  dt-bindings: iio: adc: add generic channel binding
  dt-bindings: iio: adc: add nvmem support for vrefint internal channel
  iio: adc stm32-adc: split channel init into several routines
  iio: adc: stm32-adc: add support of generic channels binding
  iio: adc: stm32-adc: add support of internal channels
  iio: adc: stm32-adc: add vrefint calibration support
  iio: adc: stm32-adc: use generic binding for sample-time

 .../bindings/iio/adc/st,stm32-adc.yaml        | 108 ++++-
 drivers/iio/adc/stm32-adc-core.h              |   8 +
 drivers/iio/adc/stm32-adc.c                   | 418 ++++++++++++++++--
 3 files changed, 482 insertions(+), 52 deletions(-)

-- 
2.17.1

