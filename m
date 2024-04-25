Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB08B24B3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 17:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07956E0D;
	Thu, 25 Apr 2024 17:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07956E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714057729;
	bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sg9z0KpPbjT7SstXzKZ7TnGL/7b/ubQX8mniz7/MyTkb4dp5Iz1yvwjivswJk5+qk
	 duuMUfQaqrWBaNh0CtDV+lZvh3Tpv9zPQrg9+d11gvn0sRvwaq0er7mBz43VdOXRc/
	 emn3t8shMTZXBkDU7uI9s2eUwnpvJnULd/7k96Gw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E72F8045D; Thu, 25 Apr 2024 17:08:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B961EF80578;
	Thu, 25 Apr 2024 17:08:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42411F80423; Thu, 25 Apr 2024 17:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61B92F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 17:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B92F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=WHNiDoqF;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=Swru+N6c
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 71D93173AF6;
	Thu, 25 Apr 2024 17:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714057676; bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHNiDoqF1xEvcSbg05RpSxwtjwjRXGqJ8LrB11W9blOnRX3Pzg9O7Sp0V6PZvYRa3
	 m3HtUdhzWi2VpeNVgmCF2SEfgGdPDQiNlqvy4ghMdvW6qT8tBVjxmOoncwgofd1O1R
	 FruiD6UF/TX2/nhxHrS0uGlgpd+wHt2efh5843p8=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eUi7BHxqOj8; Thu, 25 Apr 2024 17:07:56 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 8EB5D17375E;
	Thu, 25 Apr 2024 17:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714057675; bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Swru+N6ch4A9VEhPKgA1byhmdFfPcQVzp/PqQbjP5b5+uhvz2D1chve9vRBI3lObz
	 OhKjzgoKEB6BNAZfrpJ1Hr/jxmhA56gN4MpzL8+/ukcf4XqfmVExbYxu21e8KGg8C2
	 hPvYxpIcpnhEPgQTA25u/t86Dzve45tA9LneXprs=
Message-ID: <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
Date: Thu, 25 Apr 2024 17:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>, Chris Wulff <Chris.Wulff@biamp.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <871q6tbxvf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKFKD2OGUY46NNN2JN5ZGLSL6VR6LP2G
X-Message-ID-Hash: PKFKD2OGUY46NNN2JN5ZGLSL6VR6LP2G
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKFKD2OGUY46NNN2JN5ZGLSL6VR6LP2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 25. 04. 24 11:22, Takashi Iwai wrote:
> On Wed, 24 Apr 2024 09:40:52 +0200,
> Pavel Hofman wrote:
>>
>>
>> On 17. 04. 24 13:07, Pavel Hofman wrote:
>>
>>> I am considering implementation of multiple altsettings to f_uac2, so
>>> that multiple combinations of channels and samplesizes can be offered to
>>> the host.
>>>
>>> Configuration:
>>> --------------
>>> * each altsetting for each direction should define
>>>    * channel mask
>>>    * samplesize
>>>    * hs_bint bInterval
>>>    * c_sync type (for capture only)
>>>
>>>
>>> Perhaps the easiest config would be allowing lists for the existing
>>> parameters (like the multiple samplerates were implemented). All the
>>> list params would have to have the same number of items - initial check.
>>> First values in the list would apply to altsetting 1, second to
>>> altsetting 2 etc.
>>>
>>> Or the altsetting could be some structured configfs param - please is
>>> there any recommended standard for structured configfs params?
>>>
>>>
>>> Should the config also adjust the list of allowed samplerates for each
>>> altsetting? Technically it makes sense as higher number of channels can
>>> decrease the max samplerate, e.g. for via a TDM interface. If so, it
>>> would need either the structured configuration or some "list of lists"
>>> format.
>>>
>>>
>>> Implementation:
>>> ---------------
>>>
>>> Parameters could be turned to arrays of fixed predefined sizes, like the
>>> p/s_srates. E.g. 5 max. altsettings in each direction would consume only
>>> 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
>>>
>>> Currently all descriptor structs are statically pre-allocated as there
>>> are only two hard-coded altsettings. IMO the descriptors specific for
>>> each altsetting could be allocated dynamically in a loop over all
>>> none-zero alsettings.
>>>
>>> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
>>> recommendations, so that my eventual initial version was in some
>>> generally acceptable direction?
>>>
>>
>> This feature has coincidentally arisen in recent commits by Chris
>> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/
>>
>> Maybe Takashi's commits to the midi gadget could be a way
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
>> The midi gadget allows multiple configurations now, where configs are
>> placed into a separate block.X configfs directory. That way the configfs
>> recommendation to keep one value per item is adhered to and the
>> configuration is nice and clean.
>>
>> This method would nicely allow various samplerate lists for each
>> altsetting, without having to use some obscure list of lists.
>>
>> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
>> altsetting ID. I am not sure the dot index not starting with 0 would be
>> an issue.
>>
>> Now the question would be what to do with the existing (and the new
>> params added by Chris) flat-structure parameters which apply to (the
>> only one) altsetting 1. Maybe they could be used as defaults for the
>> other altsettings for unspecified parameters?
>>
>> I very much appreciate any input, thank you all in advance.
> 
> IMO, a softer approach would be to use subdirs for alt1+ while flat
> files are kept used for alt0.

Thanks a lot for your help. IIUC almost all existing configs for the
UAC1/2 functions apply to the "run" altsetting - altsetting 1. The
altsetting 0 is for stopping the operation, IIUC. Actually that's how
the stream stop is detected on the gadget side - transition alt1 -> alt0.

Did you perhaps mean the first "running" altsetting?


>  Alternatively, we may allow creating
> alt0, too, and the values there will win over the flat values.
> 

IIUC this would be the meaning of default configs, in case they are not
specified in the subdir. I like that as it would make the configuration
easier if not generated by some script.

Thanks,

Pavel.

