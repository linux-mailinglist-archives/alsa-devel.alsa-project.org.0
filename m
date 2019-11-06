Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467EEF0B84
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D987616D6;
	Wed,  6 Nov 2019 02:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D987616D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573002900;
	bh=U9GRTqmIxyCkGRMaSXn68cvoMLrzE4biAt/rZSzSKGU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fpIBIdGcxNYB6s6JFCCMpHyG+jU3lA4xKQkP8nhnIUWhFBw04kpCcxuj8pLdFED1e
	 cQLpaYv/hs0ejCR0t+Kspfa9HSuxVEO7j0i4Q9nLG0P2ormNn3MEpbaagkc/Gfkb39
	 Dzh1WxmvDYfejwv2/pNgaq/LGkXUTU88YaOORhzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7DFF80271;
	Wed,  6 Nov 2019 02:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07359F8049B; Wed,  6 Nov 2019 02:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A53EF8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A53EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iMmO/pxW"
Received: by mail-pf1-x444.google.com with SMTP id x28so14297030pfo.6
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RJWgLChV5dFhDjX6v3YZk5HcQ7kzB+BBUJKMApn2Ec4=;
 b=iMmO/pxWdHbfc7SZu34+QsgbzKEDJTmZ3A6iryuVPDPCDtpW3LYsGPgPBEu87998+6
 JixZkWSF4AgZtwe3McJEDxNtHt1Kbg9M51LoNMMC6CMEXgfV8vPV1TbT3bogXUyeIMM/
 kjZmfFxDFONAiR2/bXQKhPvIBHUZ+JGJs59v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RJWgLChV5dFhDjX6v3YZk5HcQ7kzB+BBUJKMApn2Ec4=;
 b=ehLcTaO2JVypsT0D04XCWfwYpFiH56MNABtERvFbd7ATVJ9pJaoE7t+zstB4ZJOBmJ
 6GMLEPzjW5zTaIwrGjqaDvJI16BhsqFDhQPNoryZ/P457zN81JmsEKe9QQSvcSQ9ussJ
 9uw5PhIWUabOyxPqSLNdOwooETG18ETR0rU/y9vDMPb0WI5hKAzcQaiHWgmkYCTWuSNy
 /NhEFaAtcfzjAooWxGCRMsGhm0/UY3RMnfP+oFqg8IPJE+fkfJt+DzkTOkKJ3BYP+Bf2
 ELJJmTwJVn165z+34XwhByG2Hj4Pqs0qghBFmrYWx8hFLvNnH7WH0jwwde6ZNB56azZq
 zxsA==
X-Gm-Message-State: APjAAAW0fFAggTHy7twAjYYDNRy5NExqjsXhkMAODsM213HeYiQU1hOQ
 bem6qN+d9XaPdsa+KDvIpAWfpiuw65pX
X-Google-Smtp-Source: APXvYqytkc/SYTBX2ZTT86xmZvJsN/rb7+ifmmEiTsQLbcjRAFyKinw4xvkULGEuDOsH1txBNvLXHA==
X-Received: by 2002:a63:8f1b:: with SMTP id n27mr29557054pgd.104.1573002830897; 
 Tue, 05 Nov 2019 17:13:50 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id f8sm11008308pgd.64.2019.11.05.17.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:13:50 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:25 -0800
Message-Id: <20191106011335.223061-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Cc: Ben Zhang <benzh@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Dylan Reid <dgreid@chromium.org>
Subject: [alsa-devel] [PATCH v3 00/11] Add Samus Hotwording for RT5677
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

This patch series adds the hotwording implementation used in the
Pixelbook on the RT5677 driver.

Known Issues:
There is a known issue where the system will fail to detect a hotword if
suspended while the stream is open. This is due to the fact that the
haswell-dsp suspends its I2S MCLK before the RT5677 suspends which
causes the writes and reads to become corrupted as a result. Any
recommendations to correct this behaviour would be appreciated.

Changes since v1:
* Addressed Mark's and Kuninori's comments
  * Adjusted DAI Links
  * Squashed related patches
  * Removed all kcontrol writes
* Addressed race condition with dapm
* Added firmware boot check
* Moved all clocking to driver API
* Moved DAPM routes that spanned drivers to machine driver

Changes since v2:
* Updated and removed necessary dapm forced power on
* Addressed Cexzary's comments

Cc: Dylan Reid <dgreid@chromium.org>
Cc: Ben Zhang <benzh@chromium.org>

Ben Zhang (7):
  ASoC: rt5677: Load firmware via SPI using delayed work
  ASoC: bdw-rt5677: Add a DAI link for rt5677 SPI PCM device
  ASoC: rt5677: Enable jack detect while DSP is running
  ASoC: rt5677: Add DAPM audio path for hotword stream
  ASoC: rt5677: Mark reg RT5677_PWR_ANLG2 as volatile
  ASoC: rt5677: Stop and restart DSP over suspend/resume
  ASoC: rt5677: Disable irq at suspend

Curtis Malainey (4):
  ASoC: rt5677: Allow VAD to be shut on/off at all times
  ASoC: bdw-rt5677: Turn on MCLK1 for DSP via DAPM
  ASoC: rt5677: Set ADC clock to use PLL and enable ASRC
  ASoC: rt5677: Wait for DSP to boot before loading firmware

 sound/soc/codecs/rt5677-spi.c       |  13 +
 sound/soc/codecs/rt5677.c           | 445 +++++++++++++++++++++++-----
 sound/soc/codecs/rt5677.h           |  11 +-
 sound/soc/intel/boards/bdw-rt5677.c |  51 ++++
 4 files changed, 447 insertions(+), 73 deletions(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
