Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555F44665F8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08819271A;
	Thu,  2 Dec 2021 15:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08819271A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457110;
	bh=SQe2hKW2ZQz78/Pai5aX2YSW0E6n5G47x4TKcILhwLM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sn7eAcfDaPwwFwt26mIoXKw67Uz2p8FMOCLRZDSV4q6aUM+wz7F3RVBD8RZ1R3qa1
	 dxssW/YIfE9J4zNvN6LvcK9yUxTYT2NSeu4NbStkVckFDOpf9mM0IiitmTnN01w1qq
	 XCVuDGCFVa9DtvzAXEwM5mFOzYqFeznpAFN7EUBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A280EF804E2;
	Thu,  2 Dec 2021 15:57:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEFB4F800CE; Thu,  2 Dec 2021 15:57:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 057FFF800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 057FFF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="AiL/0KmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457025;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=+On65RK/P0y1X+9L5FVYKDm1EJ1ZjlP8KZD5YNFlWzM=;
 b=AiL/0KmL7ZK4SQLe3rdZ9bYTPplrQgRl3H6Cod7RHEqmL4Bo9X8IdwbisltTUT6Tvs
 lUOfCXkYZ9F9S0IZ1E6zWtMcAnOD/Po1DJ8H+HurkHzht7iVoTy3loZxn1jeZ/JAjyUk
 zUrgY+/CFlUl7jrU82kMKRLtitze7pX9RS4PRv/TWVqwKRr1LPzoF4iZa5LMfpGjykRT
 35mk1QYwuDIYp7+90KGo4xAnfY3zhkROPVb3y7TmG8ZFyogOfStTQ9zMa0PW0Y0N+ax7
 x7UJwPd1WJYUZ/wZukwfC2NwdkNnXcz7ecj9mVGS4mf5DoBQnhe3TMezp8NhR9hqgXKV
 MZdQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB2Ev5pxu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 15:57:05 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
Date: Thu,  2 Dec 2021 15:55:00 +0100
Message-Id: <20211202145505.58852-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

This series makes it possible to route audio through the combined
audio/modem DSP on MSM8916/APQ8016 devices instead of bypassing it using
the LPASS drivers. This is necessary to support certain functionality such
as voice call audio. See PATCH 4/5 for details.

Also, qcom,apq8016-sbc.txt is converted to DT schema by adding it to the
existing qcom,sm8250.yaml. The bindings are similar enough that it is easier
to share a single schema instead of duplicating everything into multiple ones.

Stephan Gerhold (5):
  ASoC: dt-bindings: qcom: sm8250: Drop redundant MultiMedia routes
  ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
  ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,sm8250 DT schema
  ASoC: dt-bindings: qcom: Document qcom,msm8916-qdsp6-sndcard
    compatible
  ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6

 .../bindings/sound/qcom,apq8016-sbc.txt       |  96 -------------
 .../bindings/sound/qcom,sm8250.yaml           | 136 +++++++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 134 ++++++++++++++++-
 3 files changed, 259 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt

-- 
2.34.1

