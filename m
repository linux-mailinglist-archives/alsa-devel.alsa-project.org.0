Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BAE732AEB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB943E8;
	Fri, 16 Jun 2023 11:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB943E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686906185;
	bh=cVzo/h1du6EG71YMJA69ZOvL8XUo5XXroakRB2KzZho=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pDnn3011r93Ef9W4vhEFg8JB2ua6buEGQX6uspjrwfU+t7exQLg2eVRvQ3c0ywkVQ
	 fCJ9mPVvKNfCLfwXXur2UIYOaiwoiFjXc3dlVUPfuRy3jfVvPzRyZ9qZYWC17ogj/w
	 I/ApITMqj+7I3xDImu46xwRWF7skGW0cbVOLG9Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E64F80533; Fri, 16 Jun 2023 11:02:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B3CF80132;
	Fri, 16 Jun 2023 11:02:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 247B3F80149; Fri, 16 Jun 2023 11:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3C09F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3C09F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FtywWfZt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71C876222F;
	Fri, 16 Jun 2023 09:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EF3C433C0;
	Fri, 16 Jun 2023 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906122;
	bh=cVzo/h1du6EG71YMJA69ZOvL8XUo5XXroakRB2KzZho=;
	h=From:To:Cc:Subject:Date:From;
	b=FtywWfZtgsSj9FFvkPXXwo6WbvZLGQh+2L5ouZeJCIRq8qf+btEr6ccuQbacsOeo5
	 zwEcUnUrGyBg3M7mYLmj3cE9cC1xiuvjCZp7K09Tb3tPZ/LsFmp3t5T3SNEoGRhI4u
	 A7Tv6H/7geI+qr66OvZ9gksTWXwg4/qycNf1TuY8IHG2a+GHYcrQBn6Yu7KYRicyuf
	 svss8ubY8wrRBMqSn5QcK2POSanpEJmhtb3oE9N9i3FZAOi7EqUY+EcGNmBkB3ZfDs
	 X6nfcGOd+NhgLFFkNEChAnaX2f7MdfxAX3OM/yXJOB+5EezGd6CHIao4CSb4XxqlZ+
	 PNkWceMMoDYXw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ryan Lee <ryans.lee@analog.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: max98388: fix unused function warnings
Date: Fri, 16 Jun 2023 11:00:37 +0200
Message-Id: <20230616090156.2347850-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3UCNTXLNAIKH6CZITIDOQAJ224ASWRSW
X-Message-ID-Hash: 3UCNTXLNAIKH6CZITIDOQAJ224ASWRSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UCNTXLNAIKH6CZITIDOQAJ224ASWRSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The PM functions are never referenced when CONFIG_PM_SLEEP is
disabled:

sound/soc/codecs/max98388.c:854:12: error: unused function 'max98388_suspend' [-Werror,-Wunused-function]
static int max98388_suspend(struct device *dev)
           ^
sound/soc/codecs/max98388.c:864:12: error: unused function 'max98388_resume' [-Werror,-Wunused-function]
static int max98388_resume(struct device *dev)

Fix this by using the modern SYSTEM_SLEEP_PM_OPS() macro in place of
the deprecated SET_SYSTEM_SLEEP_PM_OPS() version, and use pm_sleep_ptr()
to hide the entire structure as well.

On a related note, the of_match_ptr() and ACPI_PTR() macros have the same
problem and would cause the device id table to be unused when the driver
is built-in and the respective subsystems are disabled. This does not
cause warnings unless -Wunused-const-variable is passed to the compiler,
but it's better to just not use the macros at all here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/max98388.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 8062a71150074..3d03c4bac6c55 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -873,7 +873,7 @@ static int max98388_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops max98388_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98388_suspend, max98388_resume)
+	SYSTEM_SLEEP_PM_OPS(max98388_suspend, max98388_resume)
 };
 
 static const struct regmap_config max98388_regmap = {
@@ -998,9 +998,9 @@ MODULE_DEVICE_TABLE(acpi, max98388_acpi_match);
 static struct i2c_driver max98388_i2c_driver = {
 	.driver = {
 		.name = "max98388",
-		.of_match_table = of_match_ptr(max98388_of_match),
-		.acpi_match_table = ACPI_PTR(max98388_acpi_match),
-		.pm = &max98388_pm,
+		.of_match_table = max98388_of_match,
+		.acpi_match_table = max98388_acpi_match,
+		.pm = pm_sleep_ptr(&max98388_pm),
 	},
 	.probe = max98388_i2c_probe,
 	.id_table = max98388_i2c_id,
-- 
2.39.2

