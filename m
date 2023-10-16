Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E07CA95C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 15:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD1884A;
	Mon, 16 Oct 2023 15:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD1884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697462955;
	bh=SeVdWfcncmZfLe1JlsiEzV6fQmdpre6533LL01Hmd+g=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZBYaolY1reMrjAKZwFdSripDIwSGdaV88Qw24BFm+hJg7CrFaE6OffkTG3tZbGhWS
	 2hkDtuIihvOE2KTiU2ZA48FNPKKtVzXuzm5YG9KZmOlhWndv0wcPt8NA5+pulw81g7
	 aPu7pdqn7T0FM1ALZyNPXP431jSwV1PhdRlMk634=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB652F80553; Mon, 16 Oct 2023 15:28:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 715C5F80236;
	Mon, 16 Oct 2023 15:28:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00841F8025F; Mon, 16 Oct 2023 15:28:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ECAFF80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 15:28:15 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CBC2B1A6F;
	Mon, 16 Oct 2023 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CBC2B1A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1697462894; bh=alJbiiYlEBJjIArEQkZcuyzsDsd/9S8qJVha+9bBfR8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=NWtmMpjx08QRxurYgdFmVIKnHOVKrPHFBl25kimy9tJkiY8P3br/mFV4ORXBaf9EO
	 lsNoDyvcukCCRMNa0TAE6rZIAiWOwW7TQ5tclnIfUwgkwoav9K+b8MYX0bPWme6lWQ
	 QtxCztVjSEtV22F9ggCHfnqMRMFbYjUvir3vN/6U=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 16 Oct 2023 15:28:11 +0200 (CEST)
Message-ID: <123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
Date: Mon, 16 Oct 2023 15:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
References: <ZSqehHhedJQY9h/1@m.b4.vu>
 <76c1526d-78be-92d2-cf2b-148278394575@perex.cz> <ZS0tajzKr68CZ5uA@m.b4.vu>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH RFC] ALSA: scarlett2: Add ioctls for user-space access
In-Reply-To: <ZS0tajzKr68CZ5uA@m.b4.vu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PXK6LVZW2ABMSSQRKK7DLEHGHZKHCRHX
X-Message-ID-Hash: PXK6LVZW2ABMSSQRKK7DLEHGHZKHCRHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXK6LVZW2ABMSSQRKK7DLEHGHZKHCRHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16. 10. 23 14:32, Geoffrey D. Bennett wrote:
> On Mon, Oct 16, 2023 at 09:04:21AM +0200, Jaroslav Kysela wrote:
>> On 14. 10. 23 15:58, Geoffrey D. Bennett wrote:
>>> In order to support functions such as firmware upgrade from
>>> user-space, add ioctls for submitting arbitrary proprietary requests
>>> through scarlett2_usb() and requesting/releasing exclusive access.
>>> ---
>>>
>>> Hi Takashi,
>>>
>>> I recently figured how to update the firmware on Scarlett Gen 2+
>>> devices. I think the best way to implement this is with an ioctl
>>> giving access to the scarlett2_usb() function from user-space, plus
>>> two ioctls to request/release exclusive access.
>>>
>>> Does something like this seem reasonable?
>>
>> Maybe you can use libusb for this job without an additional kernel
>> interface. It allows to detach the USB kernel driver and attach it again
>> when the job is complete.
> 
> Hi Jaroslav,
> 
> I considered using libusb (I used it during initial development of the
> driver), and if the only purpose of the ioctl would be for firmware
> updates then it would be reasonable to detach the kernel driver for
> that. However...
> 
> Beyond just being able to do firmware operations, that ioctl would
> also allow access to all of the configuration space using cmd =
> SCARLETT2_USB_GET_DATA and SCARLETT2_USB_SET_DATA. I think this would
> be the cleanest way to allow implementing non-mixer related
> functionality in user-space, such as reading the current firmware
> version, reading/updating the device name and channel names, and
> updating the software configuration space for Focusrite Control
> compatibility to name a few. These sorts of applications need to be
> able to make these proprietary requests through the scarlett2 driver
> to avoid disrupting it (or disrupting audio).

Thank you for this bigger picture. But except the firmware upgrade, all those 
functions seem to be implementable in a more abstract way using standard 
control API. Note that we can assign the controls also to card (e.g. 
SNDRV_CTL_ELEM_IFACE_CARD) to classify them as non-mixer.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

