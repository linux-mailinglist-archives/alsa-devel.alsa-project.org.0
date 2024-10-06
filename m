Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DA991DA8
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 12:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69DB7F1;
	Sun,  6 Oct 2024 12:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69DB7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728209346;
	bh=SRdoJ/oFK8ch6KkyAW3YApgRnZkaX3MlPZjHqx/wc9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IaDTzeqjQD2JSUS+L5ijSX2iygwyOn5tT1Z/DBUhRKvfs/f9//B5Df9R2NnSjvM7K
	 DKpe69uMEMJJt4NIUidGWacyt5cdKor/j4djluHyUD1Dgo2OrqGo57+IcsLPuslf9p
	 N2z7jC38FR75+EGHMY5ABRbMnZyzm8jcbUlB8KbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E584F805AC; Sun,  6 Oct 2024 12:08:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80800F805B0;
	Sun,  6 Oct 2024 12:08:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1834F80528; Sun,  6 Oct 2024 12:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C797F80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 12:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C797F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=H7SDFpix
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8F675C06B7;
	Sun,  6 Oct 2024 10:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD40AC4CEC5;
	Sun,  6 Oct 2024 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728209300;
	bh=SRdoJ/oFK8ch6KkyAW3YApgRnZkaX3MlPZjHqx/wc9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7SDFpixabJQXU5lZJLkiEFqpQS9BlhXRpx0oDUoocdqZytKIzB0HGu19gve3R0qt
	 R7rD6b9WQCwTgG146lqLOaNbGvnBX0V2um69KNlPQt4BR7eCeXStX/dr3wwFpdA1ob
	 ndR4YlsSteOd34NZwSW5zHuGMn5i6srQzCFDWbCE=
Date: Sun, 6 Oct 2024 12:08:16 +0200
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
Message-ID: <2024100608-chomp-undiluted-c3e2@gregkh>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
 <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
Message-ID-Hash: ESTHV2TZMPW2EJFIDXOE5OVGGQDOL3B7
X-Message-ID-Hash: ESTHV2TZMPW2EJFIDXOE5OVGGQDOL3B7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESTHV2TZMPW2EJFIDXOE5OVGGQDOL3B7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Oct 06, 2024 at 10:56:51AM +0200, Markus Elfring wrote:
> >>> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> >>
> >>                    call?
> >>
> >>
> >>> possibly return NULL pointer. NULL Pointer Dereference may be
> >>> triggerred without addtional check.
> >> …
> >>
> >> * How do you think about to use the term “null pointer dereference”
> >>   for the final commit message (including the summary phrase)?
> >>
> >> * Would you like to avoid any typos here?
> >>
> >>
> >> …
> >>> ---
> >>>  sound/soc/qcom/lpass-cpu.c | 2 ++
> >>
> >> Did you overlook to add a version description behind the marker line?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc1#n723
> …
> > This is the semi-friendly patch-bot of Greg Kroah-Hartman.
> >
> > Markus, you seem to have sent a nonsensical or otherwise pointless
> > review comment to a patch submission on a Linux kernel developer mailing
> > list.  I strongly suggest that you not do this anymore.  Please do not
> > bother developers who are actively working to produce patches and
> > features with comments that, in the end, are a waste of time.
> >
> > Patch submitter, please ignore Markus's suggestion; you do not need to
> > follow it at all.  The person/bot/AI that sent it is being ignored by
> > almost all Linux kernel maintainers for having a persistent pattern of
> > behavior of producing distracting and pointless commentary, and
> > inability to adapt to feedback.  Please feel free to also ignore emails
> > from them.
> * Do you care for any spell checking?

No.

> * Do you find any related advice (from other automated responses) helpful?

No.
