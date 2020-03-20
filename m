Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4C18D9E0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 21:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 477741663;
	Fri, 20 Mar 2020 21:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 477741663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584737883;
	bh=0WQiTEHYgEtBwIpSWqAEF5FJBUQmciJOuiMTeTKcjwk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JlhyBCzot5SYdOU/7eGaap0ocGCeb8AvNQaZlwZXcAaibk+58CSD/3M4q3XPo81SZ
	 R2Hyum7CPtgsvy4Q/w9PuLZF4DMIfFFsBfb+mS1nWPwIij+tBR9e6PQO9ydW0CVxb7
	 EIBrKrTE8WdaTfOkDba7EMUQEW/mkCQm1Tihh+3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57003F80162;
	Fri, 20 Mar 2020 21:56:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 631E3F80162; Fri, 20 Mar 2020 21:56:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB3E4F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 21:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB3E4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vY+bwhQo"
Received: by mail-lf1-x143.google.com with SMTP id c20so5669743lfb.0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxFdW9v6W+mUSjXzjhOErZqVKviF3hnRVIcHD83c/Zk=;
 b=vY+bwhQolKHP/YjRpTOkMg1e6CoOyk67/iB6jpyUgrJCPci7UOwuh+sKhreTuHQTCv
 c38CESG7MX4X45BHD0eL/p+NFlCsXM1SX61hZO71M02CiRJlceCXqDpfcAd5SwaKz0PU
 4PfeoLJonCrD/eVWKOoFpW8fW/qNDK5+S7ovPE22wqQXkcl5efMOTtAN6QrM6eH1Yri/
 M3OlY6nQt3vDHzzKScafmPyMaj8D0+ISuqD/JOuZ2ivxGBADIAtPVTLxKIGpiB7TMA2e
 jYjH/aZUApEEqtSb5OS9N+jFZ+48la0aiKHP3NDTZbFUNj7YdCAEu04pyzCmbEreh3Pf
 qZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxFdW9v6W+mUSjXzjhOErZqVKviF3hnRVIcHD83c/Zk=;
 b=eeqcryXhB1daQFs9of61aCDnCKEwJhx4bYconZAVap+u+pQjF6nyp4G3HknvPp37x+
 tbOIEdj4IEoGrrxiVmasG4e9EOONyppG/mUMNjhkdQtwr7+13WxVZUOzeIH+pRZltnQ9
 OZCGkD+gyxuLhxWQyDG1kZOvWZNF2Q2+29jgIf197LnptCyDRGGm9J5E1nOejaeMaCrG
 3TgH5l4b2Xi7BlovnQhuHkQ/DWgSgZJhJe1hCTX4eKyrdIraLwO2sWXtv0XUxAaMMXuc
 lZ0Kkqd/uUtUjvNqt3WQJHDtuiskLB6yAg32thnPeFabnaeWXY+Qz2QbPO1D/x9UJOPj
 F1Hw==
X-Gm-Message-State: ANhLgQ1MC5by7AXDEjvGyQrlOElN7POJ6f2fI3dODnX7VCZC1oSBeOnL
 qCLwLMOHlPDmApQyTTatHhA=
X-Google-Smtp-Source: ADFU+vv3bRJa6nnY4LiRKhr6qR2D1OtfWKdszUzJ8w497f3yhm9cYDRehnMPg0u2rUV4MVq8hoR0gw==
X-Received: by 2002:ac2:5203:: with SMTP id a3mr6492154lfl.152.1584737774394; 
 Fri, 20 Mar 2020 13:56:14 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id 1sm3873356lft.47.2020.03.20.13.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 13:56:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 0/2] Support built-in Mic on Tegra boards that use WM8903
Date: Fri, 20 Mar 2020 23:55:02 +0300
Message-Id: <20200320205504.30466-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hello,

This small series adds audio route for built-in microphone on NVIDIA Tegra
boards that use WM8903 CODEC. In particular this is needed in order to unmute
internal microphone on Acer A500 tablet device. I'm planning to send out the
device tree for the A500 for 5.8, so will be nice to get the microphone
sorted out. Please review and apply, thanks in advance.

Dmitry Osipenko (2):
  dt-bindings: sound: tegra-wm8903: Document built-in microphone audio
    source
  ASoC: tegra: tegra_wm8903: Support DAPM events for built-in microphone

 .../sound/nvidia,tegra-audio-wm8903.txt        |  1 +
 sound/soc/tegra/tegra_wm8903.c                 | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.25.1

