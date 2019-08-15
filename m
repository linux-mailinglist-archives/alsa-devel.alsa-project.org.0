Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B28E730
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 10:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5424A1661;
	Thu, 15 Aug 2019 10:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5424A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565858729;
	bh=pcutjsUve8S4WyTH9dHclDTlUtDX/AvNRnJR8WsX/Xs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NgDaKq2m5ejatV/vsCAO8Kh3nH7FCeMce3Ii8w63PTxjWbOGfz9OMjEm/q4NjCC5o
	 w5MOTM9eO3UqHv6BZUJUL9JoG1DfpaTvf/BlipTmx0XkDNpBixCG/U9RYlYw2WbkfG
	 J1tA0b7+FKVq3lWae/23J3bL6mxv/w7puF5kx0dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78A26F805A9;
	Thu, 15 Aug 2019 10:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C93F2F804CA; Thu, 15 Aug 2019 10:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 375FBF801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375FBF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tZL1bmoX"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB0DB21851;
 Thu, 15 Aug 2019 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565858580;
 bh=pJwpa8mKrVWkESrU8b/NRnPjZaPR3H+xGYTBqR8Br40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZL1bmoXJb7uNmpC9G4eonU+ukLeycvvdzdSVfYFtwwCzb5I9Q7qBQGyPWM1af7bc
 Y4onMl9sZLyvqglvmgVcEWohUsoudt12T4vWDCs0UjdOP04syE8fhBlMGm80EFridT
 ZwvErTxSbDdKHFw7AhGXRGdQgzHiERA6La/CJn0I=
Date: Thu, 15 Aug 2019 10:42:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Wang <hui.wang@canonical.com>
Message-ID: <20190815084258.GB3512@kroah.com>
References: <20190815083001.3793-1-hui.wang@canonical.com>
 <20190815083001.3793-2-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815083001.3793-2-hui.wang@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda - change the pintbl to undef
 tbl for Dell with alc289
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

On Thu, Aug 15, 2019 at 04:30:01PM +0800, Hui Wang wrote:
> We have another Dell laptop which needs the DELL4_MIC_NO_PRESENCE,
> and this laptop has different pincfg definitions from existing
> ones in the pintbl, rather adding a new entry, let us change
> the exiting tbl to undef tbl. It will cover all Dell laptops
> with alc289 codec and the pins of 0x19 and 0x1b are undef by default.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  sound/pci/hda/patch_realtek.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
