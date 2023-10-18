Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3257CDF24
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1CEE76;
	Wed, 18 Oct 2023 16:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1CEE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638643;
	bh=NpWOL949zjbv0453tfqLRDpLsMUhTAUanBD43aHGEEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i3GVEtbX0vtAj1D9t5PwKDAtcyQSodJ9ABU7h6Z/YQQK/9dy1X5cgNRC8fcurlpsB
	 CX2cDW5RWI3W4/kHNldple2zmXN0wvM3RkU1zQGo1KVa9rcbkdI3gxlMm9l2IBQSFC
	 tK/6RW17J7cbdU/E+f3PJAEJ+if6QpXKl732OFcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68966F80567; Wed, 18 Oct 2023 16:14:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86FCEF80557;
	Wed, 18 Oct 2023 16:14:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AE4DF80564; Wed, 18 Oct 2023 16:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A623EF8057B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A623EF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lFKeLM0Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D710BCE24E7;
	Wed, 18 Oct 2023 14:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B34C433C7;
	Wed, 18 Oct 2023 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638335;
	bh=NpWOL949zjbv0453tfqLRDpLsMUhTAUanBD43aHGEEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFKeLM0Zs5+MzEYYy8UhLbqVx3lXaV8xyhtcBeKfwv3rc5pSxCjn008Ndhjc8afrh
	 U7huOkpYkUYnX+rfpZ0QlLc7Od7srXGF0Y33gKhI07SnMYOn0u/Ze98q4U8I62hipG
	 2mNZ37oOufu2zskr3spQTMMViRR0lPF3Ec6duB8ERchb9JhBCazPT/vjlauQPncBAx
	 p3leaHdLvqngibnlw3T35PBpTlkkOITFVSv+1ChoFi8+PEon3RPIbCGvtHCqqIQ6do
	 5CeKjYsGbqQ/kPRh+k9wiWTmuTdsEUZvjjoUfYcUKSTm6Wzrkpgolk6Ws5rjpNsYcl
	 PJS8I8IWA6xhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Antoine Gennart <gennartan@disroot.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 09/31] ASoC: tlv320adc3xxx: BUG: Correct micbias
 setting
Date: Wed, 18 Oct 2023 10:11:26 -0400
Message-Id: <20231018141151.1334501-9-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SWLENBUVKYS7UMBNXXOTXVCTF3NJJMON
X-Message-ID-Hash: SWLENBUVKYS7UMBNXXOTXVCTF3NJJMON
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SWLENBUVKYS7UMBNXXOTXVCTF3NJJMON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Antoine Gennart <gennartan@disroot.org>

[ Upstream commit e930bea4124b8a4a47ba4092d99da30099b9242d ]

The micbias setting for tlv320adc can also have the value '3' which
means that the micbias ouput pin is connected to the input pin AVDD.

Signed-off-by: Antoine Gennart <gennartan@disroot.org>
Link: https://lore.kernel.org/r/20230929130117.77661-1-gennartan@disroot.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index b976c1946286a..420bbf588efea 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -293,7 +293,7 @@
 #define ADC3XXX_BYPASS_RPGA		0x80
 
 /* MICBIAS control bits */
-#define ADC3XXX_MICBIAS_MASK		0x2
+#define ADC3XXX_MICBIAS_MASK		0x3
 #define ADC3XXX_MICBIAS1_SHIFT		5
 #define ADC3XXX_MICBIAS2_SHIFT		3
 
@@ -1099,7 +1099,7 @@ static int adc3xxx_parse_dt_micbias(struct adc3xxx *adc3xxx,
 	unsigned int val;
 
 	if (!of_property_read_u32(np, propname, &val)) {
-		if (val >= ADC3XXX_MICBIAS_AVDD) {
+		if (val > ADC3XXX_MICBIAS_AVDD) {
 			dev_err(dev, "Invalid property value for '%s'\n", propname);
 			return -EINVAL;
 		}
-- 
2.40.1

