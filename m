Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F07608F2B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:14:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E315698ED;
	Sat, 22 Oct 2022 21:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E315698ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466061;
	bh=8YHRnMrwdY+bWPuyqInqkZFGMrTPYZtEoSkEM5r/n4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B1pcY5ekUGCiPPguH+4P3EpnM6O7hctKnVjZi5YyvE2t7GU9BHmbHbp2g7QoV8P3d
	 kpKV3oNobsDtEzSZe/ChBXnZ5j2w6o2Mi+e7g/p6jz+Kd5DO1THbOGlCrOxyKGCqdr
	 5TTNZBkO47rG3CX7/hHh/TKsnCAfAWWraO6z7bjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD9AF802DB;
	Sat, 22 Oct 2022 21:13:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E8E2F80246; Sat, 22 Oct 2022 21:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B739CF80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B739CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UnvqPBSd"
Received: by mail-wm1-x334.google.com with SMTP id jb18so836620wmb.4
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ognYeBAHyjV6DhEhzd6mofoEeOgyCKwh9lCaizz9hQ=;
 b=UnvqPBSdZK9Uxfvo8rI+n7WwpQ6NQM8pIJ3FUFJHTm+670JeuHmP2fokFK+z7ra4fW
 FmycXFCv77/+Ak+cAgoHtwf7qIgCCWuLzcr2QS7+fLnE0dhzrxq9VHcF0Akc0qk1f8cF
 EeqgXW6UnT1IoZJ0pURz9ukELufrEtmcu4PW1LH7Te6DrQM1Zw85YKskuqUPBeW1tMqg
 g1UbaY963fEPYLg/Q+pOlSgSP06qc6WH3UOlVUZcq14Mmd5pf/KwxmztASjJCrTRJCRC
 Lowxd2EgXH1TbuTIo8LRx9/Nodbes86RWEnaxBusyiTNPuEyp9So4PbTBALAU/ZU99VZ
 GKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ognYeBAHyjV6DhEhzd6mofoEeOgyCKwh9lCaizz9hQ=;
 b=Lo7rX93Uj7ccsLYIlDxMMW7HCxqhXE5Xvh4hZqKqDOWAf+WzYmgtTG6ItkizwqWoxW
 CVPVxzdAFLLzdpXmuqOsrJMGeVyZTLW2JxeuevKuoSojxzXDlqUmbkxdmOPW8NtaS/WQ
 41kXj4k8CLeWDRwiO9KvRtkxu7s359dgTinp+geqhPZCdDDLeRj5NoYE0FRUxyqXAlfG
 kVmWN43tGdB8TLhDBEY7+7wQhpYAVnwRYzH/h1MNOe5RnfGkxIHQhI3t5XxP9K47hv5G
 D/lO7A7nYjlbxOmVEKWvURKcsnp9W8Sj/uF7Wxycstb/Gm7T6EN9jni+f28+SfPsx3wf
 cfWg==
X-Gm-Message-State: ACrzQf16ISf6QxPyGLpRSSpEBLDnEe+kv416f5KBmLoM3Wc4Xmub4jGa
 Vom9bC6EyI+oN2j0qnDyJS4=
X-Google-Smtp-Source: AMsMyM4Fly1NOTAQ6nzGc+s1mhbV32J/ZMCVv2lX5yueZRU8qxEaYXhKxopnfxjaFDE8Dh8AVUjtmQ==
X-Received: by 2002:a05:600c:3b97:b0:3cc:c287:46fe with SMTP id
 n23-20020a05600c3b9700b003ccc28746femr1436984wms.148.1666466000037; 
 Sat, 22 Oct 2022 12:13:20 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a1cf706000000b003a4efb794d7sm6460794wmh.36.2022.10.22.12.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:19 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 0/9] ASoC: cleanups and improvements for jz4740-i2s
Date: Sat, 22 Oct 2022 20:12:59 +0100
Message-Id: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

This series is a preparatory cleanup of the jz4740-i2s driver before
adding support for a new SoC. The two improvements are lifting
unnecessary restrictions on sample rates and formats -- the existing
ones appear to be derived from the limitations of the JZ4740's internal
codec and don't reflect the actual capabilities of the I2S controller.

I'm unable to test the series on any JZ47xx SoCs, but I have tested
on an X1000 (which is the SoC I'll be adding in a followup series).

Changes in v5:

* Drop 'mem' resource removal patch already upstream.
* Update FIFO flush bits fix to address Paul's review comments.
* Drop PLL clock name patch, that needs a different approach.

Link for v4: URLHERE

Aidan MacDonald (9):
  ASoC: jz4740-i2s: Handle independent FIFO flush bits
  ASoC: jz4740-i2s: Convert to regmap API
  ASoC: jz4740-i2s: Simplify using regmap fields
  ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
  ASoC: jz4740-i2s: Align macro values and sort includes
  ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
  ASoC: jz4740-i2s: Support continuous sample rate
  ASoC: jz4740-i2s: Move component functions near the component driver
  ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops

 sound/soc/jz4740/Kconfig      |   1 +
 sound/soc/jz4740/jz4740-i2s.c | 455 ++++++++++++++++++----------------
 2 files changed, 243 insertions(+), 213 deletions(-)

-- 
2.38.1

