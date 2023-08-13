Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD977A9A4
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558CB950;
	Sun, 13 Aug 2023 18:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558CB950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691943339;
	bh=7iJvwYYjNFxrDaQvJsuVJmiSfLGX74qbUoTjwC9Jxfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Plfwz0hEGtb04YgCmwEmwDGyy79OlA4tbNJNO0fYRUlb8CeLSMCLc8atrwgOWRrKY
	 hp394FoIpHoOXTeIECZtmoG5EMcrEW3x40f1rE6148uSbNrN/X1f9LpCAqZELMejus
	 OvWcQunyMsWbLKHzqZMf5RIvsizGmqYAPLEkiNOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CCE5F8055C; Sun, 13 Aug 2023 18:14:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7C5F80549;
	Sun, 13 Aug 2023 18:14:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D05A4F80557; Sun, 13 Aug 2023 18:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9776F80290
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9776F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NiTYea0Y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD65663C7E;
	Sun, 13 Aug 2023 16:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA8FC433CA;
	Sun, 13 Aug 2023 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691943275;
	bh=7iJvwYYjNFxrDaQvJsuVJmiSfLGX74qbUoTjwC9Jxfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiTYea0YHW9lnXbI+Gb65/sah54jeI7DKwuMsxoUjadyV0BBSAZBR5ZgD8op7N2S1
	 wn4pVk0U3dQzo92RmV/0xr8AxyU03YG2oqabQf1Z0wN/6NsgApVowQpIXMrBbQBzRL
	 V3hP3UMxEuZekLPsSrzIR3BLp95017sTTErJlpfddk8DpIP4lsoA7PkJl4vEm3axTV
	 jpDQjKrITo7lOyfZbjgpM4Dh4tmjNNRh+yy5JWXv+TJFpvMNNin1aF5Xz4vVCLOHVw
	 G/l4cxxtSunRqcKPAW8Zn86Ela1sPa07/tcyoQvUZCogLCvVwdkVPdQAtCa5Z+IuaC
	 y6xHh4NoCPsRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmytro Maluka <dmy@semihalf.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.14 2/9] ASoC: da7219: Flush pending AAD IRQ when
 suspending
Date: Sun, 13 Aug 2023 12:14:20 -0400
Message-Id: <20230813161427.1089101-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813161427.1089101-1-sashal@kernel.org>
References: <20230813161427.1089101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.322
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XFI4QAFSP5LT2PTW2OG57MJUHWKEBHE3
X-Message-ID-Hash: XFI4QAFSP5LT2PTW2OG57MJUHWKEBHE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFI4QAFSP5LT2PTW2OG57MJUHWKEBHE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dmytro Maluka <dmy@semihalf.com>

[ Upstream commit 91e292917dad64ab8d1d5ca2ab3069ad9dac6f72 ]

da7219_aad_suspend() disables jack detection, which should prevent
generating new interrupts by DA7219 while suspended. However, there is a
theoretical possibility that there is a pending interrupt generated just
before suspending DA7219 and not handled yet, so the IRQ handler may
still run after DA7219 is suspended. To prevent that, wait until the
pending IRQ handling is done.

This patch arose as an attempt to fix the following I2C failure
occurring sometimes during system suspend or resume:

[  355.876211] i2c_designware i2c_designware.3: Transfer while suspended
[  355.876245] WARNING: CPU: 2 PID: 3576 at drivers/i2c/busses/i2c-designware-master.c:570 i2c_dw_xfer+0x411/0x440
...
[  355.876462] Call Trace:
[  355.876468]  <TASK>
[  355.876475]  ? update_load_avg+0x1b3/0x615
[  355.876484]  __i2c_transfer+0x101/0x1d8
[  355.876494]  i2c_transfer+0x74/0x10d
[  355.876504]  regmap_i2c_read+0x6a/0x9c
[  355.876513]  _regmap_raw_read+0x179/0x223
[  355.876521]  regmap_raw_read+0x1e1/0x28e
[  355.876527]  regmap_bulk_read+0x17d/0x1ba
[  355.876532]  ? __wake_up+0xed/0x1bb
[  355.876542]  da7219_aad_irq_thread+0x54/0x2c9 [snd_soc_da7219 5fb8ebb2179cf2fea29af090f3145d68ed8e2184]
[  355.876556]  irq_thread+0x13c/0x231
[  355.876563]  ? irq_forced_thread_fn+0x5f/0x5f
[  355.876570]  ? irq_thread_fn+0x4d/0x4d
[  355.876576]  kthread+0x13a/0x152
[  355.876581]  ? synchronize_irq+0xc3/0xc3
[  355.876587]  ? kthread_blkcg+0x31/0x31
[  355.876592]  ret_from_fork+0x1f/0x30
[  355.876601]  </TASK>

which indicates that the AAD IRQ handler is unexpectedly running when
DA7219 is suspended, and as a result, is trying to read data from DA7219
over I2C and is hitting the I2C driver "Transfer while suspended"
failure.

However, with this patch the above failure is still reproducible. So
this patch does not fix any real observed issue so far, but at least is
useful for confirming that the above issue is not caused by a pending
IRQ but rather looks like a DA7219 hardware issue with an IRQ
unexpectedly generated after jack detection is already disabled.

Signed-off-by: Dmytro Maluka <dmy@semihalf.com>
Link: https://lore.kernel.org/r/20230717193737.161784-2-dmy@semihalf.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/da7219-aad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 1d1d10dd92ae2..793c8768f7c44 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -854,6 +854,8 @@ void da7219_aad_suspend(struct snd_soc_codec *codec)
 			}
 		}
 	}
+
+	synchronize_irq(da7219_aad->irq);
 }
 
 void da7219_aad_resume(struct snd_soc_codec *codec)
-- 
2.40.1

