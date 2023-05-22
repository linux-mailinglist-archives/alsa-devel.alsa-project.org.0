Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BA70B71A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:55:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CF6822;
	Mon, 22 May 2023 09:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CF6822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684742133;
	bh=o6TSW8W8r8XSyRO5dScsC+D/zHu7TJ/MwcQun7AyYgs=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YhWJyxGP95c1ZyXDkaLJcbv7jeF7Ks7FTDgWZdbpXhhBPCGV0jgaAhkw1Gae3m1lT
	 s4x1jVuPdqS7z6NHkmcEOi7GxQGpi3TGNwU/oKelnpKu2coBtfZiujN694MvKCl+KQ
	 nt/BKcrfm/xk6RcJKCsdYWrDUCLP0Pe6Rc7NnyOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3EBF80249; Mon, 22 May 2023 09:54:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A10F80249;
	Mon, 22 May 2023 09:54:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8EF2F8024E; Mon, 22 May 2023 09:54:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F539F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:54:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4D4111E35;
	Mon, 22 May 2023 09:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4D4111E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684742077; bh=/L+Fqs5TFKTZ002+tB13aMXB/O+JIdpPobeJQ+3sbcw=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=sXoQNTWxXKXSoBqyllH5nHzZM63y6Pu/KQWkR9LMyDvhBObsTZY/h15hezvpRFICF
	 NMCicNUx5FujSoOSVGcHatXy4PE2uY2ftVktPFLwYwgH8HgLLFUJhvEuu/w9cQ7go2
	 n8isuTX+QVJAeiXJtAKzgU8ITcXBEH0/jU9S1bNk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:54:35 +0200 (CEST)
Message-ID: <e08d34d1-90fa-c396-5522-be917d2ee784@perex.cz>
Date: Mon, 22 May 2023 09:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 33/36] ALSA: seq: Add ioctls for client UMP info query and
 setup
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-34-tiwai@suse.de>
Cc: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-34-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SY7HTZGBKE2FOGU3N7N2EJLEREG57TOA
X-Message-ID-Hash: SY7HTZGBKE2FOGU3N7N2EJLEREG57TOA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SY7HTZGBKE2FOGU3N7N2EJLEREG57TOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Add new ioctls for sequencer clients to query and set the UMP endpoint
> and block information.
> 
> As a sequencer client corresponds to a UMP Endpoint, one UMP Endpoint
> information can be assigned at most to a single sequencer client while
> multiple UMP block infos can be assigned by passing the type with the
> offset of block id (i.e. type = block_id + 1).
> 
> For the kernel client, only SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO is
> allowed.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

