Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10F7D0919
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 09:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF64082B;
	Fri, 20 Oct 2023 09:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF64082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697785291;
	bh=i4mTARCVWP8DkJ2Otpts6FP0G4A/z5hhPw3/uPcBoM8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KsvV1O7/Vdx2CD8QY/nBhDQnE7rnM4qfvU9nQLgVh7/zPSk402pA/F5KL66vvPYj+
	 Qgb+cFrqfWjS0ySnZzc6wDmbJibCere0yChhzTHezbYLFrZ738vSi0zpNKlyBEoozU
	 oQbMdc7sIrboobyIP9HUcnA2kFV8YuagxValikoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F6C8F80552; Fri, 20 Oct 2023 09:00:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 114D7F8024E;
	Fri, 20 Oct 2023 09:00:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C9DF8025F; Fri, 20 Oct 2023 09:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7919BF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 09:00:30 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 207E41A5C;
	Fri, 20 Oct 2023 09:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 207E41A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1697785229; bh=BkE5d1CevKdet4YeuqW2oQyL+Ncc7thsyUdHwizdmYo=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=KXln3Pefkqp2D4iAC67i6sIxr8ebf88H2yKgVb0+E53j+aBuBjKzKkNSyt3arEdw2
	 HaIiePS/3AgD/9unt5y97HNRAMWUHobMQhTOOEBmZaYCc/iSjH8TsBKoCv5UyaMHBZ
	 GKaZB/YDeCRsLL17LV4i5xP8rKHyBPVsAzSpeKok=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 20 Oct 2023 09:00:25 +0200 (CEST)
Message-ID: <003be6b3-63eb-d850-2805-0a8ed6cf5b18@perex.cz>
Date: Fri, 20 Oct 2023 09:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
References: <20231017-coroner-blurt-edffe8@meerkat>
 <8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
 <20231019-posture-cache-fe060b@meerkat>
 <9879e427-5dd0-43ee-bacb-0b0b452ea348@sirena.org.uk>
 <20231019-extinct-importer-8e3fce@meerkat>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Migrating this list to a different platform (take 2)
In-Reply-To: <20231019-extinct-importer-8e3fce@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UJC6DA2FQVDSRLAGVMF5SOWGF32GNSSS
X-Message-ID-Hash: UJC6DA2FQVDSRLAGVMF5SOWGF32GNSSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJC6DA2FQVDSRLAGVMF5SOWGF32GNSSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 10. 23 18:25, Konstantin Ryabitsev wrote:
> On Thu, Oct 19, 2023 at 03:34:18PM +0100, Mark Brown wrote:
>>> There's a third option -- instead of migrating the alsa-devel list, we can
>>> migrate all activity to linux-sound@vger.kernel.org. It's an existing list
>>> that currently sees about 5 messages a year (and most of them are cc'd to
>>> alsa-devel anyway).
>>
>> That would definitely work well from my point of view.
> 
> Okay, since it doesn't really affect anything, I've reconfigured the patchwork
> side of things to accept patches sent both to alsa-devel and linux-sound. If
> you do want to go down the route of shifting everything towards linux-sound,
> the next step (once everyone is in agreement), is to make the changes to
> MAINTAINERS. You don't have to do all subsystems at once, you can start with
> the SOUND subsystem to trial things out and then shift others if everything is
> working correctly.

If it's an overall agreement, we can move the driver related threads and the 
patch handling to linux-sound mailing list and keep alsa-devel list for the 
user space packages and the project related discussions. I'll send an initial 
patch for MAINTAINERS ASAP.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

