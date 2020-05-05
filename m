Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9A1C6276
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 22:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD52174E;
	Tue,  5 May 2020 22:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD52174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712130;
	bh=eNCRyChecQ4w2tCyPKccVmQXUPkSlcpOcA3vMFfNx3M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cWEzlJ07QEoUxxIdaR95IHe7kF9ZHdM/saQLQiLPs/5xMJ9L9l3stU2GITP+xdMfg
	 4bp3OFXBF9EBNMpowotlaUosp7/vQk7l7kUZaIWp0JhdDEeNrJMwuZaRBE+kXbn1ba
	 iKdsY7To0p+8iG4u9eAC2Xu8CodDpWZUiZKsgagc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F73F8027B;
	Tue,  5 May 2020 22:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CEAF800DE; Tue,  5 May 2020 22:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56242F800DE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56242F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cm33ORGg"
Received: by mail-qk1-x733.google.com with SMTP id i14so3852773qka.10
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZbaPXBjAHja6wLUUmF0oPy701oq9F/nF6FbbO6x5TA=;
 b=cm33ORGgtQnu5KUIRu4HV0ibDs2y3/NiZSb++AxqAQIXjT8WD4YY4IyQTikSpBmuun
 l7zOuSKDv1fby0IaYWuSRs3rsm3VeghhKJn0kcM7P/4d5A3la+qUVFcj5wSIGss4ze3Y
 Rc6ovyzhMYvw1hegtEURqyr51V+a0rG1bcTvkC4IkTqtKSey004uAQ6uG/175q8QBL/t
 9/cloJ+syNtL/1L8vrFOXqmmEddma/oycBhDiAzIQtGL8fFCivE1HuM0S3vRFcxu7Ri5
 HIj+zbSRq+hulvVVrQaVvxZknIcwiFFeRDzEg0Z83d2yxBEMwDDPw476+E591VcdulmU
 AnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZbaPXBjAHja6wLUUmF0oPy701oq9F/nF6FbbO6x5TA=;
 b=RR4ddihfZaJhglpqhv/f+ZTmrdQ4fGIG4ySxVY/paBBV5l/9q2AuBQvLvOU18v2q7z
 /wGUY54y7WG/3i5/Yc0QeEo0QIa1549BYgMJhW1kdqvn3MrA52Vu639ALxsxkWBgmpv2
 wgzuS0gptBscEpw5dFhp8ltkevgF/yMqIAGXo/n18p1SOpRcNg90rTQBIf5WOon1swnT
 pgYVAhqZoGKNK3ERm+hlqGtSxgU4A142FW40qDyT4+OvM/SAPc74U8jDm6IS9bXadueE
 AXNWQRTDoWHcjJ0jFm+vJNq8vKS1ToZ4aHfOt9REQdzOcrIAymF7+xiMqHtaNzevOpHT
 mrXQ==
X-Gm-Message-State: AGi0PuaLBJOrP/Nb0REj4fn+E79lU3Gi/vBVjfBPhGu1Ou8MvPQ1Isdj
 6wcob9sgvz0AAqu/47dN/cC1MbHZ
X-Google-Smtp-Source: APiQypI9evJl83kfYIgMzbQf4Y6rzIWTZjoC/O8FcTJsTjmPh+gJS041RHC96WECkwpj8o0AXDli9Q==
X-Received: by 2002:a37:8b47:: with SMTP id n68mr5419987qkd.163.1588712015296; 
 Tue, 05 May 2020 13:53:35 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 00/14] Add Renoir ACP driver
Date: Tue,  5 May 2020 16:53:13 -0400
Message-Id: <20200505205327.642282-1-alexander.deucher@amd.com>
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
https://cgit.freedesktop.org/~agd5f/linux/log/?h=renoir-acp

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
 sound/soc/amd/renoir/acp3x-pdm-dma.c       | 534 +++++++++++++++++++++
 sound/soc/amd/renoir/acp3x-rn.c            | 112 +++++
 sound/soc/amd/renoir/rn-pci-acp3x.c        | 346 +++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h            |  86 ++++
 sound/soc/amd/renoir/rn_chip_offset_byte.h | 349 ++++++++++++++
 8 files changed, 1448 insertions(+)
 create mode 100644 sound/soc/amd/renoir/Makefile
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h
 create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h

-- 
2.25.4

