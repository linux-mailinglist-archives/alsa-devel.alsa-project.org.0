Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFAC349129
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A14D416EF;
	Thu, 25 Mar 2021 12:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A14D416EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616672862;
	bh=rbun0M3lJDr0Fh1Lvg8eOfZVFpFvLk5uRv1RpBIYCLs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRiz9OC6d8FsnEQtNhHGLZfaNWYqXXIJAi2XxtsWqa8PhZaac7Yl+R+v0w3Ao7OyX
	 v7lIPuIXqf8VEikKMI1k0BOl3CO8xqLq666T4OIj5tMLb8EyXohRFejhXJnSvw5SuW
	 fv3QILp6fd+W3MJWgqeEl0RaiLY5mDwYm+D3ebeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB42F80638;
	Thu, 25 Mar 2021 12:29:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41490F805E8; Thu, 25 Mar 2021 12:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7265F804B0
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7265F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tqv1fi6q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D51E861A83;
 Thu, 25 Mar 2021 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671716;
 bh=rbun0M3lJDr0Fh1Lvg8eOfZVFpFvLk5uRv1RpBIYCLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tqv1fi6qbAjkOOlDKb1n+lqPUWVB/LPyD4gqi/GgjfEaJDTJg4pH2ioFtesD5jNBY
 4DcYTICk6DLUnHNwMmLUxXGOYoI4F5/PJU5H6yMnNR9RFDuDWomZLdfxob2vLKIbqR
 rTl74KcnF6uSJwv0G+v61CqGU3z+bf9Yzp/0I+Www8TI+tO0UrdFHdU2rAGe1hl/iq
 l+ysbeLWxELuv7Zb/EqyLf5wzOFzzH1+gmal8HTV23EwTQQ42ge0H7t2OWyrXkMpzb
 +5YMPEreqyO0xmWSK3gf4plWf1p8RoqAcXpdpPC20r7zzDpWc60BvNfumWRvgo8VPF
 1CVpo91pMC+Dw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 03/10] ASoC: rt5640: Fix dac- and adc- vol-tlv
 values being off by a factor of 10
Date: Thu, 25 Mar 2021 07:28:24 -0400
Message-Id: <20210325112832.1928898-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112832.1928898-1-sashal@kernel.org>
References: <20210325112832.1928898-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit cfa26ed1f9f885c2fd8f53ca492989d1e16d0199 ]

The adc_vol_tlv volume-control has a range from -17.625 dB to +30 dB,
not -176.25 dB to + 300 dB. This wrong scale is esp. a problem in userspace
apps which translate the dB scale to a linear scale. With the logarithmic
dB scale being of by a factor of 10 we loose all precision in the lower
area of the range when apps translate things to a linear scale.

E.g. the 0 dB default, which corresponds with a value of 47 of the
0 - 127 range for the control, would be shown as 0/100 in alsa-mixer.

Since the centi-dB values used in the TLV struct cannot represent the
0.375 dB step size used by these controls, change the TLV definition
for them to specify a min and max value instead of min + stepsize.

Note this mirrors commit 3f31f7d9b540 ("ASoC: rt5670: Fix dac- and adc-
vol-tlv values being off by a factor of 10") which made the exact same
change to the rt5670 codec driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20210226143817.84287-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index b1c8bb39cdf1..db7734e45dd1 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -341,9 +341,9 @@ static bool rt5640_readable_register(struct device *dev, unsigned int reg)
 }
 
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -4650, 150, 0);
-static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -65625, 375, 0);
+static const DECLARE_TLV_DB_MINMAX(dac_vol_tlv, -6562, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -3450, 150, 0);
-static const DECLARE_TLV_DB_SCALE(adc_vol_tlv, -17625, 375, 0);
+static const DECLARE_TLV_DB_MINMAX(adc_vol_tlv, -1762, 3000);
 static const DECLARE_TLV_DB_SCALE(adc_bst_tlv, 0, 1200, 0);
 
 /* {0, +20, +24, +30, +35, +40, +44, +50, +52} dB */
-- 
2.30.1

