Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404AD8FAEB3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 11:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9138EEBE;
	Tue,  4 Jun 2024 11:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9138EEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717493138;
	bh=WFpT7tceC4LqEAg6Pkh4MT4mrzlDn7hYSXs9KJvIZoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=poLOfhKvZdMKAvouxmL4fAKcVznVLaV2u6hdDIBcP0aDihsP1ev3dn4DnT4awqfE9
	 sZKKLNXuN+muqVSEbWurfs5S9paPdJ6EO6i3H3qkIRhOoU5F9Z1/fnlsqdEmAS2SAF
	 uGzeuTh8Gu5IxuZMv7pYxPWwxeQUTCPFctdedofU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EB9F804B2; Tue,  4 Jun 2024 11:25:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4574DF804B2;
	Tue,  4 Jun 2024 11:25:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43DAAF802DB; Tue,  4 Jun 2024 11:25:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 05904F800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 11:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05904F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u0buvv/Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7F7F6121A;
	Tue,  4 Jun 2024 09:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1041C4AF07;
	Tue,  4 Jun 2024 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717493097;
	bh=WFpT7tceC4LqEAg6Pkh4MT4mrzlDn7hYSXs9KJvIZoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0buvv/ZD4+IABHIJF1b4BtB7fxBDaInn/gV6Z1zzhSJHxTaRtaDWrri/pSqWLx4M
	 J84Ri/AnMKxLOheT9Iic1h+hjKttdoRzPH5S6u/tjlqkmue2+zxrfq3DBS1KfXk2zz
	 cBChwZdQZ1BURbmoF1is4SYUv5Gq6Z06ydcqxXGCdzS0RTZrgeqTTMyE7Jls2ZmUVa
	 uZVm/mudAF4Mu/uk16uW6lgIQ3XULdrCiBkeX8eA+5KTTnlcqA8Qwzt+uNMawLLGz2
	 8oRSQm6o4/toaHAH3/NlqPT2X/tXme2mmbZ8q4HlszKu8JG4nWAKqNjjNOLrxoXv74
	 W9s90+G1cPbFA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sEQPX-000000001er-2o5n;
	Tue, 04 Jun 2024 11:24:56 +0200
Date: Tue, 4 Jun 2024 11:24:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] soundwire: bus: drop redundant probe debug message
Message-ID: <Zl7dZ-4ysKC-jSA6@hovoldconsulting.com>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-5-johan+linaro@kernel.org>
 <e1c63097-b628-4c97-add6-40fa479a7806@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c63097-b628-4c97-add6-40fa479a7806@linux.intel.com>
Message-ID-Hash: TJ7QZEHUM2CXUERKUMS6R2CUUQBL476W
X-Message-ID-Hash: TJ7QZEHUM2CXUERKUMS6R2CUUQBL476W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJ7QZEHUM2CXUERKUMS6R2CUUQBL476W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 04, 2024 at 10:37:17AM +0200, Pierre-Louis Bossart wrote:
> On 6/4/24 02:52, Johan Hovold wrote:
> > Drop the redundant probe debug message which is already provided by
> > driver core. Whether probe succeeded can also be determined through
> > sysfs.

> > @@ -152,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
> >  
> >  	mutex_unlock(&slave->sdw_dev_lock);
> >  
> > -	dev_dbg(dev, "probe complete\n");
> > -
> >  	return 0;
> >  }
> 
> I don't see the point of removing this, we've used it for the last 5
> years to figure out when the probe complete vs. when the device becomes
> attached. It's a simple log that helped us immensely with race
> conditions, etc.

Fair enough. Soundwire probing is indeed a bit of a mess.

Johan
