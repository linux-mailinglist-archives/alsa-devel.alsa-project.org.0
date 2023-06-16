Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8244732AED
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE29182A;
	Fri, 16 Jun 2023 11:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE29182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686906233;
	bh=UOnPoFg43i3UesyhFVozRmIc8vnbB70GQh4IzFCjtN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uIzojVcdIHjRo/l7Zvy+IPq7ntV24rX2n4CduMmcp8tMMUf2yjs4v2Vw08ze2DHpf
	 LU7RzFlQUscCP9NfIuPZztvchLT5w4AjO+WUOTL6f50Cnh7U1vzvhVbECGlGPl+Ry9
	 RrkJZpd5Z+CGoHkz0QAfzPtrGUry8JpCm+YQKWCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F39F80548; Fri, 16 Jun 2023 11:02:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C39F80548;
	Fri, 16 Jun 2023 11:02:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53AA9F80549; Fri, 16 Jun 2023 11:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6A23F80544
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A23F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q/nhG7AO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E294863202;
	Fri, 16 Jun 2023 09:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC8C433C0;
	Fri, 16 Jun 2023 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906137;
	bh=UOnPoFg43i3UesyhFVozRmIc8vnbB70GQh4IzFCjtN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/nhG7AOdYsI3nv+QMHa1sa79lU32ytFCuAbdWYzzYuo0eZvAqQqwJjHiYUk0p+x6
	 lJbLILzZUk+zlak4Hv/XANuqsfyEkHsj3WMQObqLLLFsRUiadkD63bjp0TRVslmGQ/
	 AhYVR87FEhBmKcXkTwLtddA+M8gGyIHtTFUGIlO/QiGJQ+Bj/gaDku/tSb6MKz2mao
	 5Yk3FQeLdKKMxKVGPv0o4CfrP3/U1lh/NPjRyzAvgO+GcO5uazcdgJaJRpuX0Mpzwj
	 MZvk4kxH4F5HRJREvI71UF7RixnpxI8z8cURMJhlJ7U0sfhgzyUc/UGPvCfhOikrTS
	 /syyNBHkwic9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: loongson: fix unused PM function warning
Date: Fri, 16 Jun 2023 11:00:38 +0200
Message-Id: <20230616090156.2347850-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616090156.2347850-1-arnd@kernel.org>
References: <20230616090156.2347850-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z7DZCOBZWHJSZMOO64USHHYDVBQYKZBH
X-Message-ID-Hash: Z7DZCOBZWHJSZMOO64USHHYDVBQYKZBH
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7DZCOBZWHJSZMOO64USHHYDVBQYKZBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

Build testing without CONFIG_PM_SLEEP causes a warning:

sound/soc/loongson/loongson_i2s.c:246:12: error: unused function 'i2s_suspend' [-Werror,-Wunused-function]
sound/soc/loongson/loongson_i2s.c:255:12: error: unused function 'i2s_resume' [-Werror,-Wunused-function]

Use the modern SYSTEM_SLEEP_PM_OPS() instead of the old one to avoid this.

Fixes: d24028606e764 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/loongson/loongson_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 35d34568be79e..f73b6d6f16c23 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -265,5 +265,5 @@ static int i2s_resume(struct device *dev)
 }
 
 const struct dev_pm_ops loongson_i2s_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2s_suspend, i2s_resume)
+	SYSTEM_SLEEP_PM_OPS(i2s_suspend, i2s_resume)
 };
-- 
2.39.2

