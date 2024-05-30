Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C739C8D55D6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 00:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262F385D;
	Fri, 31 May 2024 00:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262F385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717109816;
	bh=t2b3q3NvivHfKbxWs52/YIC7yc0r0DKyLxE8Ev0azjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tb8FiWAP9B4tNvoSHPTlvs+LpmPXJNq0/uf+0owxajUODLL+cafrnl/ByQBV+oiN6
	 6dvqn3Zo843afnu2j1MuDZ+4c0ZnFe4jTFKaVqjDKIOPWHPNDtRYEBR5W+Br2FTeYo
	 pt9brFxsUL9d3Trh5pgT83iYv4lKaGex5mLtmhKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4AF0F805A9; Fri, 31 May 2024 00:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25061F805A0;
	Fri, 31 May 2024 00:56:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86165F80149; Fri, 31 May 2024 00:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F7D1F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 00:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7D1F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=buanuCIV
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso21997041fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717109773; x=1717714573;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyzzXBthjiz94idPYhOV9w7TAAGo24N1F5P/VAMGj+w=;
        b=buanuCIVfKtfV9r52tddZvckQSbBs7+Khkj1Adgg9iT/pTvf9o4hkvHQuWwVZ+owTP
         bDQG1JcJyORvBt/aKVfepwVPT2EC5kTHHV15Kv68oUFqEoMjXFwPQJKnaczs6HeEDtpX
         3DAWOBJbtxR+ps068aOoCkVQCNcsVaCQtPUFkIeNgDAX/VaHjgIKoFt0fKU0OPz+nynu
         5cJpVtAj4WsR4AmvG3NjmDz+qWkpPyEeaqsC6HOkey+0LgagxXuQZnvNKRqsjKu/52ft
         ufq/QTcXcxdU53mU2YAaaLI/6cM0As+O9QxWlg72jChe0OvMt4vDaAGyTcIbTFbkmz+e
         Ou+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109773; x=1717714573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyzzXBthjiz94idPYhOV9w7TAAGo24N1F5P/VAMGj+w=;
        b=a0JEFTm87rmEqx+wanlxDf7Jh1VmiIKFrOyxy/vR7jxLo+kaIMhmF/RR5KOxwas88+
         6HcWwTN6hEj6J+zWszfoWOcc2begDjmdEobfaR+aIJwPG+pi+efFl3RiCBC+eq+XcqYd
         w9WOCSkKsGfVqQx3TChzQVMHHI6RzKgsecRhvKWpX9La+tZliUirxGugMD4LtELbZgvI
         7B8hZ16NEs7801gpN2OgFAS2ugNeCZapEhENfFOcO85/JfBg7b+MtWdSvlyUzYPMwW6Q
         WCArBbl/ElXvew1uRvw+Bjhoutav4Od0AngesLRGSishHRtFcyE0nMyYqbqYymrtxFbK
         S+Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPhuYygLlWUvxl8BcA0KSwHTe/tid73a8rnv30VtneNxokESsrveTvJmk7zB1JKeN51U8khlnBlF1YdBCi0gVtR8mHzavy6b/E/9M=
X-Gm-Message-State: AOJu0Yw5b4oGRNBzLMV6ZNGIrE/K0NSoTvCTLsKxJe1kTHEB8u/nrPhE
	r5Eb7kfnKcNfRMpVyMb5bR48K6A/7Z2Yxata9eUpA9Cn+2U4D+8Gur8TzCiWkpk=
X-Google-Smtp-Source: 
 AGHT+IGsolCfsunFrk+u+BfEK1ofwORxtsBKNx+Vx7U6yTZdYv6NnpXISN5IijgrRZGaS4kqu+n/MQ==
X-Received: by 2002:a2e:9ec6:0:b0:2e6:935f:b6d3 with SMTP id
 38308e7fff4ca-2ea9510e721mr1921981fa.14.1717109773222;
        Thu, 30 May 2024 15:56:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91bb6bc7sm1127091fa.56.2024.05.30.15.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:56:12 -0700 (PDT)
Date: Fri, 31 May 2024 01:56:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
Message-ID: <ZlkEC-X2vzYEZ-Zl@eriador.lumag.spb.ru>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <ZieihZRKe7OtP-nV@hovoldconsulting.com>
 <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92b02fd3-5eba-42a7-a166-21b14724b10c@linaro.org>
Message-ID-Hash: BSQFOGNITRP4P6V7XQMKTAX3A2OXZ322
X-Message-ID-Hash: BSQFOGNITRP4P6V7XQMKTAX3A2OXZ322
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSQFOGNITRP4P6V7XQMKTAX3A2OXZ322/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 23, 2024 at 01:38:18PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 23/04/2024 12:59, Johan Hovold wrote:
> > On Mon, Apr 22, 2024 at 02:43:50PM +0100, Srinivas Kandagatla wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > This patchset adds support for.
> > > 	1. parse Display Port module tokens from ASoC topology
> > > 	2. add support to DP/HDMI Jack events.
> > > 	3. fixes a typo in function name in sm8250
> > > 
> > > Verified these patches on X13s along with changes to tplg in
> > > https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> > > and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> > 
> > It looks like your UCM changes are still muxing the speaker and *each*
> > displayport output so that you can only use one device at a time (i.e.
> > only Speaker or DP1 or DP2 can be used).
> that is true.
> 
> What is the use-case to use more than one audio sink devices at the same
> time for a laptops?

Consider multi-seat setup, with each monitor having its own set of
keyboard, mouse, headphone and user behind it.

> 
> How do you test it? I never tested anything like that on a full desktop
> setup.
> 
> May be some manual setup in Wireplumber, but not 100% sure about multiple
> stream handling.
> 
> > 
> > As we discussed off list last week, this seems unnecessarily limited and
> > as far as I understood is mostly needed to work around some
> > implementation details (not sure why DP1 and DP2 can't be used in
> > parallel either).
> 
> It is absolutely possible to run all the streams in parallel from the Audio
> hardware and DSP point of view.
> 
> One thing to note is, On Qualcomm DP IP, we can not read/write registers if
> the DP port is not connected, which means that we can not send data in such
> cases.

How is this handled for the native HDMI playback on platforms like
Dragonboard 820c? As far as I was able to test, playback fails with -EIO
if HDMI output is not enabled or if the DVI monitor is connected.

> 
> This makes it challenging to work with sound-servers like pipewire or
> pulseaudio as they tend to send silence data at very early stages in the
> full system boot up, ignoring state of the Jack events.
> 
> > 
> > Can you please describe the problem here so that we can discuss this
> > before merging an unnecessarily restricted solution which may later be
> > harder to change (e.g. as kernel, topology and ucm may again need to be
> > updated in lock step).
> > 
> >  From what I could tell after a quick look, this series does not
> > necessarily depend on muxing things this way, but please confirm that
> > too.
> 
> These patches have nothing to do with how we model the muxing in UCM or in
> tplg.
> 
> so these can go as it is irrespective of how we want to model the DP sinks
> in the UCM or tplg.
> 
> 
> --srini
> > 
> > Johan

-- 
With best wishes
Dmitry
