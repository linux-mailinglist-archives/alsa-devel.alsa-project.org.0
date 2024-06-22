Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672591340C
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 14:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92056868;
	Sat, 22 Jun 2024 14:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92056868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719060712;
	bh=wguNbuw7FMvZL41k2nqi7sLsthh6o1r8emQiblZ3Bpo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aLYRSkpFW7sajDl1CIyF3tUMqF+iUQIKwt8TRR0T6+mHgzmiYOBld6NhRqlDGOZIf
	 PEB6zb2Dpm/O8c7QoAWRhd9ktV7aW+CidJ9dWlpSYUaxGS1bhPItT5NDhpteOWMzpC
	 WpPU/Ck9OLwzN65G82NCBhWUKYj1+in8aB242kn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76345F80604; Sat, 22 Jun 2024 14:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D54AF805FD;
	Sat, 22 Jun 2024 14:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11709F8023A; Sat, 22 Jun 2024 14:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF7A1F800ED
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 14:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF7A1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YmJ6M7PQ
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so6426981a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719060370; x=1719665170;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rYO/3H3r7dblkwk2TxcPuqguXSZncMIlUA/OhiIqjk=;
        b=YmJ6M7PQH9bWsANKWbCpDXU4pP760u/yhRfuzG99pGwFVb9XIPUNfcYpBQKqtUQnaB
         /nYnmhZXZlK3BCOENYOR3O7MI0ILCQXrbFrWDltsIVlKKRPq59NAtfqV2cZ2vE1ahMdm
         xtgjUR8JeTEJ7cjmyIJqR8iyM0yZOReXKtiyNinVjJ7G8uxWGtg38bVNC1+kPlmoCW3o
         lh6dzHDHTy/ZT+dV3MD4aaj/ptu7Zyuh5pCkLzry5VFhJY5b0nHjB/7Jk+kqgQynCsiC
         JS6738XvP1fJ1JbElN0q9mtX3pngiXlJO8Qw23HEH4cRiKupgcsxiQwCUqZL36eWf/VC
         dSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719060370; x=1719665170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rYO/3H3r7dblkwk2TxcPuqguXSZncMIlUA/OhiIqjk=;
        b=mvkmOYi9PupTAYYJc25bEtaOmTFOMIDqLsIpbIl6r8VVIDbcG1RsSOuO7eKWm8NvGj
         WtXp0zo9ziKwOB2Vv208OTVoHkSeLP3Un9/Ol0H2adQ7iPfiMLUXsxu1PUp3YnhsCMcM
         4UTr1D7PPhFyzq2IyVr21HN2/jTGXaeH5PKAMvMwcNWuY0fl6a9zo2yspwlbBSbeh1wX
         yIuAGBgluQsk+odjQy9yJSVC0hVAF832K0VdzETsVI7wZJujIzOQ0IMinRAqf7R22CyX
         VYN99lQ6SndAJrQB0L3Frmbj0w1lF1oVUEFklJEdvvxxRlJo+MC1XPTiBqJ12DKuPou0
         EtIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoJwtK4izbuRAB2PO2UncUjD/avyxLub4wy243tM5p7xbWZJhOPHryVbFYtx0y7nZUpZmnp0NQvh7eled6+HeZMTXrshcUxO11LQk=
X-Gm-Message-State: AOJu0YzoGbR+Qa+00r8t6pYLgqepeGMBC78t9lvDWzoidv8cqzaxdRkg
	0j3I6Cv/C8COaA/cpYTH1SfVexXbIUxv//QAKdV4nuGnrYHQIZIa
X-Google-Smtp-Source: 
 AGHT+IHUkvCwDmjtM5u94ZjAM6ZoN/Z0BO1NdF6gcnasiwVqh9Sdu5ciPtX5KTt+zJH6KRyvNqGWUA==
X-Received: by 2002:a50:d655:0:b0:57c:bec1:ff4b with SMTP id
 4fb4d7f45d1cf-57d44c2daeemr866438a12.10.1719060370294;
        Sat, 22 Jun 2024 05:46:10 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d31f33086sm2122853a12.61.2024.06.22.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 05:46:10 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/2] dt-bindings: sound: add ti,pcm5424 to pcm512x
Date: Sat, 22 Jun 2024 12:46:02 +0000
Message-Id: <20240622124603.2606770-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622124603.2606770-1-christianshewitt@gmail.com>
References: <20240622124603.2606770-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QASTQWX5GSYMDTD2QYOJGZYWXRG53JLJ
X-Message-ID-Hash: QASTQWX5GSYMDTD2QYOJGZYWXRG53JLJ
X-MailFrom: christianshewitt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QASTQWX5GSYMDTD2QYOJGZYWXRG53JLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ti,pcm5424 to the list of pcm512x compatible chips

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/sound/pcm512x.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
index 77006a4aec4a..47878a6df608 100644
--- a/Documentation/devicetree/bindings/sound/pcm512x.txt
+++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
@@ -6,7 +6,7 @@ on the board). The TAS575x devices only support I2C.
 Required properties:
 
   - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
-                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
+                 "ti,pcm5142", "ti,pcm5242", "ti,tas5754" or "ti,tas5756"
 
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
-- 
2.34.1

