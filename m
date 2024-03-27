Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACA88ECFE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:47:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4857A2C27;
	Wed, 27 Mar 2024 18:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4857A2C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561649;
	bh=RnVSD59YYhDiquPHZBqeUmKCnPtQzl1iOsxOnR+gGD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ux43zdsbBh2vfywx4gidg9zGPgY6x9HvDFxlUAU/xFj423lnuSOnloki0Tys3HNek
	 Sk2mlfKs+DXQaAYrfaao1KHmNXZl2XNRxczsHwbgtlLFcO3FyKaAH8pwoWDsTocLiB
	 LSn04x3XfGiz3L6VJ+YmFWu2JZRnMiieAFc9w3oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F706F80696; Wed, 27 Mar 2024 18:45:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29761F80696;
	Wed, 27 Mar 2024 18:45:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59A20F8061E; Wed, 27 Mar 2024 18:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 814F3F8055C
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 814F3F8055C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98848615EB;
	Wed, 27 Mar 2024 17:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B266C433C7;
	Wed, 27 Mar 2024 17:45:24 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:41 +0100
Subject: [PATCH 06/18] ASoC: rt1308-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-6-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=675;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RnVSD59YYhDiquPHZBqeUmKCnPtQzl1iOsxOnR+gGD4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsRlUsJoVFHMbWvmig9FH7sOGUyjca3O+TkI
 0tJ+a+BqNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbEQAKCRDBN2bmhouD
 13JcEACX8uKRocqQsjeeQUak3bmhYYz2LV2f/ss4Lo30G8GkBOnS0DpJMIUrPxSkLEr8CHgHbEZ
 Aj/rDm4n7vH26JJ5xCYwNSV9gi+06QXyIm7TkVSjXZMgu1wbCYChsfRg3JxwS0YMid6AXRGm3OO
 J827AEEBIOy6JT0E6jqJg9CbOZVewNdhCWOHkI/UJG25SXE6eFo4zHWDYKbPyScI7LuSze1RjVR
 yWjO8J4Nnxc6o6BCAm9oKOLwaJGJt6+DsboA1TnXPYCYl4g8YERHIrRG0ZIs7hRHIRG5IqtjTFB
 QRYtDULsGjzio0BgmREAXkOosdmihDgEZZQD6svPyqomDdY0iZMkEydw1FL0D5NTXzRcW5UEG31
 SKO+ILgaqQL/GJbe7G2p+AsfqKd6ibhZK3k71NrW3Fe2mFtwdkxiT5RDwsu2c6z76jQLicqc2Lz
 zK1TfzR2Yh6Bk1ZyS33B+7Odp3tNhFyht3cxy2uIKHPEW6zhx2NmkTmskknvzLb4L83MVOAhYlt
 ZzK9v6W8h1VFj3Vh0/dN8rXiCcEYfLhxQEAnMlWzcyVm3TtQlbHDIGkhSMc7z2Y8drhqHO0oomA
 a/IJyid/FIhAq5nepdp7WdmLOod3evCK5d34od6d4TIpK6KIgJmlTfnWnzE41hbkOV3FKPY//Xc
 uLjNm5LTD1COC1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: NTWD4U6CIWZ42BJ3SZFK4JGZ6FXMFWUY
X-Message-ID-Hash: NTWD4U6CIWZ42BJ3SZFK4JGZ6FXMFWUY
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTWD4U6CIWZ42BJ3SZFK4JGZ6FXMFWUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt1308-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 63d4abf964d4..563df483a466 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -804,7 +804,6 @@ static const struct dev_pm_ops rt1308_pm = {
 static struct sdw_driver rt1308_sdw_driver = {
 	.driver = {
 		.name = "rt1308",
-		.owner = THIS_MODULE,
 		.pm = &rt1308_pm,
 	},
 	.probe = rt1308_sdw_probe,

-- 
2.34.1

