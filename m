Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345D651FE6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790391868;
	Tue, 20 Dec 2022 12:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790391868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671536898;
	bh=HaezOBjWm0I5jWaDF8cAgd1/U87DIvY8kmuYRDi2zZo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uUpgo26JG3eGee5xTiHXwDtkdUJp5HrusH/aCZfdmDTluGTxQMLhjCLC8T8OLmGOQ
	 IWeQ2B+1Ig23/EHAbDlIMMn/W3XLwGln1lbuSJjEMBboXD7O/zh8fvobfmuWDYrSzf
	 1bV8MABRE9djn4bsb1scyUQ8Mwidr3CPCNUG3bHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42977F801C0;
	Tue, 20 Dec 2022 12:47:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7C85F8032B; Tue, 20 Dec 2022 12:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38A2F8025E
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38A2F8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Eo83z733
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE0C6B8120C;
 Tue, 20 Dec 2022 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A275C433D2;
 Tue, 20 Dec 2022 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671536836;
 bh=HaezOBjWm0I5jWaDF8cAgd1/U87DIvY8kmuYRDi2zZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eo83z733mvFA18n1TON10XetS41cggDp8NQamtOquCaDSDL2qDrNZF8+y7OekhMHB
 KrxMBbHQmIrm1w8yGbC3Bt1c3V+WXd/js46qaoY0La86fl9eglw5L6sDCG1zcSXAhu
 RO8Z0I3NI1Il526rWfd2LBxfu6Lqz/fpv3rHlOl0=
Date: Tue, 20 Dec 2022 12:47:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Message-ID: <Y6GgwcN+7hlJeHOT@kroah.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
 <Y6BhTWGUp2D5hhbE@sirena.org.uk>
 <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Takashi Iwai <tiwai@suse.de>,
 yung-chuan.liao@linux.intel.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 20, 2022 at 01:41:01PM +0200, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 19 Dec 2022, Mark Brown wrote:
> 
> > On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
> > 
> > > * there are no "CC: <stable..." tags in these patches. Is the plan to
> > > manually ask for a backport? Or how can we get the regression fixed in
> > > older releases?
> > 
> > Speak to the stable maintainers I guess, or hope their bot picks the
> > commits up.
> 
> thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
> it's possible the bots will not pick these up. I can follow up and send 
> these to stable if this does not happen.

"Fixes:" guarantees nothing, please NEVER rely on that.  As per the
kernel documentation for the last 18+ years, you have to tag a commit
with the "Cc: stable@..." tag to ensure that it gets picked up properly.

thanks,

greg k-h
