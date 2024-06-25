Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57291DF46
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093B32972;
	Mon,  1 Jul 2024 14:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093B32972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837007;
	bh=9Gll22QWM/I4JRxGFQ3Ppkj1vOWZtQK+HaVw5+rJiBo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rkTatnk0R6KpGLESErqiyDEe/O6hzU75rKnAoQKQdcNZTQrA6lg3gDlRthvk+IEO9
	 rpMvMspMudYXWbJ2bqc1o34vQ1rbSFkuoAvB5UyNUmaNirKMN6XIbbsgw47nI98IAd
	 IwbpOMn+/uBnMwxTpyq67SL48fqVLdMTpLLApPM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA4A9F8068A; Mon,  1 Jul 2024 14:22:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0702F8068A;
	Mon,  1 Jul 2024 14:22:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A205F80578; Tue, 25 Jun 2024 10:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC57EF8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 10:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC57EF8013D
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 667A82A40003052C; Tue, 25 Jun 2024 16:41:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A9C667E44E784A26A9606427893187A0
X-SMAIL-UIID: A9C667E44E784A26A9606427893187A0-20240625-164110
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 0/4] ASoC: codecs: ES8326: Solving headphone detection and 
Date: Tue, 25 Jun 2024 16:41:03 +0800
Message-Id: <20240625084107.3177-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6INPDTAH5NZL4DPZY4LMD6BRVQKKBX3Y
X-Message-ID-Hash: 6INPDTAH5NZL4DPZY4LMD6BRVQKKBX3Y
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6INPDTAH5NZL4DPZY4LMD6BRVQKKBX3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We propose four patches to solve headphone detection and suspend issues.
And there are several registers that should be read-only registers. So 
we create es8326_writeable_register, and set these registers to false.

Zhang Yi (4):
  ASoC: codecs: ES8326: Slove headphone detection issue
  ASoC: codecs: ES8326: codec can't enter suspend issue
  ASoC: codecs: ES8326: Minimize the pop noise
  ASoC: codecs: ES8326: regcache_sync error issue

 sound/soc/codecs/es8326.c | 62 +++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 12 deletions(-)

-- 
2.17.1

