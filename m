Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404C8000C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 20:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7C216C5;
	Fri,  2 Aug 2019 20:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7C216C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564769298;
	bh=jAEguxX8N6WJZBz+hlpoD/dzoX8iWbiwJniOjxUMefs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3/NHOARl7J/CgyiXBlMxKS7mE7IjnWOFFqo4Fec3hewoIuOgVBNJ2ghJLaTYNvc1
	 +xg2z+fceafHHPVWD9PcH/17FvuhH6vh/Lb6qEzCqq/dQzsGcwB9MesHDDKUJXk0kQ
	 sb7XIQHSFGbL1wiMQHZpHxneW2O046fNiawt59lM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7695F8048F;
	Fri,  2 Aug 2019 20:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83779F8048F; Fri,  2 Aug 2019 20:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60297F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 20:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60297F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rAYrta9U"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A42721726;
 Fri,  2 Aug 2019 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564766996;
 bh=f4LLTVVR2NozHp4xg1GijBVQN0SOO8S+/65J8PEHkms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAYrta9UyUCnFLkGPm0U/0x47AQ6HjSbus4/MDTo6aiSU6omJVWh0qxXxdLqeN4Yy
 GKEYNCS/qZ9mB2ndF4JsSPthqUg3CluZNG7+msjDFNDt/c2sLUbga/lqdw+IpbIuvM
 35kWXfEIgfa9b+yg4qNTkESGyo5S4zA2wMlvR3j0=
Date: Fri, 2 Aug 2019 22:58:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802172843.GC12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
 <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26-07-19, 09:46, Pierre-Louis Bossart wrote:
> =

> =

> On 7/26/19 5:38 AM, Cezary Rojewski wrote:
> > On 2019-07-26 01:40, Pierre-Louis Bossart wrote:
> > > +void intel_shutdown(struct snd_pcm_substream *substream,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct snd_soc_dai *dai)
> > > +{
> > > +=A0=A0=A0 struct sdw_cdns_dma_data *dma;
> > > +
> > > +=A0=A0=A0 dma =3D snd_soc_dai_get_dma_data(dai, substream);
> > > +=A0=A0=A0 if (!dma)
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +
> > > +=A0=A0=A0 snd_soc_dai_set_dma_data(dai, substream, NULL);
> > > +=A0=A0=A0 kfree(dma);
> > > +}
> > =

> > Correct me if I'm wrong, but do we really need to _get_dma_ here?
> > _set_dma_ seems bulletproof, same for kfree.
> =

> I must admit I have no idea why we have a reference to DMAs here, this lo=
oks
> like an abuse to store a dai-specific context, and the initial test looks
> like copy-paste to detect invalid configs, as done in other callbacks. Vi=
nod
> and Sanyog might have more history than me here.

I dont see snd_soc_dai_set_dma_data() call for
sdw_cdns_dma_data so somthing is missing (at least in upstream code)

IIRC we should have a snd_soc_dai_set_dma_data() in alloc or some
initialization routine and we free it here.. Sanyog?

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
