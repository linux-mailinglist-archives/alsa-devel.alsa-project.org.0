Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C703B1135
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 03:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174F615E2;
	Wed, 23 Jun 2021 03:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174F615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624410311;
	bh=/UokAgtuJ75ZQQqf1dWfPmZt2rp3P/9U6JkcEtOg3jU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwWJPr3bbkttqYaILw/i2kV0bknqxF7HRNEY9azLHWryc//j5rVCHCrFmsE+gFPJc
	 WeE+SOqfof5TcBe0973ru/uomblW22sYZROnP5kg9s+N4n+29ysJkmf9G1F9iskB6b
	 nGIacjopTQoAmz3PVZL5PMy03uGd3uOvaucDQvDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80567F8026A;
	Wed, 23 Jun 2021 03:03:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D99F80268; Wed, 23 Jun 2021 03:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27358F80161
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 03:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27358F80161
Received: by m.b4.vu (Postfix, from userid 1000)
 id 1443861E286D; Wed, 23 Jun 2021 10:33:27 +0930 (ACST)
Date: Wed, 23 Jun 2021 10:33:27 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 01/17] ALSA: usb-audio: scarlett2: Fix wrong resume call
Message-ID: <20210623010327.GA15559@m.b4.vu>
References: <cover.1624379707.git.g@b4.vu>
 <49721219f45b7e175e729b0d9d9c142fd8f4342a.1624379707.git.g@b4.vu>
 <s5hfsx9ptyl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hfsx9ptyl.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>, alsa-devel@alsa-project.org,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

On Tue, Jun 22, 2021 at 09:42:10PM +0200, Takashi Iwai wrote:
> On Tue, 22 Jun 2021 19:00:49 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > From: Takashi Iwai <tiwai@suse.de>
> > 
> > The current way of the scarlett2 mixer code managing the
> > usb_mixer_elem_info object is wrong in two ways: it passes its
> > internal index to the head.id field, and the val_type field is
> > uninitialized.  This ended up with the wrong execution at the resume
> > because a bogus unit id is passed wrongly.  Also, in the later code
> > extensions, we'll have more mixer elements, and passing the index will
> > overflow the unit id size (of 256).
> > 
> > This patch corrects those issues.  It introduces a new value type,
> > USB_MIXER_BESPOKEN, which indicates a non-standard mixer element, and
> > use this type for all scarlett2 mixer elements, as well as
> > initializing the fixed unit id 0 for avoiding the overflow.
> > 
> > Tested-by: Geoffrey D. Bennett <g@b4.vu>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> When submitting a patch, you have to your Signed-off-by line even if
> you are no author.  Could you give it?  Just reply with a proper SOB,
> then I'll fix manually.

Of course. You know how many times I've read
Documentation/process/submitting-patches.rst ? Not enough for it to
sink in, apparently :). Please append my SOB:

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Thanks,
Geoffrey.
