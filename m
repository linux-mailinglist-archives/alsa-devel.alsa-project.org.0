Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C19894C6A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E238E2CC8;
	Tue,  2 Apr 2024 09:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E238E2CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042106;
	bh=CnqvqodaYlEijS3S66gpBo6NENtbjINPKzjAxCX8Ei4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cuUVlTgVO0QfI+3YEQQIsuOug30+sEBeLOMdc6IOPXw3XMni/43hj8XhkHid+HHsU
	 ZuQs+Iq09lZiQ+0lPUXOTWuXf4wJU4Jsbg72mI++GQUONFCRUS2xLcwL2L+SiesAwL
	 OVFfK3zjehgOXiudbpMhBCSL5tzHnYBHBJFhmt0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E297F89B45; Tue,  2 Apr 2024 08:58:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E3DF89C89;
	Tue,  2 Apr 2024 08:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA6BF80568; Tue,  2 Apr 2024 08:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn
 [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FE8BF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE8BF80114
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 660BA3B800029E89; Tue, 2 Apr 2024 14:20:41 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3628553C6A8B4395838E59847DFF327A
X-SMAIL-UIID: 3628553C6A8B4395838E59847DFF327A-20240402-142041
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 0/4] ASoC: codecs: ES8326: solve some hp issues and
Date: Tue,  2 Apr 2024 14:20:39 +0800
Message-Id: <20240402062043.20608-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 646QAA3USQBJEGFLSIMHNUQKWACZTDSU
X-Message-ID-Hash: 646QAA3USQBJEGFLSIMHNUQKWACZTDSU
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/646QAA3USQBJEGFLSIMHNUQKWACZTDSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We solved some issues related to headphone detection.And for using 
the same configuration in different power conditions,we modified the
clock table

Zhang Yi (4):
  ASoC: codecs: ES8326: Solve error interruption issue
  ASoC: codecs: ES8326: modify clock table
  ASoC: codecs: ES8326: Solve a headphone detection issue after suspend
    and resume
  ASoC: codecs: ES8326: Removing the control of ADC_SCALE

 sound/soc/codecs/es8326.c | 37 +++++++++++++++++++++----------------
 sound/soc/codecs/es8326.h |  2 +-
 2 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.17.1

