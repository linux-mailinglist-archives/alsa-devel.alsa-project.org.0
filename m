Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9D3F1FFF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 20:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7D21664;
	Thu, 19 Aug 2021 20:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7D21664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629398177;
	bh=RYB1OWiATLy8nVP68r9qP+kO59GgKV6Y7AFx58xwnmw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFi5t8gKUtOkMaLuuXpCpNRQvwh8yLpDxQ9ByuEUcucxrbj1nxU2Xc+b7nqj7RxJD
	 kbFf8KdxoIPSXaKpE115KS/f+uHFdkB4jCR6NW+6AtPoBWzwYi8/XEuiLtvuog1dLa
	 bE12PlOPIlPuF5UYTcLGn2etChuSy9wJuXe5ZjOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 300DDF800EC;
	Thu, 19 Aug 2021 20:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 679ACF8026D; Thu, 19 Aug 2021 20:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE67F800EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 20:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE67F800EC
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id GmsNmI7dkUWyVGmsOmpaDg; Thu, 19 Aug 2021 20:34:53 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 8446D161E54;
 Thu, 19 Aug 2021 20:34:51 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id aIEWfWhXja_Z; Thu, 19 Aug 2021 20:34:50 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id B5C34161E6B;
 Thu, 19 Aug 2021 20:34:50 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id A6DF7162DC6; Thu, 19 Aug 2021 20:34:50 +0200 (CEST)
Date: Thu, 19 Aug 2021 20:34:50 +0200
From: folkert <folkert@vanheusden.com>
To: sujith kumar reddy <sujithreddy6192@gmail.com>
Subject: Re: arecord is failing with -V stereo
Message-ID: <20210819183450.GV890690@belle.intranet.vanheusden.com>
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfHWjS19mawIN8GoHiGcfMhq0MPssc0IWmjgrA6kysvhXzNZB/fujVcRgDbt9Vxu1Za34ZVb6wC4qLjnH2eVOROd9DBdStmCWTvybAPSjBs3AVIODM+Zt
 aYrxjSN0tg1+Dxsa9iejbaGV/BV+NQWpjLpG+wJrOqKVbfxOZn3vnkqF4/OlIxw3pS5D/FgwHjxixNZoOdq4jk+9G+OEbmM7wpwYSEGzk6FnlsL44OZ+oqNJ
 azDGW3YxutAaA94B4BWpCw==
Cc: alsa-devel@alsa-project.org
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

> arecord is  failing vumeter option -V stereo only.

What version?
Because the commandline you provide works fine here with 1.2.4-1ubuntu3.


