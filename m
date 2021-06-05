Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F03A7B3F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACD8169A;
	Tue, 15 Jun 2021 11:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACD8169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750868;
	bh=VDo3MyKl0Jg2TGTmupgwOD3vg/bsGkyeRfTxQnRVF/g=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r6f14sG1DzmsOOijFu+6VRQyC6OEaJFsasOACwxbfFV2ILWes+MHKnlWF//5PI3Kt
	 wHaXlBwqFkFjfZ2hCyIp4dbeboSCOgNrnZhcDeaUAuex0+LmAZVliwRvaftvrEysQ3
	 psUEHpMxSv5p3A1uo6la1Ss9l9UCPPxhM5d8EEhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 293E6F804D6;
	Tue, 15 Jun 2021 11:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26CFCF8025E; Mon, 14 Jun 2021 22:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D74FAF8025E
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 22:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D74FAF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="CnZOoGaa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C0A261241
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="CnZOoGaa"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Mon, 14 Jun 2021 21:11:34 +0100
Resent-Message-ID: <20210614201134.GE5646@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Sat, 05 Jun 2021 03:29:43 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org>)
 id 1lpM4D-004Jhb-A4
 for broonie@sirena.co.uk; Sat, 05 Jun 2021 03:29:43 +0100
Received: by mail.kernel.org (Postfix)
 id 87A0561402; Sat,  5 Jun 2021 02:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D9C80613F9
 for <broonie@kernel.org>; Sat,  5 Jun 2021 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C80613F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none)
 header.from=disroot.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=ultracoolguy@disroot.org
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 64DA25BDAD;
 Sat,  5 Jun 2021 04:23:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6gWT9UzzKU6; Sat,  5 Jun 2021 04:23:16 +0200 (CEST)
From: Gabriel David <ultracoolguy@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1622859796; bh=VDo3MyKl0Jg2TGTmupgwOD3vg/bsGkyeRfTxQnRVF/g=;
 h=From:To:Cc:Subject:Date;
 b=CnZOoGaaa3FIREcVX5ToGf229TgEHLbaSJJ9zfPck2lm/klHvqtdBfLLSHnXxw5dz
 Wn6JNtCiekXIz0coUthRiECjtXCitmNNR1KFFcnrOJdCy8Jy/7a7G/CwwiTv1W8s/w
 lPN5Zndgz8+y8mInJTj2fecg9epaxT6MXdN+b/M7zczkPYrBgaAskwboRQ3Gf7KcA9
 KlkFJigWExJyY1Bt6Y4k9NDgBjCKWZizH8ky3z3heqiWL/JNvQlcRDGorj/GMA2j2o
 o2ZUbr9gHj97PV6XS5Anwvf/HKxLt7NqvE2kiTXXGXxBB1Uw4nkPZ381GuqajzBzv0
 aKaPSDbua0fCw==
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Date: Fri,  4 Jun 2021 22:22:02 -0400
Message-Id: <20210605022206.13226-1-ultracoolguy@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org
Subject: [PATCH 0/4] ASoC: qdsp6: Add Quinary MI2S ports support
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: 85yZoG344Q2l
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: alsa-devel@alsa-project.org, Gabriel David <ultracoolguy@disroot.org>
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

Various devices(such as the Motorola Moto G7 Power, codename ocean) use
the Quinary MI2S ports for reproducing audio. Add support to them in
kernel.

Signed-off-by: Gabriel David <ultracoolguy@disroot.org>

Gabriel David (4):
  ASoC: q6afe: dt-bindings: Add QUIN_MI2S_RX/TX
  ASoC: qdsp6: q6afe: Add Quinary MI2S ports
  ASoC: qdsp6: q6afe-dai: Add Quinary MI2S ports
  ASoC: qdsp6: q6routing: Add Quinary MI2S ports

 include/dt-bindings/sound/qcom,q6afe.h |  2 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c       | 41 ++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.c           |  8 +++++
 sound/soc/qcom/qdsp6/q6afe.h           |  2 +-
 sound/soc/qcom/qdsp6/q6routing.c       | 11 +++++++
 5 files changed, 63 insertions(+), 1 deletion(-)
---
As a warning, I'm currently the only tester of these patches. If that's
gonna be a problem then I understand.

--
2.31.1

