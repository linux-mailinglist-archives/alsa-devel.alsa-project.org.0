Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC7C6F6CA2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008B7212A;
	Thu,  4 May 2023 15:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008B7212A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683205758;
	bh=hea/C/sfltmQqHsjy3hl5Wm5nYdAOuKHQP8sfPJbom8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WHMEsikuT0+UeKdiLuaCpO9Tnstj7iqgldNmo+7boo58Wvhg4MWhIS7Oz8UxoB30i
	 vmEmdcbzunlMEJ8YUp1ehhUlEP3OJgndGx3xO4r4SwGA9yCS6BuCQyLn7Nn338eosf
	 ppaA7zhyZGDb1oznpevulCIylFuyoZL3IKET5O68=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3DC3F80529;
	Thu,  4 May 2023 15:08:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459FEF8052D; Thu,  4 May 2023 15:08:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8CDCF80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:08:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4741011E0;
	Thu,  4 May 2023 15:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4741011E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683205698; bh=/fDNP9K88oHLkiVG2RFRYOx+MeiXB4L2XEaIwYo+exQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ehSXKNl90M9jO5ydZuVPjBdCQOUuPV+JMmlqAeV3VAkAhRTurJG4/IncKhkne5X78
	 Sfj3rnZYwm3tIPgE66vONmRNKPDZgpZdPCw45M4w3fUlE9WjNERrvJInpdQfhhN9Ds
	 qV9/s7dkX8Vd9k323uDHm3a60U7EOcfc7m7N19fY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  4 May 2023 15:08:14 +0200 (CEST)
Message-ID: <266661e5-ac86-1590-55d9-5f14e6486557@perex.cz>
Date: Thu, 4 May 2023 15:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7DZT7LYBW6W6XUK36RMMCO2JAHSFIR2F
X-Message-ID-Hash: 7DZT7LYBW6W6XUK36RMMCO2JAHSFIR2F
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Jeff Chua <jeff.chua.linux@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DZT7LYBW6W6XUK36RMMCO2JAHSFIR2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04. 05. 23 15:00, Oswald Buddenhagen wrote:
> Turns out that we cannot rely on the application pointer being updated
> in top-up mode, as its primary purpose is to remain operational in
> free-running mode as used by dmix.
> 
> So we logically revert some bits from commit 9f656705c5faa ("ALSA: pcm:
> rewrite snd_pcm_playback_silence()"), but we retain the bug fixes and
> try to make the code paths congruent.

It would be better to revert the broken patch and make changes on top of the 
original code. This is really difficult to review.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

