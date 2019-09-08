Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C8ACF8A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 17:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41B915F8;
	Sun,  8 Sep 2019 17:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41B915F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567956972;
	bh=mamRKbAuo8MmsdxJtpzFtZ5Y+j7rh6VwbDAPiFy2Tlw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ro/1RgUMokjj5888w4W98IZZFaklrikDQL/l86cKmCCe0UKT+9HKWpgeDv4D5ChRe
	 195LsT7x0rNtDLMvoQVNQ7RDzmXgrMkP9lQoXPQubb9z3tvCfnZBfFYWufKy3XRO02
	 k093ZZbfEaGRYeyw3X10dRObDHd1v7c/xIhAb+EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F052DF80368;
	Sun,  8 Sep 2019 17:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3B3AF80368; Sun,  8 Sep 2019 17:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA271F80157
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 17:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA271F80157
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id B00DC28A52C
To: Jaroslav Kysela <jkysela@redhat.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <219c49fd-565a-2bf0-f9fd-592f69f39901@collabora.com>
Date: Sun, 8 Sep 2019 16:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit (Tomeu
 Vizoso: 1 total)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/8/19 4:45 PM, Jaroslav Kysela wrote:
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).

I agree.

Regards,

Tomeu

> Thank you for your time and co-operation.
> 
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>    3b5fac6d10c580aee14642df8f94caad15dd53f0
>      conf/ucm: GoogleNyan: Add configuration
> 
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
