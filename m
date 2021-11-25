Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0A45D4CA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 07:27:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2D9183E;
	Thu, 25 Nov 2021 07:26:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2D9183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637821666;
	bh=QkXzjKhO/PXPDUH944NjNFDegqrII+xpL5qUP8lckTU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GPlf4s5CGdVKaQXrz3SZTI+vyNd4Jze8MKa+fIy2XlW7IJQHy4zSKuOPTUnhjP7lP
	 5NgLjwYm4FIGyAehUpZ1eGXY5bwR7HCogSYtKnSWjXdORax4a0m0zVI6tEEkSkeu9d
	 /TSgrQVckNkHgMx6GDzUpvQZkT8Qm4RXjqRfaSj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E87F804AC;
	Thu, 25 Nov 2021 07:26:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1358F804AC; Thu, 25 Nov 2021 07:26:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D196DF80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 07:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D196DF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qg7NUJu8"
Received: by mail-pf1-x434.google.com with SMTP id u80so4935604pfc.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 22:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3KRVplZvCkFOfOVdJLJgvxv7eUeJSjbE0R2ZMjgK8Fg=;
 b=qg7NUJu8MPy9axIndKBSZG/A9a117Qks+SvprKKIx/6u5Dvo/wfW0dxXbnZkcYB28o
 5B17LrKsuz/lmmXBBKRG1orqyFioG0onD0PqUjHrRQL2hHgz3PwlzwxqosZ3wLqzkj95
 UFuYnqXqUObbeHSfCMVySNCroM4b3vD5tROZ069p2SjZyi8C7muv2zb9cvBIyErJBLIf
 7yfIgTo4lBszagYEVQnQN7ArIulNHpavFKtGJAway+kSQ+jAAGPVPNJIYzhBBO3ug9dh
 jt0oPZLzO/XbNsOClyXigay8drAl7EgarlADNCKFMrujlcfFlrXL2QaRS/Wl9NC1qKdr
 qCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3KRVplZvCkFOfOVdJLJgvxv7eUeJSjbE0R2ZMjgK8Fg=;
 b=epK9qLBLci7mY/EZtqgaChOqX2tIpkpggObnO8ttmeGDaVzsamxzMPRvA5rYAVzXzL
 Zp42PFbDjPeQ9ioUeC2i4i9AbjwKYEOGwgvDpBLCrpb/sezYo+FnJ0CAvpIoGMAmDlTM
 /mkr+YeI0YQELvIDGpxjW5Pr40AUZkehOusz8b8mGHuXMrm8bvYcVcU/8OQnf/IArjKG
 A0KOHqzn4mLk3zLZ4XPOMTnbdqFhAXFPGhBt6hpFsSD5nIyoQFgkdE1vG+sYBw8RGE9S
 4379oPxBlzHZHmaOSk1nUnivk7qXhG2cdXOLqCaytIOZeDWr+4Y8xMpkFHcgyR1jv6Ep
 1SHw==
X-Gm-Message-State: AOAM5330R60BiIC1YF1L5QiQa0dAObrKuJ7uQ0UmcV4sSqFqzjxcuWRE
 QrGrgvJAdYTq1aeo6ALOSvwAwg==
X-Google-Smtp-Source: ABdhPJxroYaq42S+P8YT4URm9RJBoYTh6XWDOXusK9S3jNhc0+OPin92kb/rtWyJBd7dnKPLjtIrIg==
X-Received: by 2002:a63:155d:: with SMTP id 29mr14353211pgv.302.1637821602409; 
 Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id o23sm1706196pfp.209.2021.11.24.22.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Date: Thu, 25 Nov 2021 14:26:37 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YZ8snZR/KHLDhIlf@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
 <YZ4TGvtwO5ySCEkT@google.com>
 <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Thu, Nov 25, 2021 at 09:47:22AM +0800, allen-kh.cheng wrote:
> On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> > On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
> > > +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> > > +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > > +		if (!chan_name)
> > > +			return -ENOMEM;
> > > +
> > > +		dsp_chan = &dsp_ipc->chans[i];
> > > +		cl = &dsp_chan->cl;
> > > +		cl->dev = dev->parent;
> > > +		cl->tx_block = false;
> > > +		cl->knows_txdone = false;
> > > +		cl->tx_prepare = NULL;
> > > +		cl->rx_callback = adsp_ipc_recv;
> > > +
> > > +		dsp_chan->ipc = dsp_ipc;
> > > +		dsp_chan->idx = i;
> > > +		dsp_chan->ch = mbox_request_channel_byname(cl,
> > > chan_name);
> > > +		if (IS_ERR(dsp_chan->ch)) {
> > > +			ret = PTR_ERR(dsp_chan->ch);
> > > +			if (ret != -EPROBE_DEFER)
> > > +				dev_err(dev, "Failed to request mbox
> > > chan %d ret %d\n",
> > > +					i, ret);
> > 
> > If ret == -EPROBE_DEFER, wouldn't it need to return
> > -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.
> 
> If ret != -EPROBE_DEFER, it will show a error message then goto out.
> 
> If ret == -EPROBE_DEFER, probe funcation also will goto out. 
> 
> 
> Both of them will return ret. will not go to next round.

I see.  I misunderstood.
