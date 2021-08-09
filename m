Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F93E3E9E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 06:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE41C1658;
	Mon,  9 Aug 2021 06:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE41C1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628481844;
	bh=+XrUP5NVH1u7RhXmPRGxR+j2jSoABTqOiaov1Uv6fIU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bloUcqYtUBFmzJrDlKRCOGOgIwvkRMKxmgj8Hs7J+1WZjaHxgdtm9WlnoD0yGieuq
	 ExVQJDLoBMqaZKiQkRPCi/NMZYY0JNOd9XOSd44tXrnWpZwA3v5r7ExGCpjNj1O6TI
	 XcsCPkgcvRx5LzQXDlmo3NedGUG802x135eHaPDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 383DBF800CB;
	Mon,  9 Aug 2021 06:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1BD0F802D2; Mon,  9 Aug 2021 06:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08047F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 06:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08047F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s0YOfp0B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2F1260FC2;
 Mon,  9 Aug 2021 04:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628481746;
 bh=+XrUP5NVH1u7RhXmPRGxR+j2jSoABTqOiaov1Uv6fIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s0YOfp0BGvI4Cig2tDtz51847dS4kmRqrKOPMKUGGdmIVp5BuPOtG5Vsqw9bh48MB
 TeSvWXHGSKx0Xb8ysjb/z5w38jcNnYz6zSL7qHzZeHx+TrcuD4Mxr2JREFq0MM2w4B
 kwmBJhvXW0v2zJo03OkTozhgl4k9sKiqWHilkVaPFtffLm1N24L6HTYRitzfJRJ3v7
 apZ7ADXrYZejIq0MtI9VMKbK5LRfIqTgwJ4j3hxFOxsjuHjSTsABoqO2wKghIJbrDr
 nQZQ0622Ji/Ut22338jZpsopEGHAPZA2VjkSsMw9rDziihZPO3r/Qq98Vjntj3riix
 2X3V3C5NNBj1A==
Date: Mon, 9 Aug 2021 09:32:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Message-ID: <YRCozWNtypjnTp0b@matsya>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
 <YQ07BVDyPD1Vb4R8@matsya>
 <a40644ba-bee7-0fc2-93e5-b1746ecda938@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a40644ba-bee7-0fc2-93e5-b1746ecda938@linux.intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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

On 06-08-21, 11:17, Pierre-Louis Bossart wrote:
> 
> 
> On 8/6/21 8:37 AM, Vinod Koul wrote:
> > On 02-08-21, 10:46, Pierre-Louis Bossart wrote:
> >>
> >>>>>>>> The trigger callback is handled in the stream lock atomically,
> >>>>>>>> and are you sure that you want to operate a possibly heavy task there?
> >>>>>>>
> >>>>>>> It's a good objection that we didn't think of.
> >>>>>>
> >>>>>> Doesn't Intel use non atomic trigger to send IPCs which anyway
> >>>>>> involve code which can sleep..?
> >>>>>
> >>>>> sof_sdw.c doesn't seem setting it?
> >>>>
> >>>> Yes I think init_dai_link() should set it. Maybe Pierre/Bard would know why.
> >>>
> >>> init_dai_link() is to assign dai link elements only. No IPC is needed.
> >>
> >> The 'nonatomic' concept is only used for an FE dailink which expose a
> >> PCM device:
> >>
> >> soc-pcm.c:	pcm->nonatomic = rtd->dai_link->nonatomic;
> >>
> >> Setting a BE dailink as 'nonatomic' would not accomplish much since BEs
> >> use the 'no_pcm' option.
> > 
> > are no_pcm & nonatomic supposed to be not used together? So if FE is
> > nonatomic would BE trigger be atomic or nonatomic?
> 
> I don't follow the multiple negations, so let me retry:
> 
> For Intel machine drivers, all BE dailinks use
> .no_pcm = 1 (explicit setting)
> .nonatomic = 0 (implicit).

that was my question, how is it implicit?
Should be explicitly set, right?

> 
> All FE dailinks use
> .no_pcm = 0 (implicit)
> .nonatomic = 1 (explicit setting)
> 
> >> So the question is: is there any issue with sending an IPC in a DAI
> >> trigger callback?
> > 
> > Sorry looks like we diverged, orignal question was can we do heavy tasks
> > in trigger, the answer is no, unless one uses nonatomic flag which was
> > added so that people can do that work with DSPs like sending IPCs..
> > Maybe we should add heavy slimbus/soundwire handling to it too...?
> 
> I don't think the answer is as clear as you describe it Vinod.
> 
> The .nonatomic field is at the BE dailink level.
> 
> Unless I am missing something, I don't see anything that lets me set a
> .nonatomic property at the *DAI* level.

I would say that was a miss in original design, it should have been set
at dai level or at least allowed to propagate from dai level setting.

Now we are allowed to set it at dai_link but it is governed by dai
behaviour (DSP based DAI etc...)

> 
> The other problem is to define 'heavy task'. In this case, we are
> sending an IPC indeed, but the response is immediate, typically in the
> next ms tick.
> 
> IOW, if the response time is in the ms order of magnitude, is this 'heavy'?

There are two aspects:
1. Does the code involve a sleepy function? Response may be very fast
typically but a code path having sleeping function would stop from using
atomic context
2. Is it designed to be ms always or can be more? We should looks at
worst case rather than typical values for this.

> 
> >> This is not very different from sending a command on a
> >> bus btw, I see a similar example for SLIMbus devices:
> >>
> >> wcd9335.c:      case SNDRV_PCM_TRIGGER_SUSPEND:
> >> wcd9335.c-      case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> >> wcd9335.c-              slim_stream_unprepare(dai_data->sruntime);
> >> wcd9335.c-              slim_stream_disable(dai_data->sruntime);
> >>
> >> int slim_stream_unprepare(struct slim_stream_runtime *stream)
> >> {
> >> 	int i;
> >>
> >> 	for (i = 0; i < stream->num_ports; i++)
> >> 		slim_disconnect_port(stream, &stream->ports[i]);
> >>
> >> static int slim_disconnect_port(struct slim_stream_runtime *stream,
> >> 				struct slim_port *port)
> >> {
> >> 	struct slim_device *sdev = stream->dev;
> >> 	u8 wbuf[1];
> >> 	struct slim_val_inf msg = {0, 1, NULL, wbuf, NULL};
> >> 	u8 mc = SLIM_MSG_MC_DISCONNECT_PORT;
> >> 	DEFINE_SLIM_LDEST_TXN(txn, mc, 5, stream->dev->laddr, &msg);
> >>
> >> 	wbuf[0] = port->id;
> >> 	port->ch.state = SLIM_CH_STATE_DISCONNECTED;
> >> 	port->state = SLIM_PORT_DISCONNECTED;
> >>
> >> 	return slim_do_transfer(sdev->ctrl, &txn);
> >> }
> >>
> >> Such commands may take time...
> > 
> > Agree, so users should be recommended to use nonatomic triggers.
> 
> The SLIMbus example relies on DAIs as well, and this option does not
> exist, does it?

-- 
~Vinod
