Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95127331001
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAD518A3;
	Mon,  8 Mar 2021 14:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAD518A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211505;
	bh=IJ0Z+ui9OEOXMnypNuV7ydGk7/qmZ10qUf57VF2pGgE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PC6oNVC9bekvbF0zlYLMkEcHIOeDwwlhDcsW60F89xDbXm4CBXXbLWVVD/YESME0g
	 tOmm4egK+Q7v/koM+p1Q5G7HYaQNfr/Q5+oxo4tx5ua3P47bCoV8rQNIlt+/ysuzDW
	 DZc0suz54X9ML9kej9gzJMXOsKu5pUyTboUNDkn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C5B7F80279;
	Mon,  8 Mar 2021 14:50:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF39F801ED; Mon,  8 Mar 2021 14:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C269FF800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C269FF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="j1K3nNwa"
Received: by mail-wr1-x433.google.com with SMTP id d15so11542414wrv.5
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVXHwUF+4rYBeBM31g9Ze9WS5jjuoW2pQ3+wwBFnbQ8=;
 b=j1K3nNwa+4WIPoGWufWnEnRekEev6H7YsrlEreFNpjZ44W5vztutlseoj0Rh8qtwLx
 xXYpjiJ5pC+YbMJMGkdr+53Wt/tOmyGaPeTEdSTojCl2wY0zGZDKuJ0R63Q73ScwsJOX
 SWUjnGWtNJKsHdJiTz/KRllr2QOrIhf2peHpSuuk7qTH5fJHkPe+5xY/MOHkE8alpLip
 tMgdWJvRendDXSUPbkdIbynPCrBybWJ/Ogz6ZyMKjyMJN2XVWdcekP45QRq6z5muC8p6
 1vsaiNsntPkzLKPzorJJQtJKLDVhoQp/+1iuqpsxtsbvaaJVCn8mgg/0YgTthrWg5S/N
 zBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVXHwUF+4rYBeBM31g9Ze9WS5jjuoW2pQ3+wwBFnbQ8=;
 b=OSO3RDIskGpLhnxSX5Xy9CTkNXdRf72sEBFL/pv21MIWmTFoOEM3DIZ/I4QLTYDCZb
 UMvMg9O6vdaAGwaU5eDCHVzW20KpGv4TKdTTbEzDOqmKJU+R7FwyF1mVayH7jj63yRqf
 hwqWziAz5NrUivt+OBN3k/UKpci+6/8ftpIgoAeJDBJjpctvPo9r84vwqmx+xyNcoOnu
 zsLeP0JDw2wOVrylfz+c6uIgvwFxo3mWvuf9kny9rEpHtOHhq1+E40JKXeJx+sy9MdRw
 0nwHm0iW0APljBn/dQ3WBzll/OxPvO1vOcn7yf9hAfjGrq46vOeaFfsh5aujoFGPEQIz
 uGhg==
X-Gm-Message-State: AOAM530aw4vJdb6x0K+2nZYxoPXen8sRIKqUVS0Tq5Hwm8MwzjOJSD7F
 6em/FdQBWeisrMlaVFl/75gf4Q==
X-Google-Smtp-Source: ABdhPJzdSNArPf3ln4rbZc4YMouzE2dpM3VtjP/88PDzZ3b6z3kjkERby8dqVQUqfnWPkTRy9aYqxg==
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr23082513wry.90.1615211406168; 
 Mon, 08 Mar 2021 05:50:06 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 0/9] soundwire: qcom: various improvements
Date: Mon,  8 Mar 2021 13:49:48 +0000
Message-Id: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Thanks for reviewing v2 of this patchset!

During testing SoundWire controller on SM8250 MTP, we found
few issues like all the interrupts are not handled,
all transport parameters are not read from device tree.
Patch to add Auto Enumeration supported by the controller
is also part of this series.

Other major issue was register read/writes which was interrupt based
was an overhead and puts lot of limitation on context it can be used from.

With previous approach number of interrupts generated
after enumeration are around 130:
$ cat /proc/interrupts  | grep soundwire
21: 130 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire
    
after this patch they are just 3 interrupts
$ cat /proc/interrupts  | grep soundwire
21: 3 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire

So this patchset add various improvements to the existing driver
to address above issues.

Tested it on SM8250 MTP with 2x WSA881x speakers, HeadPhones on
WCD938x via lpass-rx-macro and Analog MICs via lpass-tx-macro.
Also tested on DragonBoard DB845c with 2xWSA881x speakers.

Changes since v1:
	- added auto enumeration patches to this patchset
	- added comments to qcom bindings to clarify invalid values
	- cleanup trasport parameters to use internal port config

Srinivas Kandagatla (9):
  dt-bindings: soundwire: qcom: clarify data port bus parameters
  soundwire: qcom: add support to missing transport params
  soundwire: qcom: set continue execution flag for ignored commands
  soundwire: qcom: start the clock during initialization
  soundwire: qcom: update register read/write routine
  soundwire: qcom: add support to new interrupts
  soundwire: export sdw_compare_devid() and sdw_extract_slave_id()
  soundwire: qcom: add auto enumeration support
  soundwire: qcom: wait for enumeration to be complete in probe

 .../bindings/soundwire/qcom,sdw.txt           |  20 +
 drivers/soundwire/bus.c                       |   4 +-
 drivers/soundwire/qcom.c                      | 529 ++++++++++++++----
 include/linux/soundwire/sdw.h                 |   2 +
 4 files changed, 441 insertions(+), 114 deletions(-)

-- 
2.21.0

