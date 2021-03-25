Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5553348FDA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:30:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5BA852;
	Thu, 25 Mar 2021 12:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5BA852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616671836;
	bh=C2JhNr3EpRjgctxfTTCNtDfVHZHunRTxMC5fatgR2VQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rdn0GSLjl2OhgTAeA0A4WTIqb8S4DxveT/lbKoDCTbUGhdnfmrdKM3hNlvFo6YZ0w
	 y+tzCLGb4ttAnFe2b2Tq+SpA660fG6N7fQISfqorjPaoFB7IQQ9V81SVRdgO5sTp6L
	 9+ARbiCt52uqNaiyZLAFY4D76iWCzSIOCCP4KWAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAC8F80506;
	Thu, 25 Mar 2021 12:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 472D1F804FD; Thu, 25 Mar 2021 12:26:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC9CF8026F
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC9CF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VGhxV/Go"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BE0461A58;
 Thu, 25 Mar 2021 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671571;
 bh=C2JhNr3EpRjgctxfTTCNtDfVHZHunRTxMC5fatgR2VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VGhxV/GovUhgVVJNb8VHmbZfAkwDbmjEMLDxHyOw2q80Esp6ErKMYN+KgO+yKpTsS
 SKDIzPwEAsExwFsQemNMpy4WX0jvTrfai7dFd1Sl9+1mod4wLO7r8Shg4LCrbRyojT
 ArjuKy+sl6hyLDAERYodwxcrTE12UdcyLSnA2hKlKknvpp7du1PQ3hWtFg8mhkSq5b
 T1jAyV0KIPGF3qSLudY+fudkoQ8cttN8XcaF7/HOKGPj6pUVeCbOGAmCDPCC6oXM2Z
 Bd1Au2hZriI0rCJwmmcayWWQz98cLiTEGZ+08nm8lkpOtgesWLslB/dX8zQYuzk7pO
 fR/IspnB/8QJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/39] ASoC: rt1015: fix i2c communication error
Date: Thu, 25 Mar 2021 07:25:28 -0400
Message-Id: <20210325112558.1927423-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112558.1927423-1-sashal@kernel.org>
References: <20210325112558.1927423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

From: Jack Yu <jack.yu@realtek.com>

[ Upstream commit 9e0bdaa9fcb8c64efc1487a7fba07722e7bc515e ]

Remove 0x100 cache re-sync to solve i2c communication error.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
Link: https://lore.kernel.org/r/20210222090057.29532-1-jack.yu@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt1015.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 3db07293c70b..2627910060dc 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -209,6 +209,7 @@ static bool rt1015_volatile_register(struct device *dev, unsigned int reg)
 	case RT1015_VENDOR_ID:
 	case RT1015_DEVICE_ID:
 	case RT1015_PRO_ALT:
+	case RT1015_MAN_I2C:
 	case RT1015_DAC3:
 	case RT1015_VBAT_TEST_OUT1:
 	case RT1015_VBAT_TEST_OUT2:
-- 
2.30.1

