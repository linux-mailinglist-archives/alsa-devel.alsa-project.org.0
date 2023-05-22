Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCB70B6C4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0438A82C;
	Mon, 22 May 2023 09:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0438A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684741516;
	bh=h2vcTNJ/xU9XOxfOUY3rMUOsDDZrPEwueLyhjyH8dlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hl4QfLrUEPgP4TcFP7cPv11euqNAlst976RSyBmzapiY2hbX9nHudP1au66XxCpPP
	 TUQlD7a0crDUB4mAZqpu8rrFpk9YB7WmdeaFU2CyQ1rqTwHh4TDMHb+eOmUQT5MNuN
	 SbQZ9PA2k+y1P/w8YpIR/rqJRELMoJX+M5S3+FEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 539FBF80551; Mon, 22 May 2023 09:44:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF840F8024E;
	Mon, 22 May 2023 09:44:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2B7F8053D; Mon, 22 May 2023 09:44:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A502FF8024E
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:44:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9930A1E3B;
	Mon, 22 May 2023 09:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9930A1E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684741458; bh=o3rsuf+yfP/Y1fs1smO5bbBEJXUA/iuoNtYOJg+MVfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z2CoNjSYN0PhNqCARMPR94wDvV33MV9FEG5jLX3lfnJQf0KD9HX1JF0DbRYHtj3uR
	 dYOzUdL9HjSFu5Ua0bfvA+TwjEubOQrmKI20apFw8LQZxF4ozJR84WjSuuHGVc0UFD
	 n15X4WqYelF2RW5bzFYaCACpyXrro2vZr9PLjAhs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:44:16 +0200 (CEST)
Message-ID: <ba3db05f-b335-43ba-0860-57fc9d2e38b7@perex.cz>
Date: Mon, 22 May 2023 09:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 28/36] ALSA: seq: Add UMP group number to
 snd_seq_port_info
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-29-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-29-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5JSK2TNE6FQJ7L6XA6KRH2IABNS4LHUL
X-Message-ID-Hash: 5JSK2TNE6FQJ7L6XA6KRH2IABNS4LHUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JSK2TNE6FQJ7L6XA6KRH2IABNS4LHUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Add yet more new filed "ump_group" to snd_seq_port_info for specifying
> the associated UMP Group number for each sequencer port.  This will be
> referred in the upcoming automatic UMP conversion in sequencer core.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

