Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D800C8B0370
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 09:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A65A9E9A;
	Wed, 24 Apr 2024 09:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A65A9E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713944832;
	bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJDTJyxpOu+76ShRHb2VcfBCS6CpDlDwNx/aFRbIjG/s3wTB23frksPGY2j+Z7HE5
	 UfZTbvC7tUTHiQ/0VCequSbzAaKiCt7QhE2Gq4Cko1EuK8lWO04wqBPG0GSC/JwPF8
	 lAJtcT1vw+L7+ZlqfUeITdxhXNZ5YZnX0TPKDvYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB18AF80588; Wed, 24 Apr 2024 09:46:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F17F8057A;
	Wed, 24 Apr 2024 09:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF9BF80423; Wed, 24 Apr 2024 09:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0E2CF800B5
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 09:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0E2CF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=Thfkjmx+;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=T5hmmwo5
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 5A7D31704EA;
	Wed, 24 Apr 2024 09:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713944453; bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Thfkjmx+kwLdUkBcSPrXc8TIUHK52LOPvAGR2JepMHE2Uk+zd+zoS3vHygDXddCgy
	 dGqABwYzJ5JY7Vh+X3EAnQInqF+1S4fswKvOuBcAm2ddK9fopeXit4vX5ZLHnCOPh9
	 v9t9hynClMTjwxzEvDJNhdUl7jdhfM+ZgAI8pkgo=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sE21McawqGRA; Wed, 24 Apr 2024 09:40:52 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 8D2A41704E9;
	Wed, 24 Apr 2024 09:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713944452; bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=T5hmmwo5FYOfd2MrdClwNds/RnvuKybolpau8aiTO7rUu4BE+HqiazoUPGq/uIoQh
	 0KzCRbG7eCe6Joqh2Dusm/4sFxJivyV3hjQQDbAVKUEVjCyBKZI4Yc904mpVQ5yMvp
	 rZ0r6kYZXRLAWsQKV8wL4TRvR6+kmp3sWXIWW+Fc=
Message-ID: <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
Date: Wed, 24 Apr 2024 09:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi
 <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>, Chris Wulff <Chris.Wulff@biamp.com>,
 Takashi Iwai <tiwai@suse.de>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
In-Reply-To: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NBLAQU5QY66CI6EUFUPZKPFKFLEVKEV5
X-Message-ID-Hash: NBLAQU5QY66CI6EUFUPZKPFKFLEVKEV5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBLAQU5QY66CI6EUFUPZKPFKFLEVKEV5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 17. 04. 24 13:07, Pavel Hofman wrote:

> I am considering implementation of multiple altsettings to f_uac2, so
> that multiple combinations of channels and samplesizes can be offered to
> the host.
> 
> Configuration:
> --------------
> * each altsetting for each direction should define
>    * channel mask
>    * samplesize
>    * hs_bint bInterval
>    * c_sync type (for capture only)
> 
> 
> Perhaps the easiest config would be allowing lists for the existing
> parameters (like the multiple samplerates were implemented). All the
> list params would have to have the same number of items - initial check.
> First values in the list would apply to altsetting 1, second to
> altsetting 2 etc.
> 
> Or the altsetting could be some structured configfs param - please is
> there any recommended standard for structured configfs params?
> 
> 
> Should the config also adjust the list of allowed samplerates for each
> altsetting? Technically it makes sense as higher number of channels can
> decrease the max samplerate, e.g. for via a TDM interface. If so, it
> would need either the structured configuration or some "list of lists"
> format.
> 
> 
> Implementation:
> ---------------
> 
> Parameters could be turned to arrays of fixed predefined sizes, like the
> p/s_srates. E.g. 5 max. altsettings in each direction would consume only
> 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
> 
> Currently all descriptor structs are statically pre-allocated as there
> are only two hard-coded altsettings. IMO the descriptors specific for
> each altsetting could be allocated dynamically in a loop over all
> none-zero alsettings.
> 
> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
> recommendations, so that my eventual initial version was in some
> generally acceptable direction?
> 

This feature has coincidentally arisen in recent commits by Chris
https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/

Maybe Takashi's commits to the midi gadget could be a way
https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
The midi gadget allows multiple configurations now, where configs are
placed into a separate block.X configfs directory. That way the configfs
recommendation to keep one value per item is adhered to and the
configuration is nice and clean.

This method would nicely allow various samplerate lists for each
altsetting, without having to use some obscure list of lists.

The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
altsetting ID. I am not sure the dot index not starting with 0 would be
an issue.

Now the question would be what to do with the existing (and the new
params added by Chris) flat-structure parameters which apply to (the
only one) altsetting 1. Maybe they could be used as defaults for the
other altsettings for unspecified parameters?

I very much appreciate any input, thank you all in advance.

With regards,

Pavel.
