Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF082B5577
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 01:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB441773;
	Tue, 17 Nov 2020 01:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB441773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605571302;
	bh=vE81QjdGFNwhJ46t/5pVqR9bVux2v4ygIt9GU5AicOI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/JJz6+SuHQeo2Zq43k4D6YEw+vVXEBXqbVe2ZJmazwDmbxBGfFwf/njSizCuiraa
	 Orin2FPnYLRDt/GYwTcHhaROYI8PUoOv54IqcDvOYB87zOOp7W4x/X7tIL0Xewjz9i
	 P0ifbndyyPq10P9vD75SShWfQaaodoLboCLoB2Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30069F8014A;
	Tue, 17 Nov 2020 01:00:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E2ABF80168; Tue, 17 Nov 2020 01:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D0821F8010A
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 01:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0821F8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605571203191261053-webhooks-bot@alsa-project.org>
References: <1605571203191261053-webhooks-bot@alsa-project.org>
Subject: [PATCH] alsa-gobject: ctl: change prototype of function relevant to
 TLV
Message-Id: <20201117000007.8E2ABF80168@alsa1.perex.cz>
Date: Tue, 17 Nov 2020 01:00:07 +0100 (CET)
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

alsa-project/alsa-gobject pull request #55 was opened from takaswie:

In ALSA control interface, the data of TLV (Type-Length-Value) style is
defined as array with unsigned int type of element. However, current
implementation of ALSACtl.Card handles them as signed int type.

This commit fixes the bug. This loses backward compatibility to v0.1.0
in a point of type of function argument.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/55
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/55.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
