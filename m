Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB7C9FF3A
	for <lists+alsa-devel@lfdr.de>; Wed, 03 Dec 2025 17:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8564B601CC;
	Wed,  3 Dec 2025 17:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8564B601CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764779209;
	bh=2DdsCcnSizR/b2VYv53Or+2+0YruRp1/YIJ4C1DFzAk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t4KiyabVCqIGEHGe/Bl204i8vUwYtz6gPAjzD3UtNuu9UpbtVXeolaSw3/stJVJAu
	 bWsqSKb+z8pHcIB2QvkSqnsCd0chFaO1dJM17/GsVpfHvafa9cEbcK3roehgCn1c4N
	 8OLUnpUnwgLVwKnWBeFr38IsUoj72IJPzEyxM6yU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABEF1F80528; Wed,  3 Dec 2025 17:26:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3511BF80528;
	Wed,  3 Dec 2025 17:26:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44BAEF8051D; Wed,  3 Dec 2025 17:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DF19F800E4
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 17:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF19F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QnvHQTNu
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b25dd7ab33so437539385a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Dec 2025 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764779114; x=1765383914;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odA/XIGtQ8Aefzv2T8xnxO8nMXdmxqb0qbtjU51/Sdo=;
        b=QnvHQTNun25xl72ULCgyj0Tp281AMYwubyVqS6Hr4DXWz2Xd+X33hXc+JOO2sK+fuF
         JCdjlC3hjUTeewS9ysPPaCNH9zODDuOkDaMkMLC0Mhrh70XC72r9ELYJK+DnEMxVUn/E
         j8niWdhqg/De6zcD4nwreZUgxs/XEkgSXCzduvoYi8iXADfR8K/6oR90QhtG9kH4alxr
         graVome9OTAMzyIFwgxhM6Rvm6X0B+Okw8DJcxDkBhgDiBZIUx7qHq7zMBWh3D4CW88w
         IynaMoekGEv6vVdtawruJuUyML51NjEz1X5+c6r5Mu5a44syaSO2+aSFu2xgNc9mHrcv
         jYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779114; x=1765383914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odA/XIGtQ8Aefzv2T8xnxO8nMXdmxqb0qbtjU51/Sdo=;
        b=hZlRUtOdVz/6Z1uWTPLx4gZ3pa3ZMUhVJQzXeGXcvpKiA2HHi6qMOtwWUzKVGRM+z8
         pnGvVwLA+7wdkvzijc6EW1CdbHkGWooz9NtNphlgjSC376dpk+MZT13+cf9bYBfE3sQ9
         jREFh80TqDS9fcFJpPU4GwEpIQjHSlfcCAxwgpELJftIHpTgUOYFja0hYXzWZao1P33I
         F2MVFCHsgP/DQreMv6xqjjkpJy1M6sV53xs7Eu8Q9mVvcElsjGyu8XtllIl8onA1W5Dc
         GRYCHHMb+HtnyQDPvXAqjC0bAJtvkKeMSB4kp2W9S413a1/toLyrKrWMasGJ34SVtfLT
         aOcg==
X-Gm-Message-State: AOJu0Yxei4E9iIBsGaxm28Ejhujhy9y51M5i4mrdf3kOWNuZmU10HGsf
	J1f3wjkxWY1BRPsGycFCeaj5XSEa39UwfVffllxAOLrJd07WT1h6pr/A
X-Gm-Gg: ASbGncv/EIGzt2mxCYjmnXm5MoKLabbImgjtaNN3o6OjtcQbj24MVR9h+rdRvbZ3/su
	Fd6QdWx6z7FfovvlM3SCSTsJLVqBWTwOgMCkwC0K5TIdrCU40iQX5dlMpYnDT2RBykgvGqGSVAc
	LYLbFIzA9A10GxMAEUft6HcFtovprQt0AEG0ULuGEaUMd7N5CLSdZ2VYwK4WLzXXkqz/qh7mp2q
	pjazoQP6giyaChuOzsO0LQysM+k+cRq6TggWtSZW5BLSXDP+ebrNFPc80j+7Dof7tKhKiEmYAH/
	Z0hrVSRbDeCkyb/d6cI899GvdZ2c+4g/OpX6Ek2wAPxqDGLCp10ybaM3Mj3Odcbt6ZX41Y9w58Z
	g9tsgQb2io+ouKxL5WCQo/tKLH1aymF0ync3oqfyPmQYzyYUEVBSF/pdFqy3oLdnT+JG20Qy0Hw
	sJGi9n8OsPn9U0WEGJyc5yk5WrngQpavXjX1RpqzdduasqIGq6YIba6SYRWD+bgdvJoVTsWzJjG
	Gea5SfEYRNnCowj9+FU
X-Google-Smtp-Source: 
 AGHT+IHzLTx09P/leFARnY6X5Rw+RTT4Z6ydiWIlqntcpCfQO5C9TvqgolhWSXC+nuZWkpXrCICBjw==
X-Received: by 2002:a05:622a:4d1:b0:4f0:441:96be with SMTP id
 d75a77b69052e-4f017652ebbmr37276351cf.51.1764779114397;
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
Received: from 30-134-MSI-RED (c-98-227-27-249.hsd1.il.comcast.net.
 [98.227.27.249])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4efd341f0ecsm115975311cf.16.2025.12.03.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
From: Andres J Rosa <andyrosa@gmail.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	Andres J Rosa <andyrosa@gmail.com>
Subject: [PATCH] ALSA: uapi: Fix typo in asound.h comment
Date: Wed,  3 Dec 2025 10:25:01 -0600
Message-ID: <20251203162509.1822-1-andyrosa@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AFWPLKYFCTLEIUO4KIQLSMNQ7K6S4LP5
X-Message-ID-Hash: AFWPLKYFCTLEIUO4KIQLSMNQ7K6S4LP5
X-MailFrom: andyrosa@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFWPLKYFCTLEIUO4KIQLSMNQ7K6S4LP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix 'level-shit' to 'level-shift' in struct snd_cea_861_aud_if comment.

Signed-off-by: Andres J Rosa <andyrosa@gmail.com>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5a049eeae..d3ce75ba9 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -60,7 +60,7 @@ struct snd_cea_861_aud_if {
 	unsigned char db2_sf_ss; /* sample frequency and size */
 	unsigned char db3; /* not used, all zeros */
 	unsigned char db4_ca; /* channel allocation code */
-	unsigned char db5_dminh_lsv; /* downmix inhibit & level-shit values */
+	unsigned char db5_dminh_lsv; /* downmix inhibit & level-shift values */
 };
 
 /****************************************************************************
-- 
2.52.0.windows.1

