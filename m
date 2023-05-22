Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0370B703
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8E882A;
	Mon, 22 May 2023 09:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8E882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684741830;
	bh=Eo0+Icm2019fc9CG18EhK9l87oMZFYzHE9JJKESCEoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JG3gw6+l7p4H230n4nHSHYBLNFLEAktx6ohHDor8N38fPHC+YXcBsYaQ7ue5TpeKD
	 lKqxTbGW+eZDuya/JVIz7oDIH72ts1CgTP+79DMcWfasv2bWCJ7eOl3zqIHj+6I3lb
	 gbMkOQ7LhA0UupOAmbkYmY1Q1DaFavAAorzHAkXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC89BF80249; Mon, 22 May 2023 09:49:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 520E4F80249;
	Mon, 22 May 2023 09:49:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0164F8024E; Mon, 22 May 2023 09:49:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC720F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:49:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1150E1E35;
	Mon, 22 May 2023 09:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1150E1E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684741773; bh=dH5cvCF7x7LQe47buAwomZ3G0OhA2VsoqsYv2R6qz/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kupl9MK+4yEJrFcQmLiB5L2kOH6+sF7dClrnRXRxhUkgcvm19BdyVJmv2m1dwXO3d
	 66fbLIpcLHs8MVoVHQN6sLSxUcQ/3mDMtQzNan1hHxIZkZzlIMSdDY440ixPePf4bu
	 z7eXth9NYuLuSGqs4WgjWeaoHOvInVuLvviMxjRE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:49:31 +0200 (CEST)
Message-ID: <abb2016d-4000-edf4-66c6-0ac9f0242d69@perex.cz>
Date: Mon, 22 May 2023 09:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 30/36] ALSA: seq: Allow suppressing UMP conversions
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-31-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-31-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QMHSQHFE23MRWAG2WSF2BLPCOVGZ2EGJ
X-Message-ID-Hash: QMHSQHFE23MRWAG2WSF2BLPCOVGZ2EGJ
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMHSQHFE23MRWAG2WSF2BLPCOVGZ2EGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> A sequencer client like seq_dummy rather doesn't want to convert UMP
> events but receives / sends as is.  Add a new event filter flag to
> suppress the automatic UMP conversion and applies accordingly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

