Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AAF6F7DE0
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 09:30:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7767B2BCA;
	Fri,  5 May 2023 09:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7767B2BCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683271847;
	bh=MIlIF/BB9sjS72bXBu5VCZUuG1FWg/VtKyZDGYzmr00=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uxS5SO7x4HAM38BTYrHhPC95EHZ/s3bGiRpSx0Wm4apG0UL7EaVNIg72bIxH+OLWT
	 cM11sTZZpvsS9trLz7KijmvKme0r4mm6MG+aU6Ce+o0gEiCQ+1Y4Ahs56Lhs8iWSAe
	 4vl9MXgiU/DeLdgFXWxIXfd7DxDS2DGIggtdypZw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF9BFF80529;
	Fri,  5 May 2023 09:29:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F679F8052D; Fri,  5 May 2023 09:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC3E1F80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:29:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2E09E11E2;
	Fri,  5 May 2023 09:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2E09E11E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683271744; bh=38/brcnHAbkloqfsUP2fNJFIuHFuyfXM0moKLfbVhxk=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=2Two0my6Eq1uFB+LvjhCLcpUgvSyMHmi3G2FxNd0odoklVMDzjGz2o+/lbtEZ/5+u
	 2gp0jK5mRQf4iWc13SEwkBL0JGDEMbfz7eUJAKYrEC4pUZ05fwwGwEQfLAhZoO/BZC
	 4IhSPeqT3CBMOp07sE3fD0N1Nt0OLAa2EjsV06Cs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 May 2023 09:29:01 +0200 (CEST)
Message-ID: <9e6ba3e9-44d1-082d-fb0d-f5ad1f92aa5a@perex.cz>
Date: Fri, 5 May 2023 09:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <87cz3gkyz9.wl-tiwai@suse.de> <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
 <ZFO5B+1+HaIz4B4X@ugly> <877ctokv6x.wl-tiwai@suse.de> <ZFPQ68qLr2fy1qRs@ugly>
 <87ttwsjbrx.wl-tiwai@suse.de> <ZFPxK7tgMEa0Gi1y@ugly> <ZFStbtMYPwhiUEMB@ugly>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZFStbtMYPwhiUEMB@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CAN4TMIUXWBIHMRJURHKLVEBFV46HU3X
X-Message-ID-Hash: CAN4TMIUXWBIHMRJURHKLVEBFV46HU3X
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAN4TMIUXWBIHMRJURHKLVEBFV46HU3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 05. 23 9:17, Oswald Buddenhagen wrote:
> On Thu, May 04, 2023 at 07:53:47PM +0200, Oswald Buddenhagen wrote:
>> i'm not going to try to prove to you that this is the case here. i just
>> know that i failed at atomizing this _properly_ the first time around.
>>
> as it goes, my brain won't go to rest over this and has already done
> half the work, so expect a new series RSN. i'm sure you'll enjoy the
> churn ...

I already finished my patchset based on your reaction yesterday. I will send 
my code in few minutes.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

