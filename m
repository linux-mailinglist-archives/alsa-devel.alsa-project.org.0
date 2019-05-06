Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B173F158E1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23FE6184A;
	Tue,  7 May 2019 07:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23FE6184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206598;
	bh=YWdFOYvw07cZoTWw22W/z75oMZpXOyXhI9Sw+R31ZF4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CcaKE6DrVuI+B8ODWi0rk/+2mXzkQuWnED6pgyL64O5qOmeS+2qqjq2yVUGUAuFw8
	 KZ90Wp9TDCgejm5BdL0+sXaj5CNabgYic/JwBn34qEj27zYVyrJ51PtdN/qC7WuK97
	 XNDVtdfa4nmHN16/QMCsDGPkMnPIOGEgdcbPbg1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F52F89727;
	Tue,  7 May 2019 07:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E10FFF896F0; Tue,  7 May 2019 00:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E2C8F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 00:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2C8F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HgPIxNQo"
Received: by mail-pl1-x632.google.com with SMTP id ck18so7108942plb.1
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 15:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1G76/DxVX8XerrNaCDJMZeudedstwh/R3GkpjdOBYaU=;
 b=HgPIxNQoQ7WPi8RBCI5jFsPgd1973w+K+pCqvgkEMJ6Eah1Fj4wiL883e6jIIfFwkZ
 oD2jHsyCGWUnyaRJVSKniXM1V9+CIRKx6389ym/P+/Tgk3/5i+eCJE0/SW9aSGmb0ca3
 6GeBhCV2odpQVKuIpNewx63ojFQGWVf6hv1MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1G76/DxVX8XerrNaCDJMZeudedstwh/R3GkpjdOBYaU=;
 b=XXlno5dP25bzrcFCYvRGiCgIMvjej6fxVz6BY4Ixcc1cPadSpcdnDGCY90DyVrgd0C
 oyKP1ynvyGMPmk+ULJHh/eZseEvDxthTM8FVZexl9x/4W2v7jVNn1J/gePxoIdY4y3fM
 rhRmIcF+A5Ny9cpPzb9g0ihlZLMlHhdL6bEaExFKaUinzxXrtli7ZuTeAL/sy+gnbJib
 RoyQsfNsLmv2dx70mAdOYKqOvP/Ma1vCoCRcKv7GH3K4eV73WcXQ/+tnuFAOaXKSC7Ok
 A09lP17+Ln2f6oPsRMFmdOMCGhvohRUzdwuorWA4fIPb8JfvQCCevXEEOrhNXqIcvPSx
 h3nA==
X-Gm-Message-State: APjAAAUKifhO7TSdIgDXcRaHWAi3irZnR3D5+jKNEW4Vsy1yXvA0J2ZN
 9tEFuZkAf9fAF/W1sdiSQuQoqg==
X-Google-Smtp-Source: APXvYqw+uLEtzDx68/COSJ+nWC5ZbK9OR4doJuY4FqNoViZrmKJ07/lsqeABZjsIVq7jsMMxrNh8Mw==
X-Received: by 2002:a17:902:bc85:: with SMTP id
 bb5mr36085795plb.310.1557183232854; 
 Mon, 06 May 2019 15:53:52 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id i15sm16052204pfr.8.2019.05.06.15.53.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 May 2019 15:53:51 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Mon,  6 May 2019 15:53:19 -0700
Message-Id: <20190506225321.74100-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Ben Zhang <benzh@chromium.org>, Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jenny TC <jenny.tc@intel.com>
Subject: [alsa-devel] [PATCH v1 0/2] ASoC: Intel: Add Cometlake PCI IDs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


This small series adds PCI IDs for Cometlake platforms, for a
dazzling audio experience.


Evan Green (2):
  ASoC: SOF: Add Comet Lake PCI ID
  ASoC: Intel: Skylake: Add Cometlake PCI IDs

 sound/soc/intel/Kconfig                |  9 +++++++++
 sound/soc/intel/skylake/skl-messages.c |  8 ++++++++
 sound/soc/intel/skylake/skl.c          |  5 +++++
 sound/soc/sof/intel/Kconfig            | 16 ++++++++++++++++
 sound/soc/sof/sof-pci-dev.c            |  4 ++++
 5 files changed, 42 insertions(+)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
