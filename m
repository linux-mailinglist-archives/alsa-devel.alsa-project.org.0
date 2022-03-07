Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7134D07FA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 20:52:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84908176C;
	Mon,  7 Mar 2022 20:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84908176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646682749;
	bh=PD1J1k4z7xLO7obGEx+XhsFzay8GTpx5VTQBmIzJzcU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwmBsNCaoIsUcIEAwFdjowTnHeWP3R6wG6YuD9YJeCBtxyk0vaAoccPZ2w5rWeYLm
	 Is3yZ9EeYZBoh9kUtQgs1oJSjHXcpsDPuKQ7NKXx0PX9dTyVbHBrZ+oLsJSK3zKxTA
	 Pqmsgs8ZM1bcK4e+4xVmQBnPVcMBdjbH3leL5cNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A85F800E9;
	Mon,  7 Mar 2022 20:51:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4495EF8013F; Mon,  7 Mar 2022 20:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 210B1F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 20:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210B1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m6OAK3rY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646682678; x=1678218678;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PD1J1k4z7xLO7obGEx+XhsFzay8GTpx5VTQBmIzJzcU=;
 b=m6OAK3rYzNbAx2fQoZVyO1Kj+FZv2zLiJncc9y892EJ++F+naJbf3atr
 xOlxEzOb97dndnk5RkHJ1TBG+hm+5HHniuY1nrAz5mv1bE2sp3nYI5Q//
 xfDvaGcg6MFVB8Bwgxc3YzwQu9RhI9XQBrWzinQJIeSctFjlnjPcOS97s
 0XfRwwosJItJdJXVNU9XGjSyEb9b/SCASlxDiluHByX7As4keU8duwv4V
 QAYpUI9hwfV3QmCjMFOkMuiDfRPpB0rJEJQu2QN444zsxeKIdqHDckfb9
 ZIIEN3jMlfuUGa0xL3eh2Rcxwc370rrdcyEOSdsKyknnV6m8rnW37zGxW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254680960"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="254680960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 11:51:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495178386"
Received: from echun1-mobl.amr.corp.intel.com ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 11:51:13 -0800
Message-ID: <66177ac18ba9099208262b9af67a0400acd2de4c.camel@linux.intel.com>
Subject: Re: [PATCH 11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
Date: Mon, 07 Mar 2022 11:51:12 -0800
In-Reply-To: <cb8673b3-2306-9582-1434-7b173a5d6c30@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
 <20220307181111.49392-12-ranjani.sridharan@linux.intel.com>
 <cb8673b3-2306-9582-1434-7b173a5d6c30@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

On Mon, 2022-03-07 at 19:55 +0100, Amadeusz Sławiński wrote:
...
> 
> > +	u8 uuid[SOF_UUID_SIZE];
> 
> Can this be uuid_t perhaps?
Yes, makes sense.

...
> >   	/* only non-zero UUID is valid */
> > -	if (memcmp(&swidget->comp_ext, nil_uuid, SOF_UUID_SIZE))
> > -		total_size += sizeof(swidget->comp_ext);
> > +	if (memcmp(swidget->uuid, nil_uuid, SOF_UUID_SIZE))
> > +		total_size += ext_size;
> 
> And if you change type above then uuid_is_null(swidget->uuid) here?
Sure.
> 
> >   
> >   	comp = kzalloc(total_size, GFP_KERNEL);
> >   	if (!comp)
> > @@ -1444,8 +1445,8 @@ static struct sof_ipc_comp
> > *sof_comp_alloc(struct snd_sof_widget *swidget,
> >   	/* handle the extended data if needed */
> >   	if (total_size > *ipc_size) {
> >   		/* append extended data to the end of the component */
> > -		memcpy((u8 *)comp + *ipc_size, &swidget->comp_ext,
> > sizeof(swidget->comp_ext));
> > -		comp->ext_data_length = sizeof(swidget->comp_ext);
> > +		memcpy((u8 *)comp + *ipc_size, swidget->uuid,
> > ext_size);
> and uuid_copy() here?
But I'd like to retain the memcpy() here as this is IPC payload and the
ipc struct does not contain the uuid field.
Thanks,
Ranjani

