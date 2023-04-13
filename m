Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664E6E0474
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D8FF73;
	Thu, 13 Apr 2023 04:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D8FF73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353543;
	bh=FxSpL+k7mWLJ/yG1GbUE51+sbJSmAkqDaYqGJUi2tiY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CtOMG0O1BGnwC+TPM01ND83oPIY1hjWoK3OJHW8OqVQa2HUSI/drFB8euMj1iW9J5
	 jCxJmHQhPOMbjtIQntvQHdFtNHjoEDJKo1NAjKYRjJ3l6+VKCRnsCA7g01oNiEhoLU
	 Trwgq78LMNxhS59TEmf2/XlX9k43mB6Cnvctkn0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2EBF8055C;
	Thu, 13 Apr 2023 04:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 681FDF80557; Thu, 13 Apr 2023 04:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05710F80534
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05710F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XpgwizO3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC41463A61;
	Thu, 13 Apr 2023 02:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A89C433EF;
	Thu, 13 Apr 2023 02:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353384;
	bh=FxSpL+k7mWLJ/yG1GbUE51+sbJSmAkqDaYqGJUi2tiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpgwizO3TBqLBmC78Gdi2T0RISPoQUl79t8yQLdK63F+682huKNdGXe3SzRH+Qm6/
	 H5hIayKFcPJNZxNE3/jrvrFmDcwFVkil7M4QUGO/Ls5Ftsq3D8PIfqfTXrjBgRxUWq
	 0HqVOWzy82IeOeBwzCh36dv18g2/vQNMOJVqZcZvRoGMe5EpfP7lKjUMZ9od51de2h
	 4iE8k+YwM3Rl25OA4P5h0lEdT3B2vR1BTw5tMCuGUoAAFq7LVu+32vcSDCCWkHfGIe
	 6Sy3CvZVZGBN2tRSDIPCC4V1aiZE1cxISJRK5vMap4vtfbgJxeRSpg1t7exFOPj4aC
	 rzPdBY8mJfKZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 09/20] ASoC: da7213.c: add missing
 pm_runtime_disable()
Date: Wed, 12 Apr 2023 22:35:47 -0400
Message-Id: <20230413023601.74410-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023601.74410-1-sashal@kernel.org>
References: <20230413023601.74410-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 276G7M4PY5GAXZ7GILHDF6DVOGFNU3UY
X-Message-ID-Hash: 276G7M4PY5GAXZ7GILHDF6DVOGFNU3UY
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Duy Nguyen <duy.nguyen.rh@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Khanh Le <khanh.le.xr@renesas.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, support.opensource@diasemi.com,
 lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/276G7M4PY5GAXZ7GILHDF6DVOGFNU3UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

[ Upstream commit 44378cd113e5f15bb0a89f5ac5a0e687b52feb90 ]

da7213.c is missing pm_runtime_disable(), thus we will get
below error when rmmod -> insmod.

	$ rmmod  snd-soc-da7213.ko
	$ insmod snd-soc-da7213.ko
	da7213 0-001a: Unbalanced pm_runtime_enable!"

[Kuninori adjusted to latest upstream]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Khanh Le <khanh.le.xr@renesas.com>
Link: https://lore.kernel.org/r/87mt3xg2tk.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/da7213.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 544ccbcfc8844..5678683c71bee 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1996,6 +1996,11 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
+static void da7213_i2c_remove(struct i2c_client *i2c)
+{
+	pm_runtime_disable(&i2c->dev);
+}
+
 static int __maybe_unused da7213_runtime_suspend(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
@@ -2039,6 +2044,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.pm = &da7213_pm,
 	},
 	.probe_new	= da7213_i2c_probe,
+	.remove		= da7213_i2c_remove,
 	.id_table	= da7213_i2c_id,
 };
 
-- 
2.39.2

