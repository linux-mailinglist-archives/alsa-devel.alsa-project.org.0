Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EEF345AD4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 10:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11D215E2;
	Tue, 23 Mar 2021 10:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11D215E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616491839;
	bh=URRr5aKlBAxVg0ntGgJQpmDFUocijKwevITWU5tvtOc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUe4Es6PxS3LNZfGNnjPHGJe9rGBQ6nqkDpOYlh0m1q+pA7G1jpHjOI/kh/JI4poW
	 F+h36okBSytVLYYIEOcLW38e+5CAlMWzyEnP2APxV+CEo/WgrpNy7yBc4rIyaVcdAW
	 uSOI8/gvuD92QVnY08Kj8BVwWc0AwbFqo4pYYjKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F4AFF80268;
	Tue, 23 Mar 2021 10:29:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4958FF8025F; Tue, 23 Mar 2021 10:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A82F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 10:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A82F80104
IronPort-SDR: 71pp7Tz30EuXk2xcZ9AWgS3zJ3NI/QiIpgvFSEuPIS3aIPGTj85LtC02sq11yyhixdPuXZwSrw
 4PXjYwrHHkng==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189842033"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="189842033"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:28:32 -0700
IronPort-SDR: zUzoIO+8x9t1jUO2KUMLx4QsGUIQE5vj3QLqY6Q1v3OlO8ZrJ6kCZIkfPvmmw9kUfIdZqEdIPM
 ZuvGNpKGIrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="513676832"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 23 Mar 2021 02:28:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 23 Mar 2021 11:28:27 +0200
Date: Tue, 23 Mar 2021 11:28:27 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Handle device properties with software node
 API
Message-ID: <YFm0u9k/DNy5URsR@kuha.fi.intel.com>
References: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
 <786795eb-6832-fd7d-4674-65be394c083d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786795eb-6832-fd7d-4674-65be394c083d@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, Mar 22, 2021 at 10:02:40AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 3/22/21 6:06 AM, Heikki Krogerus wrote:
> > The function device_add_properties() is going to be removed.
> > Replacing it with software node API equivalents.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > Hi,
> > 
> > This patch depends on a fix from mainline, available in v5.12-rc4:
> > 
> > 	2a92c90f2ecc ("software node: Fix device_add_software_node()")
> > 
> > Cheers,
> > ---
> >   sound/soc/intel/boards/bytcht_es8316.c      |  2 +-
> >   sound/soc/intel/boards/bytcr_rt5640.c       |  2 +-
> >   sound/soc/intel/boards/bytcr_rt5651.c       |  2 +-
> >   sound/soc/intel/boards/sof_sdw_rt711.c      | 20 +++++++++++++++-----
> >   sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 20 +++++++++++++++-----
> >   5 files changed, 33 insertions(+), 13 deletions(-)
> > 
> > diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> > index 06df2d46d910b..4a9817a95928c 100644
> > --- a/sound/soc/intel/boards/bytcht_es8316.c
> > +++ b/sound/soc/intel/boards/bytcht_es8316.c
> > @@ -544,7 +544,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
> >   		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
> >   	if (cnt) {
> > -		ret = device_add_properties(codec_dev, props);
> > +		ret = device_create_managed_software_node(codec_dev, props, NULL);
> 
> I don't think this is correct. This is using the codec_dev device, but this
> property is created in the machine driver - different device. I think the
> proper fix is to remove the property in the machine driver .remove()
> callback, as done below for the SoundWire case, and not to rely on devm_
> with the wrong device.
> 
> there was a thread between July and October on this in
> https://github.com/thesofproject/linux/pull/2306/
> 
> It seems that we need to restart this work.
> 
> Heikki, do you mind if I take your patches (keeping you as the author) and
> rework+test them with the SOF tree + CI ?

OK by me (though, I'm not sure about the author part after that).


thanks,

-- 
heikki
