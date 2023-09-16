Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0BA7A4DC0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E26AA4A;
	Mon, 18 Sep 2023 17:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E26AA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052720;
	bh=/ZkE2aVCHFyUYumMe8VecCnjdA9CPGn0CksaV8Mvf/s=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cAQGTvgsx+plOpZNt6hcO9TWH4E1Fj51omVTY9DNlERAKTgGFFFvy+NhkNopKlbJL
	 pztZzYxtKvUeMlFc/IzXOhT/ppBq+MDT0/X4iFbmXUez67QRDqIOYPfJIGPonir55w
	 Usn/LUhOSiiV0O+e/2380QyTpjyxyW+mQTAl+C7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B72BF80558; Mon, 18 Sep 2023 17:57:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6202F801F5;
	Mon, 18 Sep 2023 17:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44978F80425; Sat, 16 Sep 2023 17:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8A64F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 17:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A64F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U1NWOofw
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99357737980so402861566b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Sep 2023 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694877726; x=1695482526;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVGzsDlKuJKroPOhSkmnAeMyQ1dYs3e+BSZkz5C7wOU=;
        b=U1NWOofwlryj324qIMDLJDztfUwwvbkZBiViJje1PYhnachQ1329WiJnXP9hRbAG1T
         pbCAD9OvdvFtppW1iMc7ihFYhXzW4H4JHXGzdS13xS4l5DUC4+X8wIWS1VGuJgx3AjVt
         iJVayNhTaw4az/KfPvGcqu7V7PuhAz9hD+Jght5M5qxBUYEzaJsKbolfX99u/G3dFN/X
         BxXzwZjeqP0bEkn8SZ5MMgvkhI/1dhlwvjJJmDVAfhiZ5Yw6ZSiRlNi6QBKXTe9eDSao
         teUchXv381oiKbn0+zbFRyXQADOfsmQqg1YXgHhD0Q5KJA+ngXhSus5sWI8eQutZ2Sjh
         Os1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694877726; x=1695482526;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVGzsDlKuJKroPOhSkmnAeMyQ1dYs3e+BSZkz5C7wOU=;
        b=d6GsZjLUbBWH+QqRwF3V4BD9htjZUqVdDkWvdXfg8GP7yi4qz6bdVUlfT1Si4f4Ufi
         0k3AmsY2zZQKpblbuzptCWjDumypriG70a/VUw0qWkYYvb9D+nTDtzl+/uJipM+A50MQ
         vKsr7x1mKLhs1g50BQnIcap02uYjy2UeonIGIwaNmiDXCOfGZFaBLqX17TtOv8BArvxm
         6KHqs9S/zknPa3FSGtLp1CHbHz4iYUk5r2HjkjlSQMixdDZla+TKYFMCJ7emVPWmCjO7
         j2eO1DV7hSGHu0g0JmcXhgCcOFR7Krz5KQItfZ46JQ3You+lD8nkSIFmUvrHOkZGR/CY
         A5Hg==
X-Gm-Message-State: AOJu0Yzbez4N8vlLKbRlwLi/avlYaWvqojTchvTXEG2Rch++l1Mc+Cxo
	3u8ZOZzApleGz0lYeV1nYSg=
X-Google-Smtp-Source: 
 AGHT+IHYNxN0HDzjVIHcKx5NFiuIgw2hmYh9a/qE3zJvic4TrmflB/86K+hC+AI3uFH9B7Jd9ovMNw==
X-Received: by 2002:a17:906:5183:b0:9a1:fb4c:3b6c with SMTP id
 y3-20020a170906518300b009a1fb4c3b6cmr3989754ejk.59.1694877726288;
        Sat, 16 Sep 2023 08:22:06 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41b4-ce80-0e99-b4c7-72af-eba7.cable.dynamic.v6.surfer.at.
 [2a02:8389:41b4:ce80:e99:b4c7:72af:eba7])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a1709061b4500b0099bcf9c2ec6sm3822103ejg.75.2023.09.16.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 08:22:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 16 Sep 2023 17:22:02 +0200
Subject: [PATCH] selftests: ALSA: fix warnings in 'test-pcmtest-driver'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230916-topic-pcmtest_warnings-v1-1-2422091212f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIABnIBWUC/x2NXQqDMBAGryL73EA0pX9XKaXE5Ksu2DVk0yqId
 2/o4wwMs5EiM5RuzUYZX1aepUJ7aCiMXgYYjpWps52z1/Zkypw4mBTeBVqei8/CMqhBtOcjIuD
 chWrce4Xps5cw1lw+01Rlynjx+r/dH/v+A291bfJ9AAAA
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694877723; l=1641;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=/ZkE2aVCHFyUYumMe8VecCnjdA9CPGn0CksaV8Mvf/s=;
 b=8rbNDw8hACyDjOlhCkl50WXigQ4v6zK0hH4HJvTe2D8UM3KCBmiJyRrH8nDQxrnwPxEjg8Pju
 6zVzSh+w6YfAHc/Z9L0ZOVHUfipd17mJDMcpSj0RgUeo9+F/GEWVrH6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H2ZRR4TPVRHWNKQLVF6454SAM7FCFDP2
X-Message-ID-Hash: H2ZRR4TPVRHWNKQLVF6454SAM7FCFDP2
X-Mailman-Approved-At: Mon, 18 Sep 2023 15:57:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2ZRR4TPVRHWNKQLVF6454SAM7FCFDP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Defining the 'len' variable inside the 'patten_buf' as unsigned
makes it more consistent with its actual meaning and the rest of the
size variables in the test. Moreover, this removes an implicit
conversion in the fscanf function call.

Additionally, remove the unused variable 'it' from the reset_ioctl test.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Defining the 'len' variable inside the 'patten_buf' as unsigned
makes it more consistent with its actual meaning and the rest of the
size variables in the test. Moreover, this removes an implicit
conversion in the fscanf function call.

Additionally, remove the unused variable 'it' from the reset_ioctl test.
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 357adc722cba..f0dae651e495 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -13,7 +13,7 @@
 
 struct pattern_buf {
 	char buf[1024];
-	int len;
+	unsigned int len;
 };
 
 struct pattern_buf patterns[CH_NUM];
@@ -313,7 +313,6 @@ TEST_F(pcmtest, ni_playback) {
  */
 TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_t *handle;
-	unsigned char *it;
 	int test_res;
 	struct pcmtest_test_params *params = &self->params;
 

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230916-topic-pcmtest_warnings-ed074edee338

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

