Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B048FCC24
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 14:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94ED86E;
	Wed,  5 Jun 2024 14:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94ED86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717589640;
	bh=cwTJba3C8Qwz1ZLeDncLpCLV7/mbQe8fxcLPmmDJQto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0oPmMSXhMvZQgUWomAvYqMmYl/3NAjqAnqQ5k9h8yMkdhgCWF6haoX6uRlH0vA0E
	 tj2ahrD0JVbcLqzWRGZhnbE8Ms1aJigkqN3zK0TOnSiQw12RLuf33eGApxaeBXtHrq
	 eMmK8BFM4xtTSvU7jBjG5th1dKTxQWw+CMJKZ3ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0BDF805AB; Wed,  5 Jun 2024 14:13:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4388FF805A0;
	Wed,  5 Jun 2024 14:13:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C965F802DB; Wed,  5 Jun 2024 14:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E3DEF8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 14:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E3DEF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AWKkrD6k
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B446161835;
	Wed,  5 Jun 2024 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6728EC32781;
	Wed,  5 Jun 2024 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589508;
	bh=cwTJba3C8Qwz1ZLeDncLpCLV7/mbQe8fxcLPmmDJQto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWKkrD6kulejFb9Jcnx/Dpfk8fUAEF1BuapcvVUBFriLJ64IFO7T9o///SetkdC5j
	 hRKoiH9NdxNg3aWmre+8+wZmMSGTuK5HXW1KCxtIptk3CEUWU17SjrLLVGUUrCy+Kx
	 UZfx1egKTnttA1GOKyR/uhJIde6qZdSM/Hp5o3joj2v2s+Ldp2VCMSo4LZmb6cNCWI
	 zf9hyiyq5gbMOJqPVWCA7Pg1gvRniuj6o4xgez74OtfbEXTIfDvJQCM/Lan5dNpZ0y
	 MGxKcrKXmXXES50RTevVcy9X0okES53ldURt4qnI+BM8ZUpxlVGQSvyBll9rZr74Ea
	 XvpEKlfHy9zCg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sEpUc-0000000079R-06fM;
	Wed, 05 Jun 2024 14:11:50 +0200
Date: Wed, 5 Jun 2024 14:11:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
Message-ID: <ZmBWBrJDRjPn6TpA@hovoldconsulting.com>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-4-johan+linaro@kernel.org>
 <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
 <Zl7boEkMpQaELARP@hovoldconsulting.com>
 <970501b1-09ae-4f2c-a078-2b4f23fe460e@linux.intel.com>
 <Zl8iUmOfrjw3gWVX@hovoldconsulting.com>
 <0d15954f-0158-4a56-afef-f0d043135146@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d15954f-0158-4a56-afef-f0d043135146@linux.intel.com>
Message-ID-Hash: HJTUW645PJI2Q4MZPKAGHJTD6TYPQPO3
X-Message-ID-Hash: HJTUW645PJI2Q4MZPKAGHJTD6TYPQPO3
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJTUW645PJI2Q4MZPKAGHJTD6TYPQPO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 04, 2024 at 05:07:39PM +0200, Pierre-Louis Bossart wrote:
> \
> >>>>> @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
> >>>>>  	/* init the dynamic sysfs attributes we need */
> >>>>>  	ret = sdw_slave_sysfs_dpn_init(slave);
> >>>>>  	if (ret < 0)
> >>>>> -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
> >>>>> +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
> >>>>>  
> >>>>>  	/*
> >>>>>  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
> >>>>> @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
> >>>>>  	if (drv->ops && drv->ops->update_status) {
> >>>>>  		ret = drv->ops->update_status(slave, slave->status);
> >>>>>  		if (ret < 0)
> >>>>> -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
> >>>>> +			dev_warn(dev, "failed to update status: %d\n", ret);
> >>>>
> >>>> the __func__ does help IMHO, 'failed to update status' is way too general...
> >>>
> >>> Error messages printed with dev_warn will include the device and driver
> >>> names so this message will be quite specific still.
> >>
> >> The goal isn't to be 'quite specific' but rather 'completely
> >> straightforward'. Everyone can lookup a function name in a xref tool and
> >>  quickly find out what happened. Doing 'git grep' on message logs isn't
> >> great really, and over time logs tend to be copy-pasted. Just look at
> >> the number of patches where we had to revisit the dev_err logs to make
> >> then really unique/useful.
> > 
> > Error message should be self-contained and give user's some idea of what
> > went wrong and not leak implementation details like function names (and
> > be greppable, which "%s:" is not).
> 
> "Failed to update status" doesn't sound terribly self-contained to me.
> 
> It's actually a great example of making the logs less clear with good
> intentions. How many people know that the SoundWire bus exposes an
> 'update_status' callback, and that callback can be invoked from two
> completely different places (probe or on device attachment)?
> 
> /* Ensure driver knows that peripheral unattached */
> ret = sdw_update_slave_status(slave, status[i]);
> if (ret < 0)
> 	dev_warn(&slave->dev, "Update Slave status failed:%d\n", ret);
> 
> You absolutely want to know which of these two cases failed, but with
> your changes they now look rather identical except for the order of
> words. one would be 'failed to update status' and the other 'update
> status failed'.
> 
> What is much better is to know WHEN this failure happens, then folks
> looking at logs to fix a problem don't need to worry about precise
> wording or word order.
> 
> It's a constant battle to get meaningful messages that are useful for
> validation/integration folks, and my take is that it's a
> windmill-fighting endeavor. The function name is actually more useful,
> it's not an implementation detail, it's what you're looking for when
> reverse-engineering problematic sequences from a series of CI logs.

Just add "at probe" to differentiate the two cases if you really think
this is an issue:

	dev_warn(dev, "failed to update status at probe: %d\n", ret);

Johan
