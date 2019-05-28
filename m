Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A92CC0B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE4C1840;
	Tue, 28 May 2019 18:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE4C1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559061160;
	bh=b8PXiPabOpzNAJxZeu/lFFz6C+poSruKvo0e66n52ic=;
	h=From:In-Reply-To:References:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fzr8SywdcluYRI36uZPyinvpE9SHmSHxnpQZtOI4bZGfyDcUFV5/7IjTHTAtO2vSw
	 b5Ds7Snw+PVHH2z9kQXjPM2FKMxwrcJvIT8mOqdsplomNxikluZWKpblRTJHMLsdgD
	 +TTP7g7Xtf41E9fVPmGl/oOP3D3jBHpLgNycTFQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D93F8072E;
	Tue, 28 May 2019 18:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B1AFF89706; Tue, 28 May 2019 18:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE3A0F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE3A0F8065A
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 092193087948;
 Tue, 28 May 2019 16:30:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCFFE5D9CD;
 Tue, 28 May 2019 16:30:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-ID: <4653.1559061019.1@warthog.procyon.org.uk>
Date: Tue, 28 May 2019 17:30:19 +0100
Message-ID: <4654.1559061019@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 28 May 2019 16:30:47 +0000 (UTC)
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 dhowells@redhat.com, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/5] rxrpc: Fix uninitialized error code in
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

> While this is not a real false-positive, I believe it cannot cause harm
> in practice, as AF_RXRPC cannot be used with other transport families
> than IPv4 and IPv6.

Agreed.

> ---
>  net/rxrpc/output.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
> index 004c762c2e8d063c..1473d774d67100c5 100644
> --- a/net/rxrpc/output.c
> +++ b/net/rxrpc/output.c
> @@ -403,8 +403,10 @@ int rxrpc_send_data_packet(struct rxrpc_call *call, struct sk_buff *skb,
>  
>  	/* send the packet with the don't fragment bit set if we currently
>  	 * think it's small enough */
> -	if (iov[1].iov_len >= call->peer->maxdata)
> +	if (iov[1].iov_len >= call->peer->maxdata) {
> +		ret = 0;
>  		goto send_fragmentable;
> +	}
>  
>  	down_read(&conn->params.local->defrag_sem);
>  

Simply setting 0 is wrong.  That would give the impression that the thing
worked if support for a new transport address family was added and came
through this function without full modification (say AF_INET7 becomes a
thing).

A better way to do things would be to add a default case into the
send_fragmentable switch statement that either BUG's or sets -EAFNOSUPPORT.

David
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
