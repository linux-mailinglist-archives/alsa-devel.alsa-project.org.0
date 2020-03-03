Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFB178360
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 20:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187B11674;
	Tue,  3 Mar 2020 20:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187B11674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583265031;
	bh=oLnhmum3c+XaGboufbBlb3zhWlAIygOhw6E9/aBnsPA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buRgnxEefCzmwSe0eLrxnkfyW9QwjCKqr/C9u/hYOlmaw2QynaXvrCrABR3MnfRq+
	 +VLGo/Qe41vb/4s14tyHcEWMj8+cXI4fNlc/GctfmnCYykRTUg0XhyWv6jd8zYg8iN
	 4COZrZkW5hN7KxAmfQ8tE/1TGz/WQoXsJYiFk1BE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E911CF80266;
	Tue,  3 Mar 2020 20:48:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF43F8025F; Tue,  3 Mar 2020 20:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5927F8011C
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 20:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5927F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 11:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="412868168"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 03 Mar 2020 11:48:32 -0800
Date: Tue, 3 Mar 2020 21:48:31 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <8736aq2rp2.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.2003032107560.2957@eliteleevi.tm.intel.com>
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
 <alpine.DEB.2.21.2003021902500.2957@eliteleevi.tm.intel.com>
 <8736aq2rp2.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hey,

On Tue, 3 Mar 2020, Kuninori Morimoto wrote:

> Kai Vehmanen wrote:
>> int snd_soc_component_close(struct snd_soc_component *component,
>> »       »       »           struct snd_pcm_substream *substream)
>> {
>> 	/* 
>> 	 * lookup substream from "component->substream_List", 
>> 	 * only call driver->close() if found
>> 	 */
>> ...
>> 
>> ... this is arguably more code, but makes the state created in 
>> snd_soc_component_open() explicit. Upon error in middle of 
>
> But, 1 point I still not yet understand.
> 
> close() will be called 1) when open failed, or, 2) normal close.
> If my understanding was correct, your code is caring that
> 2) normal close() might be called without open().

it also covers case (1) when open fails. So instead of the currently 
merged error case rollback code in soc_pcm_components_open(), we'd just 
call snd_pcm_components_close(substream) directly in case 
of error. With tracking of opened substreams in soc-component.c, close() 
is safe to call also in error case.

But you are right, I don't really see how (2) could be hit, so we are 
essentially talking about how to avoid the <10 lines of rollback code in 
soc_pcm_components_open(). :)

That considered, I'm fine if you can come up with a cleaner version to 
handle just case (1), without tracking substreams. Maybe worth a try and 
if it doesn't work (e.g. with ID/tag), we can look at substream tracking.

Br, Kai
