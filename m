Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADCF70B629
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A536846;
	Mon, 22 May 2023 09:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A536846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684739723;
	bh=kLbefIWkF5CyzPz+mDc4kyre1a5JVo8t0lGSuQ01bsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q+TLtwH7CRLcp/LHhL3tbc8JadUY1q4BQQLqk0sxB/MHWtbmy1x/4ycSLLedvCyuu
	 JEK4mASJudla8/q+8YUZS2wUz7GZsLIUdfd5W/RQdZyQ0auguq284jfjBuzEsrESa0
	 y6YDv4yxpexkds55Z/WAXkOr8k1PbYAIw34uwswI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 195A7F80249; Mon, 22 May 2023 09:14:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E4BF80249;
	Mon, 22 May 2023 09:14:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF2F4F8024E; Mon, 22 May 2023 09:14:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFBE7F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:14:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CA0F61E35;
	Mon, 22 May 2023 09:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CA0F61E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684739665; bh=6W4DKYVNOLEvws+vb7ejDvg4qUU0qVurwGsz/DAfQD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iTv1UDEU4pzxb+jyd4dtSEXhERFcmDfpPzp/2xeTz//l8oMALomko9C/88dzJh5/2
	 ZYLUsNLCvsBcmJDoz7kh8uXVuqbXaOth4ODi2+GTFQ2H/5SSzMPhWRTx21YPp34lao
	 rYk0B8kVr2LC6OtJ9XAvSxP+QB/cjxNm75AAboTs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:14:23 +0200 (CEST)
Message-ID: <9e3a1bc5-6e75-3e2c-3035-6756e40bf6c8@perex.cz>
Date: Mon, 22 May 2023 09:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 21/36] ALSA: seq: Check validity before creating a port
 object
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-22-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-22-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: T5WQSQAO354GCYOSGPXHPGRYXXYGWIQA
X-Message-ID-Hash: T5WQSQAO354GCYOSGPXHPGRYXXYGWIQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5WQSQAO354GCYOSGPXHPGRYXXYGWIQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> The client type and the port info validity check should be done before
> actually creating a port, instead of unnecessary create-and-scratch.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

