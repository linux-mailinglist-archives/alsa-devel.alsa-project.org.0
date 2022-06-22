Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B8554522
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 12:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF0D11F9C;
	Wed, 22 Jun 2022 12:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF0D11F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655892891;
	bh=TybKAsDdOzXRRPJR01dy7T95nNUwcNlrkUSe6TAwpXs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PfPcDaTi+mH/mu4dwgWMVlYUda9iPLgXXCm7DJGFlfN4t2NDT2hrwYZY+Dcrhc2zX
	 M3a2EXCvf4/Dm7auWnsq3C17cPWstJ/tsdcWpfpn6FlW6fImDQbWIbXPQzZXm6PXCB
	 5kYy7Xcd6V0q/y6sKBGcLsXs73hjgmkA82OSFbU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29519F802D2;
	Wed, 22 Jun 2022 12:13:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DFFCF802D2; Wed, 22 Jun 2022 12:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B79DBF80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 12:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B79DBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="byOVdAh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655892829; x=1687428829;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=45HUCslR63O2eDoFf6sU5iI/mplnXmcLJYZs0gw37HM=;
 b=byOVdAh3RsBblOjtJizQ23Fo5TNt7J306iT+PnZOESnb3Ieg+vSpwslm
 srmZalIIwIuy5CiOgCMwh3zBOpoJZHfhwfZ/NaG9mVn6VHPhW+sKi1soc
 QevfrjPGLZfR1XleZfCTQC3mZPkZv8w8LTWQjyv6/uKl+hvJF1NVv2pD8 k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 03:13:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:13:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 03:13:41 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 03:13:35 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] Update machine driver for audioreach solution
Date: Wed, 22 Jun 2022 15:43:17 +0530
Message-ID: <1655892799-29641-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

This patch set is to update sc7280 machine driver for audioreach support.

Srinivasa Rao Mandadapu (2):
  ASoC: google: dt-bindings: Update sc7280-audioreach-herobrine
    compatible name
  ASoC: qcom: Add driver support for audioreach solution

 .../bindings/sound/google,sc7280-herobrine.yaml    |  1 +
 sound/soc/qcom/sc7280.c                            | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.7.4

