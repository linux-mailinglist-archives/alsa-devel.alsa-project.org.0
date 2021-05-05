Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8040373591
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 09:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668C216AE;
	Wed,  5 May 2021 09:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668C216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620199671;
	bh=J4rP+0V7QFNCIHHF0uZBOk0UMDfPAWQ+DKfH4HxTOAk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rt13O616Sxu9+zOBeKW8LtFMty/LlNjIHLOX6sKkTzf4c47L/nErs2gDMUj1nluia
	 /we0ThE+qf5lOVyi9VUegCzbOBJrW9JWGdtqP5CsnP0Fo2qzACI82UZuOu/vVwdZBZ
	 ucJizD1h+2rVSux3bluN7oFGnLgzMa+4B3R93RjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51CCF80279;
	Wed,  5 May 2021 09:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4EDF80268; Wed,  5 May 2021 09:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45D0FF80163
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 09:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D0FF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tNBsreuC"
Received: by mail-wr1-x42f.google.com with SMTP id l14so644830wrx.5
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSGB223I3PeBh3TG2RAuibwn3vbLRJONtkpynCow05g=;
 b=tNBsreuCJZemMha64jCuI97TnHZ0gwzRwx0zYrIb/M9JCEXaMBrNLQ7RxmV/PmWrbY
 HJoT2YoPVdEKNxcpCrk1VeJ0q5XVpBaRl0oNSqrmPy9aJajrmXRwxzcptYXNLBL22kg4
 kCI9rkOnmAKzVCFy0DAPO33h3iH53CX7AB+litwzli2VPeHS5m1OcNMogGiPj6w022RA
 E25OcZd9zZ4KiGk25bLrmRDXKvKPpwNFRI86GPn4Ff70sJHM29lmSjg7EFFDr/Ig830k
 tsKRqgMl3nZz5hbO9EZE4zKIvHL7NXpVXpMHGPUE/vvVs2FNzPMtmZmn3ndH27pIZCXU
 81RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSGB223I3PeBh3TG2RAuibwn3vbLRJONtkpynCow05g=;
 b=dXtfmVZ8DxZVCLzenxz0ESswGhsorS0KwjPj39pRCHQ0OnzjBybkSmgvDMgADkJMdK
 RF29z7/ikZbEQ1p5AyZYJRw2F2jia7+4wRSKM83gLN921ypOzCcEAfFGYcCY3hQ4oQAX
 v/WtZTxc2c6mzdaMA5VftT/yexTH7apny4S8Rl2khsZHbHqIFtbGYNvvbB2yl+UoTBki
 G9qyXNoLYZdwwHvZR+CcpegxawyKh7ZX7VwxCUjD2uaTbmrMtA8RepTxSHYXxLitJyIe
 u5mWqTssmdJCyMlmvtEvi9bTQK5kdGtYd89wS/CMvc41ePik7IaEuIC9YspMlQoqps/v
 AASg==
X-Gm-Message-State: AOAM532IdTjAm6zNacVWT3zLY801G+bbzX8ZysuoeVu/frt0LZqIB415
 EaPE+RWn5woNcrJux3n9ABXdPw==
X-Google-Smtp-Source: ABdhPJyABkwemPMKwQp9GLUEV/VZsbakg+LdwJTV16+JOgDc0yiICSRNDSpsAxOBJf+N1wu1PvwxEA==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr18035799wrf.315.1620199572246; 
 Wed, 05 May 2021 00:26:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 f25sm19008991wrd.67.2021.05.05.00.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:26:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: meson: g12a-toacodec: add support for SM1
Date: Wed,  5 May 2021 09:26:04 +0200
Message-Id: <20210505072607.3815442-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

This patchset adds Amlogic SM1 support on the TOACODEC driver, first by switching
to regmap fields for some bit fields to avoid code duplication, and then by adding
the corresponding bits & struct for the SM1 changed bits.

Changes since v1 at [1]:
- switch to regmap field

[1] https://lore.kernel.org/r/20210429170147.3615883-1-narmstrong@baylibre.com

Neil Armstrong (2):
  ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
  ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC

 sound/soc/meson/g12a-toacodec.c | 144 +++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 19 deletions(-)

-- 
2.25.1

