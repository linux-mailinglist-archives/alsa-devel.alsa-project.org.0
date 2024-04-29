Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE468B5C3D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526F21E9;
	Mon, 29 Apr 2024 17:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526F21E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714402890;
	bh=1EwieA7QUF9rLJWyLDX+qUl7U2/uRBK3RtLbBgX3Hww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JgpqLI6YrvdPQlIAqGPJ/QQL/StGlPkWNMTnlRBzDp5tHyqxUo4B8cQAC7IPOapT8
	 LkDOJgrBz6x9QnW+N33DT2HVpkr3cV9WL6kRUTBp8GOUshWhlOpB1HQgcW41+sFmQW
	 YZqYOYUseSbf4xwVXeP9+1Kj3BGZty6etzQUREso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44F4FF8059F; Mon, 29 Apr 2024 17:00:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A70A2F805A8;
	Mon, 29 Apr 2024 17:00:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60A4F8028D; Mon, 29 Apr 2024 17:00:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5876F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5876F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vy+Ua44h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BD8260C4F;
	Mon, 29 Apr 2024 15:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4025C113CD;
	Mon, 29 Apr 2024 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714402842;
	bh=1EwieA7QUF9rLJWyLDX+qUl7U2/uRBK3RtLbBgX3Hww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vy+Ua44hajpgT2+BhYXGsME5V8NCe8v21/S768xNPsTQnz2zGWqtiIGDYg0cem1IQ
	 2kpWL9AIxmhHYNFt7U7OHCFKPdGhP1npPJgRH0zsZG6q9oaBsTHX1wwB72vpN6W2pV
	 w6a8zfnUHIEPeQpTDBZslcLWfx4q7rFU6Bn7Er53CI1Iko6CsACOHrjUy0KQ7GAib+
	 s753iW4wcAVzxKby6OaK3OraQdvZBcQN0Rng1G64S4XQQ+yCol/sejf7DOa07FQROy
	 MdqXkWq+8b54M+1rEYed0DhZ+DYt2Km/dWs7WTNWvxe/Kwusp4eKT3cdGZ5VQxO3qN
	 xL6KBfcREkVaQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s1SUj-000000005LT-3cUe;
	Mon, 29 Apr 2024 17:00:41 +0200
Date: Mon, 29 Apr 2024 17:00:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
Message-ID: <Zi-2GVGZvWoIXO2c@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <ZieihZRKe7OtP-nV@hovoldconsulting.com>
 <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
 <ZifMlc_rLV6_LhUy@hovoldconsulting.com>
 <fc3d849d-3a7e-439a-8d71-2b70ac75ae86@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3d849d-3a7e-439a-8d71-2b70ac75ae86@linaro.org>
Message-ID-Hash: K5CTPXDR6Y4F6ES4DSKPUDCYXRHDHSMN
X-Message-ID-Hash: K5CTPXDR6Y4F6ES4DSKPUDCYXRHDHSMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5CTPXDR6Y4F6ES4DSKPUDCYXRHDHSMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 23, 2024 at 04:59:56PM +0100, Srinivas Kandagatla wrote:
> On 23/04/2024 15:58, Johan Hovold wrote:

> >> It is absolutely possible to run all the streams in parallel from the
> >> Audio hardware and DSP point of view.
> >>
> >> One thing to note is, On Qualcomm DP IP, we can not read/write registers
> >> if the DP port is not connected, which means that we can not send data
> >> in such cases.
> >>
> >> This makes it challenging to work with sound-servers like pipewire or
> >> pulseaudio as they tend to send silence data at very early stages in the
> >> full system boot up, ignoring state of the Jack events.

> > This bit sounds like it can and should be worked around by the driver to
> > avoid hard-coding policy which would prevent use cases such as the ones
> > mentioned above.

> This is not simple as you say. We have to fit these into a proper DPCM.
> Either we have a dummy Backend connected for each of these pcm 
> sub-devices when DP port is not connected and then switch back to DP 
> when its connected.

I don't know how best to implement it, but we shouldn't necessarily let
that determine the user experience.

> Or somehow find a way to not let the pipewire talk to devices which are 
> not connected.

Yes, perhaps it requires a change in user space.

But it seems the kernel should be able to fake whatever probing user
space currently does to determine if the there is a DP jack (even when
there is nothing connected).

Johan
