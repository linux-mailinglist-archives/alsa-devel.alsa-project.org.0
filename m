Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305E8AE9F7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 16:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFDC1060;
	Tue, 23 Apr 2024 16:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFDC1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713884366;
	bh=1YHO87gpuA4GWmgj2Um/hut9wEBNIU7DZW6ecVbdQog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aEf6E9gH8OzdRq08EBI5suJf1XMIvJlF+AR5ChsD70sYcED318jb2JmNZin+y+85C
	 IkPY44HEihugTNacDa3Ze2K+4jY7GNs5J/SVPGh00wsrXfEwL2qPO57Jqb8PlVQpJn
	 3aGp+fpjYQlwsBig42/8yoby3ERWqtsaN3cii0uM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3ECFF805A0; Tue, 23 Apr 2024 16:58:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDF7F8057E;
	Tue, 23 Apr 2024 16:58:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6A49F80423; Tue, 23 Apr 2024 16:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA3A3F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 16:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA3A3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lavk+HSl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D6276132C;
	Tue, 23 Apr 2024 14:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23513C116B1;
	Tue, 23 Apr 2024 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713884311;
	bh=1YHO87gpuA4GWmgj2Um/hut9wEBNIU7DZW6ecVbdQog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lavk+HSlkvCpvWHOmB/TRotL7IHCxCKW0b2IhHibrA+Y11LllPj7SumxIUl+BAtUl
	 x0Wn4ntm5NdIfBQ3kQRItM+vrb1U4IqGNr0ZsJ/t1abxEjfEh4lhsIltm/s8Aouw7c
	 RkT9s5MSw1Q8zp65Dcdf7bEVqVlGuAoyuVh7dROOGhV0PxW60PEPIl8jOFfn0SlVkD
	 3TdYDtV21DgzEFowxzeviKHhQnZ9eIlLGLeyjZ1QfW1sUNY1TGnZTr4CEsKRkGGPHT
	 NrqKPxTDm/H0cHAfUv8v1auQMVEhEoSc6CXD/jz0w43X58sRq9B6t/OP0NXCKroCq4
	 fO0bVZD6FVGxg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rzHbJ-000000002ag-1MYj;
	Tue, 23 Apr 2024 16:58:29 +0200
Date: Tue, 23 Apr 2024 16:58:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
Message-ID: <ZifMlc_rLV6_LhUy@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <ZieihZRKe7OtP-nV@hovoldconsulting.com>
 <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
Message-ID-Hash: DKXPPPX5YEE4FOYONDYHR6MOJPW2SADQ
X-Message-ID-Hash: DKXPPPX5YEE4FOYONDYHR6MOJPW2SADQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKXPPPX5YEE4FOYONDYHR6MOJPW2SADQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 23, 2024 at 01:38:18PM +0100, Srinivas Kandagatla wrote:
> On 23/04/2024 12:59, Johan Hovold wrote:

> > It looks like your UCM changes are still muxing the speaker and *each*
> > displayport output so that you can only use one device at a time (i.e.
> > only Speaker or DP1 or DP2 can be used).

> that is true.
> 
> What is the use-case to use more than one audio sink devices at the same 
> time for a laptops?

I can imagine streaming audio and video to a TV (or audio to a soundbar)
over DP while playing systems sounds and doing video conferencing using
the internal speakers (or the other DP port).

> How do you test it? I never tested anything like that on a full desktop 
> setup.

You can select the sink per application in pavucontrol. Just verified
that playing audio over the 3.5 mm jack while playing system sounds
using the internal speakers works just fine.

> > As we discussed off list last week, this seems unnecessarily limited and
> > as far as I understood is mostly needed to work around some
> > implementation details (not sure why DP1 and DP2 can't be used in
> > parallel either).
> 
> It is absolutely possible to run all the streams in parallel from the 
> Audio hardware and DSP point of view.
> 
> One thing to note is, On Qualcomm DP IP, we can not read/write registers 
> if the DP port is not connected, which means that we can not send data 
> in such cases.
> 
> This makes it challenging to work with sound-servers like pipewire or 
> pulseaudio as they tend to send silence data at very early stages in the 
> full system boot up, ignoring state of the Jack events.

This bit sounds like it can and should be worked around by the driver to
avoid hard-coding policy which would prevent use cases such as the ones
mentioned above.

> > Can you please describe the problem here so that we can discuss this
> > before merging an unnecessarily restricted solution which may later be
> > harder to change (e.g. as kernel, topology and ucm may again need to be
> > updated in lock step).
> > 
> >  From what I could tell after a quick look, this series does not
> > necessarily depend on muxing things this way, but please confirm that
> > too.
> 
> These patches have nothing to do with how we model the muxing in UCM or 
> in tplg.
> 
> so these can go as it is irrespective of how we want to model the DP 
> sinks in the UCM or tplg.

Thanks for confirming.

Johan
