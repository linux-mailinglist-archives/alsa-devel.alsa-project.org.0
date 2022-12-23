Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C4E65530E
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 18:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8D784DC;
	Fri, 23 Dec 2022 18:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8D784DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671815145;
	bh=NM3F3sd7jOCU0rHoNZ85XBi3gw6ZFcp1SuzgUdM5WCQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mGzwVb400bWAhStQkzz/d2XZEwoN1ASPuRWsdj75kXOZRSehr2ZqgQQgzLZ7oKneD
	 8iyRFpGYtokvXiuO44p5MzRp8+6oiREROq7Qs+dOZehPDT9GvW8MK9/PNZ0vbefD6z
	 RPWTqWzk0islc6T6dO8MuNzKrm8tPm1Ofw7+QYQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED4CCF804AD;
	Fri, 23 Dec 2022 18:04:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DFC2F8047B; Fri, 23 Dec 2022 18:04:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C60F803DC
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 18:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C60F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=Eaa6mKCB
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id E4759BA283E;
 Fri, 23 Dec 2022 18:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1671815080;
 bh=NM3F3sd7jOCU0rHoNZ85XBi3gw6ZFcp1SuzgUdM5WCQ=;
 h=From:To:Cc:Subject:Date;
 b=Eaa6mKCB12eMeXXpn5G/VYmqb/KdjgWdzvh7BdZ5wX/8tGgbRLb7+o1dJsSWqgKRl
 vXlP/Jirn9Lbwn1fmv9eRkOBMGJ6CdwoMTgEirluZZ+uFhK9K0OuvRTUtTgD160GOb
 dtxdHBIEdBS0VAxdCml8cGjmqlyluGdMU2e5JOeGFuSMZd8iHmXe+IVkRbvhojMtit
 65muFdbUH+d3n+88j6bYLHh/dMcF9mDEOrM+AFu4OjVJJjKFkk65epKKAYIzowRRdy
 ZhpRO0EhFub1xK8tKQSj1OjTcIsiCxle4tv4pJzCxKIPFCig1pH9C6in8FaR7s6suv
 OqJ7rCEaytE0Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: nau8822: add speaker Bridge Tied Output
Date: Fri, 23 Dec 2022 18:04:01 +0100
Message-Id: <20221223170404.210603-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for BTL (Bridge Tied Load) configuration to NAU8822 audio codec,
since this requires adding a new property to the binding convert it from
txt to yaml first.

Emanuele Ghidoli (3):
  ASoC: dt-bindings: nau8822: convert to the dtschema
  ASoC: dt-bindings: nau8822: add nuvoton,spk-btl property to dtschema
  ASoC: nau8822: add speaker Bridge Tied Output configuration

 .../devicetree/bindings/sound/nau8822.txt     | 16 -------
 .../bindings/sound/nuvoton,nau8822.yaml       | 46 +++++++++++++++++++
 sound/soc/codecs/nau8822.c                    |  9 ++++
 sound/soc/codecs/nau8822.h                    |  9 ++++
 4 files changed, 64 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8822.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml

-- 
2.25.1

