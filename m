Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AAE25FC03
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6AB178C;
	Mon,  7 Sep 2020 16:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6AB178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599488780;
	bh=Iy1rGrYuMCu7YBQhcazfqubnSv1MpoGyCHM1NgTDQmo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xp0BV8xrYk79K8pRpkQl8yGvFieOdMK/opm1IhjQ7Z30/8RCUZ1tjbl4Yw6ot/lSs
	 Gc/uaVQUd80I2WYZbnFl3AEF50OVdkhsQoBSediWvorAJs6z9Pe3Pnb6NNC1LabEYs
	 TM6ibhh70TXTBOKXMx1SPBz2ELQMSF0b0w9ydXTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDCCF80227;
	Mon,  7 Sep 2020 16:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56982F80227; Mon,  7 Sep 2020 16:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id ED249F800D3
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED249F800D3
Received: (qmail 762519 invoked by uid 1000); 7 Sep 2020 10:24:27 -0400
Date: Mon, 7 Sep 2020 10:24:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/10] USB: move snd_usb_pipe_sanity_check into the USB
 core
Message-ID: <20200907142427.GB762136@rowland.harvard.edu>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-2-gregkh@linuxfoundation.org>
 <20200903004553.GA642955@rowland.harvard.edu>
 <20200903073230.GA162335@kroah.com>
 <20200907141634.GA3733019@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907141634.GA3733019@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jesus Ramos <jesus-ramos@live.com>, johan.hedberg@gmail.com,
 Chris Wulff <crwulff@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 marcel@holtmann.org, linux-usb@vger.kernel.org,
 Dmitry Panchenko <dmitry@d-systems.ee>, linux-kernel@vger.kernel.org,
 Jussi Laako <jussi@sonarnerd.net>, linux-bluetooth@vger.kernel.org,
 Eli Billauer <eli.billauer@gmail.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Alexander Tsoy <alexander@tsoy.me>, tiwai@suse.com,
 "Geoffrey D. Bennett" <g@b4.vu>, dvyukov@google.com, himadrispandya@gmail.com
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

On Mon, Sep 07, 2020 at 04:16:34PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 03, 2020 at 09:32:30AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Sep 02, 2020 at 08:45:53PM -0400, Alan Stern wrote:

> > > Since this routine is used in only one place in the entire kernel, you 
> > > might as well inline the code there and get rid of the function 
> > > entirely.
> > 
> > Good idea, will do.
> 
> No, wait, the USB sound drivers call it a lot, so it needs to stick
> around for now until we clean that up.

Argh.  I must have run "git grep" from within drivers/usb/core.  My 
mistake.

Alan Stern
