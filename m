Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A957675E6E6
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23BE844;
	Mon, 24 Jul 2023 03:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23BE844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161821;
	bh=U1z3VtG0pGPvExFdvOAtlP5ooExECdMsVdDb35dBOsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4N7JcsYyVRXsDkfLLhS8lNv+QYBdGtLXmTLTcVSXJxYdz3Vu3iIsPA6eqvIbHAOm
	 fuIbITBOgmDnPKDi1szHzm9YIcCM2ouHuljshaJNqIKQT6WivgNqbagUZd2cUhtray
	 TxlnwRgrB3iEj45y+gN6lNacT4Xi2ZDRmXd49+qc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DDC6F805AC; Mon, 24 Jul 2023 03:22:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7A3F80580;
	Mon, 24 Jul 2023 03:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46595F805A0; Mon, 24 Jul 2023 03:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CB83F805A8
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB83F805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o0pS9zXb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16B5460F1E;
	Mon, 24 Jul 2023 01:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9BDC433C8;
	Mon, 24 Jul 2023 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161731;
	bh=U1z3VtG0pGPvExFdvOAtlP5ooExECdMsVdDb35dBOsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0pS9zXbmxpcc5y+TtcC1XOwyWcbwzcqHWs5BQBYI6l9TAO5+niARLTWG9hVcnQID
	 9fB7oKLP9Do8bHasg27LOenKDLruN5qSVwsYaJ2hzHWOu1DynTN3/u6VlV266DJ/y6
	 CTaaKVsDYgXngNblJ37xpmkRpE5ibc7DihQMGPJEbAb4RY4rGnwC/TzX9IXJcNdJfj
	 tNRTLEAch+/PuzOjYFDEwso27RoTKgDiNio3xw4YNH7Oc7Bm8gUPlKnzH5VjeAbLRQ
	 apFFjTyhn4rYDftv+CDOJ3A86gJnR7CrMhkH/jFZeuuiKGZu8WGHKNZolycs+CKCVj
	 IfyekALokCPNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 13/41] ASoC: amd: vangogh: Add check for acp
 config flags in vangogh platform
Date: Sun, 23 Jul 2023 21:20:46 -0400
Message-Id: <20230724012118.2316073-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IVDMEKEOU4KNPRFVCVFNNKIY3ZWXMNCX
X-Message-ID-Hash: IVDMEKEOU4KNPRFVCVFNNKIY3ZWXMNCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVDMEKEOU4KNPRFVCVFNNKIY3ZWXMNCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

[ Upstream commit e89f45edb747ed88e97a5771dd6d3dd1eb517873 ]

We have SOF and generic ACP support enabled for Vangogh platform
on some machines. Since we have same PCI id used for probing,
add check for machine configuration flag to avoid conflict with
newer pci drivers. Such machine flag has been initialized via
dmi match on few Vangogh based machines. If no flag is
specified probe and register older platform device.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Link: https://lore.kernel.org/r/20230530110802.674939-1-venkataprasad.potturu@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/vangogh/acp5x.h     | 2 ++
 sound/soc/amd/vangogh/pci-acp5x.c | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index bd9f1c5684d17..ac1936a8c43ff 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -147,6 +147,8 @@ static inline void acp_writel(u32 val, void __iomem *base_addr)
 	writel(val, base_addr - ACP5x_PHY_BASE_ADDRESS);
 }
 
+int snd_amd_acp_find_config(struct pci_dev *pci);
+
 static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
 				     int direction)
 {
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index e0df17c88e8e0..c4634a8a17cdc 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -125,10 +125,15 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 {
 	struct acp5x_dev_data *adata;
 	struct platform_device_info pdevinfo[ACP5x_DEVS];
-	unsigned int irqflags;
+	unsigned int irqflags, flag;
 	int ret, i;
 	u32 addr, val;
 
+	/* Return if acp config flag is defined */
+	flag = snd_amd_acp_find_config(pci);
+	if (flag)
+		return -ENODEV;
+
 	irqflags = IRQF_SHARED;
 	if (pci->revision != 0x50)
 		return -ENODEV;
-- 
2.39.2

