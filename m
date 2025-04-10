Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C2A840E2
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0ECB6A80A;
	Thu, 10 Apr 2025 12:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0ECB6A80A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281502;
	bh=g82gY1xhxcNU1gWfdeY5y//QX6zBB8SepcGIdHSH0QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tu8j31OVsmaavtfTh0toeCS6/Fm96833+nQh/VBaw24rJMYISCOMY2aNama3SOqzZ
	 q0PAEbHFpmmV73Zm9vR4y0Wj8vxhfy8amFkZtY4yOXqjq6QKSJmTLX+gColpKuQxl8
	 2gWaNvJ8G6eYaqOyRE1Az0fsJh4AwvzwpjzCAIMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55294F805E7; Thu, 10 Apr 2025 12:37:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABA1F805E7;
	Thu, 10 Apr 2025 12:37:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A958EF8014C; Thu, 10 Apr 2025 12:37:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B45FF80124
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 12:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B45FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kwlVWbO4
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-399749152b4so266299f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Apr 2025 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281444; x=1744886244;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=kwlVWbO4x7RDh+ujXrXOnsvx7l7rzpM2nMkG1iawclX/N6OQIi/md4ZH9s7QlGtU6t
         rOvay75dx8Ivl3109yoXjD/0Ml6VWAC7OyB5Y0E8370mLfN0pz2/4FU/7+dJmO+Hlk9t
         2a+vyJyFcAHwe6WAMkBu49eF53U6798emJttxe4rXiIrgkXNbjqiB9/kMfZhOHtVvfv2
         GALY9aWb7soIYVAbrPk7TwAHrwFTx521fexfMKsr1CIEc6KnyQ+Rk90smTOb7po1t4FB
         h2PbzNdzZe7YasU51wJZe95Q3IAHq587H4hv3f0aGGC/N1vdQnj3S0ZPmFgMEHyh+sUb
         eCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281444; x=1744886244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=knhQg129NQggxNJsYvTD0WyIsGbspeSFeEIlDPCoz1pRH3ljcw2pmF4B2si4zuMXWb
         jrDFEN9IXDVuEu1UJDjdHR+GXw9uMNFw2YA6c1gQGwnVO9IdoGBhPwQk4ohVQggKrpsS
         EwsXk4VIQsxSz/RhgLjFaSp61s3dvt6NNP+giS9SHufFCbIvEPP2HqRSW7b56CFlBzYX
         VVWggqEE1wwgW6zfVMWDHjeF2HZPnesQphvKBdDRcbE2D2lmGRrZ1bunIbKH2LwELw3p
         wXPXnJkoYZpoNVst5L5hk0KKSSfRg+dN678xoow/AVE0+iat0V7CXEdNmVLxDu1NJAoV
         K7Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUme/EPekSIcyb4McpXQzvoJUO4g3RwxqAz9VTOF3+GXfiuP5BNixwNNQnw5y6t+rV07dG0fsit089g@alsa-project.org
X-Gm-Message-State: AOJu0YzTJaD5XUb8Re3q0K+YHc17L1KcqvstOaTvxB/eNpxnq3fVxwVX
	ZooaFtLqLJU4JPelXDMoWObTjpfMKKHji0SsuYqqW9Bf5/lFfxI0IB4WZTbgSqhcUkRUg2T08+b
	3o8c=
X-Gm-Gg: ASbGncv5hgugzxQ5WGJNQ9oe6ajyfWdAiuCclTn6og+LazLOHH1qers8q+LAHywSkdJ
	P4WSbeCtpz18AhD1Cni49OiWr/Vdu00dU1ynw4oQQuwYEdz6o/ilFu2BMCvUojRHjVSgMDqZUqT
	ogMLPJ+tTUU9GhpVZ4BfacyfnePMNZw14uh6JvcXfiK2QONPTakUAPYgPuEGK8+TvfUqMDEd+Pc
	8a5C70Jricdf1JF0VSUXk/ihGXaqc50LXoHPmQUDgmavAGgJmqEH4vyEftmLWogyvqVGymZwC0Q
	Th30ZwVcUibs+oIad9t3WbJWrVvqVjsBmFzLBJP1guZybNw2KAdI8vMSUEj6g74skA==
X-Google-Smtp-Source: 
 AGHT+IEHtath/9fjeA3GlI+26reTGsqkfkI9JQfy2xnJmqeyhEm1jWIGOX2/OQqJlhE3Dk/VrZDbzw==
X-Received: by 2002:a05:6000:4383:b0:391:3157:7717 with SMTP id
 ffacd0b85a97d-39d8f491bcfmr1794974f8f.34.1744281443890;
        Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] MAINTAINERS: use kernel.org alias
Date: Thu, 10 Apr 2025 11:37:12 +0100
Message-Id: <20250410103713.24875-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=X081G5b8ZJlECnTTMUpLb1rMWL1BAhU9ovFKI7eRRN4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YJ14iAJU7//C7aknncCha6Mtq08dvOrWyn
 /HNnuNGqKqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV
 N3txB/9AnD2EaTyqWg9hTGWre3HhXjm+e4ArOy4+kihuI5qZt/0DIFRwwhMl5TagJHghVSfRqDI
 fgFMaFEx/F3yTAb+6B7jGn9MWe0GMteRQL/MysODm5+PBjeuYckxpEUsO9hcaI60xzkXcVzUGye
 a4vxJ0ozhUaROwiAPId3n2aPFUfHG/ko8X5KCSLrFCF5QRBOy3A1apUomNvdN4MhMoNTY2QRpWO
 hUih2OClr3o2uTC2eYmSNAw/FhE3tk2WpA3g53iMViuSRvQrVgTrm6ubCUZL7g3CHEF3mk6fuAl
 2zu6QU2DVNut+mt8rwLSWlEwmydhaJP2VaekFFSSeVeuuyse
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RGGGBAMKBWORUD7HXLPQM67IPIB4ZDD5
X-Message-ID-Hash: RGGGBAMKBWORUD7HXLPQM67IPIB4ZDD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGGGBAMKBWORUD7HXLPQM67IPIB4ZDD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

My Linaro email will stop working soon. Use @kernel.org email instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..f9a9d3dced67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17368,7 +17368,7 @@ T:	git git://git.infradead.org/nvme.git
 F:	drivers/nvme/target/
 
 NVMEM FRAMEWORK
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git
 F:	Documentation/ABI/stable/sysfs-bus-nvmem
@@ -19573,7 +19573,7 @@ S:	Supported
 F:	drivers/crypto/intel/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
@@ -19873,7 +19873,7 @@ F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
@@ -21921,7 +21921,7 @@ S:	Maintained
 F:	drivers/media/rc/serial_ir.c
 
 SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus)
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/slimbus/
-- 
2.25.1

