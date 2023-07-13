Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE0754EB0
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59BD0847;
	Sun, 16 Jul 2023 14:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59BD0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512298;
	bh=xQ4w5iebjkSzGuQ/RTDrpEWkMpL1OkxXxjzaVL6jiAw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u0gumXPf58RO6i3Udk4Po7lKVK/bi7Y1cnHFQcLSqMcdoeUleODuzbtdFz/y9sPnN
	 rB3rOW9m7bsWBQsK15oEpqD2+47Q8WTDe2kCvMFUMUKOr4pvO1W0Xjq40vo8QYCMO4
	 kFaEj9COw+/OEs1vMNZEiDqiJdSYLsTG8ihdMDa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E875AF80535; Sun, 16 Jul 2023 14:57:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DBF1F8032D;
	Sun, 16 Jul 2023 14:57:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5971DF80249; Thu, 13 Jul 2023 17:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 555B3F80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 17:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 555B3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=cPJcXmar
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b9c368f4b5so14289675ad.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689261470; x=1691853470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkYvuheuXxUs7lcziZSh45/cEYAEtU5XJFKyTCEdPAw=;
        b=cPJcXmarGy/THqQS5YeBkXPiaUN6TNcqTUg4N/gUAzoGAZF/YDWi+9CV32JMSIufHf
         eGsnoa5VCpDibdNPlLNPjuhC9X10Y6IzZKZ5yyqVwPbcisWxLeeFYoeOXaYpVctMNeXc
         bk0rfmLISbTW1sVPcX48CvKFHh/TxKtg2ph3oCO38dWTM+Nz2U7TgMbCLLf1y0mIeUFs
         2JeQ2xUbm9WYLUT3c+PGSaud31GKWHfdJgZGHaQwDvPc5QGQn9hD+tYyISUmqRT9Nbrv
         BcTDGVhWLoADC58nzgh6sKcjBRZS2gMNCPM3Xrz0j3dkS6FpEiiMWSFYZ1zpRJ6PuBpi
         65Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261470; x=1691853470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkYvuheuXxUs7lcziZSh45/cEYAEtU5XJFKyTCEdPAw=;
        b=g7aYv26UGKT19frsbqBrZzhPeu9rK+imNN+bU+vdAz3csGITjlkZXcW3kzINuUyVKj
         8oeE4TkDnDtYwf/WFFrbvMKZ1BAvcMFM4pG51R+fyApBo0N6hw21/BV/DBg5gKtxKhHo
         EXjmqjnOHV5QBzEhuJf+lRd99mHV41Ndl0mFW3LwR82u48+J5hydTUy1oK7Mkn4lXSpn
         xEeB6Mc8nzVaHCanYbcPgzP2AIaQakZ0tqtatqhTQUh/sE6PCMNZu0jJoFp+XTwnVv1n
         tz5DQ4z70mvurSbCpFvViiglCmT19HI0MLYVlOjepUH5c6p56gq6BHzg1rhsZO8zSdJf
         BSxA==
X-Gm-Message-State: ABy/qLZP3OiRWbKSl32jrRuDlmlsvqcQkB2xLbCSGZDbHUBfSTN+ARkg
	2HlW1sslqe81moFAE7TJ/h0=
X-Google-Smtp-Source: 
 APBJJlHqbZ9l5bN1xWh2PTo56lO26Opa/ZRbOUhSfvD4lbvNfmbnAzKjlum4jgW8YgbdEOFDj1ZOlA==
X-Received: by 2002:a17:903:41cb:b0:1b8:9846:a3b2 with SMTP id
 u11-20020a17090341cb00b001b89846a3b2mr2736704ple.14.1689261469776;
        Thu, 13 Jul 2023 08:17:49 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-70-13.dynamic-ip.hinet.net.
 [36.228.70.13])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b001b8a844b023sm6043640plb.272.2023.07.13.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:17:49 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: q6dsp: q6apm: make g_apm static
Date: Thu, 13 Jul 2023 23:17:43 +0800
Message-Id: <20230713151744.86072-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AR27I3BYLLBMLSEHTZMTBMEAOOAC76AI
X-Message-ID-Hash: AR27I3BYLLBMLSEHTZMTBMEAOOAC76AI
X-Mailman-Approved-At: Sun, 16 Jul 2023 12:57:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AR27I3BYLLBMLSEHTZMTBMEAOOAC76AI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes the following sprse warning:

sound/soc/qcom/qdsp6/q6apm.c:30:14: sparse: warning: symbol 'g_apm' was not declared. Should it be static?

No functional change intended

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 7bfac9492ab5..d5ad9cbd3c21 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -27,7 +27,7 @@ struct apm_graph_mgmt_cmd {
 
 #define APM_GRAPH_MGMT_PSIZE(p, n) ALIGN(struct_size(p, sub_graph_id_list, n), 8)
 
-struct q6apm *g_apm;
+static struct q6apm *g_apm;
 
 int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
-- 
2.34.1

