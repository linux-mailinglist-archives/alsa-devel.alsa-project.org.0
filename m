Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5789D29
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 13:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF255166D;
	Mon, 12 Aug 2019 13:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF255166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565609520;
	bh=vcyCaadRyewYTKzOGBK3WZjQO9FIzBvquE+pxuA0Xtw=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfcg0srQNM4NklWGex4yBa8tOJJyAk/VOoxdhPeP0NWiBP8xaOSy0RUJAZiwv2ra+
	 Q17QaVDi6bxX/iaFftQlYPUtTnmXnCb3Jom87nrJ4pC8r+OMOgxr26R4gM/iA7qoUZ
	 OC32sYHsQIwIvuSAvsxQOYF0EBZpapSbtdJ3aPHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362A7F801EB;
	Mon, 12 Aug 2019 13:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2FA9F80213; Mon, 12 Aug 2019 13:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 41A7AF8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 13:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A7AF8015B
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1565609404988405943-webhooks-bot@alsa-project.org>
References: <1565609404988405943-webhooks-bot@alsa-project.org>
Message-Id: <20190812113013.E2FA9F80213@alsa1.perex.cz>
Date: Mon, 12 Aug 2019 13:30:13 +0200 (CEST)
Subject: [alsa-devel] Is period_size bytes per period or frames per period?
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

alsa-project/alsa-lib issue #8 was opened from crocket:

According to https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html
period_size in dmix is bytes per period.

According to aplay --dump-hw-params
period_size is frames per period.

Which one is right?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/8
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
