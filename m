Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE162083B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 05:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA9D20B;
	Tue,  8 Nov 2022 05:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA9D20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667881708;
	bh=y8AAa1GpChPWZ/YKTtzAB8RcDvjqGCoUhM7seAZbyrQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bNAb6DEwCbWL96CxpXWNQIZIOtgbrLccCWH0RJI8tCnvYfCYb8zsaUGAygt0jBy9M
	 OrKOChEDUKLvPZHSYkoGnWBlw6LRp8RsrW8IPEqDFHVcXEmoUyq8uAaTu7R2km9qge
	 J1dtnVRd2Y40C3qdfOtdMCLmy7hxi4vgJXGkobG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4573CF8020D;
	Tue,  8 Nov 2022 05:27:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D8F7F801D8; Tue,  8 Nov 2022 05:27:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ED10F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 05:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED10F8016A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="1mGeDBly"
Received: by mail-pg1-x535.google.com with SMTP id 136so8510444pga.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 20:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j6096okKnM3LniZ6Nj0Sm7F7LQMDqNvSSnwZPCnhiw8=;
 b=1mGeDBlyTC13IDKQ7R/QnajcvqgJQfgZKF9EJFcZ1Wv3Zg+6kOzzFohV0Ws7IJWOwo
 P7c6++vGOIY0iOFd66JNFjfUpRRy0GGBQit8XrrPez1kAinal56iOnsD/f2H837IL33V
 pYQ1aPuaRQkDphfxjqVMUBCJWj7kwyI6RcWluOCaotT7PT4QcCYUC7K3sKqMoMEIpCkw
 dUJNDHipjWv5gTpwh04xssT+K9UidBxu0eBRhBKoCrbniH+8+0HvzASN3lggPLByED4b
 bv/mxlSmFxHvt4laSlPrqcUK0uioyQ/nfDfmoW6UWCMuEF6l5pUu1bQ7Gac8EudYQSEY
 iVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6096okKnM3LniZ6Nj0Sm7F7LQMDqNvSSnwZPCnhiw8=;
 b=uo9TEPVm6b6LXvXFdg1g3w0l0ADpJQUktCFh11R+iqIdZHZqZ+/9ITT+m1iogJxzv7
 RlllKp56aCjE79u0slA3BBLh2/QPdEanqdMN3t2xA4N75U4FSUVNJur0BqkJtCtoPl9W
 De+0FxcrgCq9bRoEEgp28pBjTsEuuLekp76XR6vbiduPg7tJaZf9DHtC0Kf/v9nSX0Xp
 0NZAoBN9kNu1ektXrpTXAZa92TFYSuH03U6CoNj0tUe5oF1ZSccKvUzUtdyxYIHlIdJk
 taKOLd2GYOiKmjJi+XBid3VzPxrMwgSuhXMA8P85NW12P2CQbF7KDNAwcmYZ9TvCkvpb
 qq9A==
X-Gm-Message-State: ACrzQf1uamQ3XSY1uxQwMEieWlId+SswKetzEMBZ8+U5Vzp7edJ8A2vq
 paPolxaIjgJK9t+LDQjTipIaXg==
X-Google-Smtp-Source: AMsMyM57qEEZLOfYjTD7nChVxavKbgKE3kQblo1X8M0SPae/WSCgHhVjERi7H1bdIYn7+pzFRkuGVA==
X-Received: by 2002:a62:ea09:0:b0:562:a86f:63af with SMTP id
 t9-20020a62ea09000000b00562a86f63afmr55027060pfh.71.1667881643602; 
 Mon, 07 Nov 2022 20:27:23 -0800 (PST)
Received: from localhost.localdomain (118-167-183-234.dynamic-ip.hinet.net.
 [118.167.183.234]) by smtp.gmail.com with ESMTPSA id
 j63-20020a625542000000b005627868e27esm5265945pfb.127.2022.11.07.20.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 20:27:23 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Adds the combination of headset codec ALC5682I-VD +
 amp rt1019p
Date: Tue,  8 Nov 2022 12:27:14 +0800
Message-Id: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, David Lin <CTLIN0@nuvoton.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

v1:
- machine driver: 
  - Adds the combination of headset codec ALC5682I-VD + amp rt1019p.
  - Remove the duplicate code in machine driver.

Ajye Huang (2):
  ASoC: Intel: sof_rt5682: add support for ALC5682I-VD with amp rt1019p
  ASoC: Intel: sof rt5682: remove the duplicate codes

 sound/soc/intel/boards/sof_rt5682.c               | 7 +------
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.25.1

