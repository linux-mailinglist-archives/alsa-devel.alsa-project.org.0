Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C79A5E60
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 10:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F81836;
	Mon, 21 Oct 2024 10:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F81836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729498481;
	bh=ZND+pJ3gQC6iceQE4vHCGnD3ShRCYad+p8lWfl/dA/I=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k4p6sM70hgMmH0DUb1tshpy3VrhI8pR7zbMRE2D+qzVzHXZ2CsjvFaFVGpshUHdeP
	 G6QNu2uJSBPmcsX53uDEsbxcVLAZ75rMVldgIF6MsS272LKPmquQKB5YKWrUaJv+09
	 IOQlA/NRryb+bg0iEOvlkR/ImkwfyrqlbHwP1EvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C64F80635; Mon, 21 Oct 2024 10:13:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C2A9F805C2;
	Mon, 21 Oct 2024 10:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CA1F80448; Fri, 18 Oct 2024 11:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86D59F80149
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 11:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D59F80149
From: Daniil Dulov <d.dulov@aladdin.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Vinod Koul <vkoul@kernel.org>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10 0/1] soundwire: cadence: Fix error check in
 cdns_xfer_msg()
Date: Fri, 18 Oct 2024 12:07:13 +0300
Message-ID: <20241018090714.399076-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.125]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-02.aladdin.ru (192.168.1.102)
X-MailFrom: D.Dulov@aladdin.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5H2Y5AX6B4IWSXT44HOF3C5WX5AHCIIF
X-Message-ID-Hash: 5H2Y5AX6B4IWSXT44HOF3C5WX5AHCIIF
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:13:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5H2Y5AX6B4IWSXT44HOF3C5WX5AHCIIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Svacer reports redundant comparison in cdns_xfer_msg(). The problem is
present in 5.10 stable release and can be fixed by the following
upstream patch that can be cleanly applied to 5.10 stable branch.
