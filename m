Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29594146A06
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 14:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A911681;
	Thu, 23 Jan 2020 14:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A911681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579787868;
	bh=nDVIcXs5/jfx2EWAd9I1py5wewG/SxmSL1rJmtwDiLg=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHj2uxsjkEVpCXII0QF8WzLZ5GQnbxgjdioldycMX6FPtTvtTh+QX/8tknZP7mKAF
	 Mn4g81NbCXU2yoWCkDLUgu6KMttekU+lG1RtSDU7DL3cY4GRia4477e52qBXDZAclI
	 jjuSXXZ65znSU00Ypv7H8liLnQ5DpsFqWdk+YEFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E4CF801D9;
	Thu, 23 Jan 2020 14:56:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FC66F801D9; Thu, 23 Jan 2020 14:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71364F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 14:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71364F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="288304082"
Received: from mjyoun1x-mobl.amr.corp.intel.com (HELO [10.251.142.125])
 ([10.251.142.125])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2020 05:55:43 -0800
To: Michal Feix <michal@feix.family>, alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
Date: Thu, 23 Jan 2020 07:55:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
Content-Language: en-US
Subject: Re: [alsa-devel] ASUS T100TAM UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/23/20 6:49 AM, Michal Feix wrote:
> Hello,
> 
> there is no sound working via speakers or headphones jack on Asus 
> T100TAM. Sound works correctly via HDMI or Bluetooth headphones. The 
> chip on this Baytrail machine is correctly recognized as bytcr_rt5640. 
>  From dmesg:
> 
> bytcr_rt5640 bytcr_rt5640: quirk DMIC1_MAP enabled
> bytcr_rt5640 bytcr_rt5640: quirk realtek,jack-detect-source 3
> bytcr_rt5640 bytcr_rt5640: quirk realtek,over-current-threshold-microamp 
> 2000
> bytcr_rt5640 bytcr_rt5640: quirk realtek,over-current-scale-factor 1
> bytcr_rt5640 bytcr_rt5640: quirk MCLK_EN enabled
> bytcr_rt5640 bytcr_rt5640: snd-soc-dummy-dai <-> media-cpu-dai mapping ok
> bytcr_rt5640 bytcr_rt5640: snd-soc-dummy-dai <-> deepbuffer-cpu-dai 
> mapping ok
> bytcr_rt5640 bytcr_rt5640: rt5640-aif1 <-> ssp2-port mapping ok
> input: bytcr-rt5640 Headset as 
> /devices/platform/80860F28:00/bytcr_rt5640/sound/card0/input17
> 
> After bootup, kernel log is filled with: "Baytrail Audio Port: ASoC: no 
> backend DAIs enabled for Baytrail Audio Port" messages. I do understand 
> this is due to the missing UCM profile for the machine.

what do you mean with 'missing UCM profile'? It's been available for 
many moons, and we worked with Jaroslav/Hans to update for UCMv2.

You should be able to use alsa-ucm and configure things manually, e.g.

alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Headphones

alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Speaker

> 
> I've successfully uploaded the output of alsa-info.sh.
> 
> I'm on Arch linux, with latest alsa-ucm-conf 1.2.1.2 which seems not to 
> be sufficient to make sound working on this thing. Is there anything I 
> can provide to help smart Alsa people to help with this?

Can you try the command above and use speaker-test -Dhw:0,0 -c2 -r48000?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
