Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08087349095
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC9A16E1;
	Thu, 25 Mar 2021 12:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC9A16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616672234;
	bh=Q+0jumXmzvPvzzhe9LlNKcZvOJQf/E7TzqeOEAOGAWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wp4pwTByiVCHjX/qKDfT6z99FnuYifZW8lh11xku9GxugvOfkvO4prW51WdVIzaHu
	 Lu9Cy1F9DsIuuIH5aL4rP4SACd/s9yPgk2jbbbnDjIgdUsPATEDiBwdk8OFkhN5Eko
	 4xAky3yopl0mE/inc/3ZftSWEqMTGIEsBWlw0HcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F273F8056F;
	Thu, 25 Mar 2021 12:27:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7313DF80579; Thu, 25 Mar 2021 12:27:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F058F80557
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F058F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ctlZjTSz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3241361A58;
 Thu, 25 Mar 2021 11:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671620;
 bh=Q+0jumXmzvPvzzhe9LlNKcZvOJQf/E7TzqeOEAOGAWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ctlZjTSz8M8WyIeHj4jaweEmMpdUmDStU/jukYcWmEvi4YWHLwo3iWV8OBRuIw9OT
 Kj+cQZ1X+YzPvI15fcxB37fqWO72yM8Mi1B/M1aFJabSvDinxmF2Pk0sQD6Dx63X8b
 SgnY8E1xpUxFtXau84taV3irIyfwqJeyckjDXuSvR1QEmxgmOcNS7dRAFsvH9rJV/O
 HyQKDmj9sJM5akfPCS41rvREJOSiZtkBHyRWmjiXuvFE7ybrpfpkyMrkuDnThyMzqG
 g0MPXEyF7NH9FV+6I1QkYJczFRPZysCla20lF9m7QL+G7071a9duOFCYgB7MSahUfO
 g4vGTN4bhpZvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 07/24] ASoC: rt5651: Fix dac- and adc- vol-tlv
 values being off by a factor of 10
Date: Thu, 25 Mar 2021 07:26:33 -0400
Message-Id: <20210325112651.1927828-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112651.1927828-1-sashal@kernel.org>
References: <20210325112651.1927828-1-sashal@kernel.org>
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

[ Upstream commit eee51df776bd6cac10a76b2779a9fdee3f622b2b ]

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
Link: https://lore.kernel.org/r/20210226143817.84287-3-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5651.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index c506c9305043..829cf552fe3e 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -285,9 +285,9 @@ static bool rt5651_readable_register(struct device *dev, unsigned int reg)
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

