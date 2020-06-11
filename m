Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D15231F6A61
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 16:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C841695;
	Thu, 11 Jun 2020 16:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C841695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591887312;
	bh=bX7UcY722QAVwW6+/B+v2yMlQ4kNPtDvmTRGCSLbq5w=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=go27N3pVVyHF+e4htXXWX4tG/We8DRBrOXHwCSuF4le82+SE7a57tpOL5K8jepzV5
	 8bpjI9mXbME7g0+RI/etCLf3dVttpm2xLbQzWKRpApOScyv6hB1QJ76r0wxYniMomf
	 UQoow54EOZWbpMyfcfeDuDP18MIOQe/wJFTyVchA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17964F802BC;
	Thu, 11 Jun 2020 16:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4E8DF802A9; Thu, 11 Jun 2020 16:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_NEUTRAL,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sonic307-34.consmr.mail.gq1.yahoo.com
 (sonic307-34.consmr.mail.gq1.yahoo.com [98.137.64.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C81AEF80290
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 16:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81AEF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="lLRUsp3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591887119; bh=Y49V++UNOPzuYl35+NoNzvTt4SNqxDJdg4ytABKfLJY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=lLRUsp3JNW5VdCt6g6Ggd0OM7Cn8QSAglRSU0NwvMZ+5rDqEa6qLy5e6FoSHILZjwM7O4lafiUP849zqqu0SSJVPNHcmU5lqKge62xtI67UjxDMiH3OWKqryetXzqAucHNE/WQTW5sat29a45ZOuUE+cN7x1ijGM9w82OqeqgPlfXleTUoUktZ4ETSx03Akmno2zef7OV26rtoLQUuZxnQRdqEej2UXjp6QvfHaIoa24T84xo28NiAsFNX2MbHAwGozcQvKgLZC4Px0ywGSxBFHE9csaHvnRK9fTc6raDQWyTQuMDZub1N8n2qaNF2vHJ7ToxaRrb3nIXPRVTZiAlQ==
X-YMail-OSG: N_6BpMEVRDvd.miR6A7lED5GPdAEx7ojsA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 14:51:59 +0000
Received: by smtp424.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID b1fcbf8aa3997862c2f8ed0063d81657; 
 Thu, 11 Jun 2020 14:49:57 +0000 (UTC)
Date: Thu, 11 Jun 2020 10:49:53 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [patch for-5.8] dma-pool: decouple DMA_REMAP from
 DMA_COHERENT_POOL
To: Christoph Hellwig <hch@lst.de>, David Rientjes <rientjes@google.com>
References: <alpine.DEB.2.22.394.2006110025250.13899@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.22.394.2006110025250.13899@chino.kir.corp.google.com>
MIME-Version: 1.0
Message-Id: <1591886384.28dd734zt4.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, tglx@linutronix.de
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

Excerpts from David Rientjes's message of June 11, 2020 3:25 am:
> DMA_REMAP is an unnecessary requirement for AMD SEV, which requires=20
> DMA_COHERENT_POOL, so avoid selecting it when it is otherwise unnecessary=
. =20
>=20
> The only other requirement for DMA coherent pools is DMA_DIRECT_REMAP, so=
=20
> ensure that properly selects the config option when needed.
>=20
> Fixes: 82fef0ad811f ("x86/mm: unencrypted non-blocking DMA allocations us=
e=20
> coherent pools")
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  kernel/dma/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20

Works for me with SME on or off with af7b480103, and with SME off in=20
abfbb29297. There is some regression with amdgpu and SME between those=20
two points, I need to check that out too. I haven't tested either before=20
or after with SEV (which I'm not even sure my system supports).=20
Regardless, this is a definite improvement.

Tested-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Thanks,
Alex.
