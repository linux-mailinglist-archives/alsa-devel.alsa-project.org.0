Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5B6A2BF7
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Feb 2023 22:53:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B371E1E4;
	Sat, 25 Feb 2023 22:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B371E1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677361990;
	bh=OJ0N7ty0hfAerhnJSWeFrzBQO9fgvxpKrfOIKXzPMDg=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QQ+fghyq1SjNsdEVJo3tFSiaopBntdRZ2EJmRgonY7Cm47tNOJOtiIrBAJwKBL+Qc
	 2/iCg5O+Qw6RtSWLsl5pqlhTbLwXz12+BGaG2Pqxx/ezwcH31nEr9b9BSDMZxE4+sh
	 A/AKrgW122GidkQTdmxG4UTg/HErOnKH4AB4UHGk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1C39F80116;
	Sat, 25 Feb 2023 22:52:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A973BF80125; Sat, 25 Feb 2023 22:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2C20F8007C
	for <alsa-devel@alsa-project.org>; Sat, 25 Feb 2023 22:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C20F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S0Xkx8E9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFE5AB80B43;
	Sat, 25 Feb 2023 21:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB5BC4339B;
	Sat, 25 Feb 2023 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677361925;
	bh=OJ0N7ty0hfAerhnJSWeFrzBQO9fgvxpKrfOIKXzPMDg=;
	h=From:Date:Subject:To:Cc:From;
	b=S0Xkx8E9a8wKGmln+yPBkfCMUFqL3Vt6S0Y9IOqfhyA8IJiQU+HyKAo07/HdGQI4W
	 fjwfZWgOGy3KHiT7+NWKiWtC1CpEy4DN6FLuYrDeZBRvc04oSYljDJPgGqZ9F6Hv+N
	 jHLhLGpdMxAJwuZ3fUO6g+uBpOnmYT0HimSjroXzfkM6JChZRz0qWaJ2ImY0BYs8Bp
	 8KCX0rhdkdMss5f9+UBnTN390YOxIBeRvrnaYHVhN+CVUZk6GCPDJ8j9CPL+bdP2Zz
	 1JVEd5QqZSsE3nTHQd6oIMsyNkcUMMF1KT0rQh5aWx3/it1ZKA2WjxkoyqISIrgfzT
	 GQHnzRJgNgDjA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 25 Feb 2023 21:48:13 +0000
Subject: [PATCH] ASoC: sam9g20ek: Disable capture unless building with
 microphone input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230225-asoc-sam9g20ek-v1-1-9baeb4893142@kernel.org>
X-B4-Tracking: v=1; b=H4sIAByC+mMC/x2NQQqDQAwAvyI5N7CNXbT9SvEQ16ihuMpGRBD/3
 tXjDAxzgElSMfgUByTZ1HSOGZ6PAsLIcRDULjOQo9IReWSbAxpP74Gc/LB/SVV5cr6rA+SoZRN
 sE8cwXtk6LZddkvS635tvc55/wYItsHYAAAA=
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OJ0N7ty0hfAerhnJSWeFrzBQO9fgvxpKrfOIKXzPMDg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+oMChmYka2JaY43e9B4DbZniZ/KHt41VgZi2hvS5
 wskbme6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/qDAgAKCRAk1otyXVSH0MupB/
 9yOzTRgPiz54Ph8xLEXpsqDAUvdbWUNdEZTAo6XPtphXXvAPsPXWVMO1lEk/LPZ5leYOgwK9fJnvCR
 T2nGZNlHq/35K/0xvfI4mEH+ilhQMqcHX3BNNSVXmynxPQY9aIoTz5xsMX/UkChr+nEI38GEGyg4N1
 Z+Klib9zu5XTIYXBO2HEX8kcWeUpIrmObGPJD0LZxpPADvH3hpGSN8jvH5C/iwVwPnotFylgaBKZHg
 49oo3ED4OS55lbjwhaxVFYhtKaqKkiaR5Wl2MPGUXffiLibgILNt/aMZbS9U0eDqyvocomyG0w4on/
 aYJB+dm2pzzD4E/tWBsdr5sgbQPi5j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: VP6RFFPC7Q7UCJHGUS4MFVVNA4UX3DJX
X-Message-ID-Hash: VP6RFFPC7Q7UCJHGUS4MFVVNA4UX3DJX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VP6RFFPC7Q7UCJHGUS4MFVVNA4UX3DJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Without modification the AT91SAM9G20-EK has no capture support, none of the
inputs of the CODEC are wired to anything to useful and there are no paths
supporting loopback. Since the audio is clocked from the CODEC and the DAPM
inputs are marked as unusable this means that capture will fail to transfer
any data as the ADC path can't be powered up.

Flag this in the device description so apps don't see unusable capture
support, guarded with the existing optional define for mic input.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9g20_wm8731.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 1430642c8433..785b9d01d8af 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -98,6 +98,9 @@ static struct snd_soc_dai_link at91sam9g20ek_dai = {
 	.init = at91sam9g20ek_wm8731_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBP_CFP,
+#ifndef ENABLE_MIC_INPUT
+	.playback_only = true,
+#endif
 	SND_SOC_DAILINK_REG(pcm),
 };
 

---
base-commit: cac85e4616b1cf4a90844b952b49b9cbc4562530
change-id: 20230225-asoc-sam9g20ek-f4e775205d8c

Best regards,
-- 
Mark Brown <broonie@kernel.org>

