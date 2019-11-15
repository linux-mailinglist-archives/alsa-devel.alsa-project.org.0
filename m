Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E045FE2AD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124421660;
	Fri, 15 Nov 2019 17:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124421660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573835098;
	bh=LcpxGnO4/iaj9JhklORsLjywhLtWwv/V2G2NtKaKhaU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nl0wPyW1o4mQ/DjVGBGdEzcje0EU3HVoaB4Zjw0lzHKJ4wXcvGmCwtaIfhEL5IOBE
	 IXfGwPhR98S8tFqutXd7WPx+U4lLLQl+PviHgFynPaNRRgLRELXjsCKms2hMu+17md
	 WGCCN9J+IJXUmiGXEw0wZRBWZskzJvqqGbtlMwPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD4FF800FF;
	Fri, 15 Nov 2019 17:23:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B70F80104; Fri, 15 Nov 2019 17:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77B9F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77B9F8007E
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVeL8-0003uL-50; Fri, 15 Nov 2019 17:20:54 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVeL7-00012y-SE; Fri, 15 Nov 2019 17:20:53 +0100
Date: Fri, 15 Nov 2019 17:20:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20191115162053.fgsd45seg526gafv@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
 <20191115161210.GB4210@sirena.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115161210.GB4210@sirena.co.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:15:40 up  7:34, 20 users,  load average: 0.13, 0.07, 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, KCHSU0@nuvoton.com,
 robh+dt@kernel.org, kernel@pengutronix.de, thomas.fehrenbacher@siedle.de
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: nau8810: add aux input control,
 available on NAU8812
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

Hi Mark,

On 19-11-15 16:12, Mark Brown wrote:
> On Fri, Nov 15, 2019 at 05:08:19PM +0100, Marco Felsch wrote:
> 
> > This commit adds the support to control the aux-port on the nau8812
> > devices. We don't need to differentiate the aux-port registers since
> > those bitfields are set to '0' on the nau8810 devices [1,2].
> 
> It'd still be better to only register these controls if the device isn't
> a nau8812 so that userspace doesn't see them.

That's the thing I tought about 10min.. Imagine that: You have an
embedded device with a very good codec driver (all codec controlls are
available) but the hw-guys didn't connect all the in-/outputs. So
switching those controls are useless too. IMHO this is exactly the same
thing here.

Regards,
  Marco
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
