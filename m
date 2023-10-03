Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA17B6DEF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 18:04:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124269F6;
	Tue,  3 Oct 2023 18:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124269F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696349052;
	bh=2DhAHBo+YbBdItb8HnA01InHv+0f3MquKuWsrN91pvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lWnJ5y80YEQCKsjMYfz9gX1xM2hw5eKfyj+MG3yCjl7ZL/1jf0zmXiy1bZGTLw11W
	 b/vLIWHjXBUrYQiWauXTU+fBZYtxMmLw7B0XK+YmDBqWOlHVetxw6c8ReGLCUguMz3
	 dPE1Vyx6VVgEIaLKez8J6BNnZ4X069/NpCQFLVZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84C0F805A0; Tue,  3 Oct 2023 18:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5401F80587;
	Tue,  3 Oct 2023 18:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2823CF80557; Tue,  3 Oct 2023 17:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C682FF80553
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C682FF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q0yACS9I
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 040F161298;
	Tue,  3 Oct 2023 15:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AAEC433CB;
	Tue,  3 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696348710;
	bh=2DhAHBo+YbBdItb8HnA01InHv+0f3MquKuWsrN91pvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0yACS9I5mo04/f0p1lkuf9QE0h/FBp1VdvpIubCClTCduooBHTGsehbanfK6yFvr
	 3d8ujJR0Gt/HlsJsczhxWFnef/uOGAfKSriVeQMl5hfqfrk6NOaLe+O5EaPctUWU1z
	 +QSkqUWkWnPx+BvrCmKjWSkvqhDzubLJzNnqEFTPwpFpZg3UX6XdnBtW4No9ZVrsBG
	 zMZKn/1N8amwOwczJjtASlirvoX3vZQl4towl66BWWGHiQUHRFrKy3C3auyGuRlF79
	 mrk4YBN1ph1ItMh67p8ApqzWEsINR+BzKnV6LA8a9IpbAnCrnYR6A1Je6+1/Su5Ws5
	 RKSGUTLwkQGzQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qnhnG-00074z-13;
	Tue, 03 Oct 2023 17:58:42 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/7] ASoC: codecs: wcd938x-sdw: fix use after free on driver
 unbind
Date: Tue,  3 Oct 2023 17:55:57 +0200
Message-ID: <20231003155558.27079-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003155558.27079-1-johan+linaro@kernel.org>
References: <20231003155558.27079-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YR2ZMFJEMCGTMPXEQSY45UTAT3VAMQKC
X-Message-ID-Hash: YR2ZMFJEMCGTMPXEQSY45UTAT3VAMQKC
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR2ZMFJEMCGTMPXEQSY45UTAT3VAMQKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make sure to deregister the component when the driver is being unbound
and before the underlying device-managed resources are freed.

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: stable@vger.kernel.org      # 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 6951120057e5..1baea04480e2 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1281,6 +1281,15 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	return component_add(dev, &wcd938x_sdw_component_ops);
 }
 
+static int wcd9380_remove(struct sdw_slave *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_del(dev, &wcd938x_sdw_component_ops);
+
+	return 0;
+}
+
 static const struct sdw_device_id wcd9380_slave_id[] = {
 	SDW_SLAVE_ENTRY(0x0217, 0x10d, 0),
 	{},
@@ -1320,6 +1329,7 @@ static const struct dev_pm_ops wcd938x_sdw_pm_ops = {
 
 static struct sdw_driver wcd9380_codec_driver = {
 	.probe	= wcd9380_probe,
+	.remove	= wcd9380_remove,
 	.ops = &wcd9380_slave_ops,
 	.id_table = wcd9380_slave_id,
 	.driver = {
-- 
2.41.0

