Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB207BF2F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B85916FD;
	Wed, 31 Jul 2019 13:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B85916FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572104;
	bh=K5Shxj6RRLMhobEETlD/6F0zu3S6i2mQWuvwV6c0FI8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=et0gztNIPUELUyV9T04qcEOsrxe+ZxH5x7rM/RJD4QiIdGJiI/zfRVPsM5b3mLvqe
	 EingtMk2BDXwV2ZxhU8Kj08rX/jnk3n0gHrFWBlnvftbboGpN10hSdn9IDJqO3gy+s
	 nBnfo78o1NShIHglQHJsb1469einPu0QHtYpQrwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A524F80440;
	Wed, 31 Jul 2019 13:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 869C2F80483; Wed, 31 Jul 2019 13:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0562F80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0562F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rFNQL9Ae"
Received: by mail-wr1-x442.google.com with SMTP id p13so69212442wru.10
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KcDf9JPXvVOUHUqnGxxJEbg/DckgQKkqSGJL2PojFY8=;
 b=rFNQL9Ae+WG2F0nAgGCxgs7LLf0Lvn49SXyS7ddcptDWNih/oCuwS7zooUVnRCu4de
 vsw+SyMfiV0Cv9bj7PWLe6rFhn/fDvwFSMY9R/yBxSHIRHO7O5TVo8XCdlHDXiYCkSm9
 TR6+cYqdSNeDT52PYDqLZe2F7Pv+V2N0pcmiKM0tu0uwtsjUGegoX8LJQYJonCdnscGC
 zymBNMSUqAW0ZuThwHD5JYahaJJRckQsLSCQmopyDUz+OFkU3t91CAZFFWssF9D7PTj/
 +/67jYMBho/x73ZY2CZ2gBmWarAvS/9a81qoifjNtUF/kei43/qaaZGfNnY6kVPbDS7u
 1zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KcDf9JPXvVOUHUqnGxxJEbg/DckgQKkqSGJL2PojFY8=;
 b=YnEUfLsV3ryhhrVh31jPJG3B6oXFjhOvVNdZIwVU5TkFu2bPrLbZn7g68dCm+d/aTO
 vkLacwfEkjOL1fxGLLlEpzNsS65IKCETbz+GA9CcFmwkpem3q1vPxJfr62M86MxV0hbn
 KJpAwC4BSB0mUpHiiPWyFNLgTUvLUuQgQX5yGJrVgFz4ldnVNLuQPucWuDIaMvnNQDx4
 SXAbL/F0jZwRyaupbaE93a1byDgU2OffhnV5vxYEdn/u+LkZKBhSOERQm24dAS1quaNH
 LzWwu9ZkemDaxebOorT3MlnS5PI1qEf8KQYoSxXwMqfUVE7+bc8vkzTSemkJFCgLsseU
 PsNQ==
X-Gm-Message-State: APjAAAWPNrqa5/A0eUhlBDzQg1x1BluyXK6CmdSiG7B8KcMl/Z3VrNk2
 wWrXf3rFdWb9SlFBCXOO2io=
X-Google-Smtp-Source: APXvYqyqXq6srNMThwdET1OBjnv0iw9Y8NEFRS4E/EE1rk9yKrazSMjmJXqsaTSy7P+uyvXCmHSP9g==
X-Received: by 2002:adf:c003:: with SMTP id z3mr50150385wre.243.1564571983946; 
 Wed, 31 Jul 2019 04:19:43 -0700 (PDT)
Received: from localhost.localdomain ([212.146.100.6])
 by smtp.gmail.com with ESMTPSA id b8sm88035205wmh.46.2019.07.31.04.19.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:19:43 -0700 (PDT)
From: Andra Danciu <andradanciu1997@gmail.com>
To: broonie@kernel.org
Date: Wed, 31 Jul 2019 14:19:28 +0300
Message-Id: <20190731111930.20230-1-andradanciu1997@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 daniel.baluta@nxp.com, kmarinushkin@birdec.tech, m.felsch@pengutronix.de,
 piotrs@opensource.cirrus.com, tiwai@suse.com, nh6z@nh6z.net,
 lgirdwood@gmail.com, paul@crapouillou.net, vkoul@kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, anders.roxell@linaro.org,
 rf@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: Add uda1334 codec driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The first patch contains uda1334 documentation.
The second patch contains the codec driver.

Andra Danciu (2):
  dt-bindings: sound: Add bindings for UDA1334 codec
  ASoC: codecs: Add uda1334 codec driver

 .../devicetree/bindings/sound/uda1334.txt          |  17 ++
 sound/soc/codecs/Kconfig                           |   9 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/uda1334.c                         | 295 +++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/uda1334.txt
 create mode 100644 sound/soc/codecs/uda1334.c

-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
