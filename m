Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061453BA24
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB301786;
	Thu,  2 Jun 2022 15:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB301786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178066;
	bh=myMnK53wIxC72d8WfULcq/fr0E5gGkGkdh3A4K8lvHE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/vlWQH/mvjAV3rLCEwQDfMhD3grEc4Ywh+rGfxRBkZ0CVkUaylkRwQ7C+F0EwWMO
	 VuM23FBbnQQWE3sfQwqdl8VKKFuxHo/dE9l3Qvs4Qj+x6vIlOAQRNJKj4VfBZw82Q+
	 YqNwKsiUq4hFpIA+LxABRTaiuOqnvWhD+acXmj3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F21F80425;
	Thu,  2 Jun 2022 15:53:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F135F8025E; Thu,  2 Jun 2022 15:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05164F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05164F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jopC93Me"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 022D2B81ED6;
 Thu,  2 Jun 2022 13:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121A8C385A5;
 Thu,  2 Jun 2022 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178002;
 bh=myMnK53wIxC72d8WfULcq/fr0E5gGkGkdh3A4K8lvHE=;
 h=From:To:Cc:Subject:Date:From;
 b=jopC93Meqsgz4W+q4xzQVZF4QFz//Q5/jRRTzolOHJn1w7YcTWAcWOqyBJjlAFZgw
 LXcKfPsWSqmZPAsfXCTpCjFexyhTRv42q2eULcHCZkIUSaphKZnwahH3AOMYRZxxGp
 7+mXAvaes/xhorHf5iVkah8jB1xB0UyEEXxa1hrxgPZH4YWDaAzqtHg+PkbG6R7qe4
 f8mZsoeB22kSB1BvKi8sDZ3XTMdDqiz6BtcKFxAui05WDJbe4aICWyaM5fSkmmAfW9
 MyM1Tg0PoLNepW5U3H57By3aS8nGfPqTWNjUOnKXcooVT4FLSRJQulg+cDYaGUwdgY
 keK8ThD27Q7Yw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 00/20] ASoC: DAI clocking terminology modernisation
Date: Thu,  2 Jun 2022 15:52:56 +0200
Message-Id: <20220602135316.3554400-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; h=from:subject;
 bh=myMnK53wIxC72d8WfULcq/fr0E5gGkGkdh3A4K8lvHE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCOoiRftIOTmIn92BE1E1O+6tExc26Id0Q65aCv
 NXm7iUWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAjgAKCRAk1otyXVSH0D0wB/
 4pKUJc4eoEwcUEnUZ9yWGVC3DsoM9ptoVki1gNgp4B4Bspcnv3UDukCQ9IfgZzoLmNQKUAg0VWnyqZ
 mKaw4SDMcqqHxr6eriPIbzPRf46d0Nd6792HEM7ub6gperujsO9xO7M6OF6JH3suhclh3+nDO5ScXh
 2l3j6P4q3KmMAFMsrndLGT/T+guKTeynDMaExV9d0bXHN7E5osvJhyzCJfBvnrtbjtkVIFB6AapOTW
 EKhYntv7uOAB7dSKmh5jShSy0WZcVss/YQYSmFXPDgj/kXpzKQZRYUInwoVu3GY1+kFvoyaNWjVfG7
 eCLouJmk9qeKM+5zjZeZXGILMrYJoe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

Update the last batch of CODEC drivers without specific
maintainers to use the new defines for DAI clocking.

Mark Brown (20):
  ASoC: cx2072x: Use modern ASoC DAI format terminology
  ASoC: max98090: Use modern ASoC DAI format terminology
  ASoC: rk3328: Use modern ASoC DAI format terminology
  ASoC: sta32x: Use modern ASoC DAI format terminology
  ASoC: sta350: Use modern ASoC DAI format terminology
  ASoC: sti-sas: Use modern ASoC DAI format terminology
  ASoC: tas2552: Use modern ASoC DAI format terminology
  ASoC: tas2770: Use modern ASoC DAI format terminology
  ASoC: tas5086: Use modern ASoC DAI format terminology
  ASoC: tas5720: Use modern ASoC DAI format terminology
  ASoC: tas6424: Use modern ASoC DAI format terminology
  ASoC: uda1334: Use modern ASoC DAI format terminology
  ASoC: tlv320adc3xxx: Use modern ASoC DAI format terminology
  ASoC: tlv320adcx140: Use modern ASoC DAI format terminology
  ASoC: tlv320aic23: Use modern ASoC DAI format terminology
  ASoC: tlv320aic26: Use modern ASoC DAI format terminology
  ASoC: tlv320aic31xx: Use modern ASoC DAI format terminology
  ASoC: tlv320aic32x4: Use modern ASoC DAI format terminology
  ASoC: tlv320aic33: Use modern ASoC DAI format terminology
  ASoC: tlv320dac3x: Use modern ASoC DAI format terminology

 sound/soc/codecs/cx2072x.c       | 17 +++++++----------
 sound/soc/codecs/max98090.c      | 12 +++++-------
 sound/soc/codecs/rk3328_codec.c  |  6 +++---
 sound/soc/codecs/sta32x.c        |  4 ++--
 sound/soc/codecs/sta350.c        |  4 ++--
 sound/soc/codecs/sti-sas.c       |  6 +++---
 sound/soc/codecs/tas2552.c       | 10 +++++-----
 sound/soc/codecs/tas2770.c       |  6 +++---
 sound/soc/codecs/tas5086.c       |  2 +-
 sound/soc/codecs/tas5720.c       |  4 ++--
 sound/soc/codecs/tas6424.c       |  6 +++---
 sound/soc/codecs/tlv320adc3xxx.c |  3 +--
 sound/soc/codecs/tlv320adcx140.c | 10 ++++------
 sound/soc/codecs/tlv320aic23.c   |  7 +++----
 sound/soc/codecs/tlv320aic26.c   | 13 ++++++-------
 sound/soc/codecs/tlv320aic31xx.c | 19 +++++++++----------
 sound/soc/codecs/tlv320aic32x4.c |  9 ++++-----
 sound/soc/codecs/tlv320aic3x.c   | 11 +++++------
 sound/soc/codecs/tlv320dac33.c   | 12 +++++-------
 sound/soc/codecs/uda1334.c       |  2 +-
 20 files changed, 74 insertions(+), 89 deletions(-)

-- 
2.30.2

