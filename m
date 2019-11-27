Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99EF10AF6C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 13:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F71F1718;
	Wed, 27 Nov 2019 13:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F71F1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574856977;
	bh=N7bJVISp7s4r9R7jV2nTO7VfeX0hVmApWMeWp0CHbeA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+jgjnumozvpnCFDH5xkKKlgD+zXjFEHdW5m3TxSNvAHZxp7meQoggG4GMdrwHGwQ
	 gcK/iMVZ60v3Dna38SQY8/f8+IBCZqhjo7p8PMd2mlYM4yPsZaw7K8Y47oJYuZHY0R
	 t3Nrxhs/O5PdBTFOZ5/ss/P2jqKrlBpMcJxrrjWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9704F800CE;
	Wed, 27 Nov 2019 13:14:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB207F8014D; Wed, 27 Nov 2019 13:14:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E258F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 13:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E258F800CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 04:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="383485947"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga005.jf.intel.com with ESMTP; 27 Nov 2019 04:14:25 -0800
Date: Wed, 27 Nov 2019 14:14:24 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5h1rtty1zs.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1911271411390.16459@zeliteleevi>
References: <20191127112536.28791-1-kai.vehmanen@linux.intel.com>
 <s5h1rtty1zs.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Nikhil Mahale <nmahale@nvidia.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: hdmi - fix regression in
 connect list handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, 27 Nov 2019, Takashi Iwai wrote:

> On Wed, 27 Nov 2019 12:25:36 +0100, Kai Vehmanen wrote:
> > @@ -1312,10 +1316,19 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
[...]
> > +	if (spec->intel_hsw_fixup) {
> > +		intel_haswell_fixup_connect_list(codec, pin_nid);
> > +		conns = snd_hda_get_connections(codec, pin_nid,
> > +						per_pin->mux_nids,
> > +						HDA_MAX_CONNECTIONS);
> > +	} else {
> > +		conns = snd_hda_get_raw_connections(codec, pin_nid,
> > +						    per_pin->mux_nids,
> > +						    HDA_MAX_CONNECTIONS);
> > +	}
> 
> Actually intel_haswell_fixup_connect_list() doesn't influence on the
> hardware setup but just updates the software cache.  So, basically we
> can copy the values directly from spec->cvt_nids here without the
> override hack as we have now.
> 
> That is, something like
> 
> 	if (spec->intel_hsw_fixup) {
> 		conns = spec->cvt_nids;
> 		memcpy(per_pin->mux_nids, spec->num_cvts,
> 		       sizeof(hda_nid_t) * conns);
> 	} else {
> 	  	snd_hda_set_dev_select(codec, pin_nid, dev_id);
> 		conns = snd_hda_get_raw_connections(codec, pin_nid,
> 						    per_pin->mux_nids,
> 						    HDA_MAX_CONNECTIONS);
> 	}
> 
> Could you check whether this works?	

hmm, you are right, this should work. spec->cvt_nids and spec->num_cvts 
were reversed in the proto code :), but otherwise looks ok based on
a few tests. I'll send a v2 patch shortly. This simplifies the code as 
well.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
