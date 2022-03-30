Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A374EC04D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA968176C;
	Wed, 30 Mar 2022 13:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA968176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648640928;
	bh=l3oxgia/AH524WfPDCJYya+1eJReQrdeKfEHcOOgSqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jlb9TF2ml+LQMSpSSVP9gCQyHr6FqVy5rrRp51hs4waEXOsENJjPiKH0XCR/Q8tnN
	 jxIhQ8fOtHMP4ke3fKuUhp/oJwc2XjHgc09ySWIuK+nFGe8/gG4iAR0qWTUgtwktWH
	 TqMT1VVUGNJ6Sfaf2SPr2WybBo5jJXx67rfxTiJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB26F80506;
	Wed, 30 Mar 2022 13:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F076FF800F2; Wed, 30 Mar 2022 13:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 774F2F800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 774F2F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BKZBDQFn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 453DD615F3;
 Wed, 30 Mar 2022 11:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40673C340F3;
 Wed, 30 Mar 2022 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640818;
 bh=l3oxgia/AH524WfPDCJYya+1eJReQrdeKfEHcOOgSqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BKZBDQFnDlUmNPQrIk5fTrC0DmYqBe84xLm/SnVMW3xCPvH0qlCPMoXAzTBjseSXV
 HMFpKJiE5iX6i1dVJciMN/3ARvs86aB3al89N+CtsxxSaYGYQplSp7f68dS4MiIQjb
 ftg4Hw3vk1A6PShHeARrMQawAJUalMv9/KBxGx1HqS63ta+gTXQYUMvUapkQKcAxDD
 1c9soVoZtnke3643N6SkMRx0KtHT9H5BZFiJee1viW13TGqennYhBfk56gZTEy6GQy
 vOg4Dtritgby0q9PgOeG6t9+gFYolx3UB5LR1g7RuS30r4lhLplZm/ZK+37Kdrmv7r
 1Y4DB5eLHQAog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 07/66] ASoC: cs42l42: Report full jack status
 when plug is detected
Date: Wed, 30 Mar 2022 07:45:46 -0400
Message-Id: <20220330114646.1669334-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, brian.austin@cirrus.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Paul.Handrigan@cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 8d06f797f844d04a961f201f886f7f9985edc9bf ]

When a plug event is detect report the full state of all status
bits, don't assume that there will have been a previous unplug
event to clear all the bits. Report the state of both HEADPHONE
and MICROPHONE bits according to detected type, and clear all the
button status bits. The current button status is already checked
and reported at the end of the function.

During a system suspend the jack could be unplugged and plugged,
possibly changing the jack type. On resume the interrupt status will
indicate a plug event - there will not be an unplug event to clear
the bits.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220121120412.672284-2-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 43d98bdb5b5b..2c294868008e 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1637,7 +1637,11 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 
 	mutex_lock(&cs42l42->jack_detect_mutex);
 
-	/* Check auto-detect status */
+	/*
+	 * Check auto-detect status. Don't assume a previous unplug event has
+	 * cleared the flags. If the jack is unplugged and plugged during
+	 * system suspend there won't have been an unplug event.
+	 */
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
@@ -1645,11 +1649,15 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET);
+						    SND_JACK_HEADSET |
+						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 				break;
 			case CS42L42_PLUG_HEADPHONE:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADPHONE);
+						    SND_JACK_HEADSET |
+						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 				break;
 			default:
 				break;
-- 
2.34.1

