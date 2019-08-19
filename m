Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D695825
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608881678;
	Tue, 20 Aug 2019 09:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608881678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566285615;
	bh=7c9bVlGb6zT53vCE72XIIyHIM62KVrkPpVsGyxwQMs4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gTganTx3QN3k0QlQa9ECHSNLS7yasDNFXVVdc3sHfU7uUmRSZCegDGOCIWioSar86
	 PCVBBicmMnV1FvKtEaqaB3ihM3WGBRXKxX4mkeI6e9xEPh1TKja5COIZSdt+fYU9yH
	 zcJIxo2Q56hEXDuW67ozCtepntuxrbSCZVME9ic4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3E2DF800BF;
	Tue, 20 Aug 2019 09:18:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2291F8064C; Mon, 19 Aug 2019 21:35:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54545F802BE
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54545F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l8OJWcmu"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62E72206C1;
 Mon, 19 Aug 2019 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242732;
 bh=8vRsvS2UGGwvEnAdIxjo2i3ETJRhz5Wf5lCbKvVguOs=;
 h=From:To:Cc:Subject:Date:From;
 b=l8OJWcmughWZuDP3/XDpGNVsTiZDTfTDaJoWhgDX7iEKwDp3iUkFyIwxIpEObvfDB
 Dxtbxko+4GaOBxk8wZiQ13pSL+1HsW8evfVGhzlbp8+WJPdkAHfJonqwQRp8KVAmtK
 v71cIdSd3diqeCyi3v7A/LtO6rFr8tZgxPKslgh0=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:07 +0200
Message-Id: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:28 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 00/21] ASoC: sun4i-i2s: Number of fixes and TDM
	Support
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

From: Maxime Ripard <maxime.ripard@bootlin.com>

Hi,

This series aims at fixing a number of issues in the current i2s driver,
mostly related to the i2s master support and the A83t support. It also uses
that occasion to cleanup a few things and simplify the driver. Finally, it
builds on those fixes and cleanups to introduce TDM and DSP formats support.

Let me know what you think,
Maxime

Marcus Cooper (1):
  ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs

Maxime Ripard (20):
  ASoC: sun4i-i2s: Register regmap and PCM before our component
  ASoC: sun4i-i2s: Switch to devm for PCM register
  ASoC: sun4i-i2s: Replace call to params_channels by local variable
  ASoC: sun4i-i2s: Move the channel configuration to a callback
  ASoC: sun4i-i2s: Move the format configuration to a callback
  ASoC: sun4i-i2s: Rework MCLK divider calculation
  ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
  ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs
  ASoC: sun4i-i2s: RX and TX counter registers are swapped
  ASoC: sun4i-i2s: Use the actual format width instead of an hardcoded one
  ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs
  ASoC: sun4i-i2s: Fix the LRCK polarity
  ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t
  ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t
  ASoC: sun4i-i2s: Fix the LRCK period on A83t
  ASoC: sun4i-i2s: Remove duplicated quirks structure
  ASoC: sun4i-i2s: Pass the channels number as an argument
  ASoC: sun4i-i2s: Support more channels
  ASoC: sun4i-i2s: Add support for TDM slots
  ASoC: sun4i-i2s: Add support for DSP formats

 sound/soc/sunxi/sun4i-i2s.c | 660 ++++++++++++++++++++-----------------
 1 file changed, 372 insertions(+), 288 deletions(-)

base-commit: d45331b00ddb179e291766617259261c112db872
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
