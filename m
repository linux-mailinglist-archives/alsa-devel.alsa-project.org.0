Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED2954787
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 13:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE0A2BA6;
	Fri, 16 Aug 2024 13:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE0A2BA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723806611;
	bh=5h6HEePH2xoOdnHNUdWDHF6E8n/HdR37iEtFBS3/PRM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QkF9RYwXFSSOUmuncPwrElNKAEMleBIftOc7K2ROqVTvbuXbuMMC7oAcEZzBkM6Bp
	 D31zTKFR3Sx+58SNak0F2NYV6J3G7EZQ5lt4TZsU9h6+GI5WJTPKzVqwEc+h5uY7oT
	 3p+uv3oD4459OByYAGJxYXyLBtSFGa0/n7brQGH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111D5F805FC; Fri, 16 Aug 2024 13:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A46DCF8061C;
	Fri, 16 Aug 2024 13:08:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9095F80301; Fri, 16 Aug 2024 13:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 847FBF8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 13:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 847FBF8016E
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B33561A0DD3;
	Fri, 16 Aug 2024 13:03:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 68A2C1A01D1;
	Fri, 16 Aug 2024 13:03:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7865F181D0FF;
	Fri, 16 Aug 2024 19:03:11 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 1/6] ALSA: compress: reserve space in
 snd_compr_metadata.key for private usage
Date: Fri, 16 Aug 2024 18:42:34 +0800
Message-Id: <1723804959-31921-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: QFEMWWALFMGNNKYCHMLDNP6AYGLONFHT
X-Message-ID-Hash: QFEMWWALFMGNNKYCHMLDNP6AYGLONFHT
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFEMWWALFMGNNKYCHMLDNP6AYGLONFHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reserve the key value which is larger than 0x80000000 for driver
private usage. Driver may define its own key values which are not
public in ALSA header

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/uapi/sound/compress_offload.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 98772b0cbcb7..7e9190538df2 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -120,7 +120,7 @@ enum sndrv_compress_encoder {
 
 /**
  * struct snd_compr_metadata - compressed stream metadata
- * @key: key id
+ * @key: key id, value larger than 0x80000000 reserved for driver private usage
  * @value: key value
  */
 struct snd_compr_metadata {
-- 
2.34.1

