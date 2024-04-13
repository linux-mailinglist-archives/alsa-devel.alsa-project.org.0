Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB868A9F28
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF860218D;
	Thu, 18 Apr 2024 17:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF860218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455598;
	bh=SBC8s0aw/XVtSUYTrPMNsE3syTSkNpxT2FbQ9YhbyWA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vUJdDUzza7QpiJxdVjDPMZcHnGKssngt49DA5OCPnOb0I5ERDYIUtbnRSDbVcsPsA
	 /gCyy5SRpRWQGF/j3hPj67TwMDtUBS5n0VNqFL4HCwOBD7sBjuHNcGtjEhZ0VZnw8a
	 14kjPKaAM0P6X4MknSBZswdnG6kTjQdmCcdzOeIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56C35F89762; Thu, 18 Apr 2024 17:47:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB47FF89759;
	Thu, 18 Apr 2024 17:47:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C63F8028B; Sat, 13 Apr 2024 08:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A3C9F80130
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 08:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3C9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=postmarketos.org header.i=@postmarketos.org
 header.a=rsa-sha256 header.s=key1 header.b=J9zJhA6Y
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1712990564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wOouSKr5PfyN6X4iAvsI+hn1OYTMkXlDy/dogZ2/0xg=;
	b=J9zJhA6Y0H65zl6t1AQUWrDFUA6GOFBOejV/FGGcbcLMx0HQ1KHudYGVzTEAzdTYTQH/0t
	FPZtvGab8DJV9FVfxsjX4inIQtAZ3gCnDKRXnOJCEKfK3PJhQChiRyCWh1+d4N5qJFKn9k
	5oGtSyJspYfWqd5VvEVvCxFaHLqyyi15LPrAqa9CnAH/XpS+DrybCF/gal7nC40I2GbiP5
	U6rhJdf0o+zk4a9WeS4PrT3/m82pYWD+nTGL3Jk8m4BF0o9BmKawmkU0m+b5J9cxDZlrQ6
	DA57Av6IEQTHXrGiVsnQERYDq/dYUxSxqWLjBq8W18PG/SPCOhcMUFUB62gqKw==
From: Anton Bambura <jenneron@postmarketos.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] soundwire: qcom: disable stop clock on 1.3.0 and below
Date: Sat, 13 Apr 2024 09:42:23 +0300
Message-ID: <20240413064225.39643-1-jenneron@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: jenneron@postmarketos.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P7AKSHZWYO2O5SPXMBBE4LEMAL72ZDPL
X-Message-ID-Hash: P7AKSHZWYO2O5SPXMBBE4LEMAL72ZDPL
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7AKSHZWYO2O5SPXMBBE4LEMAL72ZDPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes audio on sdm845 + wcd9340 with soundwire. The affected
devices are AYN Odin and Lenovo Yoga C630.

If this gets applied it should also be backported to stable and 6.6.x LTS.

Anton Bambura (1):
  soundwire: qcom: disable stop clock on 1.3.0 and below

 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0

