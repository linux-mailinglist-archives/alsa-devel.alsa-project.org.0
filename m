Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDA84F34A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 11:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CD59F6;
	Fri,  9 Feb 2024 11:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CD59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707474198;
	bh=cs5VZ4iM5HdhEgJi2Gu/DOwpKJdiVGb7uaKztxLeeN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ag8CTHOk3gZBRsybuoRCcdXgDMLp7qmaAQgkS/ecYS+9J9p36rO8C1H6U9zO9x9ZE
	 p1TILSTBy8jL91rGSFepWnZ3MVX4AeYPTXBjDUdTJZfcMAvPqtv94h7T7xmPDqnMYv
	 P+Ol/Rf1KtIH0V4fyKrMsDSevUOAmjOcGtAm0pxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7304F80571; Fri,  9 Feb 2024 11:23:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DDCCF805A8;
	Fri,  9 Feb 2024 11:23:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2875F801EB; Fri,  9 Feb 2024 11:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E81A1F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 11:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E81A1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=2utyLbyR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D18061F95;
	Fri,  9 Feb 2024 10:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA98C433F1;
	Fri,  9 Feb 2024 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707474168;
	bh=cs5VZ4iM5HdhEgJi2Gu/DOwpKJdiVGb7uaKztxLeeN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2utyLbyRIR+omAGgzPLUuILSYLG35BqhO8gkXzWOvxSl76YEuBkYa7+cDmAl6lMSt
	 mdwN7bSRtzSCd10x9pn8vEO8VnAkR3OyrtDpDSsMCZ881TATKJh0o5dQ/ft85GYYmU
	 YUGytVxSQMjVhXhjiu4+WcTfmT5X2mbQQUTpeI/4=
Date: Fri, 9 Feb 2024 10:22:45 +0000
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
	alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v14 01/53] xhci: fix possible null pointer dereference at
 secondary interrupter removal
Message-ID: <2024020931-unelected-scribble-50f4@gregkh>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
 <20240208231406.27397-2-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208231406.27397-2-quic_wcheng@quicinc.com>
Message-ID-Hash: Y2424ZF75NRG2LNOKVJ4M6OIZ62FTWDK
X-Message-ID-Hash: Y2424ZF75NRG2LNOKVJ4M6OIZ62FTWDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2424ZF75NRG2LNOKVJ4M6OIZ62FTWDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 08, 2024 at 03:13:14PM -0800, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Don't try to remove a secondary interrupter that is known to be invalid.
> Also check if the interrupter is valid inside the spinlock that protects
> the array of interrupters.
> 
> Found by smatch static checker
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-usb/ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain/
> Fixes: c99b38c41234 ("xhci: add support to allocate several interrupters")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Link: https://lore.kernel.org/r/20240125152737.2983959-2-mathias.nyman@linux.intel.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Wait, this is already in my tree, right?  Why keep sending it?

confused,

greg k-h
