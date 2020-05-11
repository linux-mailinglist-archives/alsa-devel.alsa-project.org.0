Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD511CE757
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4417B1654;
	Mon, 11 May 2020 23:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4417B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232141;
	bh=BfTwPcipFiqnhg7ufGjFiaBac6BsJriju+tYCnXUG6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZeBLqdThNSW/2Kkcidh+gmpvLessIkDRQSeR2KUjzU1WNgNA9d+aWtppCpm1hCYh
	 wjcDMsB2fnEcr2+25qZuvcvxjDgCcCrg4x9C5Q1FGSOUywp7M9exei/h7MB/f1s5su
	 IlLwkl6pQ9S5joy+YsxktJzTIs/Zm3XIBjED+lEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10BEAF80157;
	Mon, 11 May 2020 23:20:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E5CF8022D; Mon, 11 May 2020 23:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8CD2F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8CD2F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VhCC0Nc2"
Received: by mail-qt1-x834.google.com with SMTP id l1so5826772qtp.6
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOp/PvUAQ79zE2VgsXIub+73HA2DusUSaX7tCxIhgho=;
 b=VhCC0Nc2qG3b8TP+bVtIUcSCUnuXGdNE83cmOz28VggRR09mdVtawRiDgL65Uh+MO6
 UNiK1jKZ7GntsBj68kSgbBjG+zRg/pnO9BD4cXipyavj1evyTcQ+uiI5WDCw+aAW+vLb
 1LojI1mUr3qbA6T+AzmVR/OWUUdMVXWwrSKsCDWrvTujhtghym1IgavGoQJ7gpVYvk1M
 ACD6NkQc6V2yGWVq9UwvfeFfOzk//UP98kmryWes6edmhwoSHYh9TSh1uxDuKmaSgcMX
 +AsWoG9IkrABMGh9ZfuvjHDKzkh2+sYDNm2axXMik2ER+iYbUavmttCi6L8VFpRcgp5u
 5pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOp/PvUAQ79zE2VgsXIub+73HA2DusUSaX7tCxIhgho=;
 b=sVD1Pji6fj3CDH/F73NhFYJwCLjp5fHsqkIVO3Gyn4s4U56HHuJ2rlDuwLqrI5py04
 KvwefeF4pKMUB+/DbJwOzbGdyeRNyDPgAuXbSkUsu85iwAwMUve4O+n3E7fwvRRGO/nb
 3t2zBsrJjTF5VCMqG6YR6DDHx8pLIf9ypkoUmEOeaFs8gds/5WaNZ8nvGlX1DfF8oJ6n
 QnGKy7L/Vx9dm+lt7+TXMQcem0Rz5NuhGICQNXKv5oCuZBMGnyuaxmovnNPdTRJW03xi
 VTmo0rlI2b3Bn7/t8txH9vYeVI0ruO77E2149+EqNWYJDe3qx8XKwuK7WupnL7Ss7yVK
 Ehpg==
X-Gm-Message-State: AGi0PuYEmD2IamL3yoUZ6yeJTcG8L7imwNEdyuj/lPZQhTqGOo0IaDAB
 gD0cVAmQo7GpbNz1o4INZEr+lkrr
X-Google-Smtp-Source: APiQypJDEVAFwSdTDsJ9rvqZ55lhhPX8leCJUExNME1SM9OztxrelOY/bKirgeQEF3fXcPEilxT5Yg==
X-Received: by 2002:ac8:4f53:: with SMTP id i19mr19094630qtw.195.1589232023408; 
 Mon, 11 May 2020 14:20:23 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 00/14] Add Renoir ACP driver
Date: Mon, 11 May 2020 17:20:00 -0400
Message-Id: <20200511212014.2359225-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>
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

This adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Renoir APUs.

The full series can also be pulled from here:
https://cgit.freedesktop.org/~agd5f/linux/log/?h=renoir-acp-2

V2:
- Removed empty declaration of dai_ops
- Removed SNDRV_PCM_INFO_BATCH flag
- Defined Macros for delay and counter and corrected dma stop sequence.
- Changed PCI driver pm runtime sequence
- Removed redundant code

Vijendar Mukunda (14):
  ASoC: amd: add Renoir ACP3x IP register header
  ASoC: amd: add Renoir ACP PCI driver
  ASoC: amd: add acp init/de-init functions
  ASoC: amd: create acp3x pdm platform device
  ASoC: amd: add ACP3x PDM platform driver
  ASoC: amd: irq handler changes for ACP3x PDM dma driver
  ASoC: amd: add acp3x pdm driver dma ops
  ASoC: amd: add ACP PDM DMA driver dai ops
  ASoC: amd: add Renoir ACP PCI driver PM ops
  ASoC: amd: add ACP PDM DMA driver pm ops
  ASoC: amd: enable Renoir acp3x drivers build
  ASoC: amd: create platform devices for Renoir
  ASoC: amd: RN machine driver using dmic
  ASoC: amd: enable build for RN machine driver

 sound/soc/amd/Kconfig                      |  13 +
 sound/soc/amd/Makefile                     |   1 +
 sound/soc/amd/renoir/Makefile              |   7 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c       | 530 +++++++++++++++++++++
 sound/soc/amd/renoir/acp3x-rn.c            | 106 +++++
 sound/soc/amd/renoir/rn-pci-acp3x.c        | 346 ++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h            |  88 ++++
 sound/soc/amd/renoir/rn_chip_offset_byte.h | 349 ++++++++++++++
 8 files changed, 1440 insertions(+)
 create mode 100644 sound/soc/amd/renoir/Makefile
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h
 create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h

-- 
2.25.4

