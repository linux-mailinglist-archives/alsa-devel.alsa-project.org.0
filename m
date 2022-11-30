Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E463DEDD
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 19:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 191331695;
	Wed, 30 Nov 2022 19:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 191331695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669833698;
	bh=LWlQdBp9ut0y1ASX5HIqU1NUKq9IOgjnwgaX0/3cjJg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ugCyidggIM48D0fjwaPOYpDDhBBkoWRbZNrluR9OqRmHQBOYH6MNMdhjS7axLR4Rn
	 aR9vSGEvvwt4hsb0wuB5V5re+naIY4Ma6Hm1f31rE1ey3Pv46oDyCY1V4L2yMKGsAx
	 EVli1rdQ51zFkhCFqgApElqO9mzaW+b99mQAeTvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8552BF80118;
	Wed, 30 Nov 2022 19:40:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5912EF8023A; Wed, 30 Nov 2022 19:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F24BF800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 19:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F24BF800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1669833635670357943-webhooks-bot@alsa-project.org>
References: <1669833635670357943-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Update quirk for Aorus Pro WiFi Rev 1.2
Message-Id: <20221130184040.5912EF8023A@alsa1.perex.cz>
Date: Wed, 30 Nov 2022 19:40:40 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #245 was opened from 13r0ck:

An improvement for https://github.com/alsa-project/alsa-ucm-conf/pull/157

The line in was using the wrong device.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/245
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/245.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
