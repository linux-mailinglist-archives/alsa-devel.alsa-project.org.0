Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22A3DDCB1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B510116D1;
	Mon,  2 Aug 2021 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B510116D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627919294;
	bh=IQ5KeYqjl0MoLUj7aVMw/KJz7s6f3eRE3kZ6kMcXRF4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjKsb8KysyRQr4knhyjtBwQaq29wPQAm/eoYY6CxPDZiPlwppMSAID+l9Q6goqE6y
	 NyV9l3JBHnGC3QdP/X6fGzGQdEZw8vwBXocdJpEKNrOTKMVkdYhrNyej+oVlk7gElY
	 Ps3bJGJBdljoA3p6XkKYd/eG29vz8ARBf5hky8Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1135CF80268;
	Mon,  2 Aug 2021 17:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2783F8025F; Mon,  2 Aug 2021 17:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32C09F8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C09F8014D
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="274543248"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="274543248"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:46:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="501864399"
Received: from skarumur-mobl.amr.corp.intel.com (HELO [10.212.72.192])
 ([10.212.72.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:46:35 -0700
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
To: "Liao, Bard" <bard.liao@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Takashi Iwai <tiwai@suse.de>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
Date: Mon, 2 Aug 2021 10:46:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


>>>>>> The trigger callback is handled in the stream lock atomically,
>>>>>> and are you sure that you want to operate a possibly heavy task there?
>>>>>
>>>>> It's a good objection that we didn't think of.
>>>>
>>>> Doesn't Intel use non atomic trigger to send IPCs which anyway
>>>> involve code which can sleep..?
>>>
>>> sof_sdw.c doesn't seem setting it?
>>
>> Yes I think init_dai_link() should set it. Maybe Pierre/Bard would know why.
> 
> init_dai_link() is to assign dai link elements only. No IPC is needed.

The 'nonatomic' concept is only used for an FE dailink which expose a
PCM device:

soc-pcm.c:	pcm->nonatomic = rtd->dai_link->nonatomic;

Setting a BE dailink as 'nonatomic' would not accomplish much since BEs
use the 'no_pcm' option.

So the question is: is there any issue with sending an IPC in a DAI
trigger callback? This is not very different from sending a command on a
bus btw, I see a similar example for SLIMbus devices:

wcd9335.c:      case SNDRV_PCM_TRIGGER_SUSPEND:
wcd9335.c-      case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
wcd9335.c-              slim_stream_unprepare(dai_data->sruntime);
wcd9335.c-              slim_stream_disable(dai_data->sruntime);

int slim_stream_unprepare(struct slim_stream_runtime *stream)
{
	int i;

	for (i = 0; i < stream->num_ports; i++)
		slim_disconnect_port(stream, &stream->ports[i]);

static int slim_disconnect_port(struct slim_stream_runtime *stream,
				struct slim_port *port)
{
	struct slim_device *sdev = stream->dev;
	u8 wbuf[1];
	struct slim_val_inf msg = {0, 1, NULL, wbuf, NULL};
	u8 mc = SLIM_MSG_MC_DISCONNECT_PORT;
	DEFINE_SLIM_LDEST_TXN(txn, mc, 5, stream->dev->laddr, &msg);

	wbuf[0] = port->id;
	port->ch.state = SLIM_CH_STATE_DISCONNECTED;
	port->state = SLIM_PORT_DISCONNECTED;

	return slim_do_transfer(sdev->ctrl, &txn);
}

Such commands may take time...
