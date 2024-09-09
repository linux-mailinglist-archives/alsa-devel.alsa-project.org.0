Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2B971F07
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE37836;
	Mon,  9 Sep 2024 18:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE37836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725899048;
	bh=WRwiIPHmTeJtjKiM0uEFDyOO1OuvjK+ZW7u4+BlRtL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eVhv40WIXX9Ng4gaRdcGwiErm3W0x2mA0oNiEggjnX3OUxIespYpRZbBHOIx1hxni
	 UCAFbxmw2fMHlZ4uFA2oMUzkpGlPSGQtsYyW0MsCCV4fFQOARYR0LRw6Jo0S+SpUe8
	 hX+MV7ZsOzXQO5YNVdFAokqNzLNgQ6ovNsJ7HI70=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F24BF805A9; Mon,  9 Sep 2024 18:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D685F8010B;
	Mon,  9 Sep 2024 18:23:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B4DDF801F5; Mon,  9 Sep 2024 18:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 513DCF8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513DCF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=BGd443is
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2D78A4168E;
	Mon,  9 Sep 2024 16:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C65C4CEC7;
	Mon,  9 Sep 2024 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725899012;
	bh=WRwiIPHmTeJtjKiM0uEFDyOO1OuvjK+ZW7u4+BlRtL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGd443is2ZWEkDiDKn/Cu0D8OJTtiCl8vRfF8REtAROexcxqmZZ/bwuz3AcVcnwwL
	 xU2YvsX7V/xRi9GrYQDmd/Bh2aLGKg4irR00Jt7MUt7GNUxClmt/cMrjwG5R8tson0
	 giyrOqVMWMaN7y4j1lzV3o0Chbxj9d4fXYkVqhQs=
Date: Mon, 9 Sep 2024 18:23:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <2024090943-retiree-print-14ba@gregkh>
References: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
 <Zt8H530FkqBMiYX+@opensource.cirrus.com>
 <8462d322-a40a-4d6c-99c5-3374d7f3f3a0@linux.intel.com>
 <adb3d03f-0cd2-47a7-9696-bc2e28d0e587@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb3d03f-0cd2-47a7-9696-bc2e28d0e587@linaro.org>
Message-ID-Hash: TMWLDLUIRYZTFE6TIDPGXLGYILY57QAG
X-Message-ID-Hash: TMWLDLUIRYZTFE6TIDPGXLGYILY57QAG
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMWLDLUIRYZTFE6TIDPGXLGYILY57QAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 09, 2024 at 06:08:14PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2024 17:45, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 9/9/24 16:36, Charles Keepax wrote:
> >> On Wed, Sep 04, 2024 at 04:52:28PM +0200, Krzysztof Kozlowski wrote:
> >>> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
> >>> breaks codecs using non-continuous masks in source and sink ports.  The
> >>> commit missed the point that port numbers are not used as indices for
> >>> iterating over prop.sink_ports or prop.source_ports.
> >>>
> >>> Soundwire core and existing codecs expect that the array passed as
> >>> prop.sink_ports and prop.source_ports is continuous.  The port mask still
> >>> might be non-continuous, but that's unrelated.
> >>>
> >>> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >>> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
> >>> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>
> >>> ---
> >>
> >> Would be good to merge this as soon as we can, this is causing
> >> soundwire regressions from rc6 onwards.
> > 
> > the revert also needs to happen in -stable. 6.10.8 is broken as well.
> 
> It will happen. You do not need to Cc-stable (and it will not help, will
> not be picked), because this is marked as fix for existing commit.

No, "Fixes:" tags only do not guarantee anything going to stable, you
have to explicitly tag it Cc: stable to do so, as per the documentation.

Yes, we often pick up "Fixes:" only tags, when we have the time, but
again, never guaranteed at all.

thanks,

greg k-h
