Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A26D754B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 580B1209;
	Wed,  5 Apr 2023 09:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 580B1209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679618;
	bh=a2Uu8UI8V0vvRA3hscoyzszAisM9xQQnRCyxHTEGNwM=;
	h=Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gQdz5pFv5/V56GO/cd5dRNPi1Ngfvd1hwmu6+Df+ALxD27hAc29PA59S5BkEk7GSQ
	 K9aME9hwd0H4EfbBQhQKryHxstbpqJlftBuFUS4QQKDlXVxGUod+8gYlSNXyp9xFAJ
	 N8q/uPDf/2SnJoQ2EeSotX0L3IJq2ESIS9DyoG+o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DE7F8058C;
	Wed,  5 Apr 2023 09:20:53 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [PATCH v3 36/65] clk: versatile: sp810: Add a determine_rate hook
From: maxime@cerno.tech
To: alsa-devel@alsa-project.org
Message-ID: <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/II6GH5PFGOI4PGHXA24BPTUJ7437KSW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
