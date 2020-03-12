Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57C3183C9A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 23:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB941779;
	Thu, 12 Mar 2020 23:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB941779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584052582;
	bh=C86TYpnqbrA6cD0FZ7X60CclB5cUmVpHjBgTbsFDX50=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFu0ON3fVYEFE+t6Gakt+Jbs0Oe08/MUsEm9xBDtjI+0Q62l9fjAdMKIttrobPNV5
	 a45O7rKDm7BS9zfrB0nQ28zhSc3PgtQB2Fm4pXJ+WiiEwI5AWwjq6xWTEFfkbWVZ70
	 6UXpcV8m/roFB51h1cFU38UMtSk0OWqZ2GtANkwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1ADF80292;
	Thu, 12 Mar 2020 23:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E72F8028B; Thu, 12 Mar 2020 23:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A02F80273
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 23:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A02F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="YSPFRA/M"
Received: by mail-wr1-x441.google.com with SMTP id s5so9689109wrg.3
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cdz1LFOuab0jNRbzTq73NrqK6B+wszwWghkMP0+ST4=;
 b=YSPFRA/Mj5hu1kq6SzfqDihHCyZ3cPjjL2R3uOgcx667Cs8k5bOZQ4keT8vtZBMPs3
 4tC5YK+bcY4lIubGuJ+oZIDqrz8rbNw01mKIEJThYNZMhw6sS2SwXOYk12MLbALHeTwn
 7wkeaigHRRe4wJNdc7SVB/D4erJ2kUxD9SssI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8cdz1LFOuab0jNRbzTq73NrqK6B+wszwWghkMP0+ST4=;
 b=ia7jPLzN05h8Eq4NeNfWSgge4Cv6tXPi3034/JXj7vEK3rHkwKfiDCgcMNymjM8QJD
 V8+t+hyIG3mCxamxqJhyT22Nh7xOXRklipOShvwX0wnlQjHE2R6GeQ0T1HjrUczpXVJF
 eCa+tczueUoPEp3rICGMdy2UTkF2fk8dEQZsEvNPp107Gps9zKHBhqEE7cAeAIhHB34K
 4v8VXLDmEwvmaHuzbwzYdMBVLLpmMqjfkF1BnmxhfL1RShZgxF/iqoiJHiDDKGQZT5BJ
 XBuRtQEniwcwKQ1Z+pTmJIgV2WsA+dT/N9jP0HkjoUaEXXf6fR9f7Fj8Ah+D8+vtiDkZ
 xK2Q==
X-Gm-Message-State: ANhLgQ1cdMjoVJmFcRLt/bXtt0a+CCMShpphjG+RzBlLoe4VFc5IY2xu
 SPO5aBdz2oBVsLoT/V1DP6oorQ==
X-Google-Smtp-Source: ADFU+vuNtV0lnm2+jA+dT1T640PomcvSoaj/op5jgEAEK0wuosbYcrQa5xp8y5tBq843mAikSXiPyw==
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr14128631wro.58.1584052391455; 
 Thu, 12 Mar 2020 15:33:11 -0700 (PDT)
Received: from kevin-Precision-Tower-5810.dhcp.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id
 o10sm2964144wrs.65.2020.03.12.15.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 12 Mar 2020 15:33:10 -0700 (PDT)
From: Kevin Li <kevin-ke.li@broadcom.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: brcm: add dsl and pon chip audio driver
Date: Thu, 12 Mar 2020 15:32:42 -0700
Message-Id: <20200312223242.2843-3-kevin-ke.li@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200312223242.2843-1-kevin-ke.li@broadcom.com>
References: <20200312223242.2843-1-kevin-ke.li@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Kevin Li <kevin-ke.li@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-kernel@lists.infradead.org
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

Changes in v2:
 * Make the comment a C++ one for license header
 * Remove all empty functions
 * Change all variable to use kernel coding style
 * Comment chip TX RX block independently generate I2S bus signals

Kevin Li (2):
  ASoC: brcm:  Add DSL/PON SoC audio driver
  ASoC: brcm:  DSL/PON SoC device tree bindings of audio driver

 .../bindings/sound/brcm,bcm63xx-audio.txt     |  29 ++
 sound/soc/bcm/Kconfig                         |   9 +
 sound/soc/bcm/Makefile                        |   4 +
 sound/soc/bcm/bcm63xx-i2s-whistler.c          | 317 ++++++++++++
 sound/soc/bcm/bcm63xx-i2s.h                   |  90 ++++
 sound/soc/bcm/bcm63xx-pcm-whistler.c          | 485 ++++++++++++++++++
 6 files changed, 934 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt
 create mode 100644 sound/soc/bcm/bcm63xx-i2s-whistler.c
 create mode 100644 sound/soc/bcm/bcm63xx-i2s.h
 create mode 100644 sound/soc/bcm/bcm63xx-pcm-whistler.c

-- 
2.25.1

