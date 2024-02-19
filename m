Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4FF85AC92
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 20:57:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76437A4B;
	Mon, 19 Feb 2024 20:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76437A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708372652;
	bh=OaAEMFvFDN1qhJ4t5nXfrOCymw4TroM52J1E3WnfAP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKsRCLN3KR4Ftr09xgg8UWl143t/IMSfVjf6z/cHVEboXXRrEJPEYo3oYjZetWyKj
	 A+bqLQNZ0m64GJWQKzv1ltNSTgKFB2dqclsACnByipm6/9MLuF0lJHky73ujJ8UOGe
	 2L39sMQW4LSQildzPQaKh9/qdv3VRLhlvV07XrZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1DD4F805AB; Mon, 19 Feb 2024 20:56:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28EDDF80588;
	Mon, 19 Feb 2024 20:56:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 275D3F80496; Mon, 19 Feb 2024 20:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92D89F800EE
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 20:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D89F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=j/Tf0rg/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3051B60EDC;
	Mon, 19 Feb 2024 19:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB28C433F1;
	Mon, 19 Feb 2024 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708372601;
	bh=OaAEMFvFDN1qhJ4t5nXfrOCymw4TroM52J1E3WnfAP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/Tf0rg/52VRU0RdqcIIbgIp34hsAGhLLM6UEzs4f8XeRAe8Pe0ZnvuYgjEaedKPh
	 XzolqPbpGuyslO57mb26R3nPLHjlPXFweVZOqmQ+StxE+IHfCDJsSFchYOb0ECw4Ej
	 9bic7JeKdiqsqqJlLXwCDhAwxYe5B/OGUhUOFkGU=
Date: Mon, 19 Feb 2024 20:56:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
	robh+dt@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v17 00/51] Introduce QC USB SND audio offloading support
Message-ID: <2024021929-catching-subheader-d51b@gregkh>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <2024021754-unengaged-saggy-6ab1@gregkh>
 <96ab6033-2cb9-daa7-ddad-090138896739@linux.intel.com>
 <2024021922-privatize-runt-495e@gregkh>
 <d82c8955-6793-7544-0013-1033abd9f1e9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d82c8955-6793-7544-0013-1033abd9f1e9@linux.intel.com>
Message-ID-Hash: 6RFLAVH7JS7YH3AE5Z5WAWWJLRNQKSNH
X-Message-ID-Hash: 6RFLAVH7JS7YH3AE5Z5WAWWJLRNQKSNH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RFLAVH7JS7YH3AE5Z5WAWWJLRNQKSNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 19, 2024 at 01:03:31PM +0200, Mathias Nyman wrote:
> > > 
> > > Patch 10/10 is based on an old POC patch by me, but it's heavily modified.
> > > 
> > > It looks like it does a few minor things that are not optimal, like extra
> > > spinlock/unlock, and wait_for_completion_timeout() with magical timeout value.
> > > I haven't tested this version, but I guess any fixes or cleanups can be done
> > > later on top of it.
> > 
> > I can revert it now if you want, just let me know.
> > 
> 
> Maybe reverting it would be better yes.

Ok, will do, thanks for letting me know.

greg k-h
