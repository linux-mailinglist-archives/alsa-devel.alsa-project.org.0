Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FF69A349B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 07:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE24286F;
	Fri, 18 Oct 2024 07:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE24286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729230806;
	bh=t72qPYFH5qW9CSTUoUWBfe21Vq2ukayl51YEp/oosEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DNUwSARJ1lvmqnhhO0WuhTE3UnXJBrJrBAcyuaznJSrTu7bUQ+QApZMZVCkW+cyDo
	 pFieJcm6bLA+nOgBmwU8GxOJbNOHI6UTK+P5m3GtWg6UeeDSRdWwFCyV5/SXykZ4tl
	 nid7nMC40ulJQe6vVRu5dXIyI2hU8L0OJPwyDBa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D7A2F805AE; Fri, 18 Oct 2024 07:52:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 576DFF805AB;
	Fri, 18 Oct 2024 07:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEEEAF80448; Fri, 18 Oct 2024 07:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50FECF80104
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 07:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50FECF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=cSyiPMGN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CDEC5C5C84;
	Fri, 18 Oct 2024 05:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8EAC4CEC3;
	Fri, 18 Oct 2024 05:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729230758;
	bh=t72qPYFH5qW9CSTUoUWBfe21Vq2ukayl51YEp/oosEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSyiPMGNKU212TJ+q0GtMzycjpfO32+6AkR/8bwoCghlU21012x0Aoki6eVJI1/U+
	 6iELNc2vLqcqt7GQZsDvXNrVAYO8yAWTNuDglWB8WFpY0dGOUQxr22xiyNl/HZRJ2C
	 zYMq/2SyFRgLmomkI7ENxVvBoXwiCQGZBe4D5gqY=
Date: Fri, 18 Oct 2024 07:52:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation
 IMOD for secondary interrupters
Message-ID: <2024101824-hammock-elastic-8d38@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
Message-ID-Hash: 723F2NYR4FSJOVT76VGW2A5T55P42Q34
X-Message-ID-Hash: 723F2NYR4FSJOVT76VGW2A5T55P42Q34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/723F2NYR4FSJOVT76VGW2A5T55P42Q34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> Hi Greg,
> 
> On 10/16/2024 11:40 PM, Greg KH wrote:
> > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> >>
> >> Allow creators of xHCI secondary interrupters to specify the interrupt
> >> moderation interval value in nanoseconds when creating the interrupter.
> >>
> >> If not sure what value to use then use the xhci driver default
> >> xhci->imod_interval
> >>
> >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> ---
> >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> >>  drivers/usb/host/xhci.c     | 4 ++--
> >>  drivers/usb/host/xhci.h     | 5 ++++-
> >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > This is already in 6.12-rc1, which makes me confused as to what tree you
> > made this series against.
> 
> Sorry, I didn't fetch the latest changes from usb-next.

It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
based this on :(

> In this case, should I rebase and resbumit?

As the series can't be applied as-is, probably.  But I think you might
want to collect some acks from the sound people and xhci developers, as
I can't do anything with this until they look at the changes.

thanks,

greg k-h
