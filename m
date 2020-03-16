Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4191875BA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 23:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA9F1875;
	Mon, 16 Mar 2020 23:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA9F1875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584398060;
	bh=51jYDR2ZjKAfVv/Sdg9b56O4h6BwL3IlnWS9Hq5UAEU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e5w9UxzmGF9sRKQ04jrgywknGAXHsMZ5c1H19GN6vSdX8e+bew3GRTc1/gPthSvLK
	 VtJxOcvxHhP2CaC/nnJmPBxLklFm6frJXDOwKr0hH9MS0FiD82v9eG91izLiJ5q3O/
	 hQ4VvpyITibjl9sfW9fiWELD5/lvu9n4q+WYjklM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E04F800D2;
	Mon, 16 Mar 2020 23:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F1D5F8015B; Mon, 16 Mar 2020 23:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A4D56F800D2
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 23:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4D56F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584397953813324928-webhooks-bot@alsa-project.org>
References: <1584397953813324928-webhooks-bot@alsa-project.org>
Subject: sof-soundwire: initial UCM2 version
Message-Id: <20200316223237.3F1D5F8015B@alsa1.perex.cz>
Date: Mon, 16 Mar 2020 23:32:37 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #17 was opened from plbossart:

Add conditional inclusion of sections

This goes with the kernel PR https://github.com/thesofproject/linux/pull/1889

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/17
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/17.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
