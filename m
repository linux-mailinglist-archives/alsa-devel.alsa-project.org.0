Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CF91DF50
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 936672BD6;
	Mon,  1 Jul 2024 14:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 936672BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837090;
	bh=a4gqtu1F+7UwX8XJw6CuIrq1BSlh3ddIi3L0GYa8mQY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PH3iee1P0b6ex4hchK8rOMzQp3rrngwmTGSaurIvDfx/eWueGuLeTEJRFlL1A8oDy
	 wzlY4fVGycVmtTOyCdKR9871KdfTZEOIwpNvldpAaiVMjbw1KS8D2SqP4NEFKQVGF1
	 tcm+chFsX7uk7UtMSQszPwqPu6crhK1Sz7aPAj8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667EAF89914; Mon,  1 Jul 2024 14:22:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF6CF89914;
	Mon,  1 Jul 2024 14:22:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6913F80495; Tue, 25 Jun 2024 14:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn
 [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3F4CF80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 14:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F4CF80154
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.185.250.29) with ESMTP
	id 667AB3DD00002CF6; Tue, 25 Jun 2024 20:11:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: BC82B5AC330743A59EBFDF483D73D2CB
X-SMAIL-UIID: BC82B5AC330743A59EBFDF483D73D2CB-20240625-201112
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/4] ASoC: codecs: ES8326: codec can't enter suspend issue
Date: Tue, 25 Jun 2024 20:11:09 +0800
Message-Id: <20240625121109.33514-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GGMV2LNMEI7ICJXR6O27PGR27QNBEV2C
X-Message-ID-Hash: GGMV2LNMEI7ICJXR6O27PGR27QNBEV2C
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:22:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGMV2LNMEI7ICJXR6O27PGR27QNBEV2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > > Should mark the widgets with snd_soc_dapm_ignore_suspend() to allow the device to suspend with the widgets enabled.
> > Thanks for your advice. But unfortunately codec didn't enter suspend after marking
> > the widgets with snd_soc_dapm_ignore_suspend(). We will modify the trigger conditions
> > for enable_micbias and disable_micbias to solve this issue
> Really? We should fix that - that's the use case for this feature.
> What goes wrong?

We mark "MICBIAS1" and "MICBIAS2" with snd_soc_dapm_ignore_suspend() at es8326_enable_micbias(), 
and make "MICBIAS1" "MICBIAS2" active with snd_soc_dapm_force_enable_pin_unlocked().
But when the device enter suspend, the codec can't enter suspend. 

