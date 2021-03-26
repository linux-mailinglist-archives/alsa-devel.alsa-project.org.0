Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D334A215
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974FC1669;
	Fri, 26 Mar 2021 07:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974FC1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616740975;
	bh=DrVTRKnxhSTllBuQi/p0/4x5O7xfD/bSnsFgqR1yNAQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nJD6yvr11jFNn/oYT/ostOnf4RvCDGsTdc6ZuWp/KDmmg4dFSb8PvoSr/9zDN+vAy
	 RbHbnVN4kHV+qV9iNcOK+Tt+Pc+ttWa/7WrF5sG20VYe0VLNkh+u9ntHGGGN/ybdWu
	 Dhs32KVtaC7BxNds+KTX3sS+1ZF5yH/DhIoqCbDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2744F80246;
	Fri, 26 Mar 2021 07:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E318F801EC; Fri, 26 Mar 2021 07:41:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D60FDF80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60FDF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cT5DeJ+b"
Received: by mail-ej1-x636.google.com with SMTP id l4so6734624ejc.10
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=601vu5quzaQf6DnHp3OpM53cCBOhcUim1UL6VJ/oy0U=;
 b=cT5DeJ+blY6t22wiG1Y2kVtLodJ9uXZElUCLgfFosUxxWW1blbg42q55+V/XI+9iDG
 eSjqS+5sb2CyQx6VMpvU6ZtubD4icr2xzo2Aqbice9XnxxFxHRsdqpbvB/7joKFXdOFn
 GbISma2EmFJF4V20w36YmFsDCll424vNjNBfZCAj7RGubZT9H4sAMFwX9zfqgy/A5FkT
 ibbtew5DF8dfc/XLm1zcnSvCFYq/3ashV/B69dCdO8gHJHw6SKFu1c49I/K7Et8gJmwZ
 HXklQvv8NvPIttHmY4AnRvnzGY9BKRoFg1/VRmGJYXjUSHuuVQnsm+QFspVXU/wOHzBL
 NjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=601vu5quzaQf6DnHp3OpM53cCBOhcUim1UL6VJ/oy0U=;
 b=FT8U/EVf3iNv+CjKt9j16DsepecvpZuZDgTpn6xUQ4KNj1FlwKVQ2v93HT2YQsiI4g
 VmQhEgc+/chb5g5oE6UIjKadtzg3hpcwvPNdwn3WcTeKI1i7BYYbEcT2ShUqEPcb0iUl
 fB+mvgRrURieNCd1yA9xHxtA4JgGHvJV79Rr9FQbC7Paxsc6P1YVfQd+0CiMfg2VZVDT
 lRFFDfg9Z4FVdo2E+q3ntPrPWGuYQCsiETh25ZTbKOnEyDdOZAp5TbjmVAOCEq0w/vCG
 qf/3b0TuXriFb5pUQCGth6VU6zvnhXTOTyDFvaAdwinjBb3A1BbE3EE5Go5BEpGJCT8S
 KtYA==
X-Gm-Message-State: AOAM531/udxLMu67CArVU5OElnKtV2TV5yHADI7E1WJ9QjNgta3ZHkWs
 DyiPq7npS8YaCGCF9c5ntm0J4Q==
X-Google-Smtp-Source: ABdhPJw1JGdbPPuEEkOWdp72gOM1ahgIOoxvaklK9HwXG7IGdQ60CqpEKz5TGF11UDeZxqwBrNvBhg==
X-Received: by 2002:a17:906:3f88:: with SMTP id
 b8mr13913431ejj.36.1616740876082; 
 Thu, 25 Mar 2021 23:41:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id ci22sm125325ejc.54.2021.03.25.23.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:41:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v5 0/9] soundwire: qcom: various improvements
Date: Fri, 26 Mar 2021 06:39:35 +0000
Message-Id: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
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

Thanks for reviewing v4 of this patchset!

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

Changes since v4:
	- exported sdw_slave_add as kernel test robot reported error

Srinivas Kandagatla (9):
  dt-bindings: soundwire: qcom: clarify data port bus parameters
  soundwire: qcom: add support to missing transport params
  soundwire: qcom: set continue execution flag for ignored commands
  soundwire: qcom: start the clock during initialization
  soundwire: qcom: update register read/write routine
  soundwire: qcom: add support to new interrupts
  soundwire: export sdw_compare_devid, sdw_extract_slave_id and
    sdw_slave_add
  soundwire: qcom: add auto enumeration support
  soundwire: qcom: wait for enumeration to be complete in probe

 .../bindings/soundwire/qcom,sdw.txt           |  20 +
 drivers/soundwire/bus.c                       |   4 +-
 drivers/soundwire/qcom.c                      | 529 ++++++++++++++----
 drivers/soundwire/slave.c                     |   1 +
 include/linux/soundwire/sdw.h                 |   2 +
 5 files changed, 443 insertions(+), 113 deletions(-)

-- 
2.21.0

