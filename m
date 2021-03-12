Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE670338C33
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D69D1707;
	Fri, 12 Mar 2021 13:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D69D1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550492;
	bh=QwIkXi7djNiAisdeLC44LnZCDyU4XG8ICiysMhmsguA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X1Bg5oH1aGb5as0EpoMWMaqKeeHZYtBKYZOjhhSHJR9VRfWRAkNStRz8VlLxlD+UW
	 +2uiWx6aWToxLrTwVBRoLjrVpQA3W+gOEyIUH61NQwNHiIDPS8WWAdt0xXbBs/xsJG
	 dEy15jQsEpK21JNbSJddfPjbJswpZ4vtglZ1K8yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE1D1F802E0;
	Fri, 12 Mar 2021 13:00:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54605F8012A; Fri, 12 Mar 2021 13:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110E8F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110E8F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x3mD0xtG"
Received: by mail-wr1-x431.google.com with SMTP id l12so4663941wry.2
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctihznIBI6HYfRPQEJtJ2A5ihzsBfql6joqN4iVPcyc=;
 b=x3mD0xtGnMFOkAF25Ulh5v0L1V90mJLI9ed3zAM+VCt1lAi0MgnJ4P7H2JI8RrPEeu
 Z5PZQejpR5GtChXdWBfZ+bVqQzz5SDmejiDsEUOykdkt15U3XEzsGCkvwlVSFv+loDCw
 UQ7nC/MvgMtHp8u+2u1HM8jl2HbMGg6NH8kHCPcIDSTbJfozQ5LNeuXbW6KJubR2Yuug
 Ww45YA9QHTJdyge+9/r5xxwsrbCmYUoVCM5wGww/gNdkIk2KOrxlCb/11TdzyhACM5Kc
 pIoyyXCa/Fiwb7uCpyY9EIj50WSCdMxaSoAH75nUYwf6yhFP5MP7OprL5rugbTmrXRt1
 DAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctihznIBI6HYfRPQEJtJ2A5ihzsBfql6joqN4iVPcyc=;
 b=SNVLpkMZFsqMBbkHwlZDdIbzRDmOsw3dylr/EfFvrEVuEBOFfPIDxOiKU/xX0ClyFs
 DCIp+poJmjhhFS4pvGsd77LmqmdduX8xoejnlQ55F98b5HlHUKPjMGs/6JA8Bh86yN7u
 1KGL2r2vgALPG9GXYV42hAfWhcE/pjavU6PyFxRmbQG13t+cYP0Ehsq9cVvefXltEW+3
 9wbTXefKFw3wIQGbgr3tzJ5SR5tr17GnUuTdEcms/FwsZAx6bzGrOGKd9WAlDzHwYfpP
 O8/vHVbcpc8JxnaAPUa8CBM5x1dL3MubjYrWfezuetL/o3/RdfwsTnmkYPfMJMpfaqu4
 VP8A==
X-Gm-Message-State: AOAM531Ct/6K2TMhwk/bXjWzwB2IU53k9KbHom88fFqV2n/tPEhiuSyD
 3N/QvXJP/f95FE6yM+CIzf6CPA==
X-Google-Smtp-Source: ABdhPJxyYk9ByGQyGPGOMzcFO7nnAiyV4NbYnLDByxC+Q47ow7ealzYGfhYUapAwr9K25/J3bJW+ww==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr13563213wrr.297.1615550423154; 
 Fri, 12 Mar 2021 04:00:23 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h25sm2268315wml.32.2021.03.12.04.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:00:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v4 0/9] soundwire: qcom: various improvements
Date: Fri, 12 Mar 2021 12:00:00 +0000
Message-Id: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

Thanks for reviewing v3 of this patchset!

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

Changes since v3:
	- Fixed setting assigned bit during autoenumeration

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
 4 files changed, 442 insertions(+), 113 deletions(-)

-- 
2.21.0

