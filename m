Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812937570FA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 02:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5A9DF6;
	Tue, 18 Jul 2023 02:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5A9DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689640320;
	bh=wRRnJwjd9xFCNGY/0Tqpmscr+RMrnGnIgCFrmukZL1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aeFo4VNLZJ1gCUaFzdQY7l+CUlV/16oIunH/pS4KuMchCRfwzvHOZFGi41Th1wsOY
	 SIxKsnu3SShX2kemdKDNKibBmJSt2oihWckVxx71ZURKWYVrbsAsf9PLu7vOdfZFGH
	 iUqMq8nlcMGgdbRtoSbMsYHveS+uz65atY3IoIrk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB65F80567; Tue, 18 Jul 2023 02:30:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74569F8055C;
	Tue, 18 Jul 2023 02:30:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE8CF80153; Tue, 18 Jul 2023 02:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21051F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 02:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21051F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fNirPgcq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E03906136E;
	Tue, 18 Jul 2023 00:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4734C433D9;
	Tue, 18 Jul 2023 00:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689640199;
	bh=wRRnJwjd9xFCNGY/0Tqpmscr+RMrnGnIgCFrmukZL1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fNirPgcqr0ah+kdMBVwWRxPBnVTY51yFpbxXmVMGo4Ow/gkTvPRIkts7f69Hk5ngG
	 F/xpp6iysIAAvNhg41/4Bovj8jfZ27eypmzzMW5GlUv/NLDO7AG1JDhQGbfGsMlZ5M
	 SoKw8ht1r4Sb++IP2N2zeXIRnsRtHM9t+s5EoPiiZMC0B/bCM5aZ0ykWYGUx/Hljjs
	 S1mLj6w6mjHPTA8mYqv7jy3uhN3k/VSmHwdGS/e3jFo2Pd9fywLeHdkosL+8ZFxqJN
	 MylH9VpNnV36a+AtPN+AmyK7UTQSJnw3bwGIHR5eIyKz+pDpici5nUB+nuYkwNpAhP
	 E5F9MWIaxCoWw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jul 2023 01:28:43 +0100
Subject: [PATCH v2 2/5] platform: Provide stubs for !HAS_IOMEM builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-asoc-topology-kunit-enable-v2-2-0ee11e662b92@kernel.org>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wRRnJwjd9xFCNGY/0Tqpmscr+RMrnGnIgCFrmukZL1s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktdz5HH5KULEXbuQ1q25QSGhhphNIcj9NRdlYN
 NgFp+BhFLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLXc+QAKCRAk1otyXVSH
 0CeGB/0V05WlCqnoWtp17MzhLgPRsjEddQIW26JPMXN0EMFxBus8RjbLsuwVOs88wy5oq/vHLZT
 tgjoOEB8ZFnCOL1zxrbnuuUfFJWqAHFwQcVJHzdwCBSZOD/kElqRLfZJZMu9/Wr47eOiYg6vfra
 4iCi6f6S6a0EHF8LyRgF4NT7Xaom9J8xYoeyLvp5aBiCPMWiGr/M3Q1M9m3Y0gCMjgfvC8j3/k6
 /i8x7HlCwlbIcEAL/kYUnEIeRKSTlGlTcKZJLkfkw4+MYx5v7kVqEIb+5sxNqRv8hNboSSxY+N+
 dwQJ6NaU17fD77ORtRHlV8T9DkDeLxMIfsW5+wrzB5twpsKn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XW3C6X7BDXRQVB5B4GVMEPL4AOTRXFPV
X-Message-ID-Hash: XW3C6X7BDXRQVB5B4GVMEPL4AOTRXFPV
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XW3C6X7BDXRQVB5B4GVMEPL4AOTRXFPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The various _ioremap_resource functions are not built when
CONFIG_HAS_IOMEM is disabled but no stubs are provided. Given how
widespread IOMEM usage is in drivers and how rare !IOMEM configurations
are in practical use let's just provide some stubs so users will build
without having to add explicit dependencies on IOMEM.

The most likely use case is builds with UML for KUnit testing.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/platform_device.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index b845fd83f429..7a41c72c1959 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -63,6 +63,8 @@ extern struct resource *platform_get_mem_or_io(struct platform_device *,
 extern struct device *
 platform_find_device_by_driver(struct device *start,
 			       const struct device_driver *drv);
+
+#ifdef CONFIG_HAS_IOMEM
 extern void __iomem *
 devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
 				unsigned int index, struct resource **res);
@@ -72,6 +74,32 @@ devm_platform_ioremap_resource(struct platform_device *pdev,
 extern void __iomem *
 devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 				      const char *name);
+#else
+
+static inline void __iomem *
+devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
+				unsigned int index, struct resource **res)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+
+static inline void __iomem *
+devm_platform_ioremap_resource(struct platform_device *pdev,
+			       unsigned int index)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline void __iomem *
+devm_platform_ioremap_resource_byname(struct platform_device *pdev,
+				      const char *name)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+#endif
+
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);

-- 
2.39.2

