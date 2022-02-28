Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC024C7298
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 18:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F741811;
	Mon, 28 Feb 2022 18:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F741811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646069211;
	bh=KZGhzmV6F+eFGRADCE7ce4iXESi/VhZ4JczpDEPx8AE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RyEVinWQfusY4hNhUloOjefcRvUZvIg57gK+pXIO+KCvNAvFu9O4ExxjKKlIpU6Hr
	 36grveDoc/QuFewU90AtGQqkNcarlk0BVoiwqyuN4Id7QL31+Wf0tRB1Ypal4D+pBe
	 J2r6SRzIAZaGaVTDtDFStj/3n7v1lZbV5i07Ar/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5683F8025C;
	Mon, 28 Feb 2022 18:25:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA4D4F80154; Mon, 28 Feb 2022 18:25:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D881FF80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 18:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D881FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Zgqher2o"
Received: by mail-wm1-x336.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so6152842wmg.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=notYzvLapgrWxhvzTWLvUQkyjm1+ISszqSAt8pZdOYI=;
 b=Zgqher2oa92fGjqwuNd7AvQQL/prMgpwurC/1I0Q2XMCq12BsIydAK7Xbt2y6WEZ3d
 O83ghC4YWK0y7SASC9sfrraEmmCPIDC2yLy8LRMQ322ADA+msYp3dut1AKFazt1n85qG
 XAcHAU8f3A2PHmucP8HfrHUQW3D26YfuYfqnTBpTXna39MTgxw8uW0RpMvyPk3xXbryw
 OExK2vEy5eszJh4APgr2NWDP16vNXCINoVIVFMusBl66Q0sGeLGqCFl8uIwQ71XQCC/3
 /DD5nsu5Rn4vrpuvTBGcOQmGgf9w0hHWRJaKPGWbh8cOuLN4O78lW+e/LjUsMid3Fkdm
 JceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=notYzvLapgrWxhvzTWLvUQkyjm1+ISszqSAt8pZdOYI=;
 b=HpL1SDNXoHLoaPu/aJyd8DVZfq7mth+ngEjQjw3HvA8JwVDfTHxn/ayKbuzck5cf3R
 wH2fez23lergkRSL9S9vPMR1MTm5m2RX//6brKdIVSh1PjrW1Y9WTcfjnCy27eMX5suH
 wg5qSAsANfoDeVQAKvmtXzwclJZNCNrKr2TU6QsGMHXBEBMSAFf3baKvAHjJCNFmtuz/
 3+88GuUuJ0lVZhGgA7hX2Kr/uRVhlXdPB+0kTKCmJ4El8lBNWMiZT1I8xq8rN0P1zhze
 cxp7ejeS6SZziKqmjqMKyduUjwiYcuNuwuzIUzbYR9ONZv8nkGcaP0dUS7pOYiZB0Hfd
 NX4g==
X-Gm-Message-State: AOAM530L6tNIV6i5cucu+09BN0Ntmp6fuVvr+PgNsMJu5lhYq5VSAg6L
 tPXC3EVahfxXIrLi/yMZsPKwFw==
X-Google-Smtp-Source: ABdhPJwJ+NcsdjBxdhB1UyDeneF5rEqwUWcp9CAfrUzldwkhCgyJIZBroO5q5TvmPYAd8SU7IOWwyw==
X-Received: by 2002:a7b:cc15:0:b0:381:3fb8:5f93 with SMTP id
 f21-20020a7bcc15000000b003813fb85f93mr12592663wmh.106.1646069139944; 
 Mon, 28 Feb 2022 09:25:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b0034efd01ee16sm11514124wmj.42.2022.02.28.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:25:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v3 0/3] soundwire: qcom: add pm runtime support
Date: Mon, 28 Feb 2022 17:25:25 +0000
Message-Id: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

This patchset adds pm runtime support to Qualcomm SounWire Controller using
SoundWire Clock Stop and Wake up using Headset events on supported instances and
instances like WSA which do not support clock stop a soft reset of controller
along with full rest of slaves is done to resume from a low power state.

Tested it on SM8250 MTP and Dragon Board DB845c

Changes since v2:
 - update log as suggested by Pierre
 - removing handling clk stop for cases where the controller is soft reset.
 - add more error checks when calling  sdw_bus_prep_clk_stop
 - update dt-bindings with wakeup-source and interrupt-names properties.

--srini

Srinivas Kandagatla (3):
  soundwire: qcom: add runtime pm support
  dt-bindings: soundwire: qcom: document optional wake irq
  soundwire: qcom: add in-band wake up interrupt support

 .../bindings/soundwire/qcom,sdw.txt           |  14 +-
 drivers/soundwire/qcom.c                      | 206 +++++++++++++++++-
 2 files changed, 218 insertions(+), 2 deletions(-)

-- 
2.21.0

