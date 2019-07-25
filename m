Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C636574947
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB6A1ACF;
	Thu, 25 Jul 2019 10:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB6A1ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564044212;
	bh=QSBZb0Z1JD5BlmlTYwRmnnr4E9kYsRykE0pzSQLqah0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A6vQSA/3XzQF7IbW7ZiBqGlCX1+i+e5K2FMNXCdQMUApMPmgZU4ReI43Lx8dEAIM0
	 GgifElu3ha38vLWPCDpC+bga2Lr2W8lxLFu8fVYWkeeXybP8glINKwO3nSE37ltBS/
	 zdnZUxJTUt2l7qbRKOmZKgOO2HnmvjZ7TMe/iJuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0736FF8045F;
	Thu, 25 Jul 2019 10:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB700F80481; Thu, 25 Jul 2019 10:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from Galois.linutronix.de (galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D7AEF8045F
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7AEF8045F
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hqZJ7-0001IK-75; Thu, 25 Jul 2019 10:41:01 +0200
Date: Thu, 25 Jul 2019 10:41:00 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <20190725075833.3481-3-yamada.masahiro@socionext.com>
Message-ID: <alpine.DEB.2.21.1907251040380.1791@nanos.tec.linutronix.de>
References: <20190725075833.3481-1-yamada.masahiro@socionext.com>
 <20190725075833.3481-3-yamada.masahiro@socionext.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Cc: linux-spdx@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [alsa-devel] [PATCH v2 3/3] iomap: fix Invalid License ID
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

On Thu, 25 Jul 2019, Masahiro Yamada wrote:

> Detected by:
> 
>   $ ./scripts/spdxcheck.py
>   fs/iomap/Makefile: 1:27 Invalid License ID: GPL-2.0-or-newer
> 
> Fixes: 1c230208f53d ("iomap: start moving code to fs/iomap/")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
