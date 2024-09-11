Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE1974DC6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 11:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820157F8;
	Wed, 11 Sep 2024 11:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820157F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726045238;
	bh=ZNG517+nfdpR6QYSXvEOMvJ07+81ZOmK48XOp3AZ8Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yzu63wj+Fd6jv7uJWI2cwtK3CfAtaIbkZWwJmOCEQCMyn1QMw7PoOh0b20MWyjh36
	 ikuQJTPY5jXLUYM1fkdAzgf1WfCtCj/IAtcq/CHtTkEtdsnrGWtXkXXrw2LnnX4c6C
	 +EXecpPxACWLj8pODoDfEb5+SHIOq0uVCONJYNxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28063F805AA; Wed, 11 Sep 2024 11:00:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79623F805AA;
	Wed, 11 Sep 2024 11:00:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69EE0F8010B; Wed, 11 Sep 2024 10:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65024F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 10:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65024F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gZPoOROt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E5A95C034C;
	Wed, 11 Sep 2024 08:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BC7C4CEC5;
	Wed, 11 Sep 2024 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726045193;
	bh=ZNG517+nfdpR6QYSXvEOMvJ07+81ZOmK48XOp3AZ8Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZPoOROteQrOXvdwCLc+n3gZvpAyGRstUFzITbRWxvj839HkVdSiUoRoxq4l3/0jV
	 9aW14tpSMVwlk/Fc4UUGxjN1ZbwZB3R6P2VgqYGG0ZeWI+OoV064fQ+GwRypWl9e12
	 K0kE22s/Hx43Iz/4JmW1WRG8QGJwDEeb7/e1UX68/DEZWbnQy5HCadsGPaHfaORkuz
	 KONYPLzfc83UT9InG0s1PHSBTdIlYOgmWw9rB1bmVN+QO9lGhZTidj9SDRbDysq92l
	 /f/FUkmYi8E55BQ40aCqGbQTTY9XOiHq+26ZdEKsk8kJL18Stt+XogGpfSJ7TM+qo+
	 ujjJ1UFeBfYbg==
Date: Wed, 11 Sep 2024 14:29:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <ZuFcBcJztAgicjNt@vaman>
References: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
 <568137f5-4e4f-4df7-8054-011977077098@linux.intel.com>
 <a7a4bb04-de90-4637-b9e4-81c3138347d3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7a4bb04-de90-4637-b9e4-81c3138347d3@linux.intel.com>
Message-ID-Hash: NYE55AMFYMT56OPPMDSKHQNAM4RE4SZG
X-Message-ID-Hash: NYE55AMFYMT56OPPMDSKHQNAM4RE4SZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYE55AMFYMT56OPPMDSKHQNAM4RE4SZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10-09-24, 16:49, Péter Ujfalusi wrote:
> 
> 
> On 10/09/2024 16:05, Péter Ujfalusi wrote:
> > 
> > 
> > On 09/09/2024 19:47, Krzysztof Kozlowski wrote:
> >> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
> >> breaks codecs using non-continuous masks in source and sink ports.  The
> >> commit missed the point that port numbers are not used as indices for
> >> iterating over prop.sink_ports or prop.source_ports.
> >>
> >> Soundwire core and existing codecs expect that the array passed as
> >> prop.sink_ports and prop.source_ports is continuous.  The port mask still
> >> might be non-continuous, but that's unrelated.
> >>
> >> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
> >> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
> >> Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> Vinod: can you pick this patch for 6.11 if there is still time since
> upstream is also broken since 6.11-rc6

Done, should be sent to Linus tomorrow...

-- 
~Vinod
