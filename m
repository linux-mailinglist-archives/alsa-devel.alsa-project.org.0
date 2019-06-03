Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6753372D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B856D166A;
	Mon,  3 Jun 2019 19:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B856D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584168;
	bh=7isTVk7ZiRAvXJBxymfLLQlbL0JNpgUjnsK5f+pNvvk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jNL4M3y31TtJlUwKVifxXbo86yOtddrsG2Rioz80XR1gj3JiSo40NSBiw5mgnAuhH
	 uvJjB7nRVUBj9bCa81Tz4EaAnnRMb6IeMRoaOOcldLtD1MqetJNVi34JsZIa8pbJJn
	 ZqCoEPrfeh0QuJIg05bLS2WFGmwgpS5jOw2YgNGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 825ACF8972E;
	Mon,  3 Jun 2019 19:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F96BF896ED; Mon,  3 Jun 2019 19:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E2EF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E2EF80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mqTz1839"
Received: by mail-lf1-x141.google.com with SMTP id u10so7251952lfm.12
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1Dtl9xXT8tEGwrUxBzQBfGddt3tp9MI+UPqkpN1WN0=;
 b=mqTz1839SvTGVA6JMBG6+XjE0xYwF2fSddZ7+seYCgdrXgukg0+NU1E4tXpmGF15Im
 UZJXC+yUDioaBsN6la1dNtjTzmPzvL4teQe+GSwWL7g0C0GQ8xS+7Y5L2BBcCfXp+86x
 wmMcAuVi4hbPPf8Pu4a/f2A02J0NXA367FrEGeAtR7D+OzvyqwIKbnX6pmohPchdxcab
 om1NVhjh5ihdIMLobhgkrDeIrhVafIUwILMNvwzW9QzXJf7xfvMfpFZqOPjCRzZdWpdS
 xCDuNsMcjH7LJDGLtHTp/dy+CwlmAJLQAjPt9FsfMow6RPEaUZ3hCIdNIW31jvDpVBA0
 Et6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1Dtl9xXT8tEGwrUxBzQBfGddt3tp9MI+UPqkpN1WN0=;
 b=IovU5YbsCLxVJsdC6Asp6vgi8MLxwa5IHDuiPMDZGiTk5NwR59W5qCSTmqb/4+VKWD
 ZpEksHpQCBgjYM52Gf5UgzNL1C0yl7LZuByN+3Ro+UH7Hr0sSO0SePYQ7TIKUlftt4sf
 yrDJYcMSO6UXlfGGM0WYDmkstfLtYupCeu9HB5dneVGGvGrkGmFLRh+yBTIGXJBL91cD
 UGks4R3yDnvZkehiS2lYnjveVvGnNeVQfNd48FBwLUiLSRQXXtCiKqXVpx7rdFUK01pi
 IMLJcbczHvO0QOIz2xRaBhTH/IhmcfT4t1YUHNowng89Ci9GAwPSAy5I8nYQKBrZXIjO
 mglA==
X-Gm-Message-State: APjAAAUHFoZzZGXE4xHe+oeVC49PCG/LX0x35LUYH7QC7WF0a+YTLUCM
 CEEs9FiH/7BEKWln0d7FdHI=
X-Google-Smtp-Source: APXvYqxCQNjDQHJYWJnJyGea/doMquTKfXFLsAZndtY60a6k8pR2NhL8Rsw2Q/prcSP3U/G6IrOLRg==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr15110769lfn.184.1559584057528; 
 Mon, 03 Jun 2019 10:47:37 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:36 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:26 +0200
Message-Id: <20190603174735.21002-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 0/9]ASoC: sun4i-i2s: Updates to the driver
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

From: Marcus Cooper <codekipper@gmail.com>

Hi All,

here is a patch series to add some improvements to the sun4i-i2s driver
found whilst getting slave clocking and hdmi audio working on the newer
SoCs. As the LibreELEC project is progressing extremely well then there
has been some activity getting surround sound working and this is included.

The functionality included with the new patch set has been extended to
cover more sample resolutions, multi-lane data output for HDMI audio
and some bug fixes that have been discovered along the way.

I can see more usage of the tdm property since I last attempted to push
these patches and the examples currently in mainline sort of the opposite
to what I'm trying to achieve. When we first started looking at the i2s
driver, the codecs that we were using allowed for the frame width to be
determined based on the sampling resolution but in most use cases it
seems that a fixed width is required(my highest priority should be to get
HDMI audio support in). We're using the tdm property to override the old
way to calculate the frame width. What I've seen in what has already been
mainlined is that the i2s driver has a frame width that is fixed to 32
bits and this can be overridden using the tdm property.

I still need to investigate the FIFO syncing issues which i've not had a 
chance to change or address the concerns that broonie and wens brought up.
This change has been moved to the top of the patch stack.

BR,
CK

---
v4 changes compared to v3 are:
- Moved patches around so that the more controversial of patches are
  at the top of the stack.
- Added more details to commit messages.
- Fixed 20bit audio PCM format to use 4 bytes.
- Reduced number of flags used to indicate a new SoC.

v3 changes compared to v2 are:
 - added back slave mode changes
 - added back the use of tdm properties
 - changes to regmap and caching
 - removed loopback functionality
 - fixes to the channel offset mask

v2 changes compared to v1 are:
 - removed slave mode changes which didn't set mclk and bclk div.
 - removed use of tdm and now use a dedicated property.
 - fix commit message to better explain reason for sign extending
 - add divider calculations for newer SoCs.
 - add support for multi-lane i2s data output.
 - add support for 20, 24 and 32 bit samples.
 - add loopback property so blocks can be tested without a codec.


Marcus Cooper (9):
  ASoC: sun4i-i2s: Fix sun8i tx channel offset mask
  ASoC: sun4i-i2s: Add offset to RX channel select
  ASoC: sun4i-i2s: Add regmap field to sign extend sample
  ASoC: sun4i-i2s: Reduce quirks for sun8i-h3
  ASoC: sun4i-i2s: Add set_tdm_slot functionality
  ASoC: sun4i-i2s: Add multi-lane functionality
  ASoC: sun4i-i2s: Add multichannel functionality
  ASoc: sun4i-i2s: Add 20, 24 and 32 bit support
  ASoC: sun4i-i2s: Adjust regmap settings

 sound/soc/sunxi/sun4i-i2s.c | 242 ++++++++++++++++++++++++------------
 1 file changed, 164 insertions(+), 78 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
