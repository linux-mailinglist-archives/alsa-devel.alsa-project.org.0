Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AAD87704F
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:18:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1278211D;
	Sat,  9 Mar 2024 11:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1278211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979532;
	bh=h/K6J3J6NVa8QNKbOCikSU5cRzzRT4i487NnMKL31hU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rDDE4dOrr7JoWdhWm3VDwZHSN9oZRJBDFs+rV+pUgphtmS7+8skWaFdFjrXxovl8h
	 CZ98wT38lUozCloSsxwQf2pafsBodCyf2jidOGjaTVRwNOGtRnJdnZ5LZPWGaCGPSg
	 rPM7oJ39F9Fq4rSiZlCxfMA1OpRWzcn8t8/0/aSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A95FF89671; Sat,  9 Mar 2024 11:13:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13353F896B2;
	Sat,  9 Mar 2024 11:13:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 161CDF8024E; Thu,  7 Mar 2024 06:12:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA3F5F801F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 06:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3F5F801F5
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.239) with ESMTP
	id 65E94CB900013490; Thu, 7 Mar 2024 13:12:26 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6672B29C3930461E99E44569A3BDEAF9
X-SMAIL-UIID: 6672B29C3930461E99E44569A3BDEAF9-20240307-131226
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v2 0/2] ASoC: codecs: ES8326: change members of private
 structure
Date: Thu,  7 Mar 2024 13:12:20 +0800
Message-Id: <20240307051222.24010-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RT5CN6XGW6ZAKC3AOBGYKYOAYQZJHT7A
X-Message-ID-Hash: RT5CN6XGW6ZAKC3AOBGYKYOAYQZJHT7A
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RT5CN6XGW6ZAKC3AOBGYKYOAYQZJHT7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We found that using 0x45 as the default value for interrupt-clk 
would cause a headset detection error.So we took 0x00 as the default 
value for interrupt-clk and passed the test.
We removed mic1-src and mic2-src, which were not used.

Zhang Yi (2):
  ASoC: codecs: ES8326: Changing members of private structure
  ASoC: codecs: ES8326: change support for ES8326

 .../bindings/sound/everest,es8326.yaml         |  8 ++++----
 sound/soc/codecs/es8326.c                      | 18 +-----------------
 2 files changed, 5 insertions(+), 21 deletions(-)

-- 
2.17.1

