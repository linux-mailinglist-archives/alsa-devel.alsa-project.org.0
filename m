Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BF7B3EE0
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 09:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8DDDF3;
	Sat, 30 Sep 2023 09:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8DDDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696060453;
	bh=02620K2/znes2DUxPlHwZszukHUYiPLPn97khamCL20=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qv9Cl0xmSAXKsig5lwLWhpz0IV1E1XX8J7DMHgSCRXyMSeyO04In70GsKsb3BHyzB
	 GH9QcRX0IcHxv1MTIpvRbGAcqVC6arcYK4rkxZJOx0Ef5233Jry8P9DSUt7YNufveP
	 5lPlBIlg5Z3chBK9rHeKFRDrfH5Dk7Ys4cuHcst4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E8EF80567; Sat, 30 Sep 2023 09:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE619F80558;
	Sat, 30 Sep 2023 09:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35821F801F5; Sat, 23 Sep 2023 08:21:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by alsa1.perex.cz (Postfix) with ESMTP id AE044F800AA
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 08:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE044F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Vuxe9H+d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=mNK4p31V/ZLMBUmi5U
	KGQSJ6tS3MD1wGMkK0tMwsMz0=; b=Vuxe9H+d8ubxiqdUvEIfZCmSzjUHyLy0ti
	CEMXSy2axpwU0pwakmAcsErSoMw1CoY46X3eTI2UniuMoQvUmztbSvH1unkn7Gkx
	uswDF/zdq71inJbCYNXden8BmUslGMW8WJ4pQu7eSa7kuoFQ1Ne65Qdr4QTm5Kw4
	I94gM/Wb4=
Received: from localhost.localdomain (unknown [223.104.131.178])
	by zwqz-smtp-mta-g5-2 (Coremail) with SMTP id
 _____wAHmhfTgw5l5cJ1Cw--.48056S2;
	Sat, 23 Sep 2023 14:21:09 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	liuhaoran <liuhaoran14@163.com>
Subject: [PATCH] ASoC: img: Add error handling for clk_set_rate in
 img_prl_out_hw_params
Date: Sat, 23 Sep 2023 14:20:54 +0800
Message-Id: <20230923062054.19325-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAHmhfTgw5l5cJ1Cw--.48056S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW5Xw1DGr45CFW3tw1rXrb_yoWfAFcEvw
	4xWa40gryDt397K3y5Gw43tr9ayrs7CF1UCr1vqr4fJryUCryrGaykAa93urW8Zr18Cry8
	Kw4vvrWrCFy8CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjhFx5UUUUU==
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbibAPygmNfuKTXTwABsm
X-MailFrom: liuhaoran14@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3MH4RJXSKO3JBY7XI6R2ARRYFGEDH2MR
X-Message-ID-Hash: 3MH4RJXSKO3JBY7XI6R2ARRYFGEDH2MR
X-Mailman-Approved-At: Sat, 30 Sep 2023 07:52:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MH4RJXSKO3JBY7XI6R2ARRYFGEDH2MR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds error-handling for the clk_set_rate() call inside
the img_prl_out_hw_params function in the img-parallel-out.c file.

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 sound/soc/img/img-parallel-out.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 815e68a7048c..698e9e92ded9 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -137,7 +137,10 @@ static int img_prl_out_hw_params(struct snd_pcm_substream *substream,
 	if (channels != 2)
 		return -EINVAL;
 
-	clk_set_rate(prl->clk_ref, rate * 256);
+	int ret = clk_set_rate(prl->clk_ref, rate * 256);
+
+	if (!ret)
+		return ret;
 
 	reg = img_prl_out_readl(prl, IMG_PRL_OUT_CTL);
 	reg = (reg & ~IMG_PRL_OUT_CTL_PACKH_MASK) | control_set;
-- 
2.17.1

