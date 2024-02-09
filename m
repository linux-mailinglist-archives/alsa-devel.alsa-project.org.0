Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92484F346
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 11:22:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211D2846;
	Fri,  9 Feb 2024 11:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211D2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707474172;
	bh=S+SbbCAcBABXGFkQer3pBk4+WoT2/puAu+LdvJ7pTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CatoKr9ZugUeehdvXiHq3yI0KWi30a9eoDLjhhztCThyIuiVYWqaLH8AEKCXwsHQr
	 25kR1pQ+wzZO2zZ6dSQAn8bpgT1mwLf0BL/pPAvEGjcAFKi4TJ8DyyXrUG8jUORm/a
	 VsfZ3fU0FDQutNx6Qt6I3jfpJuQ3tdMPxYABkdcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9046EF8057B; Fri,  9 Feb 2024 11:22:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EC8F804E7;
	Fri,  9 Feb 2024 11:22:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE6EDF801EB; Fri,  9 Feb 2024 11:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64649F8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 11:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64649F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=D4Eu92ap
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E05BCE1FC9;
	Fri,  9 Feb 2024 10:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5900CC433C7;
	Fri,  9 Feb 2024 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707474128;
	bh=S+SbbCAcBABXGFkQer3pBk4+WoT2/puAu+LdvJ7pTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4Eu92apEOQ82YPVTi+YMOU16LsZpp6imJXtcAx1iRLCUVlkKfxhEzCh+O5k0BwIo
	 sWGTV9g/y441/l+WQLeKZzCCnqqpfDzPMD/K6soB6StIVWRBYRBgTIoiAgaby6gY3W
	 g++76qdF3AtyVkYOvArRL2qcdnKOpBiw/tvam0U0=
Date: Fri, 9 Feb 2024 10:22:06 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, corbet@lwn.net, lgirdwood@gmail.com,
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
	tiwai@suse.com, robh+dt@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v14 00/53] Introduce QC USB SND audio offloading support
Message-ID: <2024020950-eel-opt-58cd@gregkh>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
 <852cc2e0-4e61-3b8a-428f-7623ceade463@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852cc2e0-4e61-3b8a-428f-7623ceade463@quicinc.com>
Message-ID-Hash: GXNBWELJCWLEWGWW64NQXJTGHKAO2RMM
X-Message-ID-Hash: GXNBWELJCWLEWGWW64NQXJTGHKAO2RMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXNBWELJCWLEWGWW64NQXJTGHKAO2RMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 08, 2024 at 03:33:06PM -0800, Wesley Cheng wrote:
> Hi Mark/Takashi,
> 
> On 2/8/2024 3:13 PM, Wesley Cheng wrote:
> <snip>
> 
> Would it be possible to see if we could start pulling some of these non
> offloading dependent changes into your repos?  It would really be helpful
> since the # of patches is getting a little cumbersome to maintain.  If we
> need to make any follow ups, I can address them as a separate patch and add
> it to the series w/ the other changes that are still pending.

Or if someone gives me acks, I can take them through my usb tree as
well.

thanks,

greg k-h
