Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB473B582
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6147F892;
	Sun, 28 Apr 2019 09:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6147F892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436816;
	bh=nzM50S6Akw1b6uChjRxzTO5HUJXhlRHLm5mYl07G4o4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bnug7+0sVLDEWGC4L+5lY+Mskdw/g6xTAOkEZQ7VDe7HLvCYUXcfw2/Pi3qpxRxwb
	 HjLtb2D2avtUs9nZ90aG5Zim1ZycnIwyBcNljhheRJMEQL1XBVEVB3H74C2J7vkHQ7
	 dOBeNPE+zKHLSQGrAwZMhu5qRo8KlO7rWMb6HpJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD9DF89721;
	Sun, 28 Apr 2019 09:30:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E377F896DB; Thu, 25 Apr 2019 07:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688FFF80C41
 for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2019 07:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688FFF80C41
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="g7DsbdZE"
Received: by mail-qt1-x843.google.com with SMTP id p20so23118152qtc.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2019 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bes2O0Ix7dqgSxsVxUY8gAIpWunOoHLCqTDP5AHA/iQ=;
 b=g7DsbdZE1NezLukQkiFmKBO12Htp3NwcWLxh/z3qX/uoS2IVvANinEIKTSRV+H/poG
 BUOmyjJg6CwWM+iQzI3tmT1b+hZ1nyNa6Cn7bswcdsXitXaiHcZ/4HtswOkjRg8XL8bo
 qKio0c/Rt4JRO4hbh7CPq7jHdpPVXGwdm6lXGm0mzc5uQsEiX7qzQdhh1HMiyl6Td2LX
 tUVN/5gGQJ5GqxJli9TWb5sft94S1omjr+Kqi9G309zJ2TS8NmBaUPDyhCShRmdYBY8Y
 oErlh3p7kJw27BK+Z+hsDkPUIZ/53leoe/HdXdlaUDMcli2bqA2PugefnxTnZVcijaue
 G6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bes2O0Ix7dqgSxsVxUY8gAIpWunOoHLCqTDP5AHA/iQ=;
 b=ndCgHO5faV101mfJJUisZ/M1FrdxQl8+rXmLfBeYGZlqjI5P4Dl65SuzJkpf0yNuL4
 sihEj8eHOGk8ysBy0ytN/M079AilH6/t6XZYYL7lH6MwlhiUazdvMY66o3rHWGL+vtr9
 fuHNVV/GO5NuNZQBxPSJNqyMwXE3w+TLEGZxwhEA33BuwwfXJbhTd4RQ2En8L2bfuJL/
 yS2u1J1IUmFfv04S17E4C9d2Hq+PACPSgeH3SPBcG6yMbSp5owrUGOy39lb+UM715Z2V
 cq7BiYZZAnhT6ytrdInde1M2G3yPEz3cRJgNRFRnMRB3Qe+eqiPHNzc5a121lef9Kj7F
 hlwA==
X-Gm-Message-State: APjAAAVy4qKuwvqwI8ZQUhJti9LsEn4NFoAJOVrt9CCZnIDhBN83Uw1q
 Wla9oz7bTxqTA863usrMzq7VdQ==
X-Google-Smtp-Source: APXvYqxE4GA2/GUJanrd9N9UADU+nT0R4wxYOlg12nupj6xQLNwcP5COcyCOxjZUaTgyo7TLB7b+0A==
X-Received: by 2002:a0c:add2:: with SMTP id x18mr28972986qvc.23.1556171399054; 
 Wed, 24 Apr 2019 22:49:59 -0700 (PDT)
Received: from ts-system.timesys.com ([49.207.191.18])
 by smtp.gmail.com with ESMTPSA id w58sm9470720qtw.93.2019.04.24.22.49.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 22:49:58 -0700 (PDT)
From: Logesh Kolandavel <logesh.kolandavel@timesys.com>
To: support.opensource@diasemi.com
Date: Thu, 25 Apr 2019 11:12:49 +0530
Message-Id: <20190425054249.5675-1-logesh.kolandavel@timesys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, logesh.kolandavel@timesys.com,
 Adam.Thomson.Opensource@diasemi.com
Subject: [alsa-devel] [PATCH] ASoC: da7213: fix DAI_CLK_EN register bit
	overwrite
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

From: Logesh <logesh.kolandavel@timesys.com>

If the da7213 codec is configured as Master with the DAPM power down
delay time set, 'snd_soc_component_write' function overwrites the
DAI_CLK_EN bit of DAI_CLK_MODE register which leads to audio play
only once until it re-initialize after codec power up.

Signed-off-by: Logesh <logesh.kolandavel@timesys.com>
---
 sound/soc/codecs/da7213.c | 4 +++-
 sound/soc/codecs/da7213.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 92d006a5283e..306e01684bda 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1305,7 +1305,9 @@ static int da7213_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* By default only 64 BCLK per WCLK is supported */
 	dai_clk_mode |= DA7213_DAI_BCLKS_PER_WCLK_64;
 
-	snd_soc_component_write(component, DA7213_DAI_CLK_MODE, dai_clk_mode);
+	snd_soc_component_update_bits(component, DA7213_DAI_CLK_MODE,
+			    DA7213_DAI_CLK_POL_MASK | DA7213_DAI_WCLK_POL_MASK,
+			    dai_clk_mode);
 	snd_soc_component_update_bits(component, DA7213_DAI_CTRL, DA7213_DAI_FORMAT_MASK,
 			    dai_ctrl);
 	snd_soc_component_write(component, DA7213_DAI_OFFSET, dai_offset);
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 5a78dba1dcb5..9d31efc3cfe5 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -181,7 +181,9 @@
 #define DA7213_DAI_BCLKS_PER_WCLK_256				(0x3 << 0)
 #define DA7213_DAI_BCLKS_PER_WCLK_MASK				(0x3 << 0)
 #define DA7213_DAI_CLK_POL_INV					(0x1 << 2)
+#define DA7213_DAI_CLK_POL_MASK					(0x1 << 2)
 #define DA7213_DAI_WCLK_POL_INV					(0x1 << 3)
+#define DA7213_DAI_WCLK_POL_MASK				(0x1 << 3)
 #define DA7213_DAI_CLK_EN_MASK					(0x1 << 7)
 
 /* DA7213_DAI_CTRL = 0x29 */
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
