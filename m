Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B845262897
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 09:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2AA11704;
	Wed,  9 Sep 2020 09:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2AA11704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599636495;
	bh=/Wxyb0KqAoC8XqMZijnfNnHitVIRM1F6mL8VemjtvCw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hz44hOBqJ/JNzMoJ8Kmdx0d382xJxpWNCQhcTjTzmFqEg9Bh3Cq9w37NUsWPae5BF
	 P2X1hXtaJWe88bR1El15LL5jSBgTJE9AOZYMzJ6OnCgqqeMyNnnFzneX2FjeB2cfY7
	 fkUKl/PRgGwcbQiPnqlPRJ8O//oioWTA6yEdQToA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C50D3F800E9;
	Wed,  9 Sep 2020 09:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F15CDF80227; Wed,  9 Sep 2020 09:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 31CD3F800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 09:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CD3F800FD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1599636381247245073-webhooks-bot@alsa-project.org>
References: <1599636381247245073-webhooks-bot@alsa-project.org>
Subject: Spdx tags: Use PSDX tags for this project
Message-Id: <20200909072631.F15CDF80227@alsa1.perex.cz>
Date: Wed,  9 Sep 2020 09:26:31 +0200 (CEST)
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

alsa-project/tinycompress pull request #7 was opened from vinodkoul:

Add SPDX tags and remove the license text, Also adds SPDX tags to files which have this missing

Request URL   : https://github.com/alsa-project/tinycompress/pull/7
Patch URL     : https://github.com/alsa-project/tinycompress/pull/7.patch
Repository URL: https://github.com/alsa-project/tinycompress
