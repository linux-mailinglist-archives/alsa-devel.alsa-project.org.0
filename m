Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B717A632E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 14:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F7CDE5;
	Tue, 19 Sep 2023 14:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F7CDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695127124;
	bh=G6RGBHHMHWK8yELZ7uPperdzmaQNyPp5KSOeBYqzvGg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vP+l80ZUtaUjhPcHpH1Byz0UfZIiUXmK26fpadynRynk+u67pH2cMI8KyiJS3tFtd
	 4h9Anmxan9u3ipsTuM8vVUDDsMzENfn4DePoh/pU6hPn4PAsvFq8kCQWkVXV9SFNlm
	 Z8PYi/Xe7W1jfj631bzXEOFiNGpRZC7cvFN/Ln/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D67F801F5; Tue, 19 Sep 2023 14:37:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57A0AF801F5;
	Tue, 19 Sep 2023 14:37:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851A1F8025A; Tue, 19 Sep 2023 14:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32278F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 14:37:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 56FB21603;
	Tue, 19 Sep 2023 14:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 56FB21603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695127056; bh=WQmrT06b24Zai6S7EgszZhRo67vJFwZHDBV5s3rLFEQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aO6uE6SN8SFee0IirGqK+v2lSYTS+pcffD85BVbqyNEVzFDJX0sJzvlhQG50q/1Qr
	 BA4/3MkqUhqkHMq6IkNRjEtczrbGw2PGeGngx+3f3zMTyoIKJ2684CxjB6rr1uZlQK
	 vLbjrGN1oB7jmR5F1igsLvtmGzRKjCxr2+INNUVE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 19 Sep 2023 14:37:34 +0200 (CEST)
Message-ID: <92599ced-0172-c01f-99bb-af1a8da794f0@perex.cz>
Date: Tue, 19 Sep 2023 14:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] fixes for the musl C library
Content-Language: en-US
To: michael.opdenacker@bootlin.com, alsa-devel@alsa-project.org
References: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KN32XBOFYIXLNSJ3SGBCGVIDQLQ6E5TQ
X-Message-ID-Hash: KN32XBOFYIXLNSJ3SGBCGVIDQLQ6E5TQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KN32XBOFYIXLNSJ3SGBCGVIDQLQ6E5TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 09. 23 13:14, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This is a series of patches to fix compiling alsa-utils
> with the Musl C library.
> 
> Tests were made use the "master" branch of the Yocto Project
> Poky distribution.
> 
> Compiling with the GNU C library (glibc) was tested too.
> 
> Michael Opdenacker (2):
>    topology.c: include locale.h
>    nhlt-dmic-info.c: include sys/types.h

Thanks. Applied both.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

