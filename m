Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 269374CD262
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83CC1959;
	Fri,  4 Mar 2022 11:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83CC1959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646389689;
	bh=O5ajnE4DsZjuzXAmuM13pVmwy+U/Vld7bckcSYrpc6M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eUzr4G2/y7Rm3VJd/yBqLKKrqGPfiSqkoaXzNYIPRR/yjEFQPZHN+VhXr75wfGRba
	 hjOmeAEtP3+JT1hq2vLmSiqzXLR7yRwIiSY1FQtdTjYZGxomyIRkxJGHKyjCQ4IBje
	 Iv/U8gu6TK8dO7Y1n8KqfmMwSTXpBbwk2mhdB6OM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C7FF80224;
	Fri,  4 Mar 2022 11:27:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD81EF801F5; Fri,  4 Mar 2022 11:26:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF05F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF05F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="AFm4UJ71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646389612;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=zudBi6qDl21Fw03NfI0Dqw3aifqtt17ZUkifzCNDbRM=;
 b=AFm4UJ71wJ+mMup/7yUENhMkYZX/RZV2kWV4Y7oEP88CWLgIKo+JG9OOQkYaq1JpZb
 MRuOhpf2o0fesqYNs4P8ZZzoohk0V2EnNVKKAakkmpWYFyynHSxHyvIWRZ0+t6L3LDv2
 346wOkDfQO62jeGke98IYsRLNd8rGJqpKlipEUrlb7tfOee/PEmcr7Mv2fOb4+ACcvhC
 z/Mxm+k/zD+KZTAdBxyuZkbBEQslacSuQVkRpAphDAyTgMpxpd2LCACv4C8/PzaXW/iq
 Uu8iWIeV+cYYJdbO74i7jzkLf7H2UIjqIb9SQy663USZ6jfbTlzfi9ZuAqPcJdJLeV71
 SU5g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL2muE="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id 2c4d58y24AQp4vC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Mar 2022 11:26:51 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Date: Fri,  4 Mar 2022 11:24:50 +0100
Message-Id: <20220304102452.26856-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

This series adds a simple driver and DT schema for the Awinic AW8738 
audio amplifier. It's fairly simple - the main difference to 
simple-amplifier is that there is a "one-wire pulse control" that 
allows configuring the amplifier to one of a few pre-defined modes. 
This can be used to configure the speaker-guard function (primarily
the power limit for the amplifier).

Jonathan Albrieux (1):
  ASoC: codecs: Add Awinic AW8738 audio amplifier driver

Stephan Gerhold (1):
  ASoC: dt-bindings: Add schema for "awinic,aw8738"

 .../bindings/sound/awinic,aw8738.yaml         |  54 +++++++++
 sound/soc/codecs/Kconfig                      |  10 ++
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/aw8738.c                     | 104 ++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
 create mode 100644 sound/soc/codecs/aw8738.c

-- 
2.35.1

