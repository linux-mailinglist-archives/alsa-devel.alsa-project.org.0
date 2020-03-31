Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14046199931
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 17:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F1691660;
	Tue, 31 Mar 2020 17:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F1691660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585667253;
	bh=WqTQxHzJOnSXncORw8QHPl00dVrABQh1TjK/Fi8laVc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gib00vz3QQltoa89NOgXhGS9EMaj8aCNzTIU4Hp+ZtyjUnSokNyB1fkjEJJYqw6+u
	 1BCEPmfzs/y0kv2jkCjQRUrtZiLQOgbJQSQR3eSAgmqGScAbmxkY/NFgd8g/XMpMA3
	 FqvzUw/IJkrQ8BK9o9l7gclo09t2ATNCgmWbl7Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 995FEF8014F;
	Tue, 31 Mar 2020 17:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD7EF80146; Tue, 31 Mar 2020 17:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26509F8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 17:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26509F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="I6py2KmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=517; q=dns/txt; s=axis-central1;
 t=1585667148; x=1617203148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UdVSVGrWqh2+I4OVc1jvsDQdLmXpgCrsNvOns0fxOGM=;
 b=I6py2KmWewYS8f+bBxtLYvK8Uo9KMUu5CCnMTrSbNqkU626qExPL1ljn
 sLQGclivTAKJLAzgY2WSwunOi8yTf+SA33vGA8vkJp9D++0G0DVXE5xfg
 /LJBpFuYNZ9z9rHwkHjDI0zHycQ3B4mHl1z+OUo/ODOuiQ+AOkeIDWX6e
 pV/W3tiF1MxemfcPxlsdax1VC85gtyIR0/VYbn8yJlA1/HIUp6i4TWe3Z
 ka0ar5ah9QDGdd602Cggua0ATIFPSsTGbGMPgRxubbNsZUzRYzIa2NZUc
 YTQKXMDVHM2zTJeukKWfcaM8V6zmeJuJ8nbKvXGEGFqrny4NINe9LgTwa w==;
IronPort-SDR: GgDmi9TQKqG3Nvi0OZ2E3iZNVPOhtSWcfZ8Tl9/tCOux5Q5mHXm9F0uKVyLOyToO/QgCaJ5nPu
 c7XmHveyC9/YnohathzGIKWdKmjnvVir2es8LM2jIsNddSd1jazkle3RVlnTNVR179GmOSTIFp
 5ZeQaSpZfJ9ZBrIbw66+JfFhoUVdn2qcLNQ8V9wfQIbyvJduuwkiSTvnr06QCUoHIPlDojeZV/
 KwF8P1nMLj7tkhAoNR1PCwpP6U8bDnRcLac5HiLXpAdIgWER0f/9idOWpVRZzJBWQAyBoRHujT
 57E=
X-IronPort-AV: E=Sophos;i="5.72,328,1580770800"; 
   d="scan'208";a="7163862"
Date: Tue, 31 Mar 2020 17:05:44 +0200
From: Jonas Holmberg <jonashg@axis.com>
To: <tiwai@suse.de>
Subject: Re: [PATCH] pcm: add chmap option to route plugin
Message-ID: <20200331150543.GA787649@axis.com>
References: <20200331142255.786462-1-jonashg@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200331142255.786462-1-jonashg@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Mar 31, 2020 at 04:22:55PM +0200, Jonas Holmberg wrote:
> From: Jonas Holmberg <jonashg@axis.com>
> 
> Add a config definition "chmap" to override the channel maps in the same
> way as in the hw and null plugins.
> 
> Signed-off-by: Jonas Holmberg <jonashg@axis.com>
> ---
>  src/pcm/pcm_route.c | 57 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 47 insertions(+), 10 deletions(-)

There were some indentation mistakes in the patch. I will fix them and 
send a new patch.

/Jonas
