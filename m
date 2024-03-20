Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE58812ED
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD942BD8;
	Wed, 20 Mar 2024 15:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD942BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943603;
	bh=gEFqROtczUiEFI4W90FWxxBx5DXrMkaSpL7Qjab0vG4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=agYmJaP4u6EUbOobwx8EGx7X8uv1ueMwBjjv1HGoK3ZY/p3bxqDpzYI6Whx7McSdp
	 hW+Gr5Ay9nUsLgqnsYbQ731a733JzZTl7WQjcmBmEShFg6EDQb/FjznMxq2hIVxt/r
	 hlfdgiwfnreiOr1ctZs+1eHgvbSnqxJrmUoquNFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B8AF8975D; Wed, 20 Mar 2024 15:00:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8066EF89721;
	Wed, 20 Mar 2024 15:00:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35393F8025F; Wed, 20 Mar 2024 08:56:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 882CDF8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 08:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882CDF8025F
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.239) with ESMTP
	id 65FA962300035F2F; Wed, 20 Mar 2024 15:54:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CDFCBF93D30544BCA988F85B8015CF3E
X-SMAIL-UIID: CDFCBF93D30544BCA988F85B8015CF3E-20240320-155412
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 0/2] ASoC: codecs: ES8326: Reducin powerconsumption and
Date: Wed, 20 Mar 2024 15:54:07 +0800
Message-Id: <20240320075409.3539-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J6NQJMGXAFSBZ5HIFTEBGZIZNO7TB7LH
X-Message-ID-Hash: J6NQJMGXAFSBZ5HIFTEBGZIZNO7TB7LH
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6NQJMGXAFSBZ5HIFTEBGZIZNO7TB7LH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We changed the configuration related to hibernation.
and delete the REG_SUPPLY to cover mute issue.

Zhang Yi (2):
  ASoC: codecs: ES8326: Reducing power consumption
  ASoC: codecs: ES8326: Delete unused REG_SUPPLY

 sound/soc/codecs/es8326.c | 42 ++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

-- 
2.17.1

