Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F418141C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 10:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54709166B;
	Wed, 11 Mar 2020 10:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54709166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583917741;
	bh=Wd6LXzdWrevZQUi3wCpbdc21/c/XKID2lct5if6uk1o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sq2Lv9758oAEWuD9CvSWFGV60CWA2Kr5NmXk0fTsVhaaWPcPZL7qaVaPihZIXoRh5
	 Jm0WblcrHvd3RpsI3yA2pdzwKElHeF6adtCndiWZ6kIZ6DCQQcGjSxF3ssLNeyjKZ0
	 fjRATu3G8oy7pgmR1VNtvObSupNQfx+u2Jf8r5JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CC7F80141;
	Wed, 11 Mar 2020 10:07:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F81DF801EB; Wed, 11 Mar 2020 10:07:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A62AF800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 10:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A62AF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U2wEf6O9"
Received: from localhost (unknown [106.201.105.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 574FB208E4;
 Wed, 11 Mar 2020 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583917631;
 bh=Wd6LXzdWrevZQUi3wCpbdc21/c/XKID2lct5if6uk1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U2wEf6O9YENHSPbexGEYvfOiR3xkyK4g+YNQN8DmT3FTBwGvyDSlPh3FnCKYjaUy8
 X4+5m32FPQ/B5Yx8YpLLyAOTGi8Hpn9XF9T4Kj0S7K58HgY6pi+zq0SPI6pmTtawVx
 0qweTzwVYfvernBQiXLZWkkLIVlqRguu9jpW13Cw=
Date: Wed, 11 Mar 2020 14:37:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: Intel: common: add match tables
 for ICL w/ SoundWire
Message-ID: <20200311090706.GJ4885@vkoul-mobl>
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
 <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
 <d5e15895-7d10-7255-692c-c5c89d3ae1be@perex.cz>
 <b49c010b-5b90-4ad6-58b8-9e43f9fc949f@linux.intel.com>
 <e8df8119-d88b-69b7-fd7a-890f1eb06dbf@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8df8119-d88b-69b7-fd7a-890f1eb06dbf@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 11-03-20, 07:39, Jaroslav Kysela wrote:
> Dne 11. 03. 20 v 2:35 Pierre-Louis Bossart napsal(a):
> > 
> > 
> > On 3/10/20 5:12 PM, Jaroslav Kysela wrote:
> > > Dne 10. 01. 20 v 23:25 Pierre-Louis Bossart napsal(a):
> > > > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > > 
> > > > The two configurations are with the Realtek 3-in-1 board requiring all
> > > > 4 links to be enabled, or basic configuration with the on-board RT700
> > > > using link0.
> > > > 
> > > > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > > Signed-off-by: Pierre-Louis Bossart
> > > > <pierre-louis.bossart@linux.intel.com>
> > > 
> > > Hi,
> > > 
> > >     I just looking to this code and I miss the Kconfig selection for RT
> > > codecs in the SOF SDW driver. How we can enable this driver without
> > > selecting SND_SOC_ALL_CODECS ?
> > > 
> > >     I believe that those changes should be in sync with the machine
> > > description.
> > 
> > Sorry Jaroslav, I don't fully understand your question.
> > 
> > These tables are just used to
> > a) select a firmware file
> > b) select a topology file
> > c) select a machine driver.
> > 
> > The codec selections are not made in this module but handled by the
> > machine drivers in sound/soc/intel/boards/. It's the same mechanism as
> > for all other machine drivers.
> > 
> > One caveat is that the SOF parts and machine drivers for SoundWire have
> > not been provided upstream just yet, since they would not build without
> > patches in drivers/soundwire. GregKH mentioned the patches are 'sane'
> > and provided his Reviewed-by tag. Vinod Koul still has objections to our
> > proposals but has yet to make proposals that would work for Intel, so if
> > you need SoundWire support in the near-term you will need to have a
> > conversation with Vinod. The code is ready and fully-tested.
> > 
> > If you want to look at the machine drivers for SOF+Realtek drivers, see
> > 
> > https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/intel/boards/sdw_rt711_rt1308_rt715.c
> > 
> > and the Kconfig that selects the relevant codec drivers is here:
> > 
> > https://github.com/thesofproject/linux/blob/d05959d5021cefbbd841773ee25f6c7387e6bfd9/sound/soc/intel/boards/Kconfig#L556
> 
> Ohh, it explains all. I was looking for the 'select SND_SOC_RT711_SDW' lines
> in Kconfig. It's really bad to merge those pieces randomly to the ASoC tree,
> because this code in the patch is dead without the machine driver code.
> 
> Vinod, any ETA? It seems that the Intel's soundwire hardware is reaching the
> market.

That would be question for Pierre, I no longer work for Intel.

-- 
~Vinod
