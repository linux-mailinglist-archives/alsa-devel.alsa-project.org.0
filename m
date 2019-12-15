Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D711FBC6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 00:14:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895C01660;
	Mon, 16 Dec 2019 00:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895C01660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576451677;
	bh=89A7X/p0GDbdp5UU7oGifsGtMn7tvP8+x28VhaRxbHc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZARbT6N9IEgMuub1w07INl1PCnEh+Wx1pj57Eyb5CgbHO3up36OlyE1ERX90jEEZF
	 KPLqEubWEbFe1Hy3NbJJRBd0+B4dil7+AoJxtXnKrniV846+UX5kKT12wr4Xsa2rli
	 gh6KVA9IKLtmiDbJgFTR9GdCbkjPH4RP8KuzhsvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5CB7F80266;
	Mon, 16 Dec 2019 00:12:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F45AF80264; Mon, 16 Dec 2019 00:12:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3F76DF8025F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 00:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F76DF8025F
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576451538989263058-webhooks-bot@alsa-project.org>
References: <1576451538989263058-webhooks-bot@alsa-project.org>
Message-Id: <20191215231221.9F45AF80264@alsa1.perex.cz>
Date: Mon, 16 Dec 2019 00:12:21 +0100 (CET)
Subject: [alsa-devel] Don't use 16 bit signed integers for sample rate
	conversion.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-plugins issue #5 was edited from crocket:

Sample rate conversion should be done with the highest resolution possible.
Once sample rate conversion is done, using S32_LE is meaningless.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/5
Repository URL: https://github.com/alsa-project/alsa-plugins
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
