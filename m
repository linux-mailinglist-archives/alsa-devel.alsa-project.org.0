Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581832874EC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 15:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BB516AF;
	Thu,  8 Oct 2020 15:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BB516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602162480;
	bh=JlpaLOvzDt9+tdcahsRazMNyJRvQxeKZiHA5zkXI7Jg=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KO3m3xUuzSTXsIJybztV13kX7CtigvSeyDs0B2KWhrVu4WICgrenWntQ1jsRQH+iF
	 x65+m5Vwv48qFBhTLt7Oc7lvFK4IDMe6mnE/Aa/ppzb0ltIY+JMcq/31SzYJVAmFTJ
	 XPKyxWkGNPuQiz3thBhtL/VlYTcq8qEYwRFRETmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC150F8015B;
	Thu,  8 Oct 2020 15:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE43F80164; Thu,  8 Oct 2020 10:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.lineo.co.jp (ns.lineo.co.jp [203.141.200.203])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62AC1F8015B
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 10:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AC1F8015B
Received: from [172.31.78.0] (unknown [203.141.200.204])
 by mail.lineo.co.jp (Postfix) with ESMTPSA id 9872580214FF9;
 Thu,  8 Oct 2020 17:47:21 +0900 (JST)
From: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH 0/6] spelling: Fix typo related to "arbitrary"
To: linux-kernel@vger.kernel.org
Message-ID: <4dea2b7e-31b9-a231-7fa2-9ee7ffd37686@lineo.co.jp>
Date: Thu, 8 Oct 2020 17:47:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 08 Oct 2020 15:06:18 +0200
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Samuel Chessman <chessman@tux.org>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Lucas Stach <l.stach@pengutronix.de>
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

I found some typos related to "arbitrary".

s/abitrary/arbitrary/
s/arbitary/arbitrary/

This series fixes them.

These typos have been reported in the past in other codes, but
correction 'abitrary||arbitrary' wasn't added to scripts/spelling.txt.
Therefore, PATCH #6 adds it to spelling.txt.


Naoki Hayama (6):
  net: tlan: Fix typo abitrary
  dt-bindings: pinctrl: qcom: Fix typo abitrary
  dt-bindings: pinctrl: sirf: Fix typo abitrary
  ALSA: hdspm: Fix typo arbitary
  drm/etnaviv: Fix typo arbitary
  scripts/spelling.txt: Add arbitrary correction

 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt    | 2 +-
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c                           | 2 +-
 drivers/net/ethernet/ti/tlan.c                                  | 2 +-
 scripts/spelling.txt                                            | 1 +
 sound/pci/rme9652/hdspm.c                                       | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.1
