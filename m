Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291917628B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 19:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C291684;
	Mon,  2 Mar 2020 19:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C291684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583173467;
	bh=buDQFHde7bYfzHon3bp66n33y3Bc3scevoyJ87/oUzE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RN4UWfRE0TNPr+solJ8MFx3D+2j2qzjkRX/YZnS+zNtGrbnpTMid8bmAn3v/mxWTN
	 jXO3gzz/X8XNd86vwct4kOYWDu/xvU7aqSJ/MSy7Bba5DbJonfBrbBsKEh34wxtvtZ
	 6hevcTzL60yXjL0wlNBLDGeHG7plQXmJacKPob8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6F4F80131;
	Mon,  2 Mar 2020 19:22:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BAB4F801ED; Mon,  2 Mar 2020 19:22:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163D3F80131
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 19:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163D3F80131
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 10:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="412394596"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 10:22:33 -0800
Date: Mon, 2 Mar 2020 20:22:32 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <87d09vha51.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.2003021902500.2957@eliteleevi.tm.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002201103060.2957@eliteleevi.tm.intel.com>
 <87mu9cspyf.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002211251280.2957@eliteleevi.tm.intel.com>
 <87mu978pob.wl-kuninori.morimoto.gx@renesas.com>
 <87ftey88wk.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002271110010.2957@eliteleevi.tm.intel.com>
 <874kvb7d38.wl-kuninori.morimoto.gx@renesas.com>
 <871rqf6xas.wl-kuninori.morimoto.gx@renesas.com>
 <87zhd35eko.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002281404580.2957@eliteleevi.tm.intel.com>
 <87d09vha51.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.2003021928280.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, digetx@gmail.com
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

Hi,

On Mon, 2 Mar 2020, Kuninori Morimoto wrote:

> I guess you are thinking more big scale tracking/solution (?).
> Indeed it is needed, but my indicated one is not for it.
> It is just for "we want to use soc_pcm_close() as soc_pcm_open() error handling".

yes, I'm thinking it would be better to do proper tracking and not do an 
intermediate solution with IDs.

> > > 	int soc_pcm_open(...)
> > > 	{
> > > 		static u8 id;
> > > 
> > > 		/* update ID */
> > > 		id++;
> > > 		if (id == 0)
> > > 			id++;
> 
> Maybe the naming of "ID" makes you confused ?
> It is just "mark" for this "soc_pcm_open()".
> If error happen during open, "error handling soc_pcm_close()" cares only this mark.
> It is just for avoiding mismatch close.

Yes, the main issues I see:
  - the name (maybe "open_tag" would be better than "open_id"),
  - declaration of the id with "static u8 id" -- if multiple unrelated 
    streams are opened concurrently, the id management needs to be handled
    in a thread safe way,
  - the "component->open_id" field only refers to the last substream 
    open -- i.e. field is only relevant in contact of error rollbacks 

The "new id" really just refers to the substream being opened, so 
you could create it from the substream pointer as well. For error 
rollback, you want to close all components of the substream being
opened. But this is still a bit unelegant as you'd end up storing
the last substream opened to component struct (3rd bullet above).

I was thinking more in the lines of:

/* add list of opened substreams to snd_soc_component */
struct snd_soc_component {
...
	struct list_head substream_list;

int snd_soc_component_open(struct snd_soc_component *component,
»       »       »          struct snd_pcm_substream *substream)
{
	int res = 0;
	if (component->driver->open)
		res = component->driver->open(component, substream);

        /* on success, add proxy of substream to component->substream_list  */
...

int snd_soc_component_close(struct snd_soc_component *component,
»       »       »           struct snd_pcm_substream *substream)
{
	/* 
	 * lookup substream from "component->substream_List", 
	 * only call driver->close() if found
	 */
...


... this is arguably more code, but makes the state created in 
snd_soc_component_open() explicit. Upon error in middle of 
components_open(), one can just call soc_pcm_components_close() which will 
close all components for that substream (that had been succesfully 
opened).

Br, Kai
