Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D00507F9E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 05:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185BC1925;
	Wed, 20 Apr 2022 05:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185BC1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650426578;
	bh=UmEZNwACFUKxevHes8M0nIsWY9pnDeFV/oo3PZjJRRw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=giuzp9+nh8TX+eg4/HbX+AbV/jvsWDvhl7urqT4JQRp78aaPYi7H6NM+DigUVHTzs
	 Y3Y7+WIwqT/cJ6+z9B4Ke5rU7Jun9z3R2BmvWlzRsJ8YpPZxi8AaRUn9kDY5igKKJe
	 auVpBwHPlxIM34bMQ1BIwhfIdx9jbEzeKofLPHZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72CA9F80128;
	Wed, 20 Apr 2022 05:48:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C4CF800C1; Wed, 20 Apr 2022 05:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 43436F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 05:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43436F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1650426510718120098-webhooks-bot@alsa-project.org>
References: <1650426510718120098-webhooks-bot@alsa-project.org>
Subject: HDA-DualCodecs: Fix wrong jack control on Lenovo P520
Message-Id: <20220420034836.D8C4CF800C1@alsa1.perex.cz>
Date: Wed, 20 Apr 2022 05:48:36 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #149 was opened from khfeng:

Lenovo P520 uses the same line out switch like other dual codecs
systems, however it uses another jack control. So consolidate the switch and
separate the jacks to make its jack control work again.

Fixes: 7dda1e21 ("HDA: improve support for HDAudio-Gigabyte-ALC1220DualCodecs")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/149
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/149.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
