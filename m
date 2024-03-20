Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3CA8812F0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:07:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6063E265E;
	Wed, 20 Mar 2024 15:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6063E265E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943648;
	bh=q9a5zPfNLEGwH8fnln6EdOfPn8tEsN98hSCtJwKwlUA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=onye95H+YXusNyM1diPtqF9Z5aY1KCkGBsEIhFMua0hl6OZhSdFgO+kUEqALUX3sv
	 amyMTivvnskRiUigbLU4j1JaEjxDUWBOGts05W23VgWoEtDSL0iPNWUCggkJH1/3mr
	 ApBpK76jILlY/11ELVv+jSa3WJrS+bFhWk2AsDWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C540F8978A; Wed, 20 Mar 2024 15:01:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CCABF89779;
	Wed, 20 Mar 2024 15:01:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239B1F80548; Wed, 20 Mar 2024 09:30:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-60.sinamail.sina.com.cn (mail78-60.sinamail.sina.com.cn
 [219.142.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13FBBF8010B
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 09:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13FBBF8010B
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 65FA9E9500036383; Wed, 20 Mar 2024 16:30:14 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A091EFAED1EB4E179338D82FDC8D47DB
X-SMAIL-UIID: A091EFAED1EB4E179338D82FDC8D47DB-20240320-163014
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 0/2] ASoC: codecs: ES8326: Reducin powerconsumption and
Date: Wed, 20 Mar 2024 16:30:10 +0800
Message-Id: <20240320083012.4282-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EQDXGQFC73ZGAC732KZ6F3QN3UFAWEUG
X-Message-ID-Hash: EQDXGQFC73ZGAC732KZ6F3QN3UFAWEUG
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQDXGQFC73ZGAC732KZ6F3QN3UFAWEUG/>
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

 sound/soc/codecs/es8326.c | 41 ++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

-- 
2.17.1

