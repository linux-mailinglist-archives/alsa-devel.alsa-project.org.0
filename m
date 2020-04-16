Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049B1AC233
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 15:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16631660;
	Thu, 16 Apr 2020 15:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16631660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587043204;
	bh=8wwIPUjLOGVY6MiiQl/MxXSF9y5Ll1/wFK42dWzXets=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoAaKRrIM1YaiFv4nft0tEqwTFEt1ru/OrtlHMzIp9ynLBaSoWHLDDcafHITBDsTP
	 k55iMNK2uNyUXTDXIVNp+3tX+GjklVChbwauV8sn764jq9OpyXUoCNfdMFjfYxm1HV
	 c5OZwz4PILq5WWmt0Rn5aWNlDakT1UtsVRzzsufg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05116F8021E;
	Thu, 16 Apr 2020 15:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 324D6F8013D; Thu, 16 Apr 2020 15:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C174F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 15:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C174F8012E
IronPort-SDR: PTc3leFgIuAT+jDO+nWBSdtboFj5lHoR7q0XB2vtcZ6INeAxvxQKFS8Ju+jubBt1/btw58ZUi5
 obCf5Tc5JX1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 06:18:12 -0700
IronPort-SDR: IE2ouUYoFoJ9oVhoiYA8uUJ6pId6MRiAv5/w2J/1zoNtiSLa8uCMwaB/WWy6yCNC760hoh9s93
 9dP+7bthZdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; d="scan'208";a="427828759"
Received: from spearjen-mobl.amr.corp.intel.com ([10.251.143.244])
 by orsmga005.jf.intel.com with ESMTP; 16 Apr 2020 06:18:12 -0700
Message-ID: <1799db6034f66d3c3e65e2cb4dd7a0f158c41047.camel@linux.intel.com>
Subject: Re: Question about snd_soc_card_register()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Date: Thu, 16 Apr 2020 06:18:11 -0700
In-Reply-To: <s5ho8rrewrq.wl-tiwai@suse.de>
References: <DM6PR11MB29052BDEDBB872123FE6410FE8D80@DM6PR11MB2905.namprd11.prod.outlook.com>
 <s5ho8rrewrq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 "Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>
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

On Thu, 2020-04-16 at 09:04 +0200, Takashi Iwai wrote:
> On Thu, 16 Apr 2020 07:52:45 +0200,
> Sridharan, Ranjani wrote:
> > 
> > Hi Takashi,
> > 
> > While working on implementing the probes features in SOF using a
> > separate card
> > for the probe DAI links, I noticed that calling
> > snd_soc_register_card() 
> > results in
> > incrementing the usage_count for the device that registers the card
> > by 2 and
> > it is not decremented until the card is freed.
> > 
> > Is this the expected behaviour? Typically, we register a separate
> > platform
> > device for the Intel machines which in turn register the card and
> > none of them
> > ever enable runtime PM. So this has no impact on the parent
> > device's runtime
> > PM status. 
> > 
> > I'd like to avoid creating a separate platform device just to
> > register the
> > card if possible while also enabling runtime PM . But when I do
> > this today,
> > the device cannot enter runtime suspend at all. Could you please
> > shed some
> > light on this?
> 
> It's not clear how you see the things.  Which device are you looking
> at?  Typically a card object points to two different devices, one is 
> the real device that the chip belongs to (card->dev), and another the
> own device object for managing the device files (card.card_dev).
> And in general, snd_soc_card_register() or snd_card_register() don't
> manipulate the runtime PM stuff by itself at all.

Its the card->dev that I am looking at. This is the device that calls
devm_snd_soc_register_card(). 
In my tests, the usage_count for this device is 0 before calling
devm_snd_soc_register_card and it is 2 after the card registration is
complete.

Thanks,
Ranjani

