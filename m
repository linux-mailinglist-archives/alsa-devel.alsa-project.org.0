Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E71A840E5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3E66A7F4;
	Thu, 10 Apr 2025 12:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3E66A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281517;
	bh=L1x+MEpRCSfrf2Z5t+ZWnBQnsCOKl8zGDEi/DBrESfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dnRkR4ybVRx+ZR4l6WPXWSX2WMYIXYgsCCZbWVKKBQbN7jQ6HAGIEv45PE4uvlewU
	 0xFiYD7+RmMx4+IzqW7mpV0vWxRf/iAeYzQqTk9mmdWTB3WLtCpr49uVlJjQk0gm9y
	 lRIhMKUCHHwAwDjnQfRchE08wSOwgBROpi89cjW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF31AF80600; Thu, 10 Apr 2025 12:37:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A91F80606;
	Thu, 10 Apr 2025 12:37:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C27D6F8014C; Thu, 10 Apr 2025 12:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E411F80124
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 12:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E411F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=o8mlYTcd
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so459575f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Apr 2025 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281445; x=1744886245;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aYtjGBXatHaseT3Phi2jIW+StTZyswtuqFhYnfH/gE=;
        b=o8mlYTcd42EgxCrCex5G7dz4UfoxYo0Z13qLJEpDsz2Xl4n4qzp/jsBp49G7RYZYz8
         bBMvaotA0bTjVeMgYHUcmYdYUQfXiq96uPKx77D86PHAtnR5cNvcm6jwizHKAJpimZeX
         iEz2TCQctupM5B+2ojBm9Lsk2BLkLaZba7Nz7wIu7/39JRQmqVWG225wEsiIA1JNOKYE
         yoYPWgnGfeqUR9IBj1tKyH2IERVlZ6nooW/blDFCXPdxFimJj4aHs83gbjNeoC5wSWb/
         clFWu11NznjVgndaeXg7Y0H6Y6qfXb5QW7qa5k6WuWpQpcB1bHdhp5ra7IcGPIpTJnzo
         ugqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281445; x=1744886245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aYtjGBXatHaseT3Phi2jIW+StTZyswtuqFhYnfH/gE=;
        b=dH5smAiwc/EM3ZvtQB1TYsgb2A6lX67aw5fBl272G00oOBRSbg8pX1QSFanLRGig6Z
         LDcKvrR4x9L4l1vZabzhKcA4+xddVt0coT9+FRONDqQNnFoFnsfGYD1nlH+G/HLyBZxy
         QlEIk/bb4DjaYfnjeqn8EXDSfgkRr0EPZml95BP6nNRyOigiphvW7++eIsuz6nVsKtoR
         Ttmf+vTSvtcVY1RUqXEzDACalWn6yp5dU4DJiyeCzxBx0J5p66/SVWRnxG9h18rCl7Fz
         XMp5ZqJDk9J69WG9UVSpKuIBJGFkaxeVEW0svNyyflxc8CsXmelEAY9O7bf30haMOtPE
         XyBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHtSqUsV3ZdrHZz6kwUlgY7n5+fGjHsSnP+Xstiiyb6TqBVG/gOdLuknP4tlKpTPgCFhq5BwxE30GA@alsa-project.org
X-Gm-Message-State: AOJu0YzZ0bNjHgsi33KakGiR4LVeWrMqRQyVEIHw5wz8K7uYhMyCSrcq
	VLa/Y8pt8OJxghySXu9acJdmZON0vdDtQTod6m7UNIk7lkEqv4BhFj/Ep5/aX4A=
X-Gm-Gg: ASbGnct40bs2HkD2HxjBErYEPGVNX98q+nWj8bkinqaTsJ21mqAgja62MMOovpRqMUx
	g57XS/mGlExX76RBvXKaHOw02du87Bo/sjogMcXxuVjG3+nm5gnXC2EwUklquaT2jUKoDyiVfkO
	9nGQgtTnOqha3mZoi000RBVozuuwEX29WKrN8ilxwJDmpcQQX61UdmRl7IpKOsTWnjx4BSEbg/N
	5d/ytgW+tQ3iZeXtHRBmrDj2eSVJUPvEqc8W/GqmrWLUOaSmTXLtv2+Z5iYuShwS6XadarsBRih
	7q55HXw99cNfntaK3ggwMo3KFo7VZUHpIqjeIKU1Dt4xBzK9xG8wOA6CrVH07kaEMg==
X-Google-Smtp-Source: 
 AGHT+IGGCF1uYN0vSOy+9N6MTk1Sll7akKwdvJm3f6V81SnCFhS1Hq04fztkt0wX1t2RP9Kn4lRv9Q==
X-Received: by 2002:a05:6000:2210:b0:38f:2413:2622 with SMTP id
 ffacd0b85a97d-39d8fddf94emr1702026f8f.47.1744281445152;
        Thu, 10 Apr 2025 03:37:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:24 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] mailmap: Add entry for Srinivas Kandagatla
Date: Thu, 10 Apr 2025 11:37:13 +0100
Message-Id: <20250410103713.24875-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=ZhYHEoqrUkGkRgz46TiGnWcPMiKR/N1g2slVddB+DV0=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959Zm3y7kLG6HvBFTp7/7z9RyQCDI8Z0cZJte
 YmqqO7XWtWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWQAKCRB6of1ZxzRV
 N8i4CAC1e4sdQHEe9sOx1teSQqtqYSkc9V8pStNn0lGq2HBACEukAa59Qb7+IxwFcdI/fvNVwoj
 IZ8PFTqOl2N+eMpABQqYZn11RiZECUCl+LNEF70jhrN8ZolLoeYLYuC+sp7lrPdRRvjTzXlu+Bk
 QAOcD5+btV+okFLbjsM3CVCFyxYGCSQVlI+hGTDY8A1+VxsUZABV13u8JuXFsPsmCSqTwHeFMCC
 9/XJQjg6/D67SzfntnoC/FCsVMA/Z3HQbQJUsVLaVN2RVmdwcLCxDzEnNU5R7QD8dp+7NCAT2fa
 bG5/S05epDUFKboyGZpLCzqbQLUUVBJNFKO4xdKxG+KlGqpB
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z33CB6RNG6HZ77DQMDOVYGKPIPDBDELL
X-Message-ID-Hash: Z33CB6RNG6HZ77DQMDOVYGKPIPDBDELL
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z33CB6RNG6HZ77DQMDOVYGKPIPDBDELL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add entries for the various addresses that I have been using over
the years and remap all of them to kernel.org alias.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..0326d5e75012 100644
--- a/.mailmap
+++ b/.mailmap
@@ -685,6 +685,8 @@ Simon Wunderlich <sw@simonwunderlich.de> <simon.wunderlich@saxnet.de>
 Simon Wunderlich <sw@simonwunderlich.de> <simon@open-mesh.com>
 Simon Wunderlich <sw@simonwunderlich.de> <siwu@hrz.tu-chemnitz.de>
 Sricharan Ramabadhran <quic_srichara@quicinc.com> <sricharan@codeaurora.org>
+Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@st.com>
+Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@linaro.org>
 Srinivas Ramana <quic_sramana@quicinc.com> <sramana@codeaurora.org>
 Sriram R <quic_srirrama@quicinc.com> <srirrama@codeaurora.org>
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com> <sriram.yagnaraman@est.tech>
-- 
2.25.1

