Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5D877040
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:15:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C30741;
	Sat,  9 Mar 2024 11:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C30741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979312;
	bh=pJzzRLw0ld6ieyqr7fhe5DRfgd38ERsz5SID14arAVY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XRZCttRYRDZrJtyHs+7fNvYNS3wFC5Q5azpeI8x33Q+yRn6wbhWiixNsqaWNMbF1/
	 uo/HkDqxWGhI0roQXq6+JJ+xzjQ3H4di3qZq+uf4+1lb8ZgdknXBRWwyTfE8xZ8Q7K
	 gkjOWWjEH0/UIlZFzw1/EzUUG0Iu5hKJOBWsJISs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15A92F806A1; Sat,  9 Mar 2024 11:12:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C932EF80690;
	Sat,  9 Mar 2024 11:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A752F802E8; Wed,  6 Mar 2024 02:34:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn
 [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC6EF8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 02:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC6EF8014B
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.235) with ESMTP
	id 65E7C81800003DE4; Wed, 6 Mar 2024 09:34:17 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4BE93CC2C17E4254B72E6993CDEE0D62
X-SMAIL-UIID: 4BE93CC2C17E4254B72E6993CDEE0D62-20240306-093417
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 0/2] ASoC: codecs: ES8326: change members of private
 structure
Date: Wed,  6 Mar 2024 09:34:12 +0800
Message-Id: <20240306013414.18708-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YUJNYTVSSBZEHGXZPTEKFSLHWAWVFKKH
X-Message-ID-Hash: YUJNYTVSSBZEHGXZPTEKFSLHWAWVFKKH
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:10:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUJNYTVSSBZEHGXZPTEKFSLHWAWVFKKH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We found that using 0x45 as the default value for interrupt-clk 
would cause a headset detection error.So we took 0x00 as the default 
value for interrupt-clk and passed the test.
We removed mic1-src and mic2-src, which were not used.

*** BLURB HERE ***

Zhang Yi (2):
  ASoC: codecs: ES8326: Changing members of private structure
  ASoC: codecs: ES8326: change support for ES8326

 .../bindings/sound/everest,es8326.yaml        | 22 ++-----------------
 sound/soc/codecs/es8326.c                     | 18 +--------------
 2 files changed, 3 insertions(+), 37 deletions(-)

-- 
2.17.1

