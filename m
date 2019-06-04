Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49033405E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:36:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171941669;
	Tue,  4 Jun 2019 09:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171941669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559633793;
	bh=w9P/pPCI38ed0RESWdE0VLV+LsGAXKM9UjNbfEFtWAc=;
	h=From:In-Reply-To:References:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VMGX5s4JKoeobH+blEgie8Mrv9PMDcBq6SjoO5612AmfLe/HasBiZDkr0COzVGnZs
	 mQ+WVXyLWBizWAatTqD3Fn2jcpY1b5KqM51nbdH6iNejNorjbuhLNnSvcqa3ZzPPKc
	 26RW7UpQPiUbJ8m6gmSpz4JdrdB22PYhgrcHMiI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E93FF896F8;
	Tue,  4 Jun 2019 09:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C809F896F7; Tue,  4 Jun 2019 09:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D18EF896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D18EF896CE
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 451FB135BB;
 Tue,  4 Jun 2019 07:34:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2EE317D94;
 Tue,  4 Jun 2019 07:34:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
References: <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
 <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-ID: <9305.1559633653.1@warthog.procyon.org.uk>
Date: Tue, 04 Jun 2019 08:34:13 +0100
Message-ID: <9306.1559633653@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 04 Jun 2019 07:34:30 +0000 (UTC)
Cc: linux-block@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 dhowells@redhat.com, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
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

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> I'm not such a big fan of BUG(), so I'd go for ret = -EAFNOSUPPORT, but given
> rxrpc is already full of BUG() calls, I guess it is an acceptable solution.

Okay.  Are you okay with this going through net-next?

David
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
