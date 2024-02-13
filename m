Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8D853425
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:05:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A8A14DD;
	Tue, 13 Feb 2024 16:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A8A14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836707;
	bh=WNpttQEDrqvt8dFJV77xZZnD8lcLZbyCkaxL6f/dDNg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mV1MzIphOoezAN9oXB0q9ynNp4F+WgfsFdvuLZm3hRGmhrlst58Wvh92gfgZ4xEro
	 ng4adzbjtiXbgMsrThqBjfXwa81GI7V7VqG/nou23bZwHINyam+kvHJKrLRFFgl9A5
	 UTeR/56CzOJ8RAO/iYJMqv32Lk9iU9qQx+eAtb08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CD53F8072D; Tue, 13 Feb 2024 16:02:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 352B1F8058C;
	Tue, 13 Feb 2024 16:02:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F2F9F80238; Tue, 13 Feb 2024 15:43:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23A15F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A15F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=l5smCoRw
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e0a5472e7cso1700114b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 06:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835405; x=1708440205;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYNucHgPMrt9ZK1QrIVWntmjSqYfyys/m1XF/v5jsto=;
        b=a7SCAb9eIbJ3pMUfCjZZ7h3IZ3KC5LLgoOsQpT6tl9I+gTskLOJsF4ReQoGZgvi7Fe
         3c4lgqK2ya+wcjHLP7PnvOkv55iUhWDk+EyH+UUUOeb/8hur9IKoAdQN9sFFi6G0o1hq
         tDk+VAQggG2x8xo+k4yQuk4fIXTdNdfXs3uXZXfxTpaNzeZfmX6axUiLOjnSK9XHmno0
         QVoiPBO/hdkcA5VQBZrnnyXEtj6xasoItfbcVZeRwSdoZtRB4P+rfTqWCCX2a2zk0VtM
         ha9kHETW7P+bOWxAHw0Tr+JyW4sv2FLe7JgXYfWrFJPaporNajHAoz8q4svhpQlUesdB
         WtPA==
X-Gm-Message-State: AOJu0Yz0NcMz2onPX8LKz9n4UkCL0dltBEWJOn1qBLDVS5IbtWkhwo4j
	X6vfq/HUc7yWWwc0IYOgPZ493xy5JnSQ+yERr8qpj0P/OoUqtLoXG6UJDnlV3cNs3Q==
X-Google-Smtp-Source: 
 AGHT+IHLLGlo70VhjAv4z5ov36ZrZKFq8nDNMCqLQZYEXHlALKW6yInWY/9G7HaH9+IuoqUeK7+Y3g==
X-Received: by 2002:a05:6a20:ce47:b0:19c:93b3:c669 with SMTP id
 id7-20020a056a20ce4700b0019c93b3c669mr8122107pzb.29.1707835405253;
        Tue, 13 Feb 2024 06:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4zBhh7yrmLk5zu+RrfnMjm/6ZEH6JfqqMa/JIvOBxWQhZW+wzh6usqXGWcwMUagazDoJJGAkLZEYCozTpKub2l4senvn+V8FphaQAQiiSDfFZvkVdEO9czIVLZpFekJ8E8CTbCBhS6qpOysUOtnJd0Pr7Ldn0IuKaqqe5LTLYGq/81T3cqeWqo+pp00fjqK9SGMGwApeArmdoPWQkZoKDrTJ+DbWEhfqIRs3LRZ26tSGvl/Vg+mzHyef12XTJT5pDiATujcy055BrcvTl
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a62d105000000b006e08437d2c6sm8099904pfg.12.2024.02.13.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:43:24 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707835403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FYNucHgPMrt9ZK1QrIVWntmjSqYfyys/m1XF/v5jsto=;
	b=l5smCoRwvk1Mx5BdQFCdQtU/3ZsJ1FNBT66X17YgwebdIbuSshfBM3SXwxe8hYvs7LGKf6
	5FM4DbiGVuXj22gYOtU9H88lu0RNr/b7f8I0N2lYdX4skI6p0MDtGCE6dqlQ3Z61h2xGIk
	v045CjiSyBnCALlcewuUAfLibBQDuWhzSEYZF0eCdRHTSmr0/ojheAnrURXmTayNdPd4x1
	9QbAzG2iube256TVDuBdfYQQVzG8RlJNgmOxtCVTuw2ev/25yPNpo9ih2sTFlasDMqHEqI
	SWgB4SGxSFzVIP10zrLAuEFIsRmiSGr6LvYUuqu8Xqb7UVK7zGM7g06pWYk/hw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 13 Feb 2024 11:44:01 -0300
Subject: [PATCH] soc: qcom: apr: make aprbus const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-bus_cleanup-apr-v1-1-50c824eec06d@marliere.net>
X-B4-Tracking: v=1; b=H4sIADCAy2UC/x3MQQqAIBBA0avIrBPUCrKrRITZWANhohhBePek5
 Vv8/0LCSJhgZC9EvCnR5Stkw8Aexu/IaasGJVQnlGz5mtNiTzQ+B25C5K3o3aCdFv1goVYhoqP
 nP05zKR8fLAWPYQAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=WNpttQEDrqvt8dFJV77xZZnD8lcLZbyCkaxL6f/dDNg=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBly4Azba+yedlJSxrLcdV5QSQIj/y/UhcAHPfbF
 dDVyANESOeJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcuAMwAKCRDJC4p8Y4ZY
 phWnD/9rAPaaWWA6BJ6yJMPj/UIdqpENn4eB0nlph7th67CZFFwn3Q5o8lddz4AEEo4p7tPB5AB
 cgp4O7LA7iCH/ExEypmt6bMZzwVFCkgBABtGEYWq+9gE1s5iAZGPl/0Y6EdiHEhXHe6MSHcA/YG
 aWFlXIxp4liOhyVy1FQHtxakUUaCAFsFkrv+A5sEzCDp+EjV0NrHA6j/OtnMgIuCRqD27yDkSSp
 P0651lFbSuJPSowMFTHWZ/7jWjF3stF29rIt0JLJ8il0P2frbyA+zBp3AteLjduDCaikJQ3Tk1o
 GoV8uQcBRbfDU6Z07X/LO8rZ5Z8pXTQpIwpme5c3M2+dBIOFcscOYfVd4+s6Gzdfm66vAWy/bRA
 ibktmLZzaNWOQrldMnT1AvtL/QWDh3d4tFTapi7DFZX0KklDllYtHSuw4Pt7ctX9Jmj0+MBYCtg
 3+WiMBTC1bNUgkOlfB5sOdtB50t2qzmQUjHv8WVn8oD/sXQBXLmZ3iSNrfakyXmooAa95AqbXjI
 V0wlpBlIaFtWal8Lbjl5SufroglOceEYPwJ5FzQ2z/aj3oUFDMJO1BrNA9EPFdEOSKu65sZmVS3
 D9co0V2ciBHfFcmaS0YIXv21Fg5j+hOoN27LTF+nfrWZ+qucYMTubmd6xoZaOuFGdpxHCHqbUyq
 ND+n/BJP/jpCp3A==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R6IH45OH4DHBUWMFAVFKFJCDML3H4LCG
X-Message-ID-Hash: R6IH45OH4DHBUWMFAVFKFJCDML3H4LCG
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:02:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6IH45OH4DHBUWMFAVFKFJCDML3H4LCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the aprbus variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/soc/qcom/apr.c       | 2 +-
 include/linux/soc/qcom/apr.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 1f8b315576a4..50749e870efa 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -399,7 +399,7 @@ static int apr_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return add_uevent_var(env, "MODALIAS=apr:%s", adev->name);
 }
 
-struct bus_type aprbus = {
+const struct bus_type aprbus = {
 	.name		= "aprbus",
 	.match		= apr_device_match,
 	.probe		= apr_device_probe,
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index be98aebcb3e1..7161a3183eda 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -9,7 +9,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 
-extern struct bus_type aprbus;
+extern const struct bus_type aprbus;
 
 #define APR_HDR_LEN(hdr_len) ((hdr_len)/4)
 

---
base-commit: f7b0172f074a435a34bc0902b6cdbf1a3e935e27
change-id: 20240213-bus_cleanup-apr-305f89f9058c

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

