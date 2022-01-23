Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F64972AA
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jan 2022 16:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23332884;
	Sun, 23 Jan 2022 16:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23332884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642952529;
	bh=21hAEKB5ITqnWJ82zDve3NMTyIy0rPkf6oShD2WVPVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hkh9Wcbt3ZO0C5j0aUpcwwnbcMTv85Wjx4bAMB7IS94bkFHNYu0ctDC0uVNRut9fC
	 Ign9rn4s6ABRNCaWWsfRY1McT6YlUYPIZ3aECWMRcCxoKVRvWH648r2lSlv8CESVtf
	 /sQ4uZJE9uIlr884ychO4zgZCr3wfD78+LYrHfZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B44F804B0;
	Sun, 23 Jan 2022 16:41:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97096F800A7; Sun, 23 Jan 2022 16:41:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49507F800A7
 for <alsa-devel@alsa-project.org>; Sun, 23 Jan 2022 16:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49507F800A7
Received: from p508fcdea.dip0.t-ipconnect.de ([80.143.205.234]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nBez0-0005OB-FH; Sun, 23 Jan 2022 16:40:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>, Brian Norris <briannorris@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Date: Sun, 23 Jan 2022 16:40:43 +0100
Message-Id: <164295214821.418606.10125525976562860474.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
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

On Fri, 14 Jan 2022 15:02:06 -0800, Brian Norris wrote:
> This series fixes DP/HDMI audio for RK3399 Gru systems.
> 
> First, there was a regression with the switch to SPDIF. Patch 1 can be
> taken separately as a regression fix if desired. But it's not quite so
> useful (at least on Chrome OS systems) without the second part.
> 
> Second, jack detection was never upstreamed, because the hdmi-codec
> dependencies were still being worked out when this platform was first
> supported.
> 
> [...]

Applied as fix for 5.17, thanks!

[1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
      commit: b5fbaf7d779f5f02b7f75b080e7707222573be2a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
