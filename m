Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA06483C5
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 15:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A579D219B;
	Fri,  9 Dec 2022 15:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A579D219B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670596152;
	bh=XKJ3GRSHuHX15H3zy3Oe35SDTLkvHp+ZIQyyYsklFmI=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VnkujRCBZoqkp1TUMKEscGHvHeyyN3kd3GFPj9uokYqj6AiiUNsYY7WxmScUArPnZ
	 ZoLUcaNJZBUqbHvwFJ5xqX9fu0vrlrfGSeIvxE62azPsTVIXFmZsxYJZ1gZPNxDFni
	 P82aP0Qmav1MfKvLPquA45KNRftbIkTo3IWJBabk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA00F8024C;
	Fri,  9 Dec 2022 15:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E45DBF8022D; Fri,  9 Dec 2022 15:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 353A1F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 15:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 353A1F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f3/hPbg3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670596089; x=1702132089;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=HqgoOLg94nvwxKe35sdtoSxMcAQD5gifnZrRCurRNJw=;
 b=f3/hPbg3qnfjxNX0/9RqjwfFJcjj+DY/DGz4yPLQKu3HAor+U0mWQDVH
 Zx3DoGpN1omC6gUJoh6Z/gyTcAjsvghNMJKvgGZDKvK66l3O6S6GosUpQ
 EO5F4q9yiz2d2EERwEacDBhct84MIjITY4VOU2BVvMQNtIZOgzaSCOnXm
 4YLLnSMKyW1JYfihNPX63TVa/3ZTlFs3gAEYq/ukEci3z69GcE7s8PD42
 +knJ01kQjn79DjcYDDN8EBhaUUHRWNHuTpFNAQu9if51dNKQNGX6Zkp/r
 gS0GdYsPRhVZ72jvuVEMHOgdvpa15Labf7pPTZVeGqSzbgA3ifAEUwIQ7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="316174300"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316174300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 06:28:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="597742329"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="597742329"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 06:28:00 -0800
Date: Fri, 9 Dec 2022 16:27:40 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: SOF: Revert: "core: unregister clients and
 machine drivers in .shutdown"
In-Reply-To: <Y5M8MYT60KiS2XBn@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2212091613240.3532114@eliteleevi.tm.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
 <Y5M8MYT60KiS2XBn@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, lgirdwood@gmail.com,
 Takashi Iwai <tiwai@suse.de>, daniel.baluta@nxp.com,
 Oliver Neukum <oneukum@suse.com>, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Zhen Ni <nizhen@uniontech.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Fri, 9 Dec 2022, Mark Brown wrote:

> On Fri, Dec 09, 2022 at 01:45:29PM +0200, Kai Vehmanen wrote:
> 
> > This reverts commit 83bfc7e793b555291785136c3ae86abcdc046887.
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much

ack, will fix in V2. 

> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
> 
> > -	/*
> > -	 * make sure clients and machine driver(s) are unregistered to force
> > -	 * all userspace devices to be closed prior to the DSP shutdown sequence
> > -	 */
> > -	sof_unregister_clients(sdev);
> > -
> > -	snd_sof_machine_unregister(sdev, pdata);
> > -
> 
> I am somewhat surprised that these block on the kernel side rather than
> just disconnecting the kernel side of whatever userspace sees - I'd
> thought they were more like hotplug operations than something blocking.

Yes, this is not so obvious. The machine unregister ends up 
in soc-core.c:soc_cleanup_card_resources()

--cut--
static void soc_cleanup_card_resources(struct snd_soc_card *card)
{
»       struct snd_soc_pcm_runtime *rtd, *n;

»       if (card->snd_card)
»       »       snd_card_disconnect_sync(card->snd_card);
--cut--

... and there we have the "sync" variant call that gets us in trouble
with e.g. kexec().

This seems to be only user of snd_card_disconnect_sync(), but it was 
specifically added to fix a bug in commit 0ced7b050224 ("ASoC: soc-pcm: 
remove soc_pcm_private_free()").

Br, Kai
