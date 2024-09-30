Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CB98BC59
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A08C1923;
	Tue,  1 Oct 2024 14:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A08C1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786416;
	bh=+WSYWb5zuZ3ce7+vEdasSuujef9LTNe/rREu1EmZRfQ=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zcrvl5q0XGwEpk49GOpU4RA76+gDYeKNat78CZEDQG5OwCr2FmefO267b5zjLmFVF
	 x6TxhiYAvGQ6Kp3cVr6rFJ0m2woNbysRNYlIBW14DyfRfDkSDI1YIgAjqLK7JPiepU
	 IFkDqkhMJ0flHlyIwmWws+WIzBJ0rR3nUYi5Ju8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84F0DF80687; Tue,  1 Oct 2024 14:36:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EFDF80857;
	Tue,  1 Oct 2024 14:36:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C35F80517; Mon, 30 Sep 2024 09:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65DBFF80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 09:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65DBFF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256
 header.s=a4 header.b=Q8ZCwIQq
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1727680614; x=1730272614;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+WSYWb5zuZ3ce7+vEdasSuujef9LTNe/rREu1EmZRfQ=;
	b=Q8ZCwIQq1eEP+Z91GDz24IwcglzI4swQbdZWsiYd0d/GeCvLqxz3x8HbwPNJqfQd
	Bzm7dJs33hSV88gyHPG0dKp4O+XN8K9/ks4RxwuOP3e9gUcWUJz8jkJ71w4RlG4I
	84gykcIEvNH6zSqsjlSRTmPoysOzOt1JRL06kWGTwIQ=;
X-AuditID: ac14000a-4577e70000004e2a-9d-66fa506665e9
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
 BB.50.20010.6605AF66; Mon, 30 Sep 2024 09:16:54 +0200 (CEST)
Received: from llp-hahn.hahn.test (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 30 Sep
 2024 09:16:54 +0200
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Mon, 30 Sep 2024 09:16:46 +0200
Subject: [PATCH] sound: soc: codecs: tlv320aic3x: Fix codec gpio-reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: 
 <20240930-wip-bhahn-tlv320aic3x_fix_reset-v1-1-c040d86a4b93@phytec.de>
X-B4-Tracking: v=1; b=H4sIAF1Q+mYC/x2N0QqEIBAAfyX2uQXTHrRfOSI22zsXwgsNC6J/T
 3ocBmYuyJyEMwzNBYmLZPnHCl3bgA8Uf4yyVAatdK+cUXjIhnOgEHFfi9GKxJtz+so5Jc68o/f
 kOku9tW6BWtkSV/kePuN9PyDKxEZxAAAA
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Teresa Remmet <t.remmet@phytec.de>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, Benjamin Hahn
	<B.Hahn@phytec.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727680614; l=1640;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=+WSYWb5zuZ3ce7+vEdasSuujef9LTNe/rREu1EmZRfQ=;
 b=N+mcYfPSpYdHeYhTnv7KrB/jqd17s0RSTtUYij5tcfS5VbGi3Q86lKNPD+t2+mfRINbKKAMY7
 l5RO+yHzA7jC0LJE9FpL/POWY3qawyLKed1H1b6o+qCf2TBPPXDDgwP
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42JZI8nAo5sW8CvN4O0PDYsrFw8xWaw5co7F
	YurDJ2wWH+7/YLX4dqWDyeLyrjlsFnOfTWG26NzVz2rR1atvseH7WkaL7nfqDtweGz43sXns
	nHWX3WPTqk42j/7uFlaPfW+XsXms33KVxeP4je1MHp83yQVwRHHZpKTmZJalFunbJXBlrFl6
	lKngFU/Fg0vSDYxXuLoYOTgkBEwkdhyI72Lk4hASWMIk8eDmWTYI5yGjxNPnz4AcTg42ATWJ
	XW9es4LYLAKqEo3n28BsYQE3ia1bZrOA2LwCghInZz5hARnKLKApsX6XPkiYWUBeYvvbOcwQ
	JUES+xbvA5svIbCHUaL/Ugs7iCMiMJlJ4sDFCSwgDrPAIkaJY+e2gbVICAhLfN69hg3C3s0k
	sfpYNMTZiRI7X8uBhIUEZCVunt8CVSIvMe3ca6jWUIkjm1YzTWAUnoXkvlkI981Cct8CRuZV
	jEK5mcnZqUWZ2XoFGZUlqcl6KambGEFxJsLAtYOxb47HIUYmDsZDjBIczEoivPcO/UwT4k1J
	rKxKLcqPLyrNSS0+xCjNwaIkzru6IzhVSCA9sSQ1OzW1ILUIJsvEwSnVwGgfrlBre3Dj9lOM
	6QdbtYSeVkgzr1dpXnB9Q0+7R/2/VNG/V2p9l/HYzapewDbrm2Lk478XXvdt/RNrXn62amXG
	z39yize4r3dc9ttC9U2ZCldz9e0ffBuv1CZ1NbM75Hz4zDi1bunE2oi4slviSv4fT2l/vR30
	0aV41jPboOKL95Sm7FPvPavEUpyRaKjFXFScCAD6+GPKoQIAAA==
X-MailFrom: B.Hahn@phytec.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OPLJNMVKFWVBENSESZEIBXWYJPKIHS6C
X-Message-ID-Hash: OPLJNMVKFWVBENSESZEIBXWYJPKIHS6C
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:36:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPLJNMVKFWVBENSESZEIBXWYJPKIHS6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TLV320AIC3007 requires a hardware reset after power-up for proper
operation. After all power supplies are at their specified values,
the RESET pin must be driven low for at least 10 ns. Even though the
datasheet sais min 10ns, I needed more than 10ns when testing this out.
15ns worked for me.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 sound/soc/codecs/tlv320aic3x.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 56e795a00e22..d002fc0b99b5 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1367,8 +1367,11 @@ static int aic3x_regulator_event(struct notifier_block *nb,
 		 * Put codec to reset and require cache sync as at least one
 		 * of the supplies was disabled
 		 */
-		if (aic3x->gpio_reset)
+		if (aic3x->gpio_reset) {
 			gpiod_set_value(aic3x->gpio_reset, 1);
+			ndelay(15);
+			gpiod_set_value(aic3x->gpio_reset, 0);
+		}
 		regcache_mark_dirty(aic3x->regmap);
 	}
 
@@ -1813,6 +1816,10 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 
 	gpiod_set_consumer_name(aic3x->gpio_reset, "tlv320aic3x reset");
 
+	/* CODEC datasheet says minimum of 10ns */
+	ndelay(15);
+	gpiod_set_value(aic3x->gpio_reset, 0);
+
 	for (i = 0; i < ARRAY_SIZE(aic3x->supplies); i++)
 		aic3x->supplies[i].supply = aic3x_supply_names[i];
 

---
base-commit: ad46e8f95e931e113cb98253daf6d443ac244cde
change-id: 20240930-wip-bhahn-tlv320aic3x_fix_reset-cca918a4889d

Best regards,
-- 
Benjamin Hahn <B.Hahn@phytec.de>

