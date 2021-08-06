Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986C3E2B83
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 15:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E213416C5;
	Fri,  6 Aug 2021 15:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E213416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628257129;
	bh=+M/KNvCrPjIixoNusBjYzcT2MzQ/5x3p3yP3fk3XRuo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmD4XKnJgCaJ9lj6jSq5Lwx97LAaS7pgp94GdZyyA3d60DKyQ6rRYFRlU19PZAoJX
	 rZzrDy9YL3UlvKhMUum8+O7WXHNUCAXjZYSVoSR5xgn+UwO0FiFrDrbOZHXvxHEWml
	 phEuo7JAJ6fgGjhjEqVPPCQP/46zoDBwBV/wo2uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B73F80268;
	Fri,  6 Aug 2021 15:37:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19907F8025F; Fri,  6 Aug 2021 15:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 814A5F8010A
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 15:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 814A5F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ubZYUm1O"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C13AA60E09;
 Fri,  6 Aug 2021 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628257033;
 bh=+M/KNvCrPjIixoNusBjYzcT2MzQ/5x3p3yP3fk3XRuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubZYUm1OwKbZFJB7VdLYH76TC9U6A06Uo5+csyowasuBZwAeq5hFxWcgx9jL79HuQ
 atVAIityhCDmk9kI42krsKU4O9/RN2pvnMOKmHn/1fagyS60n1MnOxVcTG9kmbhoSC
 hw95k/YnEQW0CSEcU7qojUuY/0UJtVENYzYyJBCPcqoSigeK3RUjJGxng2P05jLnkc
 tpXeApfKaASvIGTvlKqV6aSmC/WPbgkZacm8j4cEadOOvifsExB3+u7JwLuxzk3RU4
 Ih22RMrcWnR6rc5461GPYUB26aIGO6DiaLyroRmKZjNlIqaWuxZpmk41YLOMzMBCDz
 JjKpnJxfa90sQ==
Date: Fri, 6 Aug 2021 19:07:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Message-ID: <YQ07BVDyPD1Vb4R8@matsya>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
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

On 02-08-21, 10:46, Pierre-Louis Bossart wrote:
> 
> >>>>>> The trigger callback is handled in the stream lock atomically,
> >>>>>> and are you sure that you want to operate a possibly heavy task there?
> >>>>>
> >>>>> It's a good objection that we didn't think of.
> >>>>
> >>>> Doesn't Intel use non atomic trigger to send IPCs which anyway
> >>>> involve code which can sleep..?
> >>>
> >>> sof_sdw.c doesn't seem setting it?
> >>
> >> Yes I think init_dai_link() should set it. Maybe Pierre/Bard would know why.
> > 
> > init_dai_link() is to assign dai link elements only. No IPC is needed.
> 
> The 'nonatomic' concept is only used for an FE dailink which expose a
> PCM device:
> 
> soc-pcm.c:	pcm->nonatomic = rtd->dai_link->nonatomic;
> 
> Setting a BE dailink as 'nonatomic' would not accomplish much since BEs
> use the 'no_pcm' option.

are no_pcm & nonatomic supposed to be not used together? So if FE is
nonatomic would BE trigger be atomic or nonatomic?

> So the question is: is there any issue with sending an IPC in a DAI
> trigger callback?

Sorry looks like we diverged, orignal question was can we do heavy tasks
in trigger, the answer is no, unless one uses nonatomic flag which was
added so that people can do that work with DSPs like sending IPCs..
Maybe we should add heavy slimbus/soundwire handling to it too...?

> This is not very different from sending a command on a
> bus btw, I see a similar example for SLIMbus devices:
> 
> wcd9335.c:      case SNDRV_PCM_TRIGGER_SUSPEND:
> wcd9335.c-      case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> wcd9335.c-              slim_stream_unprepare(dai_data->sruntime);
> wcd9335.c-              slim_stream_disable(dai_data->sruntime);
> 
> int slim_stream_unprepare(struct slim_stream_runtime *stream)
> {
> 	int i;
> 
> 	for (i = 0; i < stream->num_ports; i++)
> 		slim_disconnect_port(stream, &stream->ports[i]);
> 
> static int slim_disconnect_port(struct slim_stream_runtime *stream,
> 				struct slim_port *port)
> {
> 	struct slim_device *sdev = stream->dev;
> 	u8 wbuf[1];
> 	struct slim_val_inf msg = {0, 1, NULL, wbuf, NULL};
> 	u8 mc = SLIM_MSG_MC_DISCONNECT_PORT;
> 	DEFINE_SLIM_LDEST_TXN(txn, mc, 5, stream->dev->laddr, &msg);
> 
> 	wbuf[0] = port->id;
> 	port->ch.state = SLIM_CH_STATE_DISCONNECTED;
> 	port->state = SLIM_PORT_DISCONNECTED;
> 
> 	return slim_do_transfer(sdev->ctrl, &txn);
> }
> 
> Such commands may take time...

Agree, so users should be recommended to use nonatomic triggers.

-- 
~Vinod
