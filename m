Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7228E72D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 10:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339A5165E;
	Thu, 15 Aug 2019 10:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339A5165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565858682;
	bh=RvuB4VUzto2c5icx9wraPZCryoq2miLsziN0IsCHl1Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZZzDfZsdMJ6LCCBCK7cBUrscTRXW05bLwwcgl3JaFuVXVhWtjBkTr95w6oMTyi/Z
	 VfpqnxVQ0mz+36wF/oxEyVpu52SQgcsritHYNg0CGW5h++GbJLn+nbWkU/e20fH0yI
	 hb5iHpSfuisY+WDUhsFTZvNPz8NCUaklNCtp2wMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF1FF80274;
	Thu, 15 Aug 2019 10:42:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C829F80274; Thu, 15 Aug 2019 10:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8477FF801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8477FF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qBaE/V/W"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AB7521851;
 Thu, 15 Aug 2019 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565858569;
 bh=USPxJNoL/CR/1yf8im0Lr+aG9FevNu7XoPSdWfFzoY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qBaE/V/WnxoBUOWHFCvINR6p0sz3eQvRN2yid0KMoDHJqjxQVW2x+PFhvWdpqMEpe
 7ii8nxtr+GPMD8cBZeJNYgO88xDk6kwM5XlGbe8nyQvYXdIjjOVEKlU9oPaPl9QqCI
 2dRk52YVsU5Sz9+rB/XIInzYwvPBfo88MYM4pU1w=
Date: Thu, 15 Aug 2019 10:42:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Wang <hui.wang@canonical.com>
Message-ID: <20190815084246.GA3512@kroah.com>
References: <20190815083001.3793-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815083001.3793-1-hui.wang@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: hda - Add a new match function
 for only undef configurations
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

On Thu, Aug 15, 2019 at 04:30:00PM +0800, Hui Wang wrote:
> With the existing pintbl, we already have many entries in it. it is
> better to figure out a new match to reduce the size of the pintbl.
> 
> For example, there are over 10 entries in the pintbl for:
> 0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE
> 
> If we define a new tbl like below, and with the new adding match
> function, we can remove those over 10 entries:
> SND_HDA_PIN_QUIRK(0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
> 	{0x19, 0x40000000},
> 	{0x1a, 0x40000000},),
> 
> Here we put 0x19 and 0x1a in the tbl just because these two pins are
> undefined on Dell laptops with the codec alc255, and these two pins
> will be overwritten by ALC255_FIXUP_DELL1_MIC_NO_PRESENCE.
> 
> In summary: the new match will check vendor id and codec id first,
> then check the pin_cfg defined in the tbl, only all pin_cfgs in the
> tbl are undef and the corresponding pin_cfgs on the laptop are undef
> too, this match returns true.
> 
> This new match function has lower priority than existing match
> functions, so the existing tbls still work as before after applying this
> patch.
> 
> My plan is to change the existing tbl to undef tbl for MIC_NO_PRESENCE
> fixups gradually.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  sound/pci/hda/hda_auto_parser.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)


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
