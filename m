Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB89348FDD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:31:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1803016A1;
	Thu, 25 Mar 2021 12:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1803016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616671905;
	bh=KtmsC9HXqP6iYRKpMA/dcq7ZYWgWJI8JVT0f7dUZJiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qmN379e/jyRFJRo3buUTpYsvEtDJlYO/uohftkDUvYsn7GNYjMe4WzPTUrpUKYZFs
	 gFhWBJAm6l2Hh7dDo/aAhQ4R3XjBKX6bY7pyRzn0jXC+dZ9FG/5Y/I4f0vdtx8iJIX
	 3qSKEOjLxvLm+Y1+24h1GgGZ1icAMPRVjuJ1dL9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FF3F8026D;
	Thu, 25 Mar 2021 12:26:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07430F8025F; Thu, 25 Mar 2021 12:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B572AF80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B572AF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pzhZOlTL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 355A961A35;
 Thu, 25 Mar 2021 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671516;
 bh=KtmsC9HXqP6iYRKpMA/dcq7ZYWgWJI8JVT0f7dUZJiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pzhZOlTL3Hm/VwQjf/pJkVSeZn52nDrusqnr+JvAUU99mKY36CoczplpWnKlohYA2
 NCqJeFGrXxdJhSIJwmTpcXJBGn85RBQp40xjoshy1km5Ozo6PBggSDUtr8PmlKV8TT
 BRjRnrsc0K195mTSgkSyvdRPHohEJwRqu2AreeKD4JVtujn3IL07g2QXAR0R9UoELt
 czW8cPMZcwkOyJQexRUsO4ipklYVMyxLlxHvm/v6OLYIZJSC8gMJhDxBoBYyGLsSjI
 QJ8TVuwO2AOBfvZUQT9Rxr+TxeAUXFsoyCnwX7YVC8AldsiJw503V32rNN0rWJKgJS
 Vg6CuYdmMsswQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 13/44] ASoC: es8316: Simplify adc_pga_gain_tlv
 table
Date: Thu, 25 Mar 2021 07:24:28 -0400
Message-Id: <20210325112459.1926846-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112459.1926846-1-sashal@kernel.org>
References: <20210325112459.1926846-1-sashal@kernel.org>
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

[ Upstream commit bb18c678754ce1514100fb4c0bf6113b5af36c48 ]

Most steps in this table are steps of 3dB (300 centi-dB), so we can
simplify the table.

This not only reduces the amount of space it takes inside the kernel,
this also makes alsa-lib's mixer code actually accept the table, where
as before this change alsa-lib saw the "ADC PGA Gain" control as a
control without a dB scale.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20210228160441.241110-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8316.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index f9ec5cf82599..ec2f11ff8a84 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -63,13 +63,8 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(adc_pga_gain_tlv,
 	1, 1, TLV_DB_SCALE_ITEM(0, 0, 0),
 	2, 2, TLV_DB_SCALE_ITEM(250, 0, 0),
 	3, 3, TLV_DB_SCALE_ITEM(450, 0, 0),
-	4, 4, TLV_DB_SCALE_ITEM(700, 0, 0),
-	5, 5, TLV_DB_SCALE_ITEM(1000, 0, 0),
-	6, 6, TLV_DB_SCALE_ITEM(1300, 0, 0),
-	7, 7, TLV_DB_SCALE_ITEM(1600, 0, 0),
-	8, 8, TLV_DB_SCALE_ITEM(1800, 0, 0),
-	9, 9, TLV_DB_SCALE_ITEM(2100, 0, 0),
-	10, 10, TLV_DB_SCALE_ITEM(2400, 0, 0),
+	4, 7, TLV_DB_SCALE_ITEM(700, 300, 0),
+	8, 10, TLV_DB_SCALE_ITEM(1800, 300, 0),
 );
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(hpout_vol_tlv,
-- 
2.30.1

