Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DF87DCBA
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4229E2BAB;
	Sun, 17 Mar 2024 10:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4229E2BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666314;
	bh=7+fJfBST5IdB1sgP/eTQYRwwxuAf0nFH5htcIsMtVUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KWxuKiWMfjA2h0OsxMPpC+X9YSHw4idRF/EgJ7Bm5Ttr4LnneghZyzvc12T55WDeL
	 kK/nY3WKtiyTagctNbhAhhsEX/RfAY7MsVWSNG4OJLgNWU/HrFk7idWXI0/cC1Y7+K
	 MtPmCrF/ELi0HzY1euzBVCYTD7ay0L1w0QLwr8Zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F20FBF806C5; Sun, 17 Mar 2024 10:03:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD38F805E4;
	Sun, 17 Mar 2024 10:03:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D11E1F8028D; Fri, 15 Mar 2024 15:45:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 657CEF80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 657CEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KWDBifJA
Received: by mail.gandi.net (Postfix) with ESMTPSA id A85231BF20C;
	Fri, 15 Mar 2024 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710513925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCzVTi/8qiIkWIQuMQeabN+Upuh5rS0d0MiWy39obn8=;
	b=KWDBifJAeamjCj4tFGXOKgrfAdJ+TaLvUBsIFlZSmEqiozMYaPqkiTjZKk+6rPwCnKloM7
	tCnUNg4sxFveR6d7CK8E47hqVzEvvypk7BtvNEW3jHLxBdCOrFXrO4s1KNYGVjvxZEtkMX
	SA29cZrOEH6nQ3hGtJ69pjG0SxbvbDwb+F4naOcJKjsU2SIdcr2AkLJwa8m/kJkxkdBZob
	ZovQHltOeOJMR00N20S1O4tlOMtDtJ/TCRtE3PUQAk3MpBehBg1GMFLROjSzPG/u3J2VzW
	OYDeQ+H/rCftP6Mfp7AA0EOz9xvxO/DjZj7Xg9PnMTgpKXCe3mNbtvKDYJUFXA==
Message-ID: <13faa6c8-ad4f-4f81-935a-5ea74621d373@bootlin.com>
Date: Fri, 15 Mar 2024 15:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] ASoC: ti: davinci-i2s: Enable unexpected frame
 pulses detection
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi
 <peter.ujfalusi@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-10-bastien.curutchet@bootlin.com>
 <51866f62-460d-4035-bcf1-b9f03cf9be0b@sirena.org.uk>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <51866f62-460d-4035-bcf1-b9f03cf9be0b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YUNGBNTUI4SNYA4IZVTAOR3V2XYZ2O6W
X-Message-ID-Hash: YUNGBNTUI4SNYA4IZVTAOR3V2XYZ2O6W
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUNGBNTUI4SNYA4IZVTAOR3V2XYZ2O6W/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 3/15/24 15:09, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 12:27:41PM +0100, Bastien Curutchet wrote:
> 
>> McBSP can generate an SYNCERR when unexpected frame pulses are
>> detected. The driver always disables this feature and ignore the
>> unexpected frame pulses.
> 
> What does "unexpected" mean?

Unexpected frame sync pulse is defined in datasheet as a sync pulse that 
occurs <N> bit clocks earlier than the last transmitted bit of the 
previous frame. The <N> can be configured through registers.

> 
>> Enable the generation of SYNCERR by the McBSP according to the
>> 'ti,enable-sync-err' device-tree property.
> 
> Why would this be optional, and how is this reported - I'm not seeing
> any interrupt handling updates?

It is possible to deliberately ignore them and that is what is done 
today in the driver.
This is reported as a status bit in a register. An interrupt can indeed 
be generated from this but I'm not using it (now at least).
I use the fact that McBSP automatically drops previous element and 
starts a new reception when an unexpected frame pulse occurs.


Best regards,
Bastien
