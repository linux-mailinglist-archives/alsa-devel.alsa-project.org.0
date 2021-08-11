Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 395263E9B16
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 00:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1C01AF7;
	Thu, 12 Aug 2021 00:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1C01AF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628722729;
	bh=AsTYz/Srw+pdgAC/lSY3iuaisyOC4LJx9jeV8CqLIG0=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:References:
	 In-Reply-To:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=nXW36bsO2U+wVaEtx9UoqCvmkGUrQv02bvBuOF+q/QYDcxRKvH6bekZeN0bGybYos
	 +4T/TRRNJjjhPSyVTPUknh+rFNwYcpDlgW18FdAcmGN+Guosf46UWiOMfYGL40lgrr
	 ZHgqELlF/XvJE/uW0deingkjdkj2ooBDL9v5quTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23582F8032D;
	Thu, 12 Aug 2021 00:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 775A2F802D2; Thu, 12 Aug 2021 00:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.50.161])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0745BF80148
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 00:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0745BF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=offbeat.tech header.i=@offbeat.tech
 header.b="Ye2VtBkC"
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 6EDE014677
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 17:56:58 -0500 (CDT)
Received: from gator4324.hostgator.com ([162.241.194.183]) by cmsmtp with SMTP
 id Dx9emgJGBrJtZDx9emEFAj; Wed, 11 Aug 2021 17:56:58 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=offbeat.tech; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:To:From:Date:Resent-To:Resent-Message-ID:Resent-Date:
 Resent-From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n+TmzxRuJEUq/z0+cU1LTBHfE9TU/A9REMvx5sV2jxo=; b=Ye2VtBkC8LKN3rdrhx0z9sF/M4
 dpcsvoWFY51DN69EnZkKJHSrNTgxspklDA4RAGbqnmvjzf3hx/w9RUilMLp4E/a3FcjFTN/NFkcVL
 DwipDH5WkvnArsvALBYoTk+y/FJi9FoITlwG2ltqesQ4qFmPl2F2Z590DELCpRy/Awq0XrhGkB9u4
 wxkNEGRzB+5aEaCzkxl7J1E7vobysUz5k8t6OQLzem0kzef76kIqwMGmlP5HVUwZSL7mpwGDjoMjn
 uRLihGpkUWyKYXkpIRO1yUr61I1sen0ekToflwrwvcP3HadKbGYwLhMYjtXVJNEA40w7T4eHU93kq
 1jRzLjjQ==;
Received: from c-73-213-206-7.hsd1.md.comcast.net ([73.213.206.7]:59140
 helo=localhost) by gator4324.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@offbeat.tech>) id 1mDx9d-003m2J-VD
 for alsa-devel@alsa-project.org; Wed, 11 Aug 2021 17:56:58 -0500
Resent-From: tom <tom@offbeat.tech>
Resent-Date: Wed, 11 Aug 2021 18:56:57 -0400
Resent-Message-ID: <20210811225657.uszcagp5btluigi7@offbeat.tech>
Resent-To: alsa-devel@alsa-project.org
Date: Tue, 10 Aug 2021 21:22:37 -0400
From: tom <tom@offbeat.tech>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: CORB reset timeout, Intel 3400 onboard chip
Message-ID: <20210811012236.r7cepbgeepef2b5w@offbeat.tech>
References: <20210810223536.u2y2cggfgrdqyhby@offbeat.tech>
 <c2883e45-5822-c154-9057-14a2b0f05938@linux.intel.com>
 <20210811012120.eafmshqoqvaobe7g@offbeat.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811012120.eafmshqoqvaobe7g@offbeat.tech>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4324.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - offbeat.tech
X-BWhitelist: no
X-Source-IP: 73.213.206.7
X-Source-L: No
X-Exim-ID: 1mDx9d-003m2J-VD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-213-206-7.hsd1.md.comcast.net (localhost)
 [73.213.206.7]:59140
X-Source-Auth: tom@offbeat.tech
X-Email-Count: 1
X-Source-Cap: b2ZmYmVhdDY7b2ZmYmVhdDY7Z2F0b3I0MzI0Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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

On 21/08/10 09:21PM, tom wrote:
> On 21/08/10 09:16PM, tom wrote:
> > On 21/08/10 06:03PM, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > On 8/10/21 5:35 PM, tom wrote:
> > > > Hello all,
> > > > I am experiencing an issue with my onboard sound card, where I have no sound
> > > > output. Please see a copy of my alsa-info.sh for my current 
> > > > /etc/modprobe.d/*.conf config, located here:
> > > > 
> > > > http://ix.io/3vAV
> > > > 
> > > > I attempted troubleshooting using some config options that I saw listed in 
> > > > HDAudio.txt. Specifically, I tried model options for "generic". I also tried a 
> > > > few options for probe_mask, including "1" and "0x100".
> > > > 
> > > > 
> > > > It seems that no matter which options I put in, I always get a
> > > > CORB timeout from desg:
> > > > 
> > > > [    4.052955] snd_hda_intel 0000:00:1b.0: CORB reset timeout#1, CORBRP = 0
> > > > [    4.053038] snd_hda_intel 0000:00:1b.0: no codecs initialized
> > > > 
> > > > When I remove my probe_mask options, it first switches to polling mode, then
> > > > single_cmd mode, and finally fails to initialize any codecs. I looked at the
> > > > hda_intel.c file and saw a section for my onboard sound card (ref line 2515):
> > > > 
> > > > 00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset High 
> > > > Definition Audio (rev 05)
> > > 
> > > In the alsa-info.sh log, I can see this
> > > [    3.950319] snd_hda_intel 0000:00:1b.0: codec_mask forced to 0x0
> > > 
> > > I am not sure how this might happen, this looks like a bad configuration
> > > to me?
> > > 
> > > 	/* check forced option */
> > > 	if (chip->codec_probe_mask != -1 &&
> > > 	    (chip->codec_probe_mask & AZX_FORCE_CODEC_MASK)) {
> > > 		azx_bus(chip)->codec_mask = chip->codec_probe_mask & 0xff;
> > > 		dev_info(chip->card->dev, "codec_mask forced to 0x%x\n",
> > > 			 (int)azx_bus(chip)->codec_mask);
> > > 	}
> > 
  Hello Pierre,
  
  My /etc/modprobe.d/alsa-base.conf file looks as follows:
  
  options snd_hda_intel probe_mask=0x100
  
  And this was based on a suggestion from "HDAudio.txt"
  
  If I comment this line out, I will instead get the following from the
  command "sudo dmesg | grep -i snd":
  
  [    4.110018] snd_hda_intel 0000:00:1b.0: CORB reset timeout#1, CORBRP = 0
 [    5.114462] snd_hda_intel 0000:00:1b.0: azx_get_response timeout, switching to polling mode: last cmd=0x100f0000
 [    6.124488] snd_hda_intel 0000:00:1b.0: No response from codec, disabling MSI: last cmd=0x100f0000
 [    7.131158] snd_hda_intel 0000:00:1b.0: Codec #1 probe error; disabling it...
 [    7.236557] snd_hda_intel 0000:00:1b.0: CORB reset timeout#1, CORBRP = 0
 [    8.244423] snd_hda_intel 0000:00:1b.0: azx_get_respons timeout, switching to single_cmd mode: last cmd=0x100f0000
 [    8.244955] snd_hda_intel 0000:00:1b.0: no codecs initialized
 
 I hope this helps!
