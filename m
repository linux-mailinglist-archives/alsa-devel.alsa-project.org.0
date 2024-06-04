Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE38FAE91
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 11:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97087EAB;
	Tue,  4 Jun 2024 11:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97087EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717492679;
	bh=FCrFtvGT7nfYDArMK5ytnHOL+AVDEQiP/9i3bDpr0hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u4RkieRLPx8LpcbNGn7URcYNcKkJQn1PaIDYPCZaajlBUsXUTzrjZ0BmrIyf5Vu2p
	 WoBIhkfTVHWu3CGS/Cp52eX4uGiQClDSizfik8jmTEyFgDk0lPdCUlNjdiW21Bah/5
	 a9dT7kTjY0Dz5etT6t0IrVrqybmjU0h1LbeT2Ip4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3524FF8059F; Tue,  4 Jun 2024 11:17:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05491F8051F;
	Tue,  4 Jun 2024 11:17:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 503FBF802DB; Tue,  4 Jun 2024 11:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E19DFF80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 11:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19DFF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L3YGOQUL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F1F660F23;
	Tue,  4 Jun 2024 09:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52111C2BBFC;
	Tue,  4 Jun 2024 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717492642;
	bh=FCrFtvGT7nfYDArMK5ytnHOL+AVDEQiP/9i3bDpr0hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3YGOQULFYzsdRUHxPDwrS0zuMsIKMDkRsByuPi3yXGkmGiKwxqZme5r7pqSeB8xb
	 D8vsUY1rbs2KS6EaMvEOYpFTFpkX1u1H4LhNh4MP/kFmsO5Bt3v1doMjiCz9OWCDTn
	 ZRuywir2hsfdLVWK7/vQtTv+6wd8rFJDcBNxB7hYb6+JOnBSKNf0lwk+r90Dg12qSg
	 m+gdgqCMA+opVFr+bGwSXHursv8ZjOB2JH1+fblDh9h1LMaNujBgYDgRygEFNdv0ki
	 wjBeqI1ZIpl549F832GSb1f+hp9Vp51ZHNVcFirChjnBTWOC6ZBudBb20H73DQBfiq
	 6IjoFe9Qd/dHA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sEQIC-000000001XF-28Nh;
	Tue, 04 Jun 2024 11:17:21 +0200
Date: Tue, 4 Jun 2024 11:17:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
Message-ID: <Zl7boEkMpQaELARP@hovoldconsulting.com>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-4-johan+linaro@kernel.org>
 <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
Message-ID-Hash: 3LGRTX7BYWI3DYFHTBRFKYCI46IRFDY5
X-Message-ID-Hash: 3LGRTX7BYWI3DYFHTBRFKYCI46IRFDY5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LGRTX7BYWI3DYFHTBRFKYCI46IRFDY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 04, 2024 at 10:33:02AM +0200, Pierre-Louis Bossart wrote:
> On 6/4/24 02:52, Johan Hovold wrote:
> > Clean up the probe warning messages by using a common succinct format
> > (e.g. without __func__ and with a space after ':').

> > @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
> >  	/* init the dynamic sysfs attributes we need */
> >  	ret = sdw_slave_sysfs_dpn_init(slave);
> >  	if (ret < 0)
> > -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
> > +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
> >  
> >  	/*
> >  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
> > @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
> >  	if (drv->ops && drv->ops->update_status) {
> >  		ret = drv->ops->update_status(slave, slave->status);
> >  		if (ret < 0)
> > -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
> > +			dev_warn(dev, "failed to update status: %d\n", ret);
> 
> the __func__ does help IMHO, 'failed to update status' is way too general...

Error messages printed with dev_warn will include the device and driver
names so this message will be quite specific still.

> Replacing 'with status' by ":" is fine, but do we really care about 10
> chars in a log?

It's not primarily about the numbers of characters but about consistency.

Johan
