Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8CF8BFDC3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B49B4741;
	Wed,  8 May 2024 14:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B49B4741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172830;
	bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IYiqoodHLcVj3/uV3+wlsPs2SACTLPb7lvh3T7tOSch/Cr6H0wTxmNfGe87D89CG7
	 kdvNIGfQ2rOTofScQK46SKLy2V8bwLAbXFJJY5rGWT5AecCDMNb+zHGeXqX1Cr3pim
	 MYLAU2JkSvkaaOqpap8gu2h8FsxeM1j3bFpNf3OE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E1FF8069F; Wed,  8 May 2024 14:51:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E6AF8069F;
	Wed,  8 May 2024 14:51:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D611F80570; Wed,  8 May 2024 13:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C105CF8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C105CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dzHz5bp0
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59d0810f59so667730666b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166079; x=1715770879;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=dzHz5bp0ZLGyn9obBHPEuPgymfJDQyPX0mSwRbwWoOABkWDjjZY6lpUoWPF0hbxY1W
         I+uz5Kx1DjCysj8tRr8isSW/AIiZXGaBa+4n5a5UnXv/giGs/lqpaAfhQIlHY/wHB4wu
         fPJs/ne6nfpl+Goxt0UweEsuYRPs/qdr5fs39bszsxOAiCX5FqkEsShWvBME/y0AwJ7f
         btTBAQH2UDfn4MdmFf+7b4m29D5CL9hvgMm8Xd3D01JDak/RTTfYbSGXJmoVWqQYlQ0e
         VVrwWjQL/FSttfXT7+LFhHhj9JQIaQz38JwJ7p77vmwg2h5qV6VSk8dkpqfkvoUfV9Zo
         4M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166079; x=1715770879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=bJG9gYMrmrReo7z5dAg3UX4JRhCDlDPMmIN3bQsR3wRlzIOn6UsjrWbdB3Mlw/jiLY
         wm18dUsBXP4AWJsFQplM35UniXMOuFxgqB1yaBgFhW7sa4T1cd+cCFnorM3MAA+4aQZ1
         iHyOkFf/tM19SVVvo/72KRvAmXKyOylUSVyno0hW3Do1aukw4mDGo9gQpJnEDbxn22s9
         Nmj7MCBXDCVCjsCVEpj2cqMIpEkGEK0OZAuI7huvM8YHpLnFStIK+upuQvAoN2LE4WN6
         6Oib6mt7F8lwa/u6N9IIOnRGNg3TUJHKg3MaMvO9+qbRwvazwF+xJlIx/pPbpN3oyYnf
         jZkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv6CfNGvSSm7a/ldyt4bwzl6bWHGwZ2CCKgF8r0ml6Ik2ipnumtseozT9kXGNnd2Jsj2e7aXWCs24qNZ5fA6dvqMzQPQJhQxG9ub8=
X-Gm-Message-State: AOJu0YxCQ7bSxa3U+6ArvpjFhJ+Gu5108e6ZVCn6eExoWDTdipLiiCGr
	0Lb1d789i9G8cN3ZPg8ggVpXoDaJVJXDrPrsf8/D6zS2rC7fyR3Z
X-Google-Smtp-Source: 
 AGHT+IFgeu/s+KC8rDn6htjx+jvP1Y3rc1ZlgtfjnZ0vURY07Nu9Xv35QHBlM4I/VNTBm/3YvoUPAA==
X-Received: by 2002:a50:ab59:0:b0:570:3b8:a990 with SMTP id
 4fb4d7f45d1cf-5731da6977emr1667758a12.39.1715166079292;
        Wed, 08 May 2024 04:01:19 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:49 +0200
Subject: [PATCH v2 1/7] ASoC: dt-bindings: samsung,midas-audio: Add headset
 mic bias supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-1-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1024;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
 b=K1veHz6hjzCU7royAnxjqrMCC0z9fIknAhe0rQDN3eWSJhF3ZkHUPxbS3lAcGY5M1qORpIsuP
 pD4Lape6OslD+fk6fUGab9UEaED1Tl0U0keF0AjW3Lq1k9isWgrReLQ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K2T675U5E2X4M7AUZ4IFVNYTQMVIZVY6
X-Message-ID-Hash: K2T675U5E2X4M7AUZ4IFVNYTQMVIZVY6
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2T675U5E2X4M7AUZ4IFVNYTQMVIZVY6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices use a separate mic bias supply (also referred to as
"ear mic bias") to enable/disable the headset mic.

Add the DT property headset-mic-bias-supply to allow for specifying
this supply.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ec80f529d84..6ed53dd0bb53 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -53,6 +53,9 @@ properties:
   submic-bias-supply:
     description: Supply for the micbias on the Sub microphone
 
+  headset-mic-bias-supply:
+    description: Supply for the micbias on the Headset microphone
+
   fm-sel-gpios:
     maxItems: 1
     description: GPIO pin for FM selection

-- 
2.45.0

