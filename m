Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A9483E7F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 09:53:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F07170B;
	Tue,  4 Jan 2022 09:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F07170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641286386;
	bh=qBWalmtKSmagHda2t4OLj3e+LegwcyqsE7AA17/oBUE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+noafjQmDqEiE41F+B9aTEb+BuDqgGjFHXAwCHQdXI1ShtHPFOIH4PXv2lcVrKhk
	 PAOMHgP20gTkT2mAe+mlnevs0/SIw17tj5g/FCWKqAxP82rmEgoUvtO138q3gJWVll
	 tgYnfTNSqI0+8Z6r02HnKUQ8DjOc/DgDf3dLKDJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194BCF8032B;
	Tue,  4 Jan 2022 09:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7250AF80310; Tue,  4 Jan 2022 09:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from magratgarlick.emantor.de (magratgarlick.emantor.de
 [78.46.208.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F41E1F80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 09:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41E1F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de
 header.b="HqpbkZ5R"; 
 dkim=pass (1024-bit key) header.d=czerwinskis.de header.i=@czerwinskis.de
 header.b="qrS2vg4R"
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
 id 4DF4491608; Tue,  4 Jan 2022 09:51:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1641286313;
 bh=qBWalmtKSmagHda2t4OLj3e+LegwcyqsE7AA17/oBUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HqpbkZ5R2rXGOhRQzetJxWpJT2+kYJ7NbKhHJFzgTWqWsoO/Qp8bLG5Hs2whASAQw
 PWnOfLs+/Kmd00fD9Nxe/IF5xitzZmDghWt5deMJp7ncBYlnn2EMO3qFN/hcu3nZch
 HRNEKDmyCGxsm+sqFYKpWjSScnGcMA+OU0C+XOYk=
Received: from webmail.emantor.de (magratgarlick.emantor.de
 [IPv6:2a01:4f8:c17:c88::2])
 by magratgarlick.emantor.de (Postfix) with ESMTPA id B8BCA915FB;
 Tue,  4 Jan 2022 09:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1641286310;
 bh=qBWalmtKSmagHda2t4OLj3e+LegwcyqsE7AA17/oBUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrS2vg4Rgw3Ez9BAx2YYKumQcsmZTn6CHmhxthAPEZIsH5zO4ie7E3TBeCdR32e9l
 XHr8aBLvxjvEZgcCzwRKYo7MSTWeSyakUF959sCev3OoNMBHnUiOmgPixY1w/ix90V
 vQbI0+iWtFIS5V0xtwlDuP3REAtaetfS9MN0dOzk=
MIME-Version: 1.0
Date: Tue, 04 Jan 2022 09:51:50 +0100
From: rouven@czerwinskis.de
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: IOMMU Page Fault with Creative Soundblaster Zx after suspend
In-Reply-To: <s5hwnjmo7ae.wl-tiwai@suse.de>
References: <87mtkjqvgj.fsf@czerwinskis.de> <s5hwnjmo7ae.wl-tiwai@suse.de>
Message-ID: <f039f58c6aa161a15ed38737c51cc233@czerwinskis.de>
X-Sender: rouven@czerwinskis.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Colin Ian King <colin.king@intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Simeon Simeonoff <sim.simeonoff@gmail.com>
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

Hi,

Am 2021-12-30 08:56, schrieb Takashi Iwai:
> On Wed, 29 Dec 2021 16:24:13 +0100,
> Rouven Czerwinski wrote:
>> 
>> Hi,
>> 
>> With current 5.15.11, my soundblaster Zx is not correctly coming back
>> from suspend. Dmesg prints:
>> 
>> [Mi Dez 29 16:12:14 2021] [drm] UVD and UVD ENC initialized 
>> successfully.
>> [Mi Dez 29 16:12:14 2021] snd_hda_codec_ca0132 hdaudioC0D1: ca0132 DSP 
>> downloaded and running
>> [Mi Dez 29 16:12:15 2021] [drm] VCE initialized successfully.
>> [Mi Dez 29 16:12:15 2021] usb 1-5: reset full-speed USB device number 
>> 2 using xhci_hcd
>> [Mi Dez 29 16:12:16 2021] ata1.00: Enabling discard_zeroes_data
>> [Mi Dez 29 16:12:16 2021] OOM killer enabled.
>> [Mi Dez 29 16:12:16 2021] Restarting tasks ... done.
>> [Mi Dez 29 16:12:16 2021] PM: suspend exit
>> [Mi Dez 29 16:12:16 2021] snd_hda_intel 0000:06:00.0: AMD-Vi: Event 
>> logged [IO_PAGE_FAULT domain=0x000f address=0xdf880000 flags=0x0000]
>> [Mi Dez 29 16:12:17 2021] igb 0000:08:00.0 enp8s0: igb: enp8s0 NIC 
>> Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX
>> 
>> Where the IOMMU Page Fault looks suspicious. Unbinding and rebinding 
>> the
>> driver using sysfs fixes it, thats the current workaround I have
>> been using.
> 
> Is it a regression from the earlier releases?  If yes, please try to
> narrow down the regression range, at least, which version started
> showing the problem.  It'd be great if you can perform git bisection,
> of course.

I thought it was but it isn't, I recently switched the profile from 
"Analog Stereo Duplex"
to "Analog Surround 5.1" within pavucontrol (underlying sound daemon is 
pipewire).
This seems to lead to the IOMMU error on resume, using 2.0 works fine 
over a suspend resume
cycle.
Time to find out what the surround handling does differently from plain 
stereo for the
soundblaster Z cards.

Kind regards,
Rouven
