Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6361987703B
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:13:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE4823E8;
	Sat,  9 Mar 2024 11:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE4823E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979223;
	bh=ZLWxTNvadb4hyjem5uvWUCn8AIITYg1bzbW2sx4kDIU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y4pVhKKdJLWwJRnOzVEDSiHBGP+v6NRTftjY4hZz8/ED0mhoU1YSzJb6NuvTNK+OB
	 /WzE7vw3tXqwdy60vuCx5bRXVBDKMtKsd0d9g/wVyH1/I3pq/crQN8pXpPFie/F4mJ
	 w+3T8OZfoR49i/KCOB922OloBo5QYNVT56tE1qLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC0ADF805C0; Sat,  9 Mar 2024 11:12:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C8FF805D2;
	Sat,  9 Mar 2024 11:12:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C54F8024E; Mon,  4 Mar 2024 10:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93F08F8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 10:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F08F8014B
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Vinod Koul <vkoul@kernel.org>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10/5.15/6.1 0/1] soundwire: stream: use consistent pattern
 for freeing buffers
Date: Mon, 4 Mar 2024 12:55:41 +0300
Message-ID: <20240304095542.4799-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.125]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)
X-MailFrom: D.Dulov@aladdin.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NRUJKND5M2QI6YR2IUZS4UQXHI2WKODZ
X-Message-ID-Hash: NRUJKND5M2QI6YR2IUZS4UQXHI2WKODZ
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:09:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRUJKND5M2QI6YR2IUZS4UQXHI2WKODZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Svacer reports NULL-pointer dereference and double free issues in
do_bank_switch() in case sdw_ml_sync_bank_switch() returns an error
not on the first iteration of the list_for_each_entry() loop. These 
problems are present in 5.10, 5.15 and 6.1 stable releases. These problems
have been fixed by the following upstream patch that can be cleanly
applied to 5.10, 5.15 and 6.1 branches.
