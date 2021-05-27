Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62606393022
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 15:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E3716EA;
	Thu, 27 May 2021 15:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E3716EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622123558;
	bh=J/HM11gqKst6Dcqt5dJX5+dMTl6Cr6Ivb5RmsAs+pXM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoQtwhNcerFXqsvlibOrFjSdZebf8/1KWroy1jb8IMqX+BibySfCw/R9PylAbBVMx
	 f2gtMs/1mWwUQd/LlemkzBzLDrx+YK4BzuO9Sehfmjth0vvXfa5kld361x1C8pnOmm
	 ji2MAH2ybSYfFcdiuRFNbBhRJlTEGB/NaM5ywJUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33284F80149;
	Thu, 27 May 2021 15:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A96AF80147; Thu, 27 May 2021 15:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4600FF800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 15:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4600FF800EA
IronPort-SDR: jkYHKzJdrCoz7DRS03v1oli1TcXFKm+ljugA+uSIKkz7xENE25OEZ5o1m9oozlCDwy8e9bAuPN
 lMaDc5OtS9oQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202741833"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202741833"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 06:50:40 -0700
IronPort-SDR: bX53wWvhg6Is+pIFWQsb0qsEl8Lafc9pNNpTUCxKN80uptaCVkwqmwBslX1xgo5/IHZlXX0Og4
 FnTBuS4LRm7g==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477493323"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 06:50:39 -0700
Date: Thu, 27 May 2021 16:43:04 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
In-Reply-To: <877djk8jw2.fsf@ungleich.ch>
Message-ID: <alpine.DEB.2.22.394.2105271551100.3922722@eliteleevi.tm.intel.com>
References: <874keoijzh.fsf@ungleich.ch>
 <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz> <87r1hs31h6.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271343540.3922722@eliteleevi.tm.intel.com>
 <877djk8jw2.fsf@ungleich.ch>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi Nico,

On Thu, 27 May 2021, Nico Schottelius wrote:

> > it seems more kernel config options are missing. Distribution kernels
> > typically enable all the machine drivers, but you are specifically missing
> > CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH=m
> 
> I've enabled this one and all machine types and indeed the card is being
> recognised (report at
> http://alsa-project.org/db/?f=5cbe7c293cbb80ab548b892cfc8b991476b0b2aa).
> I checked permissions on /dev/snd, which looks good.
> 
> However, obs does not list the microphone at all and
> chromium / jitsi shows the snd-hda-dsp mic, however does not let me
> select it.

ok, that's great so the driver appears to work now. You could try
to do simple arecord test in terminal:

arecord -fdat -vv -Dplugw:0,6 -c4 /dev/null

You should see vumeter activity from the built-in microphone.

If that works, this starts to go a bit outside the scope of this list, but 
it sounds something in Alpine's user-space integration is missing. In e.g. 
Fedora and Ubuntu, ALSA UCM file is provided for these platforms and the 
shipped versions of Pipewire/Pulseaudio can expose the devices correctly 
to apps. You can do a sanity test (of your hardware) by booting a recent 
live image of either distro.

Br, Kai
