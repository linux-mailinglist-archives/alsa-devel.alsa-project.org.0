Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C113263C1D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 06:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF161673;
	Thu, 10 Sep 2020 06:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF161673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599712537;
	bh=sFSnBAivTFd5nT85vb120vUu2mOLRrq3xkVxhZZQuZo=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RthuUvvRiXo8Wc38yHxljczgDkNOHjFvUqql8wbxPf6J6HiM3vB8F/eM+wF3qnvrP
	 MVu1/d0gr+6/cwXsULAfffFwqTuXZDLk4pTaDhuD36eVS5F1XNCFBFSFzWpmi5tDHt
	 BBk8vOSpAMKIgz452x1Bkb1dVu3VegxwaYrh0Ubo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10BB6F800E9;
	Thu, 10 Sep 2020 06:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F29F80277; Thu, 10 Sep 2020 06:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37977F8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37977F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CIGkn/UC"
Received: by mail-yb1-xb4a.google.com with SMTP id 207so4232259ybd.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=hAy5Z2kT60SpmL91IykD2jWw5/FSREturFd1fEa37go=;
 b=CIGkn/UCeDdFagywqDsyikKmKILOpsFf96fZQFOgdsmjLhCs9ybLL3lszg9kRlY472
 oC6C6fKFltlfHxJq7z+4aQ666d986n/bZTWmksfg0uU6EwE+hfVrS+hFRN6tiDgXroj4
 RMLB9tahb8X853pW1HW8EhwjCQTHaeekyWbATlSrVv3x+luuU4PMGUh9a2b0W1crIVGO
 qFx+wiAO2bb36ri6TyuTTbD9vMpc0Le1A6LA96cYTC7TUy1dyilqV/SDXC2P4KXHJtgd
 UQLyyeeghUioTeyphu/JR+z0zAD6c5+4O9Feszww6+u/eo2+MTylOF60uVXax+uwb/bS
 JVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=hAy5Z2kT60SpmL91IykD2jWw5/FSREturFd1fEa37go=;
 b=kQB7UJlhIQVNiamE9Ih+29EX9MPjsHmNMbBUEdtjf7dG92yhB3ZY9QR5ieaBHTmNmf
 xkXLDEf9nfTKHgpMZq860n0Ao8c/TfFYhOk7+Kt7kxN5tr9TFi0e6INE4I/zGonCdXHR
 ymbcMWE403P8Inpdjggllu8/m/qQLU4rnq2l+bKCkvLXaZ2eNd2p8XKzKX31Avcn65r6
 72lDuWcrOPxoUd6AorLdnEnrQRYb+6rwzlrRQ/CtjFicR111j5i9E+P026nHBRfqt6Ea
 478sCbRCQe0UR4tIdtNGIDXV+EXKrZzjfP3aCsUrhnHdKKi4L51Gw0+zhaMhiWcVwCEM
 2+2g==
X-Gm-Message-State: AOAM532cr2i4jW/z/Grw7atx9uGFOl804AMndTxJF5/G7pnxTAgfHkPv
 RDtci5P3eTQ5pzVSURf6KrUV5VcqVKkg
X-Google-Smtp-Source: ABdhPJy7IpxXAOQkJCvR9c3wPh5GOPAG0UEhUv7ALXkm3rL+RTzFUyPpyDsliQaecFQkjBpuMtEZOjMJjSt5
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:bc04:: with SMTP id
 i4mr10746629ybh.32.1599712420296; Wed, 09 Sep 2020 21:33:40 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:33:29 +0800
Message-Id: <20200910043331.3808223-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH RESEND 0/2] ASoC: rt1015p: add rt1015p codec driver
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, tzungbi@google.com
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

Adds rt1015p codec driver.

Tzung-Bi Shih (2):
  ASoC: rt1015p: add codec driver
  ASoC: dt-bindings: rt1015p: add document

 .../bindings/sound/realtek,rt1015p.yaml       |  36 +++++
 sound/soc/codecs/Kconfig                      |   7 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rt1015p.c                    | 148 ++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
 create mode 100644 sound/soc/codecs/rt1015p.c

-- 
2.28.0.526.ge36021eeef-goog

