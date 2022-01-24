Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8B4987FC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 19:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB242811;
	Mon, 24 Jan 2022 19:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB242811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643047988;
	bh=1xLm/84dTTQG3iL3ceFNG/Y9g6Aj2seki3xg+Gb74PA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxLbj28P3mruQKuFoiNEp5qoy7PkQem7EB1F9umENeBPHiyzCrNoGvNkKHqCB2YZ8
	 KMENbx9kvhmjfp+rZ/fpimuZSr7BkXsTO168Ic6yunJzYdBhi73bOZs9sTMBg8dn2Q
	 dONbIszyfRKKyVVKZoNQcYM4Kwoha7XuU09Hmj6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E16A8F802BE;
	Mon, 24 Jan 2022 19:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 870F1F8027C; Mon, 24 Jan 2022 19:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51186F800E9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 19:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51186F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F4Z2rBCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643047915; x=1674583915;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1xLm/84dTTQG3iL3ceFNG/Y9g6Aj2seki3xg+Gb74PA=;
 b=F4Z2rBCn0si45dIgByjRAQzvTvq0kU+pTPMZ3paN6ufr1p29TsmvNYi9
 gmArIhr4LdaX+GihNgQfDHBy5fNgzwdlde/m9hqWpVy+Gpb/ZkCzccFFj
 lUYAFMNZhZnqk+RswtMGrnhZsgvv7ZDrjLAhh64XLb/On0DsnjcwZ53YW
 OgWN92ufD0VQSO3eZSGWBSJBXjlaaFo0nXK9WyPVwigAXJ7kOuXlZ7Ofp
 sBQVf0jQa0Wub8HTFXHK6cwJjdReGSxcZpL0j6s2MoCIkr8b9VNN6TXhB
 X/hOSrSno05BwwZuBPEZ76/1g7nVZLrILn1eiypeQRm+Y2rgKbSlWnwmY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226784242"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226784242"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:11:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479176893"
Received: from jindalan-mobl.amr.corp.intel.com (HELO [10.212.11.218])
 ([10.212.11.218])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:11:44 -0800
Message-ID: <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
Date: Mon, 24 Jan 2022 12:11:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: No sound on gpd pocket 3
Content-Language: en-US
To: anthony tonitch <d.tonitch@gmail.com>, alsa-devel@alsa-project.org
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/24/22 10:52, anthony tonitch wrote:
> Hello,
> 
> I have a problem I guess related to sof... I already asked on the irc
> #alsa@libera.chat and gnarface advised me to come and ask on this
> mailing list!

using "options snd-intel-dspcfg dsp_driver=1" to avoid using SOF isn't
very helpful on an AMD platform :-)

08:00.1 Audio device [0403]: NVIDIA Corporation GP104 High Definition
Audio Controller [10de:10f0] (rev a1)
	Subsystem: PNY Device [196e:11a0]
0a:00.3 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family
17h (Models 00h-0fh) HD Audio Controller [1022:1457]
	Subsystem: ASUSTeK Computer Inc. Device [1043:86c7]

Best of luck!

> 
> I am struggling to make the sound of my gpd pocket 3 to work on linux
> (archlinux to be precise)! In fact, the sound is not supposed to work
> out of the box as other users tested it before me! but they all had
> the solution to set the dsp_driver and this didn't worked for me!
> I checked several times to see if the module was loaded properly and
> yes it is (as you can also check in the alsa-info at the end of the mail)!
> 
> If I do aplay -l I get a bunch of hdmi connection that is not working
> at all! I'm really lost here and I don't even know what to look for
> anymore
> 
> The sound works great on windows so This doens't seems to be hardware problem ?!
> and I tried to plug an usb headset which give me sound so I doesn't
> seems to be config related either ?! (tho the jack doesn't work)
> 
> I asked on several places already. I post the different links here in
> case you want to check but I don't have any response to any post
> unfortunately!
> 
> - Post on Archlinux BBS: https://bbs.archlinux.org/viewtopic.php?id=273044
> - Post on subreddit GPDPocket:
> https://www.reddit.com/r/GPDPocket/comments/s31qi8/gpd_p3_no_sound_linux/
> 
> - Screenshot and bios picture of maybe relevant informations:
>     - https://imgur.com/a/DouSB3m
>     - https://imgur.com/a/K232PLJ
> 
> I hope there is enough informations to help me debug this but if you
> need anything I can provide it! this is a small pc and I'm usualy
> quarrying it around!
> I know this is better to send mail but if you need me to chat for any
> reason (it would be easier for instance) I'm usually hanging on the
> libera.chat irc as tonitch you can pm or tag me on #alsa
> 
> Here is the alsa-info.sh :
> http://alsa-project.org/db/?f=6ddb669a19086cebdb121c97c25bbdccb98e856d
> 
> Thanks a lot for your help!
> 
> PS: Ubuntu mate have released their official pocket 3 distribution and
> I tried it but the sound didn't worked either, here is the alsa-info
> In case this help ?! :
> http://alsa-project.org/db/?f=df4c183fd00cec224006ec8caa228705399ad873
