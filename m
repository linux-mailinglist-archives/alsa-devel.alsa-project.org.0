Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E892BEC5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827B6846;
	Tue,  9 Jul 2024 17:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827B6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540239;
	bh=NwcjSKqDE0VK2dDbdmqM/92kBglAO28ukjiQXm09KUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+81d/MXVJFEhv9ZRC/fUPR4eauYbv2clMvOn/ikkSoG//JR9eR56UdplC0DORFHT
	 eNt0VvE5hgHmAUrMHMZYyjHkPWYO7UbH5/Jzt3pKMioh3KxitccMm5fsmjc8JQD91y
	 eirvPR1yjI6RVyXN1oSbi2zVMS1yEx20zGVyKQ+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90A84F805EE; Tue,  9 Jul 2024 17:48:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7049F805FD;
	Tue,  9 Jul 2024 17:48:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDDF4F8025E; Wed,  3 Jul 2024 18:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F120F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F120F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OGyDHcac
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so4139065a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023675; x=1720628475;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hjyRNvMZXMYBEm5NP3z8RmRqPF9CkIDkfVc08IOZB8=;
        b=OGyDHcacdJiY0gCYwGfCPC3yuD7g+b24II8SLZH/RBvK+HkzyLBkJe0EU8f4H/UYqr
         izy+0LwIIDC9FS0DaIgqkjJ37ud4VYD88LvbzvXxjely8YjS5jtUno3K5WaN4vKiCQE9
         MZGZej9kzt6LQCxQPwjEBImQMavbyr45k4ItE64b1oBmM6duCuW8767udEvkAz6OrerL
         paD4SV2GcM3mSPLF/18d9VuLC2ljXEd4hZc74trFyyl9JLx+FQDDYIbEIPkgFZFeBEK9
         sqiPCOUga7JVOIaSQibdS9xDcnk1k0Vz/UWy7PB7ciTUdRY5m562r7POnzw29I4Ywr3K
         5Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023675; x=1720628475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hjyRNvMZXMYBEm5NP3z8RmRqPF9CkIDkfVc08IOZB8=;
        b=mLEKQSXOQwTTBF3fbHc/LfUVqVxELsKF8WcrbqDPy3MSHbI7i/RQpZxWlebFGp4qPp
         nP0h7P1P39ETISaVCRTl49dCY0GTqZBLpf9yb0z9lOkb4lmBigbZyFq+b7GMJ5nMg3mw
         4NBAe9deEPfGWZD1OBx7eIRNqtXsIRevh/ol0BywG9GpCob+HZLQZLNQRWQXfpFsLi+g
         aGALi+3c0b6Bh2yDVm6ZPeisqntupfjby7pQ2RNaEVl7iOnymfCv4SXgBVvEvOs5BLwb
         FNpaQfni4ELRXcdoSY8eCDmMztfqikfvV7lnc9qzLQiP1aK+tf/tsYHIA1NdgORx1GkF
         mz9w==
X-Gm-Message-State: AOJu0YxlsWd3LQKWgcQiK5O1ZBTgx8ZNxzjVJ3ItzhwRKcRGndgwAinB
	D7yY5LTGqo1c7W15pE5cCrZ29OgjMImNro56SMVhXg/ETobKcird3WZajXYE
X-Google-Smtp-Source: 
 AGHT+IFOgOBRrS9IUtn6qtfyrq5vCvZtNpLMPWCmi322966ijwSGZ4lwhvUtQ+TzJoBprglknSsVuA==
X-Received: by 2002:a17:906:455a:b0:a77:b249:7845 with SMTP id
 a640c23a62f3a-a77b24978dfmr6398866b.68.1720023675011;
        Wed, 03 Jul 2024 09:21:15 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:20:58 +0200
Subject: [PATCH 2/9] ASoC: cs35l35: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-2-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=727;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=NwcjSKqDE0VK2dDbdmqM/92kBglAO28ukjiQXm09KUU=;
 b=qRGQKMbhjYvNJI99p/tB7KMd8jCtxTve1uuNNnquwCevb6IQukXQIFf3b4dH2atJCTqzqRdZG
 i9gkyQUG0ToAAElojBWoubl2XVu3HmlbhADGvlciUCcyvbujH5dzuD8
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZJEAAUOXKGVKPYUOR7F4WQ7HXBOSYWRO
X-Message-ID-Hash: ZJEAAUOXKGVKPYUOR7F4WQ7HXBOSYWRO
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJEAAUOXKGVKPYUOR7F4WQ7HXBOSYWRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`cs35l35_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index c39b3cfe9574..7a01b1d9fc9d 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1086,7 +1086,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l35 = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs35l35_regmap = {
+static const struct regmap_config cs35l35_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 

-- 
2.40.1

