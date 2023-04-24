Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B86ECA63
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 12:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1A8F23;
	Mon, 24 Apr 2023 12:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1A8F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682332445;
	bh=I+AArAY1YcEyPrvgN7assWYGYocSeYaZq0COT2cIpEI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sh9BlAxmNBfTInOu0TX4yYLCJD2WYvepheHs+58DnJ/3Pq9jTos5C4JLrw1+NhQ7s
	 ZuBaQ6V9bcZdXe3M5u41uU5sUsUpgPOM1fqCT2akg+auVh/gn1e4bX2plBLUn8EsZK
	 71TYDhHnpO58J5Adx7ovboq6oC0FSCq8cizqdOOk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4479F80162;
	Mon, 24 Apr 2023 12:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9728F8018A; Mon, 24 Apr 2023 12:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9EFCF80104
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 12:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9EFCF80104
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B9E4523E69;
	Mon, 24 Apr 2023 06:32:58 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqtVC-MLH-00; Mon, 24 Apr 2023 12:32:58 +0200
Date: Mon, 24 Apr 2023 12:32:58 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: emu10k1: fix multi-channel playback device class
Message-ID: <ZEZa2oQV20IgqNvR@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230422161021.1143989-1-oswald.buddenhagen@gmx.de>
 <874jp7oy2k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <874jp7oy2k.wl-tiwai@suse.de>
Message-ID-Hash: JKYQETHXQ6NA7JFQPK2JOE7F77JKGINC
X-Message-ID-Hash: JKYQETHXQ6NA7JFQPK2JOE7F77JKGINC
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKYQETHXQ6NA7JFQPK2JOE7F77JKGINC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Apr 23, 2023 at 09:30:11AM +0200, Takashi Iwai wrote:
>On Sat, 22 Apr 2023 18:10:21 +0200,
>Oswald Buddenhagen wrote:
>> 
>> It's multi, not mono/stereo.
>> 
>> AFAICT, this doesn't do anything in the kernel.
>
>... but those values are read by user-space.
>
>> Also, I think the subclass is meaningless for devices with just one
>> stream, but whatever.
>
>Again, the value is read by user-space.
>
i assumed that much.
but these are another thing that appears to have exactly zero useful 
documentation.

>So changing both have clear influence on the user-space program, and
>unless you have to change this for fixing a real bug (and there is no
>other way), this is too risky.  IOW, too late to change, we have to
>accept those values.
>
there aren't any precedents for use of SNDRV_PCM_CLASS_MULTI and 
SNDRV_PCM_SUBCLASS_MULTI_MIX in the kernel tree.
there don't appear to be relevant hits outside the kernel, either.
it's conceivable that some code would check for the *_GENERIC enums, but 
i didn't find such code.
so i'd postulate that these enums are effectively dead, and both the 
risk and the gain of this change are about zero.
i suggest to initiate a formal deprecation procedure for the MULTI enum 
values, however that's supposed to look like.

regards
