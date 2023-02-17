Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0669A9F5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:12:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D2BEED;
	Fri, 17 Feb 2023 12:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D2BEED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632349;
	bh=BB0n+xkJc9Xy7B2lrptZGE8c8ONrpfeHbm8HJDJyX4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qIUPUSYxbfMyjLsJZgGv1d+35hzAr1jidVNWLiiYXA0l71A6Y1lG5bzKi5kAZKTTX
	 l9AbN6NfJYR+uTfTJS2Ub/sMYaE1317ODCRue/ywd0evXnZU02fM7dsDfwGK9jj+bN
	 T7cKIBngDWkuIdEZCMT4yaTkUx58+GxsBoeSubBM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E790AF8055C;
	Fri, 17 Feb 2023 12:10:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5507F80171; Fri, 17 Feb 2023 12:09:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0560DF801C0
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0560DF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Owx1Fal5
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E28EC66021BF;
	Fri, 17 Feb 2023 11:09:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632175;
	bh=BB0n+xkJc9Xy7B2lrptZGE8c8ONrpfeHbm8HJDJyX4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Owx1Fal5qKGwyYicswEJSQOBMj7gxD9DDYR/igas+T58x5HIE0le86mCtQPe5Fnfe
	 DtSQlulkS/1R9xEtRv9Hd/NPQZGGgxvzv3IkM69YFTNBRdm5NMfb/srQ+IY3Q/nLqG
	 WwIz+iZN4LN530g4z0Fbbmz6Im4Eu/Qth3xFDT/g8d4PArOXoGoKyddCgQatr0/8Oj
	 9VDXoIBJKd2fbTg8fUqdoOLsC4pBfLLtzDtxhy1tSCJhvfbZwpB9v3ncWGhPTZWYwV
	 RYDcwwecJTX9Xw7j0M/a5SRNwsOTqSzHCPMg43lyjXgfLg2ffIB12gCk2ica1vurRu
	 boQQ2O5mciIew==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 3/9] ASoC: amd: vangogh: use sizeof of variable instead of
 struct type
Date: Fri, 17 Feb 2023 11:08:44 +0000
Message-Id: <20230217110850.1045250-4-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217110850.1045250-1-lucas.tanure@collabora.com>
References: <20230217110850.1045250-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4XYLQKKFM7QM66DB6HPR2EIAE2X5VUSA
X-Message-ID-Hash: 4XYLQKKFM7QM66DB6HPR2EIAE2X5VUSA
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XYLQKKFM7QM66DB6HPR2EIAE2X5VUSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use sizeof(*machine) instead of sizeof(struct acp5x_platform_info)

There is a possibility of bug when variable type has changed but
corresponding struct passed to the sizeof has not.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index f914f6327cda..43c80103d138 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -342,7 +342,7 @@ static int acp5x_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	int ret;
 
-	machine = devm_kzalloc(dev, sizeof(struct acp5x_platform_info), GFP_KERNEL);
+	machine = devm_kzalloc(dev, sizeof(*machine), GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
 
-- 
2.39.2

