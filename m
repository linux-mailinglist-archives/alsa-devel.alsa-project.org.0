Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F56991D3F
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 10:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD60851;
	Sun,  6 Oct 2024 10:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD60851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728203415;
	bh=IeAGKkN1wUHgln50MQguJlxeJL1wxccB424rArOqimg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCUxC6kf1AtGV+J73c0phOsE+JdsV/J7Fmu9fd1pCoCTIMDxlkJrIW8YQaIBxgavq
	 l4PNcl7TL2UvJnGbFgvtmrE5X7RN3pEBP8MYbYWimy1B3bFguSYEIfR08ydVisWsjt
	 aolkx3vJFbAB+s7bgTFRjuBFSuP19yH8SyfhEres=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9056AF805B2; Sun,  6 Oct 2024 10:29:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E8AF8059F;
	Sun,  6 Oct 2024 10:29:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB105F80528; Sun,  6 Oct 2024 10:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81CA0F8001E
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 10:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81CA0F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=AK4/R15Y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DE5EA40C36;
	Sun,  6 Oct 2024 08:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F08DC4CEC5;
	Sun,  6 Oct 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728203369;
	bh=IeAGKkN1wUHgln50MQguJlxeJL1wxccB424rArOqimg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AK4/R15YMTDd0AWBOuLTknswIJMiOl65Me0tIed8vocFDiMO7uWjxW6fQhc/taULo
	 lWWaGmd4cRW9A6KoDi8zzmw7D/+dsslP18Wp6Kl0SOcLifUinzWL5xZPBX9TIGZEbW
	 jpRX0UqMUC43Q2S9xKyTM7kLO17uwuFdJt4qXKSU=
Date: Sun, 6 Oct 2024 10:29:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <2024100620-decency-discuss-df6e@gregkh>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
Message-ID-Hash: BG22SEH5MERS5CWUZRN7MMQDGTAV7JFH
X-Message-ID-Hash: BG22SEH5MERS5CWUZRN7MMQDGTAV7JFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BG22SEH5MERS5CWUZRN7MMQDGTAV7JFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Oct 05, 2024 at 05:40:53PM +0200, Markus Elfring wrote:
> > A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> 
>                    call?
> 
> 
> > possibly return NULL pointer. NULL Pointer Dereference may be
> > triggerred without addtional check.
> …
> 
> * How do you think about to use the term “null pointer dereference”
>   for the final commit message (including the summary phrase)?
> 
> * Would you like to avoid any typos here?
> 
> 
> …
> > ---
> >  sound/soc/qcom/lpass-cpu.c | 2 ++
> 
> Did you overlook to add a version description behind the marker line?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc1#n723
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
