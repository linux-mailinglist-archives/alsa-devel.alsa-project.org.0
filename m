Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492F7570F4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 02:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0772AE9;
	Tue, 18 Jul 2023 02:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0772AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689640267;
	bh=CrZhbPZ9FwBTokvrtGGOK79L/OJY8CV+5y15IrPndTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pEaVuAwjagq450uzHBFCtZedoHYUICjrdTHnqrL4Ahz47nTbEDO7va2tf1CUgwRuK
	 WEjgPwmRS7/HgH+VV5M2VX/TLSEWMPkxRFqtmZhHFQdzLbTWGMtn5HyrCD7byUK75q
	 hmgckV7amoFHX2gFacdUiZ/jbx82mqFGvJOyOqJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1407F8053B; Tue, 18 Jul 2023 02:30:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC2EF8032D;
	Tue, 18 Jul 2023 02:30:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 452B9F8027B; Tue, 18 Jul 2023 02:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EF72F8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 02:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF72F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ffFY7WQw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4EB761371;
	Tue, 18 Jul 2023 00:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E153C433CB;
	Tue, 18 Jul 2023 00:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689640195;
	bh=CrZhbPZ9FwBTokvrtGGOK79L/OJY8CV+5y15IrPndTc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ffFY7WQwV/lqerPI7KGjBkdWpPe8ulAGvEL+wXiFTO16y+pNJ9c8f7GOBNJlmpgVS
	 q1L59AjKvKUptn+tpiXZOAIwGOd8k8jXHPVoaVhPKGy8kEFj4cia9cgNUBKWiGDO2z
	 BAiMeQtjYsnYltDjmxcygnG0CfiAM56ihDVDIhqNP2f88MzLw/Ak70pMTzBFdxN0Y1
	 IRlQ9aeEyNfcFQBSFJ51mNms8lHrHPNY9WdKkn+Fbricq6jamNIRxff5kfNBDIYeWH
	 n2CAPOzyEz1351o5EQZ5vr1eU+wC3ZUSuu1ynu49xdpHbrnqq2xjqNf0+r1HrjaqOM
	 rgVRgtdH79D7A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jul 2023 01:28:42 +0100
Subject: [PATCH v2 1/5] driver core: Provide stubs for !IOMEM builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-asoc-topology-kunit-enable-v2-1-0ee11e662b92@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CrZhbPZ9FwBTokvrtGGOK79L/OJY8CV+5y15IrPndTc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktdz5m2OQFGCRftcMVv/Funt3wXBqKcBsv56oL
 Laitxdvs3yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLXc+QAKCRAk1otyXVSH
 0MefB/99za3fuZtdz0rVH5AeHcPCF7GaJTRkzzIhb5WwHhbT8jCNeBK3G8u+r9F0ahtSfH+YHlN
 1DcaMJ3qZtpnxkYNNO2VzxP9Z0swluuMgWoN5XbfsjVEyJz4xUkPpcK7J9avwS5Qs/xhm8br2YI
 tcTu+Gkv56YKzfd/zcpFwU+ep5lRpZG9k9JV+l7VKUVcvkLjuM05U9HD6b79Jv6Fd/kEQTnhA+k
 FmnRWzn141+lRfXHfXSmHxP8uDsSYB7guASWtRkdW/YAb5IABf8N3kZRC8RmRUpEF7vex++xnEp
 VHZEv8dGY4WNMrykQUZZOSg862WtTXokJI/I8WxJPsWpv54O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: YG4CWDVZII3MMHMTPRT4TEPP2S4NSFKP
X-Message-ID-Hash: YG4CWDVZII3MMHMTPRT4TEPP2S4NSFKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG4CWDVZII3MMHMTPRT4TEPP2S4NSFKP/>
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
without having to add explicit dependencies on HAS_IOMEM.

The most likely use case is builds with UML for KUnit testing.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/device.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index bbaeabd04b0d..6731d7dc1a2a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -349,6 +349,7 @@ unsigned long devm_get_free_pages(struct device *dev,
 				  gfp_t gfp_mask, unsigned int order);
 void devm_free_pages(struct device *dev, unsigned long addr);
 
+#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_ioremap_resource(struct device *dev,
 				    const struct resource *res);
 void __iomem *devm_ioremap_resource_wc(struct device *dev,
@@ -357,6 +358,31 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
 void __iomem *devm_of_iomap(struct device *dev,
 			    struct device_node *node, int index,
 			    resource_size_t *size);
+#else
+
+static inline
+void __iomem *devm_ioremap_resource(struct device *dev,
+				    const struct resource *res)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline
+void __iomem *devm_of_iomap(struct device *dev,
+			    struct device_node *node, int index,
+			    resource_size_t *size)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+#endif
 
 /* allows to add/remove a custom action to devres stack */
 void devm_remove_action(struct device *dev, void (*action)(void *), void *data);

-- 
2.39.2

