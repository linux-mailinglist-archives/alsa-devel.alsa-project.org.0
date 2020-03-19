Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612618B3D2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 14:02:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F3C1769;
	Thu, 19 Mar 2020 14:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F3C1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584622964;
	bh=oSdVJpJ6chv0PIay3o+QYreHJ9y9mzorL872umTS+vs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EcOSUdVrwInRdbpwtYaMKMHpoHO2JaTHaV5BY0IJ4FBHBfZX4+U/Wm1dlO5UnS61E
	 lFUjwxb+WITYvacrvejOeXgwH9Aeh9V/yQMQnQsUDMXbOudeYBlw3DJ15Gfrrm7/Sf
	 FwuhkDlQI4++oopc/F8iHgsJBy+RPtxsc9Qw9R94=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C273BF80232;
	Thu, 19 Mar 2020 14:01:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FCC8F800DD; Thu, 19 Mar 2020 14:00:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87FA0F800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 14:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87FA0F800DD
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 5E6E12009CA;
 Thu, 19 Mar 2020 13:00:53 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 172B020B1E; Thu, 19 Mar 2020 14:00:49 +0100 (CET)
Date: Thu, 19 Mar 2020 14:00:49 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 kuninori.morimoto.gx@renesas.com
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200319130049.GA2244@light.dominikbrodowski.net>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
Cc: alsa-devel@alsa-project.org, curtis@malainey.com,
 linux-kernel@vger.kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On Wed, Mar 18, 2020 at 11:20:55PM +0100, Cezary Rojewski wrote:
> On 2020-03-18 22:52, Dominik Brodowski wrote:
> > On Wed, Mar 18, 2020 at 09:43:54PM +0100, Cezary Rojewski wrote:
> > > On 2020-03-18 20:22, Dominik Brodowski wrote:
> > > > On Wed, Mar 18, 2020 at 07:27:58PM +0100, Cezary Rojewski wrote:
> > > 
> > > > > 
> > > > > Due to pandemic I'm working remotely and right now won't be able to test
> > > > > audio quality so focusing on the stream==NULL issue. And thus we got to help
> > > > > each other out : )
> > > > 
> > > > Sure, and thanks for taking a look at this!
> > > > 
> > > > > Could you verify issue reproduces on 5.6.0-rc1 on your machine?
> > > > 
> > > > It reproduces on 5.6.0-rc1 + i915-bugfix. I'm trying to bisect it further in
> > > > the background, but that may take quite some time.
> > > > 
> > > 
> > > Could you checkout v5.6-rc1 with following commit reverted:
> > > 	ASoC: Intel: broadwell: change cpu_dai and platform components for SOF
> > > 
> > > For my working v5.6-rc1 commit id is:
> > > 64df6afa0dab5eda95cc4cc2269e3d4e83b6b6ce.
> > 
> > Hm, no joy -- after suspend/resume, no sound at first, and if I twiggle some
> > options with pulseaudio, I get garbled output (even when using
> > 
> > 	aplay -f S16_LE -r 44100 -c 2 --device="sysdefault:CARD=broadwellrt286"
> > 
> > ). Will try to bisect further the next days.
> > 
> 
> Thanks for quick reply. Revert of said commit fixes stream==NULL issue for
> me. See if there were any changes in dmesg.
> Will ask technicians to assist me on site tomorrow.

Have some good news now, namely that a bisect is complete: That pointed to
1272063a7ee4 ("ASoC: soc-core: care .ignore_suspend for Component suspend");
therefore I've added Kuninori Morimoto to this e-mail thread.

Additionally, I have tested mainline (v5.6-rc6+ as of 5076190daded) with
*both* 64df6afa0dab (which you suggested yesterday) and 1272063a7ee4
reverted. And that works like a charm as well.

Hope this helps!

Thanks,
	Dominik
