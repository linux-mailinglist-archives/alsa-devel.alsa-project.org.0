Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B22D0AF1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 08:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B144F1742;
	Mon,  7 Dec 2020 08:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B144F1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607324736;
	bh=rOxPta3VC4hT0k1XT31CaKYF5dlbv+Z1cw3MP/anGXI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLD9uHC4FLMB6NjSgh/jRHeiSHWdOeOOG8ApnwOvgB/xsnhZmTANiMy9UY5/7t77D
	 U83OzC/OgnihKVCNcCeESJt2mF4EvHKUvxQ775CcHjcuw25xdcbB2gjF9Iq3OssOUv
	 TYOPjDyd0pNKaEVBPHRq1t+3oy1gQkI9+ULsD23s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14DE5F8015B;
	Mon,  7 Dec 2020 08:04:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629CBF8015B; Mon,  7 Dec 2020 08:04:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E40E2F800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 08:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40E2F800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1607324631141882896-webhooks-bot@alsa-project.org>
References: <1607324631141882896-webhooks-bot@alsa-project.org>
Subject: rt715: init: setup ADC07 to a proper volume
Message-Id: <20201207070400.629CBF8015B@alsa1.perex.cz>
Date: Mon,  7 Dec 2020 08:04:00 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #65 was opened from libinyang:

This patch initiates 'rt715 ADC 07 Capture Volume' to a proper volume.

Signed-off-by: Libin Yang <libin.yang@intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/65
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/65.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
