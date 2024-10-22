Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965879AB05A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2024 16:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3D8A4D;
	Tue, 22 Oct 2024 16:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3D8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729605779;
	bh=LmyL3KEbkYZuNuIInWGrQBEfqsb4AkMQu7FSENmaHVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eShrAJC1gNu6dGaA2EMon+VewhfvkGUAlJlsvJVZCp0eYDiNcgG7mvNw3/v6y5YK9
	 /I0UelSBDStimx974JrZDgfHthCFcM89dXymwhZaXAFl7lFCgCKCC/eNaMwzRmFn2l
	 qWN+cW4+YNxmfG7O/6bobZxkLI3VjijqL+9pSTG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E2CFF805B2; Tue, 22 Oct 2024 16:02:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 443F8F805B0;
	Tue, 22 Oct 2024 16:02:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C70F0F8016C; Tue, 22 Oct 2024 16:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD6E2F80149
	for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2024 16:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6E2F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=X3K4hVJd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78908A4340F;
	Tue, 22 Oct 2024 14:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C658BC4CEE6;
	Tue, 22 Oct 2024 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729605739;
	bh=LmyL3KEbkYZuNuIInWGrQBEfqsb4AkMQu7FSENmaHVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3K4hVJdwnNbAOVCh8gkIv75QtRIj0U0iziJQUzJ3OvJ+BzSsCP39chI/kNPCd/xr
	 7cyiElt8+paHPGsCOYOa7AHtEUSFTn9Na7ha5JWevo8EOJ+zUeRbSU9rJhGzALzKt9
	 b8oA/8lxhkOqj14DpsMNKXRyTugJoprE9jTfrFdA=
Date: Tue, 22 Oct 2024 16:02:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, lgirdwood@gmail.com,
	tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation
 IMOD for secondary interrupters
Message-ID: <2024102240-gag-famished-245c@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
 <2024101824-hammock-elastic-8d38@gregkh>
 <87wmi02qcj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmi02qcj.wl-tiwai@suse.de>
Message-ID-Hash: 74VBUXSBPNB36VYK6DZAOSBPPTT6VEPF
X-Message-ID-Hash: 74VBUXSBPNB36VYK6DZAOSBPPTT6VEPF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74VBUXSBPNB36VYK6DZAOSBPPTT6VEPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 22, 2024 at 03:56:44PM +0200, Takashi Iwai wrote:
> On Fri, 18 Oct 2024 07:52:35 +0200,
> Greg KH wrote:
> > 
> > On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> > > Hi Greg,
> > > 
> > > On 10/16/2024 11:40 PM, Greg KH wrote:
> > > > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> > > >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > >>
> > > >> Allow creators of xHCI secondary interrupters to specify the interrupt
> > > >> moderation interval value in nanoseconds when creating the interrupter.
> > > >>
> > > >> If not sure what value to use then use the xhci driver default
> > > >> xhci->imod_interval
> > > >>
> > > >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> > > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >> ---
> > > >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> > > >>  drivers/usb/host/xhci.c     | 4 ++--
> > > >>  drivers/usb/host/xhci.h     | 5 ++++-
> > > >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > > > This is already in 6.12-rc1, which makes me confused as to what tree you
> > > > made this series against.
> > > 
> > > Sorry, I didn't fetch the latest changes from usb-next.
> > 
> > It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
> > based this on :(
> > 
> > > In this case, should I rebase and resbumit?
> > 
> > As the series can't be applied as-is, probably.  But I think you might
> > want to collect some acks from the sound people and xhci developers, as
> > I can't do anything with this until they look at the changes.
> 
> Honestly speaking, I couldn't follow fully the discussions about the
> fundamental design -- IIRC, Pierre and others had concerns to the way
> to manage the offload device via kcontrols.  Did we get consensus?

I don't think so.

> I believe that's the biggest obstacle in the audio side, i.e. what's
> visible to users.  The kernel internals can be corrected at any time
> later.

I would like to see that agreed on before I even look at the usb side.

thanks,

greg k-h
