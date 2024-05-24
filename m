Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DD38CE883
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 18:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 557621EB;
	Fri, 24 May 2024 18:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 557621EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716567244;
	bh=BdoTvVOPkbsKys5oa+9xW3Y4PkStppmaGSySwGyNJM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUjDKE9Q4U1fog/rdPXD1nQZJATgJ6PES3E1QcnhnhfoVbQ5Xkbut6Wuc+Uba8PVE
	 z9zjKblIEMI37pHGi+jsXdC1Z0GJX89IGpJ7DZ7EQpdoyRiUGNBo4YEt6ivELfWUMP
	 GI0YS9Ty1oFzQAc82DOoKKqyc1x6NJa1PIRsI65M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CC14F805B4; Fri, 24 May 2024 18:13:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB9FF8016B;
	Fri, 24 May 2024 18:13:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4047F8020D; Fri, 24 May 2024 18:13:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0856F8016B
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 18:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0856F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZ65Bep8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F40F60004;
	Fri, 24 May 2024 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716567198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Huh/X722SjDzCcdLJbM0TZp8RM43bnA8UHc9vCXTgrM=;
	b=ZZ65Bep8ZewGVgSU2IYuGeNI6iiP7/oPRLfjS9R7MpDNReqJPUgEvK/AiqJWgNegf/jZaf
	cfgDw9w/ZRvW5ukDCxGVsPhW5VVTzBMYiAzesSmnfVHjc4bk1RDSJUpKTYDNv64UMBpXdC
	bDIh61f4XcA/I6Y5LMRSdIe0sF7yloozN894wqQhgy/qKz3hc7N9w09joZWyG+3t7CYT3L
	RHII0ZI262dwnefTs+6QZmLHuAimleAhSqtotwHTHMn6bxkjJoyzT1enFrfD8WhEThzo8B
	EP1S89F5uqjrUASgIx6WBndJrxcA1C/oUCF5p24cXP+lk8WaQd+Lwg4Dy+TNaQ==
Date: Fri, 24 May 2024 18:13:16 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	miquel.raynal@bootlin.com, perex@perex.cz, tiwai@suse.com,
	lars@metafoo.de, lgirdwood@gmail.com
Subject: Re: DMA Transfer Synchronization Issue in Out-of-Tree Sound Card
 Driver
Message-ID: <ZlC8nG0Vzxg9HFT2@localhost.localdomain>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	miquel.raynal@bootlin.com, perex@perex.cz, tiwai@suse.com,
	lars@metafoo.de, lgirdwood@gmail.com
References: <Zkxb0FTzW6wlnYYO@localhost.localdomain>
 <6e01c13f-2bc1-4e08-b50e-9f1307bda92d@sirena.org.uk>
 <87msoiz94h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msoiz94h.wl-tiwai@suse.de>
X-GND-Sasl: louis.chauvet@bootlin.com
Message-ID-Hash: 2URCJUXJCSCZ5RUBIDE6QH7A54TKXPVM
X-Message-ID-Hash: 2URCJUXJCSCZ5RUBIDE6QH7A54TKXPVM
X-MailFrom: louis.chauvet@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2URCJUXJCSCZ5RUBIDE6QH7A54TKXPVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 22/05/24 - 07:52, Takashi Iwai a écrit :
> On Tue, 21 May 2024 20:32:59 +0200,
> Mark Brown wrote:
> > 
> > On Tue, May 21, 2024 at 10:31:12AM +0200, Louis Chauvet wrote:
> > 
> > > To address this DMA issue, I have created a patch [1] that guarantees the 
> > > completion of the DMA transfer upon the return of xdma_synchronize. This 
> > > means xdma_synchronize now sleeps, but looking at other drivers around it 
> > > appears expected to be able to do so.
> > 
> > You need to set the nonatomic flag for the PCM to allow this, the
> > default is that triggers run in atomic context.
> 
> Right, that's a most straightforward solution.  It implies that the
> period updates must be in non-atomic, i.e. use a threaded irq handler
> in most cases.
> 
> If the synchronization is needed for assuring the hardware stop, there
> is an alternative with PCM sync_stop callback, too.  The callback is
> called at each time after a stream gets stopped before the next action
> (that is, either prepare, hw_params or close).  It's only for
> stopping, and there is no similar way for sync of a stream start,
> though.
> 
> 
> thanks,
> 
> Takashi
> 

Hi!

Thank you for your prompt responses!

I have currently implemented the solution with sync_stop, as it is 
precisely what I need to do, and it works perfectly.

As I may need to backport this driver up to 4.19, sync_stop was not yet 
available, so I will look into the threaded IRQ solution, which sounds 
promising.

Thank you both very much!

Best regards,
Louis Chauvet

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
