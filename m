Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90D339E8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 23:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D511654;
	Mon,  3 Jun 2019 23:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D511654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559597575;
	bh=0g8jBEOzpk/Uw2q4XZoA91576D4HpTQSNRncK7jKMSw=;
	h=Date:To:From:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJ7/800Sj/uYsgLryxmCvIXKGa/IzQrxqBK/YVeNuU3RFoPVFm8wODFdpIaIVRC6z
	 Q8le0q2m60/zl/hudASSUviwrp38jmVtJ3wQy6dGIrOrprzM/wN1O0pmdFChPAvEP+
	 UUxZpK/+E31uXuIbjO0t/qeFdlPyG0Vx26WCkIuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67FAF896DB;
	Mon,  3 Jun 2019 23:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40ED9F896DD; Mon,  3 Jun 2019 23:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68EDEF896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 23:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68EDEF896CE
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5FACC14D41E0F;
 Mon,  3 Jun 2019 14:30:57 -0700 (PDT)
Date: Mon, 03 Jun 2019 14:30:54 -0700 (PDT)
Message-Id: <20190603.143054.1734848612616501920.davem@davemloft.net>
To: dhowells@redhat.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <15499.1559298884@warthog.procyon.org.uk>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 03 Jun 2019 14:30:58 -0700 (PDT)
Cc: alsa-devel@alsa-project.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de, netdev@vger.kernel.org,
 tiwai@suse.com, clemens@ladisch.de, jhs@mojatatu.com,
 linux-block@vger.kernel.org, jiri@mellanox.com, geert@linux-m68k.org,
 xiyou.wangcong@gmail.com, joe@perches.com, tahiliani@nitk.edu.in,
 mb@lightnvm.io, eranbe@mellanox.com, dan.carpenter@oracle.com,
 igor.j.konopko@intel.com
Subject: Re: [alsa-devel] [PATCH] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
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

From: David Howells <dhowells@redhat.com>
Date: Fri, 31 May 2019 11:34:44 +0100

> Here's my take on the patch.

I assume I'll see a final version of this under separate cover.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
