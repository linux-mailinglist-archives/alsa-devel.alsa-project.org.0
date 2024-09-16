Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9256D979C40
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 09:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3F2E9A;
	Mon, 16 Sep 2024 09:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3F2E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726472986;
	bh=UxJDOLsIkLKE+S+2zQRowyEzhpxzfeo5mHf7JBjYlpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eJDlo7yR8RYAUZ0n84K3iuaI8NlES8yZQjACeiqiP7NVHSxs7g30TcLFr+a+fAbnb
	 s/Sx85L+OJw9dFyKh3uRvY7V7QoyK5e/uO0EsN8oJBhGNzBHCDjaHneqoTrQirv6LL
	 x9XXJ+hXj/F/7fy+wn/kNnDJBaDgQVscVozhKD3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1572F805A8; Mon, 16 Sep 2024 09:49:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FF06F80269;
	Mon, 16 Sep 2024 09:49:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A112F80107; Mon, 16 Sep 2024 09:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92866F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 09:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92866F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rLiwVIWb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DE56A41789;
	Mon, 16 Sep 2024 07:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDBCC4CEC4;
	Mon, 16 Sep 2024 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726472946;
	bh=UxJDOLsIkLKE+S+2zQRowyEzhpxzfeo5mHf7JBjYlpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLiwVIWboheUTjYnjo+YcyYUOd2Ccf5RUJlcmBAC7+IBv+vEEy7RCSMKl8yPLEVu0
	 XXeIcoDSi2SK0KM8ZkPq5a7coN2F4KZx6qsjGn7mdEDJuuLR6tLXhmSOu1ofnQX5hW
	 8E7B5dkg5MOJOZCk00cN0F5BmptWOFolLr1mSmGfLAq9jjZvYx127X56+e68K4kcs4
	 LbIYxTJ88fGXJ7pgmX0ME2tthjyNbyxHD8ZriOTOOBg8sSlfYB9xQFianwN18sbjnF
	 AzAir8VTrZGARYMOKGxv57Ju2OQbxf5igqdUZSxLno6Ud/yygZVEDn0RL9NxXKFzLe
	 GCqG8dag7BBOQ==
Date: Mon, 16 Sep 2024 09:49:03 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <Zufi79wdsMokxVB9@vaman>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
 <2024091130-detail-remix-34f7@gregkh>
 <ZuQnPnRsXaUEBv6X@vaman>
 <ZuXgzRSPx7hN6ASO@vaman>
 <2024091555-untitled-bunkbed-8151@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024091555-untitled-bunkbed-8151@gregkh>
Message-ID-Hash: 3SBQ5N6X7464NUPTTNTOPDWCV2Q6UIY3
X-Message-ID-Hash: 3SBQ5N6X7464NUPTTNTOPDWCV2Q6UIY3
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SBQ5N6X7464NUPTTNTOPDWCV2Q6UIY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-09-24, 15:23, Greg KH wrote:
> On Sun, Sep 15, 2024 at 12:45:25AM +0530, Vinod Koul wrote:
> > > > 
> > > > Is this in Linus's tree yet?  That's what we are waiting for.
> > > 
> > > Yes I was waiting for that as well, the pull request has been sent to
> > > Linus, this should be in his tree, hopefully tomorow..
> > 
> > It is in Linus's tree now. Greg would you like to drop commit
> > 6fa78e9c41471fe43052cd6feba6eae1b0277ae3 or carry it and the
> > revert...?
> 
> I can not "drop" a commit that is already in a realease for obvious
> reasons :(
> 
> > What is the usual process for you to handle reverts?
> 
> We just take them like normal.  What is the git id of the revert in
> Linus's tree?

Sure, makes sense. It has been auto-picked so this is fine.

fwiw: 
ab8d66d132bc: soundwire: stream: fix programming slave ports for non-continous port maps

Thanks
-- 
~Vinod
