Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C627CA01A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 09:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDFC852;
	Mon, 16 Oct 2023 09:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDFC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697440110;
	bh=G13hUKnXBRyz6YjhDpBtKCrvJroG3ipOTFkNyfl+wYk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zflumvqw+GBUidNRecbWKqQqF+wb/HSMsgde3kGLWA0hslFh7sHCG6F6FPxvTXUob
	 PDhaJ1075WGoUHdXh3d2By6T5czbWZatdIC7ToRN9eG3zDQyUVCF7JTJoW6YG8Xm8K
	 GZA5yOssGhNJY/c53bfWfo7QEOnVSsRtcr1LPjUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89998F80552; Mon, 16 Oct 2023 09:07:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46A7BF8024E;
	Mon, 16 Oct 2023 09:07:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CCACF8025F; Mon, 16 Oct 2023 09:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07BBAF80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 09:04:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8E8261A5C;
	Mon, 16 Oct 2023 09:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8E8261A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1697439865; bh=dlfCrhzTrgJ6JoncMa2w1xgItm96Gqs5tP+FvpMCDvs=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=iE/l8UEnJ1kZ7air97jCxaIe9WSO9NGze08j1IBxAWv6OlPei57WmkQ3k+obG7a4T
	 Nr7QV7GzUdq2wwWUUOqq+FT0zAkGzMSOs7mRAP0c5OdCVPX5RxSpRGY3rc9MndyJ3E
	 qy0sDLD1CtXGDinEVtqBGHxa7iW8N+H+JHUDW3cQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 16 Oct 2023 09:04:22 +0200 (CEST)
Message-ID: <76c1526d-78be-92d2-cf2b-148278394575@perex.cz>
Date: Mon, 16 Oct 2023 09:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Geoffrey D. Bennett" <g@b4.vu>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <ZSqehHhedJQY9h/1@m.b4.vu>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH RFC] ALSA: scarlett2: Add ioctls for user-space access
In-Reply-To: <ZSqehHhedJQY9h/1@m.b4.vu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F6HESUPRYKK3CA7QJ6HD33DS44TOHMMV
X-Message-ID-Hash: F6HESUPRYKK3CA7QJ6HD33DS44TOHMMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6HESUPRYKK3CA7QJ6HD33DS44TOHMMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14. 10. 23 15:58, Geoffrey D. Bennett wrote:
> In order to support functions such as firmware upgrade from
> user-space, add ioctls for submitting arbitrary proprietary requests
> through scarlett2_usb() and requesting/releasing exclusive access.
> ---
> 
> Hi Takashi,
> 
> I recently figured how to update the firmware on Scarlett Gen 2+
> devices. I think the best way to implement this is with an ioctl
> giving access to the scarlett2_usb() function from user-space, plus
> two ioctls to request/release exclusive access.
> 
> Does something like this seem reasonable?

Maybe you can use libusb for this job without an additional kernel interface. 
It allows to detach the USB kernel driver and attach it again when the job is 
complete.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

