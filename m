Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5133124D8
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 15:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F5331688;
	Sun,  7 Feb 2021 15:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F5331688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612709529;
	bh=ZuA6mkFoPJc05KffoGWbOh2Hd350IRjeANXyW3oiLzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNPzD9nZgwNwNt4bs1RTtK+4JngWwIY830BsPxsXG9xPoWj2yrEZzoKoOVloCetGH
	 pEi938OxzSrK9dkG4KfdDgxp2K80jaO33TU8QL8ziF7mLK5/RHEJn61LhnBSH+LfYN
	 cNzaqHHcz9ISGqgH8t/OVhW7wgBWwOFmJpAHPjdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6EAF80139;
	Sun,  7 Feb 2021 15:51:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C67C8F801EC; Sun,  7 Feb 2021 15:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE5CF8016B
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 15:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE5CF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ap68n+au"
Received: by mail-ej1-x630.google.com with SMTP id bl23so20630496ejb.5
 for <alsa-devel@alsa-project.org>; Sun, 07 Feb 2021 06:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkleRZJBKyLZJuTUE3JaxeJgSw+9WtyguiUk2zRc9iY=;
 b=ap68n+aukbg2nw8AXwXDmnUe+pAEkQO0jAoROhsr/b79cRU006nD9knUGSZaaedfDD
 GOo6ogQYJrcWvT9C/BSHPNkGhQZAwxHrSFHRjtBnZmBtLCjqecw4WEJ84llc1DQFJr1F
 My6i29uYxATcvJTs84C8dwWoio+kojUNvQy9GmdifqxsxBbok/5sy/+Inbo9mM08haFC
 hI/o6agRjaBq2PtHfsJEqQfLqTl6N/PnUrDDgRxy5pHJ9KlFwFi8lcDeqig0HcU4T6WU
 zrlAhlcRkzkE4hB5c7jA3cTG0PE7usefwZun/z2GbZjAtk1DCk+2fBW6w/pP7B59vcvi
 tsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkleRZJBKyLZJuTUE3JaxeJgSw+9WtyguiUk2zRc9iY=;
 b=CvPLdQYCkymis389lQPTIgN9SHE4PpybdAClEUAT+Z5ar5RTJLRAZk8D+W7ubqqs/b
 cP80Bnu4xd5fu7AuSTChn5BYnCZG8ipNTZBy6hDZ0vZR7I+7kE8JmqfEUwrzc3y0yxal
 72PyN1f4JrdpGO1h8O/9KNhE86sL2l+7Dc69X6QdjpDQgvq5ExQJlTPtx0/WKWuHI5Jd
 tr0VXa7m6HJmPSSwPhrMPZK9HzpXf+hFoliXUSb0A16gECIjaH3G8pdl7njNQSh2MZCf
 MWlCStbXb32BVQSefgDZNWEksCnGigHJRk2qCN2zaz2qCsjshx+ELgDDNCwPwrHbdrBK
 Tw/w==
X-Gm-Message-State: AOAM531Qwqd/9NozVRe6uYIInlaRAhCbsMHO4UuXf16z4PH3VU5cjiyt
 94/75OhVDTbpzsKxdJXAr1ccMG93vCo81A==
X-Google-Smtp-Source: ABdhPJzvJEEBDc1mwjNPTpoj0PZZ4CD6AmRG3itGcnnh2XE3iakqMBa5B2IAQE8ScpR3uZMrizTa/g==
X-Received: by 2002:a17:906:547:: with SMTP id
 k7mr12940280eja.273.1612709465828; 
 Sun, 07 Feb 2021 06:51:05 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8388-1987-9380-4ad8-691e-003a-5a6e.cable.dynamic.v6.surfer.at.
 [2a02:8388:1987:9380:4ad8:691e:3a:5a6e])
 by smtp.gmail.com with ESMTPSA id x17sm7477161edd.76.2021.02.07.06.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 06:51:05 -0800 (PST)
From: Jasmin Fazlic <superfassl@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] alsa-tools/hdspmixer: enhance preset save and add
 hardware ouput loopback buttons
Date: Sun,  7 Feb 2021 15:50:46 +0100
Message-Id: <20210207145048.14580-1-superfassl@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2e9bb0b8-ee14-9dc9-1bd8-ecffca3982ac@gmail.com>
References: <2e9bb0b8-ee14-9dc9-1bd8-ecffca3982ac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jasmin Fazlic <superfassl@gmail.com>
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

The main focus here was to give the user the ability
to toggle the hardware output loopback state available
with following driver patch:
https://github.com/tiwai/sound/commit/da2a040ee7cfe1dd57d5bec7906cb979c5787a86

Since the state is added to the saved preset file at the
end, old versions of this tool can still read the preset
file. Furthermore to not lose this new data should the
user accidentally or willfully save the preset with an
older version of the tool, the save routine was altered
to keep any extra data in a possibly present preset output
file.

Jasmin Fazlic (2):
  alsa-tools/hdspmixer: enhance saving of presets
  alsa-tools/hdspmixer: add output loopback buttons

 hdspmixer/pixmaps/loopback.xpm        |  69 ++++
 hdspmixer/pixmaps/output.xpm          | 498 +++++++++++++++-----------
 hdspmixer/pixmaps/output_r.xpm        | 498 +++++++++++++++-----------
 hdspmixer/src/HDSPMixerCard.cxx       |  34 ++
 hdspmixer/src/HDSPMixerCard.h         |   2 +
 hdspmixer/src/HDSPMixerLoopback.cxx   | 133 +++++++
 hdspmixer/src/HDSPMixerLoopback.h     |  48 +++
 hdspmixer/src/HDSPMixerOutput.cxx     |   1 +
 hdspmixer/src/HDSPMixerOutput.h       |   3 +
 hdspmixer/src/HDSPMixerOutputData.h   |   1 +
 hdspmixer/src/HDSPMixerOutputs.cxx    |   4 +-
 hdspmixer/src/HDSPMixerPresetData.cxx |   1 +
 hdspmixer/src/HDSPMixerPresetData.h   |   1 +
 hdspmixer/src/HDSPMixerPresets.cxx    |   2 +
 hdspmixer/src/HDSPMixerWindow.cxx     | 166 +++++++--
 hdspmixer/src/Makefile.am             |   2 +
 hdspmixer/src/defines.h               |   2 +-
 hdspmixer/src/pixmaps.cxx             |   1 +
 hdspmixer/src/pixmaps.h               |   1 +
 19 files changed, 995 insertions(+), 472 deletions(-)
 create mode 100644 hdspmixer/pixmaps/loopback.xpm
 create mode 100644 hdspmixer/src/HDSPMixerLoopback.cxx
 create mode 100644 hdspmixer/src/HDSPMixerLoopback.h

-- 
2.27.0

