Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE11EF018
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 05:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF121670;
	Fri,  5 Jun 2020 05:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF121670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591329149;
	bh=MkZlFvOHEWdmiGXUz+8nFcd3BMsmvXHkOZhZ94yHBlY=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFV3S8Q/pvKufgM5Mm6pdFZMepfRiiyvSKK/pyyIBVuLXUF1x1X6m8AD8ZEQkjp8h
	 IWRaoJN9anp5S7hpVUBdzSmu51R7FOg4voHf9mvf8BA/l18Nf7mOwvW3TFvmei+dDO
	 8/Ki5qOrCP+d4gKyOB4Ru19Aa1bjyV/+3T/mgDZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A37F8027C;
	Fri,  5 Jun 2020 05:50:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EEA1F80212; Fri,  5 Jun 2020 05:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D8DF80108
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 05:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D8DF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Qr8NpwFv"
Received: by mail-qv1-xf49.google.com with SMTP id z7so6304621qve.0
 for <alsa-devel@alsa-project.org>; Thu, 04 Jun 2020 20:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=p99Rcfl/aySHjDwEOcdqr/T7gyuhzsbPgf2F8y+KRrM=;
 b=Qr8NpwFvc3m9a8cy0y5TtAb4IB8DeLYGbb5haVvGLrrIhrFzjWhUZG+O7YWpolGP/m
 emRGlm6vQIu4bhiMnPzS3XI7I0NN8pfpy7tMgIvMNzEe+otgQ1ujviH2F3XFKena5k1A
 lk9L29WsMJ2j4+g1S/qhEb/j50xEr7r4AEAZYltFaaHEF5i0JDY2F/MYuGpmsEMWQgeW
 Fn0MrtUBzpF4+So2nVUjMu5s080UbTmKdtniHMszTuFDp3E67ISB2M2qmrbr9B3vpBm1
 OsIES6bjYs7zrhCFPdlObvlg1koBj7YXguwpGyd9ll4NE6BDiEnfuMiCJiMC+KTgBFsq
 EbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=p99Rcfl/aySHjDwEOcdqr/T7gyuhzsbPgf2F8y+KRrM=;
 b=KN8S0jkdeer4/OfNy+b0+XwZPCAHV6JdJNdnostALdRjW8m2zfuqefmTyCpyHOCOOV
 YD0zDY/y3Pi8hgZg6/uPhh38t/KRTy8hHnvX2jA7qqz+BZhzTHvg3rF4JHTaxgtMEyaF
 3qYtoXNHh8mBaJJbHRn26TfGaamGPFNAQY3Njgeewl9EuRI6ATdh4g7tGLZrT5Ac3FvA
 xbtXV1HHgiurTJvROSrJ2LqpqkWA+4apYgt+0hFkHRBEecoi8bg95TEDUJmjk6ZpUhqr
 L+WwZzSdeB1Ot8VTQNQF3VnSLe4f2jGpp6r1RChH/7xKiXPimlYqG7AfkxIrKc5c01sI
 OxLA==
X-Gm-Message-State: AOAM530esT68Bws4PUSWGqOZTj9kJpDgB+JQndgmrrHuhORoUkaLX8dB
 cqIcuVKF1lFZfpMQTXRf51G6MmTM/G4j
X-Google-Smtp-Source: ABdhPJxzfWFy3s0SB1OW0cA/iS6Ny7DmGwdbwtZRhHwnw5nDvPgbtvrU9FgFjoR2KGH+jpeHJmPDGmB/ugty
X-Received: by 2002:ad4:4725:: with SMTP id l5mr5042459qvz.120.1591328984178; 
 Thu, 04 Jun 2020 20:49:44 -0700 (PDT)
Date: Fri,  5 Jun 2020 11:49:29 +0800
Message-Id: <20200605034931.107713-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 0/2] ASoC: max98357a: support MAX98360A in OF
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Commit 1a0f2433d738 ("ASoC: max98357a: Add ACPI HID MAX98360A") supports
MAX98360A in ACPI world.  This series supports MAX98360A in OF world.

Tzung-Bi Shih (2):
  ASoC: max98357a: add compatible string for MAX98360A
  ASoC: dt-bindings: add compatible string for MAX98360A

 .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
 sound/soc/codecs/max98357a.c                         |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.27.0.278.ge193c7cf3a9-goog

